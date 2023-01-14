package com.multi.ggo.board;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

@Controller
public class BoardController {
	Board_Service service;
	FileUploadLogic fileuploadService;
	
	@Autowired
	public BoardController(Board_Service service, FileUploadLogic fileuploadService) {
		super();
		this.service = service;
		this.fileuploadService = fileuploadService;
	}
	
	
	
	
	
	
	
	
//______________________________________________________________________________________________________________________

	
	
	// 파일업로드 (기존등록을 수정)
	@RequestMapping(value = "/b_insert.do", method = RequestMethod.POST)
	public String write(Board_DTO dto, HttpSession session) throws IllegalStateException, IOException {
		
		
		//1. MultipartFile 정보를 추출하기
		List<MultipartFile> files = dto.getFiles();
		
		//2. 업로드될 서버의 경로 ( 서버가 배포되는 Real path를 구해야함. << 구하려면 session이 필요함  << 그래서 HttpSession 매개변수추가)
		//   ㄴ 실제 서버의 경로를 추출하기 위해서 context의 정보를 담고 있는 ServletContext객체를 추출
		// 	스프링에는 WebUtils라는 클래스(의 getRealPath 메서드)가 있어 , 그걸사용
		//	 getRealPath는 servletContext 객체(이프로젝트에대한정보) 를 전달해줘야함. 그러면 알아서
		//   ㄴ servletContext 란? : 프로젝트가 서버에 배포되는 실제 경로와 context에 대한 정보를 담고 있는객체 
		// 	getRealPath메서드가 작성자가 지정한 path와 결합해서 실제위치를 구함
		String path = WebUtils.getRealPath(session.getServletContext(), "/WEB-INF/upload");
		System.out.println("________업로드될서버의 경로 : "+ path);
		
		
		//3.파일업로드 서비스를 호출해서 실제 서버에 업로드되도록 작업
		List<Board_FileDTO> boardfiledtolist= fileuploadService.uploadFiles(files, path);
		int count = 1;
		
		//업로드된 파일의 boardfileno의 값을 셋팅 1~ 첨부파일 마지막 번호
		for(Board_FileDTO boardfiledto:boardfiledtolist) {
			boardfiledto.setBoardFileno(count + "");
			count++;
		}
		System.out.println("boardfiledtolist : " +boardfiledtolist);
		
		//4. 게시글에대한 일반적인 정보와 춤부되는 파일의 정보를 db에 저장
		service.b_insert(dto,boardfiledtolist );
		
		return "redirect:/b_category.do?category=all";
	}
	
	
	
	
	
	
	//다운로드(파일업로드한거)
	//HttpEntity란?  Http 요청과 응답(요청헤더, 바디, 응답헤더)을 관리하는 객체
	// ResponseEntity란?  응답데이터를 관리하는 객체 (Http헤더, Http바디, Http상태정보...)
	//	HttpEntity의 하위/ 스프링 프레임워크에서 지원(import org.springframework.http.ResponseEntity; 통하여확인) / 
	// <UrlResource>란 ? 파일객체를 다루기위해서 스프링 내부에서 사용하는 객체
	// @PathVariable = path에서 변수로 쓸거다라는 어노테이션 
	@RequestMapping("/download/{id}/{no}/{boardFileno}")
	public ResponseEntity<UrlResource> downloadFile(@PathVariable String id, @PathVariable String no, @PathVariable String boardFileno, HttpSession session) throws MalformedURLException, FileNotFoundException, UnsupportedEncodingException {
		System.out.println("@@체크: " + id+ ",  " + no + ",  "   +boardFileno);
		
		//글번호와 파일번호를 이용해서 해당 파일을 조회
		// ㄴ 요청한 파일에 대한 조회이므로 BoardFileDTO를 리턴하도록 처리		
		
		//파일을 다운로드하기위해서 저장된 파일의 정보를 가져오기 - 다운로드를 요청한 경우 요청된 파일을 response
		//*****dto를 넘긴다고 했을때 이렇게 생각함;;;*********************service.getFile(id, no, boardFileno);  
		Board_FileDTO selectFileinfo = service.getFile(new Board_FileDTO(no,"","",boardFileno));  //id물려도 상관없음, 어차피 맵퍼에 물리는건 no 와 boardFileno
		System.out.println("selectFileinfo체크 ___________: " + selectFileinfo);		
		
		  // ㄴ 순서중요 Board_FileDTO의 멤버변수 순서로. //파일명을 이용해서 다운로드할 파일을 객체로 생성하는 작업
		  //UrlResource resource = new UrlResource("file :" + 파일의 풀경로(RealPath )
		  UrlResource resource = 
				  new UrlResource("file:" +  WebUtils.getRealPath(session.getServletContext(), 
						  "/WEB-INF/upload/"+selectFileinfo.getStoreFilename()));
		  
		  //파일명에 한글이 있는경우, 깨지지않도록 처리 String encodedFilename =
		  String encodedFilename = UriUtils.encode(selectFileinfo.getOriginalFilename(), "UTF-8"); 
		  String mycontenttype = "attachment; filename=\""+encodedFilename+"\"";
		  
		  //파일다운로드 //// 헤더에 이거슨 CONTENT_DISPOSITION 입력하여 파일다운로다야 알림? return
		  return ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION, mycontenttype).body(resource);
		 
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//기존 (게시글만등록)
	//게시글등록
//	@RequestMapping("/b_insert.do")
//	public String write(Board_DTO dto) {
//		System.out.println("등록확인1 : "+dto);
//		service.b_insert(dto);
//		System.out.println("등록확인2 : "+dto);
//		return "redirect:/b_category.do?category=all";
//	}
	
	
	
	
	//게시글조회-원본
//	@RequestMapping("/b_list.do")
//	public ModelAndView boardlist() {
//		ModelAndView mav =new ModelAndView("b_list");
//		List<Board_DTO> b_list = service.b_list();
//		mav.addObject("b_list", b_list);
//		return mav;
//	}
	
	
	
	
	
	
	
	
//	
//	//게시글조회- 페이징 테스트1
//	@RequestMapping("/b_list.do")
//	public ModelAndView boardlist(Criteria_DTO criteria) {
//		ModelAndView mav =new ModelAndView("b_list");
//		List<Board_DTO> b_list = service.pagingList(criteria);
//		System.out.println("b_list 조회공유 체크 : "  + b_list);
//		//DB에서 데이터가져오기  - criteria 데이터만 필요
//		mav.addObject("boardlist", b_list);
//		//화면에 필요한 정보 가져오기 (생성자로처리됨)
//		mav.addObject("pageMaker", new Page_DTO(criteria, 500));  //500dms db에서 count(*)로가져와야한다.
//		return mav;
//	}
	
	
	
	
		
	
	
	
	
