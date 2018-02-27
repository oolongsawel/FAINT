package com.faint.domain;

public class UserVO {
	
	private int id;
	private String email;
	private String password;
	private String name;
	private String nickname;
	private String phonenumber;
	private int sex;
	private String website;
	private String intro;
	private int prilevel;
	private String sessionkey;
	private int sessionlimit;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public int getPrilevel() {
		return prilevel;
	}
	public void setPrilevel(int prilevel) {
		this.prilevel = prilevel;
	}
	public String getSessionkey() {
		return sessionkey;
	}
	public void setSessionkey(String sessionkey) {
		this.sessionkey = sessionkey;
	}
	public int getSessionlimit() {
		return sessionlimit;
	}
	public void setSessionlimit(int sessionlimit) {
		this.sessionlimit = sessionlimit;
	}
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", email=" + email + ", password=" + password + ", name=" + name + ", nickname="
				+ nickname + ", phonenumber=" + phonenumber + ", sex=" + sex + ", website=" + website + ", intro="
				+ intro + ", prilevel=" + prilevel + ", sessionkey=" + sessionkey + ", sessionlimit=" + sessionlimit
				+ "]";
	}
	
}
