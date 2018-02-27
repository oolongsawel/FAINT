package com.faint.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.faint.domain.PostVO;
import com.faint.domain.SearchCriteria;
import com.faint.domain.TagVO;

@Repository
public class PostDAOImpl implements PostDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.faint.mapper.postMapper";

	@Override
	public void create(PostVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public void addAttach(String url) throws Exception {
		session.insert(namespace + ".addAttach", url);
	}

	// post전체목록
	@Override
	public List<PostVO> listAllPost() throws Exception {
		return session.selectList(namespace + ".listAllPost");
	}

	// post tag(keyword)로 찾기
	@Override
	public List<PostVO> listPostKeyword(SearchCriteria cri) throws Exception {
		// 검색한 tag의 count값 1 증가
		plusTagCount(cri);
		return session.selectList(namespace + ".listPostKeyword", cri);
	}

	// tag로 포스트 찾으면 tag count+1 증가
	@Override
	public void plusTagCount(SearchCriteria cri) throws Exception {
		session.update(namespace + ".plusTagCount", cri);
	}

	/////////////// tag관련 ////////////////////
	// 태그등록
	@Override
	public void insertTag(TagVO vo) throws Exception {
		session.insert(namespace + ".insertTag", vo);
	}

	// 태그 name으로 검색
	@Override
	public TagVO selectTagByName(String name) throws Exception {
		return session.selectOne(namespace + ".selectTagByName", name);
	}

	// postid와 tagid 넣기
	@Override
	public void insertPostedTag(int postid, int tagid) throws Exception {

		Map<String, Integer> paramMap = new HashMap<>();
		paramMap.put("postid", postid);
		paramMap.put("tagid", tagid);

		session.insert(namespace + ".insertPostedTag", paramMap);
	}

}