     //게시글 읽기
	@RequestMapping("/b_read.do")
	public String b_read(String no, String state, Model model) {
		System.out.println("조회수 메서드읽기전" + no);
		
		System.out.println("조회수 메서드읽기후" + no);
		Board_DTO board = service.b_read(no);
		
		
		
		//첨부파일관련 추가
		List<Board_FileDTO> boardfiledtolist = service.getFileList(no);
		System.out.println("boardfiledtolist읽기 체크 _________: "+boardfiledtolist);
		
		
		String view="";
		if(state.equals("READ")) {
			service.increaseHit(no);
			System.out.println("+++++조회수처리후 :" + board.hits);
			view = "b_read_page";
		}else {
			view = "b_update_page";
		}
		model.addAttribute("board", board);
		model.addAttribute("boardfiledtolist", boardfiledtolist);
		return view;
	}
	
	
	
	
	
		
	
	//메인화면 ajax처리용 (게시판,경조사,소식 )
	//jackson라이브러리가 List에 저장된 DTO들을 자동으로 json객체로 변환
	@RequestMapping(value ="/b_ajax.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<Board_DTO> ajaxlist(String category) {
		System.out.println("매개변수인입확인 : " + category);
		List<Board_DTO> ajaxlist = service.findByCategory(category);
		System.out.println("ajax통신확인 : " + ajaxlist);
		return ajaxlist;
	}
	
	
	//하단검색
	@RequestMapping("serarchData.do")
	public ModelAndView dataSearch(String tag, String searchData, Model model) {
		ModelAndView mav = new ModelAndView("page_test2");
		System.out.println("tag : " + tag + ",   searchData값 : " +  searchData);
		List<Board_DTO> listall = service.searchData(tag, searchData);
		mav.addObject("boardlist", listall);
		return mav;
	}

	
	//카테고리 조회
		@RequestMapping("/b_category.do")
		public ModelAndView categorylist(String category) {
			//System.out.println("매개변수체크 category : "+category);
			ModelAndView mav =new ModelAndView("b_list");
			List<Board_DTO> boardlist = service.findByCategory(category);
			mav.addObject("category", category);
			//System.out.println("공유체크 category : "+category);
			mav.addObject("boardlist", boardlist);
			//System.out.println("탑의 리스트선택시__________listCategory공유체크" +boardlist);
			return mav;
		}
	
	
	
	
	//페이징 테스트2
		@RequestMapping("/page_test2.do")
		public String paginglist2(PagingVO vo, Model model, String nowPage, String cntPerPage) {
			int total = service.countBoard();
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "5";
			}
			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("paging", vo);
			model.addAttribute("boardlist", service.selectBoard(vo));
			System.out.println("공유테스트 : " + service.selectBoard(vo));
			return "page_test2";
		}
	
}
