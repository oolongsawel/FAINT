package com.faint.domain;

import java.util.Date;

public class TagVO {
	private int id;
	private String name;
	private int tagcount;
	private Date regdate;
	
	//getter, setter
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTagcount() {
		return tagcount;
	}
	public void setTagcount(int tagcount) {
		this.tagcount = tagcount;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	//toString
	@Override
	public String toString() {
		return "TagVO [id=" + id + ", name=" + name + ", tagcount=" + tagcount + ", regdate=" + regdate + "]";
	}
	
	
	//hashCode
	public int hashCode(){
		return name.hashCode();
	}
}
