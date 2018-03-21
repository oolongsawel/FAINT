
package com.faint.persistence;

import java.util.List;

import com.faint.domain.SearchCriteria;

public interface SearchDAO {
	
	public List<String> listKeyword(SearchCriteria cri) throws Exception;		// 검색창 검색어 키워드
	
}
