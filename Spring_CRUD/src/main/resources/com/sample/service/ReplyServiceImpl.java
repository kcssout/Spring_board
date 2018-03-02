package com.sample.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sample.dao.ReplyDAO;
import com.sample.dao.crudDAO;
import com.sample.dto.Criteria;
import com.sample.dto.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{
	@Inject
	private ReplyDAO dao;
	@Inject
	private crudDAO cdao;
	
	@Transactional
	@Override
	public void addReply(ReplyVO vo) throws Exception {
		
		dao.create(vo);
		
		cdao.updateReplyCnt(vo.getNo(), 1);
		
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
		int no = dao.getNo(rno);
		dao.delete(rno);
		cdao.updateReplyCnt(no, -1);
		
	}

	@Override
	public List<ReplyVO> listReplyPage(int no, Criteria cri) throws Exception {
		return dao.listPage(no, cri);
	}

	@Override
	public int count(int no) throws Exception {
		return dao.count(no);
	}

	//------------------------------------------------------------------------------

}
