package com.faint.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.faint.domain.SearchCriteria;
import com.faint.domain.UserVO;
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
}
