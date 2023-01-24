package com.multi.ggo.ajax;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.multi.ggo.board.Board_DTO;
import com.multi.ggo.member.MemberDTO;

//컨트롤러가 실행되는 시간을 측정 & 요청 IP
public class TimeCheckInterCepter extends HandlerInterceptorAdapter{

	private long start;
	private long end;

	//컨트롤러 호출 전 호출되는 메서드(HandlerAdapter호출 전에)
	//retrun이 true이면 다음으로 진행,
	//        false이면 진행 x
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("____________preHandle 컨트롤전");
		System.out.println("접속한 ip : " + request.getRemoteHost());
		
		
		
		
		MemberDTO user= (MemberDTO) request.getSession().getAttribute("user");
		System.out.println("인터셉터 board체크 : " + user);
		String view = "";
		if(user==null) {
			view = "redirect:/login_Page";
			response.sendRedirect("/ggo/login_Page");
			return false; // 비로그인자 막는거니 다음으로 연결되지 않게 retrun false;
		}
			
			start = System.nanoTime();
//		return super.preHandle(request, response, handler);
		return true;
	}

	
	
	//컨트롤러 실행후에 호출되는 메서드(HandlerAdapter호출 후에)
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
//		super.postHandle(request, response, handler, modelAndView);
		end = System.nanoTime();
		System.out.println("____________postHandle 컨트롤후______________");
		String handlerClass = handler.getClass().getName();
		System.out.println("실행객체 : " + handlerClass +", 실행시간 : " + (end-start));
	}


	// 뷰가 렌더링된 후에 호출
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}
	
	
	
	
	
}
