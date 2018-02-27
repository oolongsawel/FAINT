package com.faint.persistence;

import java.util.List;

import com.faint.domain.PostVO;
import com.faint.domain.SearchCriteria;
import com.faint.domain.TagVO;

public interface PostDAO {

	public void create(PostVO vo)throws Exception;
	//파일첨부
	public void addAttach(String fullName) throws Exception;

	//post 전체목록
	public List<PostVO> listAllPost() throws Exception;
	
	//post 키워드 목록(String타입의 키워드를 매개변수로 받음)
	public List<PostVO> listPostKeyword(SearchCriteria cri) throws Exception;

	/////////////tag 관련 ////////////////
	//tag등록
	public void insertTag(TagVO vo) throws Exception; 
	
	//tag name으로 찾기
	public TagVO selectTagByName(String name) throws Exception;
	
	//tagcount증가_keyword를 매개변수로 받음
	public void plusTagCount(SearchCriteria cri) throws Exception;
	
	
	///////////post와 tag relation ////////////////////
	//postid와 tagid 등록
	public void insertPostedTag(int postid, int tagid) throws Exception;
}
