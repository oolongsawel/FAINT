package com.faint.service;

import java.util.List;

import com.faint.domain.SearchCriteria;

public interface SearchService {

	public List<String> listKeyword(SearchCriteria cri) throws Exception;			// 검색창 검색어
	
}
