package com.multi.ggo.board;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
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
		fileuploadService.uploadFiles(files, path);
		service.b_insert(dto);
		return "redirect:/b_category.do?category=all";
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
	
	
	
	
	
	
	
	
	
	//게시글조회
	@RequestMapping("/b_list.do")
	public ModelAndView boardlist() {
		ModelAndView mav =new ModelAndView("b_list");
		List<Board_DTO> b_list = service.b_list();
		mav.addObject("b_list", b_list);
		return mav;
	}
	
	//카테고리 조회
	@RequestMapping("/b_category.do")
	public ModelAndView categorylist(String category) {
		System.out.println("매개변수체크 category : "+category);
		ModelAndView mav =new ModelAndView("b_list");
		List<Board_DTO> boardlist = service.findByCategory(category);
		mav.addObject("category", category);
		System.out.println("공유체크 category : "+category);
		mav.addObject("boardlist", boardlist);
		System.out.println("탑의 리스트선택시__________listCategory공유체크" +boardlist);
		return mav;
	}
		
     //게시글 읽기
	@RequestMapping("/b_read.do")
	public String b_read(String no, String state, Model model) {
		Board_DTO board = service.b_read(no);
		String view="";
		if(state.equals("READ")) {
			view = "b_read_page";
		}else {
			view = "b_update_page";
		}
		model.addAttribute("board", board);
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
	
	
	
	
}
