package com.multi.ggo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	MemberService service;
	
	@Autowired
	public MainController(MemberService service) {
		super();
		this.service = service;
	}
	
	
	//연결테스트
	@RequestMapping("/test")
	public String test() {
		return "/emp/summertest";
	}
	
	
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
		return "redirect:/listall.do";
	}

	
// 회원전체조회
	@RequestMapping("/listall.do")
	public ModelAndView listall() {
		ModelAndView mav = new ModelAndView("listall_Page");
		List<MemberDTO> listall =service.memberlist();
		System.out.println("전체멤버조회list" + listall);
		mav.addObject("listall", listall);
		return mav;
	}	

// 회원읽기
	@RequestMapping("/idRead.do")
	public ModelAndView idRead(String id, String state ) {
		//System.out.println("리스트에서 넘겨받은 거 :" + id +",   "+ state);
		MemberDTO idRead = service.memberIdRead(id);
		String view = "";
		if(state.equals("READ")) {
			view="idRead_Page";
		}else {
			view="idUpdate_Page";
		}
		ModelAndView mav = new ModelAndView(view);
		mav.addObject("idRead", idRead);
		System.out.println("리드가 읽은 id : " + id);
		return mav;
	}
	
	// 회원삭제
	@RequestMapping("/idDelete.do")
	public String delete(String id) {
		int result = service.delete(id);
		//System.out.println(result + "개 삭제완료");
		return "redirect:listall.do";
	}
	
	// 회원수정
	@RequestMapping("/idUpdate.do")
	public String idUpdate(MemberDTO dto) {
		System.out.println("업데이트 : " + dto);
		int memberdto = service.update(dto);
		System.out.println(memberdto +"개 업데이트 완료");
		return "redirect:listall.do";
	}
	
	// 로그인
	@RequestMapping("/login.do")
	public ModelAndView login(MemberDTO loginId, HttpServletRequest request) {
		System.out.println("request 1 찍어보기 : " + request);
		ModelAndView mav = new ModelAndView();
		System.out.println("loginId  찍어보기 : " + loginId);
		MemberDTO user = service.login(loginId);
		System.out.println("가져온거 찍어보기 " + user);
		//mav.setViewName("index");
		String view = "";
		if(user !=null) {
			HttpSession session = request.getSession();
			System.out.println("session 찍어보기 : " + session);
			session.setAttribute("user", user);
			//view = user.getAddr();
			view = "redirect:/mainPage";
		}else {
			view = "login_Page";
		}
		mav.setViewName(view);
		System.out.println("가져온거2 : " + user);
		return mav;
	}
	
	//로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		if(session != null) {
			session.invalidate();
		}
		return "index";
	} 
	
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