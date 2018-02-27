package com.faint.persistence;

import java.util.List;

import com.faint.domain.SearchCriteria;
import com.faint.domain.UserVO;

public interface UserDAO {

	public void create(UserVO vo) throws Exception;
	//사용자 전체목록
		public List<UserVO> listAll() throws Exception;
		
		//사용자 키워드 목록(String타입의 키워드를 매개변수로 받음)
		public List<UserVO> listKeyword(SearchCriteria cri) throws Exception;
}
