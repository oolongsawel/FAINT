package com.faint.service;

import javax.inject.Inject;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.faint.domain.MemberVO;
import com.faint.dto.LoginDTO;
import com.faint.persistence.MemberDAO;

import common.MailHandler;
import common.TempKey;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO dao;
	@Inject
	private JavaMailSender mailSender;
	@Inject
	PasswordEncoder passwordEncoder;

	@Override
	public void regist(MemberVO vo) throws Exception {
		
		System.out.println("서비스레지스");

		String encPassword = passwordEncoder.encode(vo.getMemberPassword());
		vo.setMemberPassword(encPassword);
		//System.out.println("암호화된 비밀번호 : "+user.getUserPassword());

		dao.insertUser(vo);
		System.out.println(vo);
		System.out.println("///////////////////////  찍히");
		String key = new TempKey().getKey(50,false);  // 인증키 생성

		dao.createAuthKey(vo.getMemberEmail(),key); //인증키 db 저장
		//메일 전송
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("FAINT  서비스 이메일 인증]");
		sendMail.setText(
				new StringBuffer().append("<h1>메일인증</h1>").append("<a href='http://localhost:8080/user/emailConfirm?userEmail=").append(vo.getMemberEmail()).append("&memberAuthKey=").append(key).append("' target='_blank'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("sososososo@gmail.com", "서어비스센터 ");
		//System.out.println("getEmail"+user.getUserEmail());
		sendMail.setTo(vo.getMemberEmail());
		sendMail.send();
	}

	//이메일 인증 키 검증
	@Override
	public MemberVO userAuth(MemberVO user) throws Exception {
        MemberVO vo =new MemberVO();
		System.out.println(user+"user");
        vo=dao.chkAuth(user);
        //System.out.println("ser.userAuth.chkauth"+vo);
        if(vo!=null){
            try{
            	System.out.println(vo+"vo");
                dao.userAuth(user);
				dao.successAuth(vo);
            }catch (Exception e) {
                e.printStackTrace();
            }}
        return vo;
	}
	//패스워드 찾기 이메일 인증 검증
	@Override
	public MemberVO userAuthFindPassword(MemberVO user) throws Exception {
		MemberVO vo =new MemberVO();
		vo=dao.chkAuth(user);
		if(vo!=null){
			try{
				System.out.println("패스워드 찾기 이메일 인증성공 !!!");
				dao.successAuth(user);
			}catch (Exception e) {
				e.printStackTrace();
			}}
		return vo;
	}
	//로그인
	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		System.out.println("service dto: "+dto);
		System.out.println("멤버서비스 dto");
		try {
			String pw = dao.getUserPw(dto.getMemberEmail()).getMemberPassword();
			String rawPw = dto.getMemberPassword();
			//System.out.println("db pW  : "+pw);
			//System.out.println("입렵Pw:"+rawPw);
			//System.out.println(passwordEncoder.matches(rawPw, pw));
			if(passwordEncoder.matches(rawPw, pw)) {
				System.out.println("비밀번호 일치");
				dto.setMemberPassword(pw);
			}else {
				//============System.out.println("비밀번호 불일치");=======================
				//주석 해제 시 비 암호화 설정된 db Pw  값으로  로그인 되지 않음
				dto.setMemberPassword(pw);
			}
		}catch(NullPointerException npe){
			MemberVO vo=new MemberVO();
			vo=null;
			System.out.println(vo);
			return vo;
		}catch (Exception e){
			MemberVO vo=new MemberVO();
			vo=null;
			return vo;
		}
		return dao.login(dto);
	}
	//회원 정보 변경
	@Override
	public MemberVO modifyUser(MemberVO vo) throws Exception {
		dao.updateUser(vo);
		return  dao.read(vo);
	}
	//회원 탈퇴
	@Override
	public void deleteUser(MemberVO vo) throws Exception {
		//System.out.println(user);
		dao.deleteUser(vo);
	}

	@Override
	public MemberVO naverLogin(LoginDTO dto) throws Exception {

		MemberVO vo =new MemberVO();
		vo=dao.naverReadUser(dto);
		if(vo==null){
			try{
				dao.naverInsertUser(dto);
			}catch (Exception e) {
			e.printStackTrace();
			}}
		return dao.naverReadUser(dto);
	}
	//구글 oauth login
    @Override
    public MemberVO googleLogin(LoginDTO dto) throws Exception {
    	MemberVO vo =new MemberVO();
        vo=dao.naverReadUser(dto);
        if(vo==null){
            try{
                dao.naverInsertUser(dto);
            }catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }}
        return dao.naverReadUser(dto);
    }
    //이메일 아이디 중복 관련 코드 전송
	@Override
	public String authenticate(String str) throws Exception {
		MemberVO vo = dao.authenticate(str);
	//	System.out.println("dao vo:"+vo);
		if(vo == null) {
			return "T";
		}else if(vo.getUserState() == 0){
			return "F";
		}else{
			return "D";
		}
	}
	//이름 중복관련 코드 전송
	@Override
	public String authenticateName(String str) throws Exception {
		MemberVO vo = dao.authenticateName(str);
	System.out.println(str.toString());
		System.out.println("dao vo:"+vo);
		if(vo == null) {
			return "T";
		}else{
			return "F";
		}
	}
	//비밀번호 찾기
	@Override
	public void findPassword(MemberVO user) throws Exception {
		String key = new TempKey().getKey(50,false);

		dao.updateAuthKey(user.getMemberEmail(),key); //인증키 db 저장

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[서어비스 센터 비밀번호 찾기 ]");
		sendMail.setText(
				new StringBuffer().append("<h1>아래 주소로 접속하여 패스워드를 변경해주세요</h1>").append("<a href='http://localhost:8080/user/findPasswordConfirm?userEmail=").append(user.getMemberEmail()).append("&memberAuthKey=").append(key).append("' target='_blank'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("somony9292@gmail.com", "fififias");
		//System.out.println("getEmail"+user.getUserEmail());
		sendMail.setTo(user.getMemberEmail());
		sendMail.send();
	}

	@Override
	public void modifypassUser(MemberVO vo) throws Exception {
		//System.out.println("dao.vo 입력 값"+user);
		System.out.println("여기 모디 파이 패스 실행 ");
		//String encPassword = passwordEncoder.encode(vo.getMemberPassword());
		//String encPassword = passwordEncoder.encode(vo.getMemberPassword());
		//System.out.println(vo.getMemberPassword().toString()+"입력받은 비밀번호 ");
	//	vo.setMemberPassword(encPassword);
		
		//System.out.println("암호화된 비밀번호 : "+vo.getMemberPassword());
		try {
			System.out.println("실행실행 실행 ");
			dao.successAuth(vo);
			dao.updatePassword(vo);
			System.out.println("///////////////////////변경하자 ");
			System.out.println("변경되니???");

		//	System.out.println("코드 삭제");
		}catch (Exception e){
			System.out.println("모디파이 패스 유저 되라 11111111111");
			e.printStackTrace();
		}
	}
	//마이페이지 관련 서비스
	
	@Override
	public void deleteImage(String userId) throws Exception {
		dao.deleteImage(userId);
	}
}
