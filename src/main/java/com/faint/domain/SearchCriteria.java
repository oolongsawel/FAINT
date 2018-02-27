package com.faint.domain;

public class SearchCriteria {
	
	//305p
	//일단 타입은 하나니깐 키워드만 필드에설정
	//필드
	private String keyword;

	
	//getter, setter
	public String getKeyword() {
		return keyword;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	//toString
	@Override
	public String toString() {
		return "SearchCriteria [keyword=" + keyword + "]";
	}
	
	
	
}
