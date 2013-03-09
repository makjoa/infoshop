package kr.pe.infoshop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class SessionInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// check variable
		Object userId = request.getSession().getAttribute("userInfo");
		//
		System.out.println("==============================================="+ userId);
		// pass through when access login.do, join.do
		if(request.getRequestURI().equals("/infoshop/login") || request.getRequestURI().equals("/infoshop/join")){
			if(userId != null){
				response.sendRedirect(request.getContextPath() + "/");
				return true;
			} else {
				return true;
			}
		}
		//
		// where other pages		
		if(userId == null){
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		} else {
			return true;
		}
		//		
	}
	
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}
}
