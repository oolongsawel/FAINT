package com.faint.sns;


import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.faint.domain.UserVO;
import com.faint.service.PostService;

@Controller
public class MainController {

	@Inject
	private PostService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		
		
		return "redirect:/main";
		
	}
		@RequestMapping(value = "/instar_main", method = RequestMethod.GET)
	public String home1(Locale locale, Model model) {
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			
			String formattedDate = dateFormat.format(date);
			
			model.addAttribute("serverTime", formattedDate );
		
		return "/instar_main";
		
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void main(HttpServletRequest request, Model model)throws Exception{
		
		HttpSession session=request.getSession();
		UserVO vo=(UserVO)session.getAttribute("login");

		if(vo!=null){
				model.addAttribute("list", service.mainRead(vo.getId())); //세션 아이디값을 통해 현재 팔로우중인 유저들의 게시물정보 및 유저정보 등을 받아옴
		}
	}

}
