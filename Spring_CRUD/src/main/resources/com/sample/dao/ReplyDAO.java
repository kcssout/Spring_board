package com.sample.dao;

import java.util.List;

import com.sample.dto.Criteria;
import com.sample.dto.ReplyVO;

public interface ReplyDAO {
	//댓글 목록
	public List<ReplyVO> list(int no);
	//댓글 입력
	public void create(ReplyVO vo);
	//댓글 수정
	public void update(ReplyVO vo);
	//댓글 삭제
	public void delete(int no);
	
	public List<ReplyVO> listPage(int no, Criteria cri) throws Exception;
	public int count(int no) throws Exception;//댓글수
}
