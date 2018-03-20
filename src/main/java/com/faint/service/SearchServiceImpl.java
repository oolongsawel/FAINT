package com.faint.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.faint.domain.SearchCriteria;
import com.faint.persistence.SearchDAO;

@Service
public class SearchServiceImpl implements SearchService {

	@Inject
	private SearchDAO dao;

	@Override
	public List<String> listKeyword(SearchCriteria cri) throws Exception {
		return dao.listKeyword(cri);
	}

}
