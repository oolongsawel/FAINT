package com.faint.domain;

public class MemberVO {
	private int memberID;
	private String memberEmail;
	private String memberPassword;
	private String memberName;
	private String memberSex;
	
	private int userState;

	private String memberPicture;
	private String sessionKey;
	private String memberAuthKey;
	private String snsID;

	public int getMemberID() {
		return memberID;
	}

	public void setMemberID(int memberID) {
		this.memberID = memberID;
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

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberSex() {
		return memberSex;
	}

	public void setMemberSex(String memberSex) {
		this.memberSex = memberSex;
	}

	public String getMemberPicture() {
		return memberPicture;
	}

	public void setMemberPicture(String memberPicture) {
		this.memberPicture = memberPicture;
	}

	public String getSessionKey() {
		return sessionKey;
	}

	public void setSessionKey(String sessionKey) {
		this.sessionKey = sessionKey;
	}

	public String getMemberAuthKey() {
		return memberAuthKey;
	}

	public void setMemberAuthKey(String memberAuthKey) {
		this.memberAuthKey = memberAuthKey;
	}

	public String getSnsID() {
		return snsID;
	}

	public void setSnsID(String snsID) {
		this.snsID = snsID;
	}

	public int getUserState() {
		return userState;
	}

	public void setUserState(int userState) {
		this.userState = userState;
	}
	

}
