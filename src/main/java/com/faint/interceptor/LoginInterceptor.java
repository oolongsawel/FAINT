package com.faint.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final String LOGIN="login";
	private static final Logger logger=LoggerFactory.getLogger(LoginInterceptor.class);
	
	//이전 세션 삭제
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		HttpSession session = request.getSession();
		if(session.getAttribute(LOGIN)!=null){
			logger.info("clear login data before====================================");
			session.removeAttribute(LOGIN);
		}
		return true;
	}
	
	//email,password값으로 받은 userVO검색하여 해당 객체 세션 객체에 저장
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{
		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Object userVO = modelMap.get("userVO");
		System.out.println(userVO);
		if(userVO != null){
			logger.info("new login success====================================");
			session.setAttribute(LOGIN, userVO); //세션 "login"속성에 userVO담아서 전달
			//이전페이지로 목적지 설정
			Object dest = session.getAttribute("dest");
			response.sendRedirect(dest!=null ? (String)dest:"/");
		}
	}
	
	
}
