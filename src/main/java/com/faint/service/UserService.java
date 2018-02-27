package com.faint.service;

import java.util.List;

import com.faint.domain.SearchCriteria;
import com.faint.domain.UserVO;

public interface UserService {
	public void join(UserVO user) throws Exception;

	//사용자 전체목록
	public List<UserVO> listAll() throws Exception;
	
	//사용자 키워드목록
	public List<UserVO> listKeyword(SearchCriteria cri) throws Exception;
}
