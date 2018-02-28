package com.sample.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sample.dto.Criteria;
import com.sample.dto.crudVO;
@Repository
public class crudDAOImpl implements crudDAO{

	@Inject
	private SqlSession sqlSession;

	private static final String Namespace = "com.sample.mappers.crudMapper";

	@Override
	public List<crudVO> select() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".select");
	}

	@Override
	public void insert(crudVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert(Namespace+".insert",vo);
		
	}
	/*
	@Override
	public List<crudVO> view(int no) throws Exception {
		// TODO Auto-generated method stub
		List<crudVO> result = sqlSession.selectList(Namespace+".view",no);
		return result;	
	}
	*/
	//selectone으로 할시
	
	public crudVO view(int no) throws Exception{
		return sqlSession.selectOne(Namespace+".view",no);
			
	}	
	@Override
	public void visit(int no) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(Namespace+".visit", no);
	}
	public void updateCon(crudVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update(Namespace+".updateCon", vo);
	}
	@Override
	public void delete(int no) {
		// TODO Auto-generated method stub
		sqlSession.delete(Namespace+".delete", no);
	}
	//게시판 페이징처리
	@Override
	public List<crudVO> listPage(int page) throws Exception {
		// TODO Auto-generated method stub
		 if (page <= 0) {
		      page = 1;
		    }
	    page = (page - 1) * 10;
		return sqlSession.selectList(Namespace + ".listPage", page);
	}

	@Override
	public List<crudVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace + ".listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {

	    return sqlSession.selectOne(Namespace + ".countPaging", cri);
	 }



	
}
