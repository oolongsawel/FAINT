package com.faint.domain;

public class AdminVO {
	/*
	 * 관리자 회원 
	 * 그냥 멤버에서 관리자를 부여해서 하는 것인가 아니면 따로 
	 * 관리자 회원전용 이 있을지는
	 * 
	 * 따로 테이블을 만들어야 할듯 
	 * 
	 * */
	private String id;
	private String pw;
	private String pname;
	private String email;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "AdminVO [id=" + id + ", pw=" + pw + ", pname=" + pname + ", email=" + email + "]";
	}
	
	
}
