package com.faint.dto;

public class FollowDTO {
	private String usernick;
	private int userid;
	private int followedid;
	private boolean isFollow;
	
	public String getUsernick() {
		return usernick;
	}
	public void setUsernick(String usernick) {
		this.usernick = usernick;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getFollowedid() {
		return followedid;
	}
	public void setFollowedid(int followedid) {
		this.followedid = followedid;
	}
	public boolean isFollow() {
		return isFollow;
	}
	public void setFollow(boolean isFollow) {
		this.isFollow = isFollow;
	}
	@Override
	public String toString() {
		return "followDTO [usernick=" + usernick + ", userid=" + userid + ", followedid=" + followedid + ", isFollow="
				+ isFollow + "]";
	}
	
}
