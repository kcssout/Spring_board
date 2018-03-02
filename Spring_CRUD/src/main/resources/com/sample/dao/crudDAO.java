package com.sample.dao;

import java.util.List;

import com.sample.dto.Criteria;
import com.sample.dto.crudVO;
public interface crudDAO {
	public List<crudVO> select() throws Exception;
	public void insert(crudVO vo);
	//public List<crudVO> view(int no) throws Exception;
	//selectone으로 할시
	public crudVO view(int no) throws Exception;
	public void visit(int no) throws Exception;
	
	public void updateCon(crudVO vo);
	public void delete(int no);
	
	public void updateReplyCnt(int no, int amount) throws Exception;//댓글수
	public void renew() throws Exception;
	//페이지 처리
	public List<crudVO> listPage(int page) throws Exception;
	public List<crudVO> listCriteria(Criteria cri) throws Exception;
	public int countPaging(Criteria cri) throws Exception;

}
