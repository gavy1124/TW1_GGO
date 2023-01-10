package com.multi.ggo.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("user") 
public class MemberController {
	
	MemberService service;
	
	@Autowired
	public MemberController(MemberService service) {
		super();
		this.service = service;
	}
	
	
	//연결테스트
	@RequestMapping("/test")
	public String test() {
		return "/emp/summertest";
	}
	
	
	

	@RequestMapping("/myjob.do") //수업에선 menupath를 넣어, 별도 jsp연결함
	public String myjob(HttpSession session) {
		MemberDTO user = (MemberDTO) session.getAttribute("user");
		
		return user.getAddr();
	}
	
	
	
	
	
	
	
	
	
	
	
//	@RequestMapping("/index.do")
//	public String index(Model model) {
//		//첫 페이지가 로딩될때 필요한 데이터를 가져오기 위해 서비스 연결
//		List<MemberDTO> boardlist = service.boardCategory("골드");
//		model.addAttribute(boardlist);
//		return "index";
//	}
	
	
	
	
	
	
	
	@RequestMapping("/mainPage")
	public String index() {
		return "index";
	}
	
	
//컨트롤 > service > serviceimpl > dao > daoimpl > mybatis > 오라클

// 회원가입페이지 view-config 로처리
// 로그인페이지 view-config 로처리

// 회원등록
	@RequestMapping("/write.do")
	public String write(MemberDTO dto) {
		service.insert(dto);
		//System.out.println("등록 dto : " + dto);
		return "redirect:/listall.do?sort=all";
	}

	
// 타입별전체조회
	@RequestMapping("/listall.do")
	public ModelAndView listall(String sort) {
		//System.out.println("sort찍 : " + sort);
		ModelAndView mav = new ModelAndView("listall_Page");
		List<MemberDTO> listall =service.boardCategory(sort);
		//System.out.println("sort : " + sort);
		//System.out.println("listall : " + listall);
		mav.addObject("sort", sort);
		mav.addObject("listall", listall);
		return mav;
	}	
	
// 회원전체조회
//	@RequestMapping("/listall.do")
//	public ModelAndView listall() {
//		ModelAndView mav = new ModelAndView("listall_Page");
//		List<MemberDTO> listall =service.memberlist();
//		System.out.println("전체멤버조회list" + listall);
//		mav.addObject("listall", listall);
//		return mav;
//	}	

	
	
	
	// 회원읽기
		@RequestMapping("/idRead.do")
		public String idRead(String id, String state, Model model ) {
			//ModelAndView mav = new ModelAndView(view);
			MemberDTO idRead = service.memberIdRead(id);
			String view = "";
			if(state.equals("READ")) {
				//System.out.println("리드: "+idRead.getSort());
				view="idRead_Page";
			}else {
				//System.out.println("업뎃: "+idRead.getSort());
				view="idUpdate_Page";
			}
			//System.out.println("model수정하기___________________________" + idRead);
			//mav.addObject("idRead", idRead);
			model.addAttribute("idRead", idRead);
			return view;
		}
	
// 회원읽기
//	@RequestMapping("/idRead.do")
//	public ModelAndView idRead(String id, String state ) {
//		MemberDTO idRead = service.memberIdRead(id);
//		String view = "";
//		if(state.equals("READ")) {
//			view="idRead_Page";
//		}else {
//			view="idUpdate_Page";
//		}
//		ModelAndView mav = new ModelAndView(view);
//		mav.addObject("idRead", idRead);
//		return mav;
//	}
//	
	
	
	
	
	// 회원삭제
	@RequestMapping("/idDelete.do")
	public String delete(String id) {
		int result = service.delete(id);
		//System.out.println(result + "개 삭제완료");
		return "redirect:listall.do?sort=all";
	}
	
	// 회원수정
	@RequestMapping("/idUpdate.do")
	public String idUpdate(MemberDTO dto) {
		System.out.println("업데이트 : " + dto);
		int memberdto = service.update(dto);
		System.out.println(memberdto +"개 업데이트 완료");
		return "redirect:listall.do?sort=all";
	}
	
	
	// 로그인(new)
	@RequestMapping("/login.do")
	public String springlogin(MemberDTO loginuserInfo, Model model) {
		System.out.println("스프링이제공하는 @SessionAttributes(\"user\")  : "  );
		MemberDTO user = service.login(loginuserInfo);
		String view="";
		if(user != null) {
			model.addAttribute("user", user);
//			view = user.getEmail();
			view = "redirect:/mainPage";
		}else{
			view = "login_Page";
		}
		return view;
	}
	
	
	//로그아웃
	@RequestMapping("/logout.do")
	public String springlogout(SessionStatus status) {
		System.out.println("user유저객체제거");
		status.setComplete(); //세션에있는 user객체제거
		return "index";
	}
	
	
	
	
	
	
	
	
	
	// 로그인
//	@RequestMapping("/login.do")
//	public ModelAndView login(MemberDTO loginId, HttpServletRequest request) {
//		ModelAndView mav = new ModelAndView();
//		MemberDTO user = service.login(loginId);
//		String view = "";
//		if(user !=null) {
//			HttpSession session = request.getSession();
//			session.setAttribute("user", user);
//			view = "redirect:/mainPage";
//		}else {
//			view = "login_Page";
//		}
//		mav.setViewName(view);
//		return mav;
//	}
	
	
	
	
	
	
	
//	//로그아웃
//	@RequestMapping("/logout.do")
//	public String logout(HttpSession session) {
//		if(session != null) {
//			session.invalidate();
//		}
//		return "index";
//	} 
	
	
	
	
	
	// 하단검색
	@RequestMapping("/dataSearch.do")
	public ModelAndView dataSearch(String tag, String searchData) {
		ModelAndView mav = new ModelAndView("listall_Page");
		List<MemberDTO> listall =service.Search(tag, searchData);
		//System.out.println("전체멤버조회" + listall);
		mav.addObject("listall", listall);
		return mav;
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}