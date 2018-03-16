package com.faint.persistence;


import java.util.Date;

import com.faint.domain.MemberVO;
import com.faint.dto.LoginDTO;

public interface MemberDAO {

	public void insertUser(MemberVO vo) throws Exception;  // 회원 등

	public MemberVO login(LoginDTO dto) throws Exception; // 로그

	public MemberVO read(MemberVO vo) throws Exception; // 멤버 읽기 

	public void updateUser(MemberVO vo) throws Exception; // 회원수

	public void deleteUser(MemberVO vo) throws Exception; // 유저 삭

	public void naverInsertUser(LoginDTO dto) throws Exception; // 네이버 등

	public MemberVO naverReadUser(LoginDTO dto) throws Exception; // 네이버 유저읽기( 아직 안됨)

	public void createAuthKey(String memberEmail, String memberAuthKey) throws Exception; // 인증키 발

	public MemberVO chkAuth(MemberVO vo) throws Exception; // 인증키 확인 

	public void userAuth(MemberVO vo) throws Exception; // 인증키 로 인한 -> 유저State 변

	public MemberVO authenticate(String str) throws Exception; 

	public MemberVO authenticateName(String str) throws Exception;

	public void updateAuthKey(String memberEmail, String memberAuthKey) throws Exception; // 인증키 변경 및 재 발

	public void updatePassword(MemberVO vo) throws Exception; //패스워드 변

	public void successAuth (MemberVO vo) throws Exception;  // 인증완료로 인한인증키 삭제 
	
	
	public void keepLogin(Integer memberID, String sessionKey, Date next);  // 로그인 유지  세션 에 담기 

	public MemberVO checkSessionKey(String value);   // 세션 확인 


	String getUserProfile(int memberID) throws Exception;  //유저 프로필 사진 

	public MemberVO getUserPw(String userEmail) throws Exception; // 유저비밀번호 등

	public void deleteImage(String memberID) throws Exception; //프로필 사진 삭제 

}



