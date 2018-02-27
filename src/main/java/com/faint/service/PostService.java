package com.faint.service;

import java.util.List;

import com.faint.domain.PostVO;
import com.faint.domain.SearchCriteria;
import com.faint.domain.TagVO;

public interface PostService {
	public void regist(PostVO post) throws Exception;

	// post 전체목록
///////////// post 등록하면서 tag랑 관계table에도 값넣기/////////
	public List<PostVO> listAllPost() throws Exception;

	// post tag로 찾기(keyword)
	public List<PostVO> listPostKeyword(SearchCriteria cri) throws Exception;

	// tag 등록
	public void insertTag(TagVO vo) throws Exception;

	// tag name검색
	public TagVO selectTagByName(String name) throws Exception;

	/////////// post와 tag 관계 ////////////////////
	// postid와 tagid 등록
	public void insertPostedTag(int postid, int tagid) throws Exception;

	public List<PostVO> read(Integer userid) throws Exception;
	
	public void modify(PostVO post) throws Exception;
	
	public void remove(Integer id) throws Exception;
}
