package com.faint.sns;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.faint.domain.UserVO;

@Controller
//@RequestMapping("/member/profile/*")
public class ProfileController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProfileController.class);
	/*
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public void profileEdit(Model model){
		
		logger.info("profile edit..............");
		
		UserVO user = new UserVO();
		model.addAttribute(user);
		
	}
	
	@RequestMapping(value ="/pwchange", method = RequestMethod.GET)
	public void pwEdit(Model model){
		logger.info("profile password edit..............");
		
	}*/
}
