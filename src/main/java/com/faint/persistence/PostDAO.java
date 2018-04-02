package com.faint.persistence;

import java.util.List;

import com.faint.domain.PostVO;
import com.faint.domain.SearchCriteria;
import com.faint.domain.TagVO;
import com.faint.domain.UserVO;
import com.faint.dto.FollowinPostDTO;
import com.faint.dto.TopPostDTO;

public interface PostDAO {

	public void create(PostVO vo)throws Exception;

	//파일첨부
	public void addAttach(String fullName) throws Exception;
	
	//==================post read관련======================
	//특정유저의 전체 포스트
	public List<PostVO> read(Integer userid) throws Exception;
	
	//특정유저의 전체 저장 포스트
	public List<PostVO> storeRead(Integer userid) throws Exception;
	
	//게시물의 세부디테일 정보
	public FollowinPostDTO detailRead(PostVO vo) throws Exception;
	
	//모든 post 전체목록
	public List<PostVO> listAllPost() throws Exception;
	
	//팔로우한 유저의 post전체목록 및 유저정보
	public List<FollowinPostDTO> mainRead(Integer id) throws Exception;
	
	// 인기 게시물
	public List<PostVO> topPost(TopPostDTO dto) throws Exception;
	

	//===================tag 관련 =======================
	//post 키워드 목록(String타입의 키워드를 매개변수로 받음)
	public List<PostVO> listPostKeyword(SearchCriteria cri) throws Exception;
		
	//tag등록
	public void insertTag(TagVO vo) throws Exception; 
	
	//tag name으로 찾기
	public TagVO selectTagByName(String name) throws Exception;
	
	//tagcount증가_keyword를 매개변수로 받음
	public void plusTagCount(SearchCriteria cri) throws Exception;
	

	
	//postid와 tagid 등록
	public void insertPostedTag(int postid, int tagid) throws Exception;
	/*---------------------------------------------무한 스크롤----------------------------------------------------------*/
	
	// 태그 검색 무한 스크롤
	public List<PostVO> tagsAjax(SearchCriteria cri) throws Exception;
	public List<PostVO> infiniteScrollTags(SearchCriteria cri, Integer row) throws Exception;

	
	// 위치 검색 무한 스크롤
	public List<PostVO> locationsAjax(SearchCriteria cri) throws Exception;
	public List<PostVO> infiniteScrollLocations(SearchCriteria cri, Integer row) throws Exception;
	
	//=========================post와 like============================
	public void postLike(PostVO vo) throws Exception;
		
	public void postUnlike(PostVO vo) throws Exception;
		
	public List<UserVO> postLiker(PostVO vo) throws Exception;
	
	//==============================store==============================
	public void postStore(PostVO vo) throws Exception;
	
	public void postTakeaway(PostVO vo) throws Exception;
	
}
