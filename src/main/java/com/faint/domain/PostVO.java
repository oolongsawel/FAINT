package com.faint.domain;

import java.util.Arrays;
import java.util.Date;

public class PostVO {
	private int id;
	private int userid;
	private int cateid;
	private String caption;
	
	private Date regdate;
	private int replycnt;
	
	private String[] files;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getCateid() {
		return cateid;
	}
	public void setCateid(int cateid) {
		this.cateid = cateid;
	}
	public String getCaption() {
		return caption;
	}
	public void setCaption(String caption) {
		this.caption = caption;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	@Override
	public String toString() {
		return "PostVO [id=" + id + ", userid=" + userid + ", cateid=" + cateid + ", caption=" + caption + ", regdate="
				+ regdate + ", replycnt=" + replycnt + ", files=" + Arrays.toString(files) + "]";
	}
	
	
}
