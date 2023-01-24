package com.multi.ggo.ajax;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.multi.ggo.member.MemberDTO;

public class InterCepter extends HandlerInterceptorAdapter{
	
	private long start;
	private long end;
	//컨트롤인입전  (컨트롤러 호출 전 호출되는 메서드(HandlerAdapter호출 전에))
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//System.out.println("접속한 ip : " + request.getRemoteHost());
		
		
		// 로그인 성공시 user라는 이름으로 어트리뷰트가 저장됨
		//세션이 만들어있지 않으면 null을 리턴하도록 
		HttpSession session = request.getSession(false);//getSession() 빈매개변수로 둘시, 세션이없으면 자동생성됨. 그래서 false
		
		if(session !=null) { // 가져온 세션이 null이 아니라면, 즉 로그인성공한 사람이라면
			MemberDTO user = (MemberDTO) session.getAttribute("user");
			if(user==null) { // user가 null이면 로그인 하지 않았다.
				response.sendRedirect("/ggo/login_Page"); //그렇다면 sendRedirect로 로그인 페이지로 가게끔 한다.
				return false; // 다음 컨트롤러로 진행이 안되야 하기 때문에 retrun에 fasle입력
			}
		}
		start = System.nanoTime();
		return true;   //실행시 다음스탭으로 넘어가야하니 true;
		//return super.preHandle(request, response, handler);  
	}

	
	
	
	//컨트롤 처리후 ( /컨트롤러 실행후에 호출되는 메서드(HandlerAdapter호출 후에))
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		end = System.nanoTime();
		String handlerClass = handler.getClass().getName();
		//System.out.println("실행객체 : " + handlerClass +", 실행시간 : " + (end-start));
		super.postHandle(request, response, handler, modelAndView);
	}

	
	//뷰가 렌더링된 후에 호출
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}

	
	
	
	
	
	
	
	
}
