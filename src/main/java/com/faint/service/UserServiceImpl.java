package com.faint.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.faint.domain.SearchCriteria;
import com.faint.domain.UserVO;
import com.faint.dto.FollowDTO;
import com.faint.dto.LoginDTO;
import com.faint.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO dao;

	@Override
	public void join(UserVO user) throws Exception {
		dao.create(user);
	}

	// 사용자 전체목록
	@Override
	public List<UserVO> listAll() throws Exception {
		return dao.listAll();
	}

	// 사용자 키워드목록
	@Override
	public List<UserVO> listKeyword(SearchCriteria cri) throws Exception {
		return dao.listKeyword(cri);
	}
	@Override
	public void regist(UserVO user) throws Exception{
		dao.create(user);
	}
	
	@Override
	public UserVO read(Integer id) throws Exception{
		return dao.read(id);
	}
	
	@Override
	public void modify(UserVO user) throws Exception{
		dao.update(user);
	}
	
	@Override
	public void remove(Integer id) throws Exception{
		dao.delete(id);
	}
	
/*	 팔로우 =========================================== */
	
	@Override
	public void flwCreate(FollowDTO dto)throws Exception{
		dao.flwCreate(dto);
	}
	
	@Override
	public void flwDelete(FollowDTO dto)throws Exception{
		dao.flwDelete(dto);
	}
	
	@Override
	public int isFlw(FollowDTO dto)throws Exception{
		return dao.isFlw(dto);
	}
	
	@Override
	public List<UserVO> flwnList(int userid) throws Exception{
		return dao.flwnList(userid);
	}
	
	@Override
	public List<UserVO> flwdList(int userid) throws Exception{
		return dao.flwdList(userid);
	}
	
	@Override
	public int flwnCnt(int userid) throws Exception{
		return dao.flwnCnt(userid);
	}
	
	@Override
	public int flwdCnt(int userid) throws Exception{
		return dao.flwdCnt(userid);
	}
	
	//로그인=======================================
	@Override
	public UserVO login(LoginDTO dto)throws Exception{
		return dao.login(dto);
	}
}
