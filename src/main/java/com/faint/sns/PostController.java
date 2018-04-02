package com.faint.sns;

import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.faint.domain.PostVO;
import com.faint.domain.UserVO;
import com.faint.dto.FollowinPostDTO;
import com.faint.service.PostService;

@Controller
@RequestMapping("/post/*")
public class PostController {

	@Inject
	private PostService service;
	
	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
	
	/*게시물 등록창 읽기*/
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGET(Model model, HttpServletRequest request) throws Exception {
		logger.info("register get..............");
		
		HttpSession session = request.getSession();
		if(session !=null){
			UserVO user = (UserVO)session.getAttribute("login");
			logger.info(user.toString());
			model.addAttribute("userVO", user);
		}
		
		return "forward:/post/uploader";
	}

	/*게시물 등록 - model방식*/
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public void registerPOST(Model model, HttpServletRequest request) throws Exception {
		logger.info("register post..............");
		
		HttpSession session = request.getSession();
		if(session !=null){
			UserVO user = (UserVO)session.getAttribute("login");
			logger.info(user.toString());
			model.addAttribute("userVO", user);
		}
		
		String[] files = request.getParameterValues("files");

		if(files != null){
			JSONArray jArray = new JSONArray();

			for(int i=0; i<files.length;i++){
				JSONParser jsonParser = new JSONParser();
				JSONObject jsonObject = (JSONObject) jsonParser.parse(files[i]);
				jArray.add(jsonObject);
			}
			logger.info(jArray.toJSONString());
			model.addAttribute("files", jArray);
		}
		logger.info(Arrays.toString(files));
	}
	
	/*파일 첨부*/
	@RequestMapping(value = "/uploader", method = RequestMethod.GET)
	public void uploader() throws Exception {
		logger.info("uploader get..............");
		
	}
	
	/*게시물 등록 - model방식*/
	@RequestMapping(value = "/register/submit", method = RequestMethod.POST)
	public String registerSubmit(PostVO post, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
		logger.info("regist submit POST..............");
		logger.info(post.toString());
		
		HttpSession session = request.getSession();
		
		UserVO user = (UserVO)session.getAttribute("login");
		post.setUserid(user.getId());
		
		service.regist(post);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/";
	}
	
	
	/*게시물 URI*/
	@ResponseBody
	@RequestMapping(value="/{userid}", method=RequestMethod.GET)
	public ResponseEntity<List<PostVO>> list(@PathVariable("userid") Integer userid){
		ResponseEntity<List<PostVO>> entity=null;
		try{
			entity=new ResponseEntity<>(service.read(userid), HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/detail", method=RequestMethod.POST)
	public ResponseEntity<FollowinPostDTO> detailRead(@RequestParam("postid") Integer postid, HttpServletRequest request){
		ResponseEntity<FollowinPostDTO> entity=null;
		
		System.out.println(postid);
		
		HttpSession session=request.getSession();
		UserVO userVO=(UserVO)session.getAttribute("login");
		PostVO vo = new PostVO();
		vo.setId(postid);
		vo.setUserid(userVO.getId());
		
		try{
			entity=new ResponseEntity<>(service.detailRead(vo), HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//게시물 저장 - rest방식
	@RequestMapping(value="/{postid}/store", method=RequestMethod.POST)
	public ResponseEntity<String> postStore(@PathVariable("postid") Integer postid, HttpServletRequest request){
		ResponseEntity<String> entity=null;
		
		HttpSession session=request.getSession();
		UserVO userVO=(UserVO)session.getAttribute("login");
		PostVO vo = new PostVO();
		vo.setId(postid);
		vo.setUserid(userVO.getId());
		
		System.out.println(postid);
		System.out.println(userVO.getId());
		
		try{
			service.postStore(vo);
			entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	//like 삭제 - rest방식
	@RequestMapping(value="/{postid}/takeaway", method=RequestMethod.DELETE)
	public ResponseEntity<String> postTakeaway(@PathVariable("postid") Integer postid, HttpServletRequest request){
		ResponseEntity<String> entity=null;
		
		HttpSession session=request.getSession();
		UserVO userVO=(UserVO)session.getAttribute("login");
		PostVO vo = new PostVO();
		vo.setId(postid);
		vo.setUserid(userVO.getId());
		
		try{
			service.postTakeaway(vo);
			entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//like 등록 - rest방식
	@RequestMapping(value="/{postid}/like", method=RequestMethod.POST)
	public ResponseEntity<String> postLike(@PathVariable("postid") Integer postid, HttpServletRequest request){
		ResponseEntity<String> entity=null;
		
		HttpSession session=request.getSession();
		UserVO userVO=(UserVO)session.getAttribute("login");
		PostVO vo = new PostVO();
		vo.setId(postid);
		vo.setUserid(userVO.getId());
		
		System.out.println(postid);
		System.out.println(userVO.getId());
		
		try{
			service.postLike(vo);
			entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	//like 삭제 - rest방식
	@RequestMapping(value="/{postid}/unlike", method=RequestMethod.DELETE)
	public ResponseEntity<String> postUnlike(@PathVariable("postid") Integer postid, HttpServletRequest request){
		ResponseEntity<String> entity=null;
		
		HttpSession session=request.getSession();
		UserVO userVO=(UserVO)session.getAttribute("login");
		PostVO vo = new PostVO();
		vo.setId(postid);
		vo.setUserid(userVO.getId());
		
		try{
			service.postUnlike(vo);
			entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//게시물에 대한 좋아요 유저반환(PK,nickname만) - JSON객체(LIST배열에 담아서 던져줌)
	@ResponseBody
	@RequestMapping(value="/{postid}/likerlist", method=RequestMethod.GET)
	public ResponseEntity<List<UserVO>> likerList(@PathVariable("postid") Integer postid, HttpServletRequest request){
		ResponseEntity<List<UserVO>> entity=null;
		
		HttpSession session=request.getSession();
		UserVO userVO=(UserVO)session.getAttribute("login");
		PostVO vo = new PostVO();
		vo.setId(postid);
		vo.setUserid(userVO.getId());
		
		try{
			entity=new ResponseEntity<List<UserVO>>(service.postLiker(vo), HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
