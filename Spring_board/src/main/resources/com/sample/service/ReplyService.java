package com.sample.service;

import java.util.List;

import com.sample.dto.Criteria;
import com.sample.dto.ReplyVO;

public interface ReplyService {
	public void addReply(ReplyVO vo) throws Exception;
	
	public List<ReplyVO> listReply(int no) throws Exception;
	
	public void modifyReply(ReplyVO vo) throws Exception;
	
	public void removeReply(int rno) throws Exception;
	
	public List<ReplyVO> listReplyPage(int no, Criteria cri) throws Exception;
	
	public int count(int no) throws Exception;
}
