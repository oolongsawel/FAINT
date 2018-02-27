package com.faint.sns;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.faint.domain.PostVO;
import com.faint.service.PostService;

@Controller
@RequestMapping("/post/*")
public class PostController {

	@Inject
	private PostService service;
	
	private static final Logger logger = LoggerFactory.getLogger(ProfileController.class);
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(PostVO post, Model model) throws Exception {
		logger.info("register get..............");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(PostVO post, RedirectAttributes rttr) throws Exception {
		logger.info("regist POST..............");
		logger.info(post.toString());

		service.regist(post);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/main";
	}
}
