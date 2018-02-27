package com.faint.sns;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.faint.domain.UserVO;
import com.faint.dto.FollowDTO;
import com.faint.dto.LoginDTO;
import com.faint.service.UserService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
		
	@Inject
	private UserService service;
	
	@RequestMapping(value="/profile_test", method=RequestMethod.GET)
	public void registerGET(UserVO user, Model model) throws Exception{
		logger.info("profile get................");
	}
	
	@RequestMapping(value="/profile_test", method=RequestMethod.POST)
	public void registerPOST(UserVO user, Model model) throws Exception{
		logger.info(user.toString());
		service.regist(user);
	}
	
	@RequestMapping(value="/profile_main", method=RequestMethod.GET)
	public void listAll(Model model) throws Exception{
		
		model.addAttribute("list", service.listAll());
		
	}
	
	@RequestMapping(value="/profile", method=RequestMethod.GET)
	public void read(@RequestParam("id") int id, Model model, HttpServletRequest request) throws Exception{
		model.addAttribute("userVO", service.read(id));
		

		//로그인유저와 페이지 주인 비교
		if(request.getSession()!=null){
			HttpSession session=request.getSession();
			UserVO vo=(UserVO)session.getAttribute("login");
			
			//1일경우 팔로우 중인 관계, 0일경우 팔로우가 아닌관계, -1일 경우 본인페이지
			if(id!=vo.getId()){ //세션값과 userpage주인이 다른경우 (팔로우 여부 확인(1일경우 팔로우 중 0일경우 팔로우 아님))
				FollowDTO dto=new FollowDTO();
				dto.setFollowedid(id);
				dto.setUserid(vo.getId());
				model.addAttribute("relation", service.isFlw(dto));
			}else if(id==vo.getId()){ //세션값과 userpage주인이 같은 경우 - 해당페이지의 관리자이므로 관리할 수 있는 권한부여
				model.addAttribute("relation", -1);
			}
		};

		
	}
	
	// 팔로우 관련 컨트롤러-------------------------------
	//follow 등록 - rest방식
	@ResponseBody
	@RequestMapping(value="/follow", method=RequestMethod.POST)
	public ResponseEntity<String> followStart(@RequestBody FollowDTO dto){
		ResponseEntity<String> entity=null;
		System.out.println(dto);
		try{	
			service.flwCreate(dto);
			entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	

	//follow 삭제 - rest방식
	@ResponseBody
	@RequestMapping(value="/unfollow", method=RequestMethod.DELETE)
	public ResponseEntity<String> unfollow(@RequestBody FollowDTO dto){
		ResponseEntity<String> entity=null;
		System.out.println(dto);
		try{
			service.flwDelete(dto);
			entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 해당 유저가 follow하는 사람 리스트 URI
		@ResponseBody
		@RequestMapping(value="/following/{userid}", method=RequestMethod.GET)
		public ResponseEntity<List<UserVO>> flwnList(@PathVariable("userid") Integer userid){
			ResponseEntity<List<UserVO>> entity=null;
			try{
				entity=new ResponseEntity<List<UserVO>>(service.flwnList(userid), HttpStatus.OK);
			}catch(Exception e){
				e.printStackTrace();
				entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		// 해당 유저를 follow하는 사람 리스트 URI
		@ResponseBody
		@RequestMapping(value="/followed/{userid}", method=RequestMethod.GET)
		public ResponseEntity<List<UserVO>> flwdList(@PathVariable("userid") Integer userid){
			ResponseEntity<List<UserVO>> entity=null;
			try{
				entity=new ResponseEntity<List<UserVO>>(service.flwdList(userid), HttpStatus.OK);
			}catch(Exception e){
				e.printStackTrace();
				entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		// 해당 유저가 follow하는 사람 count URI
		@ResponseBody
		@RequestMapping(value="/followingCnt/{userid}", method=RequestMethod.GET)
		public ResponseEntity<Integer> flwnCnt(@PathVariable("userid") Integer userid){
			ResponseEntity<Integer> entity=null;
			try{
				entity=new ResponseEntity<Integer>(service.flwnCnt(userid), HttpStatus.OK);
			}catch(Exception e){
				e.printStackTrace();
				entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		// 해당 유저를 follow하는 사람 count URI
		@ResponseBody
		@RequestMapping(value="/followedCnt/{userid}", method=RequestMethod.GET)
		public ResponseEntity<Integer> flwdCnt(@PathVariable("userid") Integer userid){
			ResponseEntity<Integer> entity=null;
			try{
				entity=new ResponseEntity<Integer>(service.flwdCnt(userid), HttpStatus.OK);
			}catch(Exception e){
				e.printStackTrace();
				entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		//로그인 관련 컨트롤러======================================
		//로그인 페이지
		@RequestMapping(value="/login", method=RequestMethod.GET)
		public void loginGET(@ModelAttribute("dto") LoginDTO dto){ 
			
		}
		//로그인 페이지방향(세션의 LOGIN속성에 uservo값 추가) - login 인터셉터가 작동
		@RequestMapping(value="/loginPost", method=RequestMethod.POST)
		public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception{
			UserVO vo=service.login(dto);
			if(vo==null){
				return;
			}
			model.addAttribute("userVO", vo);
		}
		//프로필편집
		@RequestMapping(value = "/profile/edit", method = RequestMethod.GET)
		public void profileEdit(Model model){
			
			logger.info("profile edit..............");
			
			UserVO user = new UserVO();
			model.addAttribute(user);
			
		}
		
		@RequestMapping(value ="/profile/pwchange", method = RequestMethod.GET)
		public void pwEdit(Model model){
			logger.info("profile password edit..............");
			
		}
}
	
