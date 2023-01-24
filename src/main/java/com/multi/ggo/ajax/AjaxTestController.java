package com.multi.ggo.ajax;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.ggo.member.MemberDTO;
import com.multi.ggo.member.MemberService;

@Controller
@RequestMapping("/ajax")
public class AjaxTestController {

	MemberService service;

	@Autowired
	public AjaxTestController(MemberService service) {
		super();
		this.service = service;
	}

	@RequestMapping("/noajax")
	public String noajax(String id, Model model) { // /ajax/noajax //처리 후 뷰를 response하는 메서드
		String msg = "";

		if (id.equals("jang")) {
			msg = "사용가능 아이디";
		} else {
			msg = "사용불가능 아이디";
		}
		model.addAttribute("msg", msg);
		return "etcview/ajax";

	}

//	/@RequestMappin("/ajaxtest01") 요렇게만하면 한글깨짐 . ↓ 아래와같이 설정해주어야 한글깨지지않음.
	// 처리후 Response Body에 처리결과 문자열을 저장해서 보내기
	@RequestMapping(value = "/ajaxtest01", produces = "application/text;charset=utf-8")
	@ResponseBody
	public String ajaxtest(String id) {
		String msg = "";

		if (id.equals("jang")) {
			msg = "사용가능 아이디";
		} else {
			msg = "사용불가능 아이디";
		}
		return msg;

	}

	
	
	//DTO 에 있는 번호비교 ( ajax처리)   //실제맵핑=/ajax/exam 클래스고정맵핑있음/ajax
	@RequestMapping(value = "/exam", produces = "application/text;charset=utf-8")
	@ResponseBody
	public String ajaxexam(String no) {
		String msg = "";
		//System.out.println("넘어오는파라미터 : " + no);
		try {
			if (service.noSearch(no) != null) {
				String reusltNo = service.noSearch(no).get(0).getNo();
						if (reusltNo.equals(no)) {
							msg = "사용불가능 번호 입니다.";
						} else {
							msg = "사용가능한 번호 입니다.";
						}
				} else {
					msg = "사용가능한 번호 입니다.";
				}
				return msg;
		} catch (Exception e) {
			msg = "사용가능한 번호 입니다.";
		}
		return msg;
	}
	
	
	
	//jsp파일 스크립트의 dataType이,     text인지 json인지 따라 자바 produces  잘입력할것.
	@RequestMapping(value = "/exam02", produces = "application/json;charset=utf-8" )
	@ResponseBody
	public MemberDTO ajax_json(String id) {
		//System.out.println("넘어오는파라미터 : " + id);
		//System.out.println(service.memberIdRead(id));
		return service.memberIdRead(id);
	}
	
	
	
	
	
	
}
