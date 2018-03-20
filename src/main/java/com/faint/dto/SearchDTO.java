package com.faint.dto;

// 검색창 검색
public class SearchDTO {
	
	/*태그*/
	private int tagid;				// 태그 id
	private String tagname;		// 태그 이름
	private int postedtagCnt;		// 태그와 연결된 게시글 갯수
	
	/*사용자*/
	private String nickname;		// 사용자 nick
	private String name;			// 사용자 이름
	private int userid;				// 사용자 id
	
	/*위치*/
	private int postid;				// 게시글 번호
	private int cateid;				// 게시글 카테고리 번호
	private String location;		// 위치
	
	
	//getter, setter
	public int getTagid() {
		return tagid;
	}

	public void setTagid(int tagid) {
		this.tagid = tagid;
	}
	
	public String getTagname() {
		return tagname;
	}
	
	public void setTagname(String tagname) {
		this.tagname = tagname;
	}
	
	public int getPostedtagCnt() {
		return postedtagCnt;
	}
	
	public void setPostedtagCnt(int postedtagCnt) {
		this.postedtagCnt = postedtagCnt;
	}
	
	public String getNickname() {
		return nickname;
	}
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getUserid() {
		return userid;
	}
	
	public void setUserid(int userid) {
		this.userid = userid;
	}
	
	public int getPostid() {
		return postid;
	}

	public void setPostid(int postid) {
		this.postid = postid;
	}

	public int getCateid() {
		return cateid;
	}

	public void setCateid(int cateid) {
		this.cateid = cateid;
	}
	
	public String getLocation() {
		return location;
	}
	
	public void setLocation(String location) {
		this.location = location;
	}

	//toString
	@Override
	public String toString() {
		return "SearchDTO [tagid=" + tagid + ", tagname=" + tagname + ", postedtagCnt=" + postedtagCnt + ", nickname="
				+ nickname + ", name=" + name + ", userid=" + userid + ", postid=" + postid + ", cateid=" + cateid
				+ ", location=" + location + "]";
	}

	
	
	
}
