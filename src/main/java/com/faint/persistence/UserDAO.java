package com.faint.persistence;

import java.util.List;

import com.faint.domain.SearchCriteria;
import com.faint.domain.UserVO;
import com.faint.dto.FollowDTO;
import com.faint.dto.LoginDTO;

public interface UserDAO {

	public void create(UserVO vo) throws Exception;

	// 사용자 전체목록
	public List<UserVO> listAll() throws Exception;

	// 사용자 키워드 목록(String타입의 키워드를 매개변수로 받음)
	public List<UserVO> listKeyword(SearchCriteria cri) throws Exception;

	public UserVO read(Integer id) throws Exception;

	public void update(UserVO vo) throws Exception;

	public void delete(Integer id) throws Exception;

	/* 팔로우 */
	public void flwCreate(FollowDTO dto) throws Exception;

	public void flwDelete(FollowDTO dto) throws Exception;

	public int isFlw(FollowDTO dto) throws Exception;

	public List<UserVO> flwnList(int userid) throws Exception;

	public List<UserVO> flwdList(int userid) throws Exception;

	public int flwnCnt(int userid) throws Exception;

	public int flwdCnt(int userid) throws Exception;

	/* 로그인 */
	public UserVO login(LoginDTO dto) throws Exception;
}
