package com.faint.dto;

public class LoginDTO {
	/* 로그인시 이메일 패스워드 + 쿠키 체크 */
	
	
	private String memberEmail;   
	private String memberPassword;
	private boolean useCookie;
	private String snsID;
	private String memberName;
	
	public String getSnsID() {
		return snsID;
	}
	public void setSnsID(String snsID) {
		this.snsID = snsID;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}

}
