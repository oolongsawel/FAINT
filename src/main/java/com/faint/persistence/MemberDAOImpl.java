package com.faint.persistence;


import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.faint.domain.MemberVO;
import com.faint.dto.LoginDTO;


@Repository
public class MemberDAOImpl implements MemberDAO {
	@Inject
	private SqlSession session;
	
	final String namespace = "com.faint.mapper.MemberMapper";

	//회원 정보 입력
	@Override
	public void insertUser(MemberVO vo) throws Exception {
		System.out.println("회원등록완료 !!!");
		session.insert(namespace+".insertUser",vo);
		System.out.println("//////////////////////////////////");
		System.out.println("회원등록완료 !!!");
	}
	//email 중복 확인
	@Override
	public MemberVO authenticate(String str) throws Exception {
		return session.selectOne(namespace+".checkdupl", str);
	}
	//이름 중복 확인
	@Override
	public MemberVO authenticateName(String str) throws Exception {
		return session.selectOne(namespace+".checkduplName", str);
	}
	//해당 email에 인증 키 업데이트
	@Override
	public void createAuthKey(String memberEmail, String memberAuthKey) throws Exception {
		MemberVO vo = new MemberVO();
		vo.setMemberAuthKey(memberAuthKey);
		vo.setMemberEmail(memberEmail);
		session.update(namespace + ".createAuthKey", vo);
	}
	//이메일 인증 코드 확인
	@Override
	public MemberVO chkAuth(MemberVO vo) throws Exception {
		return session.selectOne(namespace + ".chkAuth", vo);
	}
	//인증 후 계정 활성화
	@Override
	public void userAuth(MemberVO vo) throws Exception {
		System.out.println("인증하나요??");
		
		session.update(namespace + ".userAuth", vo);
		System.out.println(vo.getUserState());
	}
	//로그인 검증
	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		return session.selectOne(namespace+".login",dto);
	}
	//유저 정보 확인
	@Override
	public MemberVO read(MemberVO vo) throws Exception {
		return session.selectOne(namespace+".readUser",vo);
	}
	//유저 정보 변경 후 업데이트
	@Override
	public void updateUser(MemberVO vo) throws Exception {
		System.out.println(vo);
		session.update(namespace+".updateUser",vo);
	}
	//회원 탈퇴
	@Override
	public void deleteUser(MemberVO vo) throws Exception {
		session.update(namespace+".deleteUser",vo);
	}
	//소셜 로그인 회원 정보 입력
	@Override
	public void naverInsertUser(LoginDTO dto) throws Exception {
		session.insert(namespace+".naverInsertUser",dto);
	}
	//소셜 로그인 회원 정보 확인
	@Override
	public MemberVO naverReadUser(LoginDTO dto) throws Exception {
		return session.selectOne(namespace+".naverReadUser",dto);
	}
	//인증 키 재발급
	@Override
	public void updateAuthKey(String memberEmail, String memberAuthKey) throws Exception {
		MemberVO vo = new MemberVO();
		vo.setMemberAuthKey(memberAuthKey);
		vo.setMemberEmail(memberEmail);
		session.update(namespace + ".createAuthKey", vo);
	}
	//패스워드 변경
	@Override
	public void updatePassword(MemberVO vo) throws Exception {
	System.out.println("////////////패스워드변경");
		System.out.println("비밀번호 변경이 되냐 ");
		session.update(namespace+".updatePassword",vo);
	}
	//인증 후 인증키 삭제
	@Override
	public void successAuth(MemberVO vo) throws Exception {
		
		System.out.println("인증 되었으므로 인증키 null 값 반환 ");
		session.update(namespace+".successAuth",vo);
	}
	

	// 프로필 사진 
	@Override
	public String getUserProfile(int memberID) throws Exception {
		return session.selectOne(namespace + ".getUserProfile", memberID);
		

	}

	@Override
	public MemberVO getUserPw(String memberEmail) throws Exception {
		return session.selectOne(namespace + ".getUserPassword",memberEmail);
	}

	@Override
	public void deleteImage(String memberEmail) throws Exception {
		session.update(namespace+".deleteImage",memberEmail);
		
		// 프로필 사진 삭제 
	}
	/// 세션을 통한 로그인 유지 
	@Override
	public void keepLogin(Integer memberID, String sessionKey, Date next) {
		System.out.println("세션키 저장하러 오나요?1 ");
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("memberID", memberID);
		paramMap.put("sessionKey", sessionKey);
		paramMap.put("next", next);

		session.update(namespace + ".keepLogin", paramMap);
	}
	
	@Override
	public MemberVO checkSessionKey(String value) {
		return session.selectOne(namespace + ".checkSessionKey", value);
	}
}