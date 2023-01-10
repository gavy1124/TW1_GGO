package com.multi.ggo.ajax;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.multi.ggo.member.MemberDTO;
import com.multi.ggo.member.MemberService;




@RestController
//@Controller
//@ResponseBody
@RequestMapping("/json")
public class JSONTestController {
	MemberService service;

	@Autowired
	public JSONTestController(MemberService service) {
		super();
		this.service = service;
	}
	
	//	@ResponseBody를 넣어주면, ★웹페이지(뷰)를 응답하지않고★, 	response body에 String을 추가해서 response 하겠다는 의미
	
	
	//http형태의 요청이 들어왔을때,   response 뷰를 담아 보내는것이 아니라,
	//Responsebody에 받을형식이 String이다 
	@RequestMapping("/getString") 
	public String responseString() {
		return "json";  
	}
	
	@RequestMapping("/getJsonObj")
	public MemberDTO responseOBJ() {
		return service.memberIdRead("가오리상");
	}
	
	@RequestMapping("/getJsonArr")
	public List<MemberDTO> getJsonArr() {
		return service.memberlist();
	}
	
	
	
	
	
	
}
