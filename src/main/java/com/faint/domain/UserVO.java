package com.faint.domain;

public class UserVO {
	private int id;
	private String email;
	private String name;
	private String nickname;
	private String phonenumber;
	private String website;
	private int sex;
	private String password;
	private String profilephoto;
	private String intro;
	private int prilevel;
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
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getProfile_photo() {
		return profilephoto;
	}
	public void setProfile_photo(String profilephoto) {
		this.profilephoto = profilephoto;
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
	public String getProfilephoto() {
		return profilephoto;
	}
	public void setProfilephoto(String profilephoto) {
		this.profilephoto = profilephoto;
	}
	public void setPrilevel(int prilevel) {
		this.prilevel = prilevel;
	}
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", email=" + email + ", name=" + name + ", nickname=" + nickname + ", phonenumber="
				+ phonenumber + ", website=" + website + ", sex=" + sex + ", password=" + password + ", profilephoto="
				+ profilephoto + ", intro=" + intro + ", prilevel=" + prilevel + "]";
	}
	
	
	
}

