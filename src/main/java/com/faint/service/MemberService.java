package com.faint.service;

import com.faint.domain.MemberVO;
import com.faint.dto.LoginDTO;

public interface MemberService {
	public void regist(MemberVO vo) throws Exception;

	public MemberVO login(LoginDTO dto) throws Exception;

	public MemberVO modifyUser(MemberVO vo) throws Exception;

	public MemberVO naverLogin(LoginDTO dto) throws Exception;

	public MemberVO googleLogin(LoginDTO dto) throws Exception;

	public MemberVO userAuth(MemberVO vo) throws Exception;

	public MemberVO userAuthFindPassword(MemberVO vo) throws Exception;

	public void deleteUser(MemberVO vo) throws Exception;

	public String authenticate(String str) throws Exception;

	public String authenticateName(String str) throws Exception;

	public void findPassword(MemberVO vo) throws Exception;

	public void modifypassUser(MemberVO vo) throws Exception;



	public void deleteImage(String memberID)throws Exception;
}



