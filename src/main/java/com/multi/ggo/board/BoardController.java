package com.multi.ggo.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	Board_Service service;
	
	@Autowired
	public BoardController(Board_Service service) {
		super();
		this.service = service;
	}

	//게시글등록
	@RequestMapping("/b_insert.do")
	public String write(Board_DTO dto) {
		System.out.println("등록확인1 : "+dto);
		service.b_insert(dto);
		System.out.println("등록확인2 : "+dto);
		return "redirect:/b_category.do?category=all";
	}
	
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
