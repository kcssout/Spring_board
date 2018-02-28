package com.sample.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sample.dao.ReplyDAO;
import com.sample.dto.Criteria;
import com.sample.dto.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{
	@Inject
	private ReplyDAO dao;
	
	@Override
	public void addReply(ReplyVO vo) throws Exception {
		
		dao.create(vo);
	}

	@Override
	public List<ReplyVO> listReply(int no) throws Exception {
		
		return dao.list(no);
	}

	@Override
	public void modifyReply(ReplyVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void removeReply(int rno) throws Exception {
		dao.delete(rno);
	}

	@Override
	public List<ReplyVO> listReplyPage(int no, Criteria cri) throws Exception {
		return dao.listPage(no, cri);
	}

	@Override
	public int count(int no) throws Exception {
		return dao.count(no);
	}

}
