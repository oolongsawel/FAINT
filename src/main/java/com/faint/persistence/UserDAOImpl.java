package com.faint.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.faint.domain.SearchCriteria;
import com.faint.domain.UserVO;
import com.faint.dto.FollowDTO;
import com.faint.dto.LoginDTO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.faint.mapper.userMapper";

	@Override
	public void create(UserVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	// 회원전체목록
	@Override
	public List<UserVO> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}

	// 회원키워드목록
	@Override
	public List<UserVO> listKeyword(SearchCriteria cri) throws Exception {
		return session.selectList(namespace + ".listKeyword", cri);
	}

	@Override
	public UserVO read(Integer id) throws Exception {
		return session.selectOne(namespace + ".read", id);
	}

	@Override
	public void update(UserVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer id) throws Exception {
		session.delete(namespace + ".delete", id);
	}

	/* follow=================================================== */
	@Override
	public void flwCreate(FollowDTO dto) throws Exception {
		session.insert(namespace + ".flwCreate", dto);
	};

	@Override
	public void flwDelete(FollowDTO dto) throws Exception {
		session.delete(namespace + ".flwDelete", dto);
	};

	@Override
	public int isFlw(FollowDTO dto) throws Exception {
		return session.selectOne(namespace + ".isFlw", dto);
	};

	@Override
	public List<UserVO> flwnList(int userid) throws Exception {
		return session.selectList(namespace + ".flwnList", userid);
	};

	@Override
	public List<UserVO> flwdList(int userid) throws Exception {
		return session.selectList(namespace + ".flwdList", userid);
	};

	@Override
	public int flwnCnt(int userid) throws Exception {
		return session.selectOne(namespace + ".flwnCnt", userid);
	};

	@Override
	public int flwdCnt(int userid) throws Exception {
		return session.selectOne(namespace + ".flwdCnt", userid);
	};

	// 로그인================================================
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return session.selectOne(namespace + ".login", dto);
	};

}
