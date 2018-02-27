package com.faint.sns;

import javax.inject.Inject;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.faint.domain.SearchCriteria;
import com.faint.service.UserService;

@Controller
@RequestMapping("/searchlist/*")
public class SearchListController {
	
	
		  private static final Logger logger = LoggerFactory.getLogger(SearchListController.class);

		  @Inject
			private UserService userService;
		  
		  //list.jsp에서 키워드를 받아서 키워드와 일치하는 유저목록 출력
		  @RequestMapping(value = "/list", method = RequestMethod.GET)
		  public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		    logger.info(cri.toString());
		    //키워드출력(확인차)
		    System.out.println(cri.getKeyword());
		    model.addAttribute("list", userService.listKeyword(cri));
		  }
		  
		 
}
