package com.faint.persistence;

import java.util.List;

import com.faint.domain.ReplyVO;

public interface ReplyDAO {
	
	public void create(ReplyVO vo) throws Exception;
	
	public List<ReplyVO> read(Integer postid) throws Exception;
	
	public void delete(Integer id) throws Exception;

}