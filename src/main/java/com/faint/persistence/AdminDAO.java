package com.faint.persistence;

import java.util.HashMap;

import java.util.List;

import com.faint.domain.MemberVO;

import util.SearchMemberCriteria;

// 관리자 
public interface AdminDAO {
	
		List<MemberVO> getSearchMemberList(SearchMemberCriteria scri, HashMap<String, Object> map); //  회원목록 불러오기 
		
		int getTotalMemberCount(SearchMemberCriteria scri);   //전체 회원수 
		
		public List<MemberVO> listAll() throws Exception;
		
		public int deleteMember(String memberEmail);
}
