package com.faint.service;

import java.util.List;

import com.faint.domain.ReplyVO;

public interface ReplyService{
	
	public void regist(ReplyVO vo) throws Exception;
	
	public List<ReplyVO> read(Integer postid) throws Exception;
	
	public void remove(Integer id) throws Exception;
	
}