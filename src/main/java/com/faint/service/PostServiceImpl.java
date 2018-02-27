package com.faint.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.faint.domain.PostVO;
import com.faint.domain.SearchCriteria;
import com.faint.domain.TagVO;
import com.faint.persistence.PostDAO;
import com.faint.util.HashTagHelper;

@Service
public class PostServiceImpl implements PostService {

	@Inject
	private PostDAO dao;

	private static final Logger logger = LoggerFactory.getLogger(PostServiceImpl.class);

	///////////// post 등록하면서 tag랑 관계table에도 값넣기/////////
	// post등록
	// post의 caption의 Tag추출
	// tbl_tag에 없으면 추가해주기
	// tbl_posted_tag 테이블의 postid랑 tagid 넣기
	@Transactional
	@Override
	public void regist(PostVO post) throws Exception {
		dao.create(post);
		System.out.println("##################created post");
		// 첨부파일 목록 불러들임
		String[] files = post.getFiles();

		// 파일 목록 없으면 아무것도 안함
		if (files != null) {
			for (String url : files) {
				dao.addAttach(url);
			}
		}
		System.out.println("##################add attach");
		List<String> hashTags = HashTagHelper.getAllHashTags(post.getCaption());
		System.out.println(hashTags);
		System.out.println(post);
		if (!hashTags.isEmpty()) { // exist hash tag
			for (String tagname : hashTags) {
				
				registPostAndTag(post.getId(), tagname);
			}
		}
		System.out.println("##################add tags");

	}

	// post전체목록
	@Override
	public List<PostVO> listAllPost() throws Exception {
		return dao.listAllPost();
	}

	// post tag로 찾기( tag로 찾고나면 count +1 증가)
	@Override
	public List<PostVO> listPostKeyword(SearchCriteria cri) throws Exception {
		return dao.listPostKeyword(cri);
	}

	// tag 등록
	@Override
	public void insertTag(TagVO vo) throws Exception {
		dao.insertTag(vo);
	}

	// tag name검색
	@Override
	public TagVO selectTagByName(String name) throws Exception {
		return dao.selectTagByName(name);
	}

	/////////// post와 tag 관계 ////////////////////
	// postid와 tagid 등록
	@Override
	public void insertPostedTag(int postid, int tagid) throws Exception {
		dao.insertPostedTag(postid, tagid);
	}

	////////////////////////////
	// private?? 왜?? 일단 public
	public void registPostAndTag(Integer postid, String tagname) throws Exception {
		TagVO vo = selectTagByName(tagname);

		if (vo == null) {
			// tbl_tag에 존재하지 않는 tag
			// tbl_tag에 일단 tag를 넣는다
			vo = new TagVO();
			vo.setName(tagname);
			//vo.setTagcount(0);
			insertTag(vo);
		}
		insertPostedTag(postid, vo.getId());

	}
}
