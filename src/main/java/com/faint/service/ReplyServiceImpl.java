package com.faint.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.faint.domain.ReplyVO;
import com.faint.persistence.ReplyDAO;


@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	private ReplyDAO dao;
	
	@Override
	public void regist(ReplyVO vo) throws Exception{
		dao.create(vo);
	}
	
	@Override
	public List<ReplyVO> read(Integer postid) throws Exception{
		return dao.read(postid);
	}
	
	@Override
	public void remove(Integer id) throws Exception{
		dao.delete(id);
	}
	
}