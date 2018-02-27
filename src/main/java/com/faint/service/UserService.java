package com.faint.service;

import java.util.List;

import com.faint.domain.SearchCriteria;
import com.faint.domain.UserVO;
import com.faint.dto.FollowDTO;
import com.faint.dto.LoginDTO;

public interface UserService {
	public void join(UserVO user) throws Exception;

	// 사용자 전체목록
	public List<UserVO> listAll() throws Exception;

	// 사용자 키워드목록
	public List<UserVO> listKeyword(SearchCriteria cri) throws Exception;

	public void regist(UserVO user) throws Exception;

	public UserVO read(Integer id) throws Exception;

	public void modify(UserVO user) throws Exception;

	public void remove(Integer id) throws Exception;

	/* 팔로우 */
	public void flwCreate(FollowDTO dto) throws Exception;

	public void flwDelete(FollowDTO dto) throws Exception;

	public int isFlw(FollowDTO dto) throws Exception;

	public List<UserVO> flwnList(int userid) throws Exception;

	public List<UserVO> flwdList(int userid) throws Exception;

	public int flwnCnt(int userid) throws Exception;

	public int flwdCnt(int userid) throws Exception;

	// 로그인

	public UserVO login(LoginDTO dto) throws Exception;
}
