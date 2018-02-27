package com.faint.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.faint.domain.SearchCriteria;
import com.faint.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.faint.mapper.userMapper";
	
	@Override
	public void create(UserVO vo) throws Exception {
		session.insert(namespace+".create", vo);
	}
	//회원전체목록
    @Override
	public List<UserVO> listAll() throws Exception {
	   return session.selectList(namespace + ".listAll");
	}
	
	 //회원키워드목록
	 @Override
	 public List<UserVO> listKeyword(SearchCriteria cri) throws Exception {
		  return session.selectList(namespace+".listKeyword", cri);
	 }
	  

}
