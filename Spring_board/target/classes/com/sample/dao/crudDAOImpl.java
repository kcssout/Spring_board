package com.sample.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.hibernate.Session;
import org.hibernate.Transaction;
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
	public void insert(crudVO vo){
		// TODO Auto-generated method stub
		sqlSession.insert(Namespace+".insert",vo);
//		 Session session = HibernateUtil.getSessionFactory().openSession();
//		 Transaction tx = session.beginTransaction();
//		 session.persist(vo);
//		 tx.commit();
//		 session.close();
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
		sqlSession.update(Namespace+".renew");//댓글 숫자갱신
		return sqlSession.selectList(Namespace + ".listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {

	    return sqlSession.selectOne(Namespace + ".countPaging", cri);
	 }

	@Override
	public void updateReplyCnt(int no, int amount) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("no", no);
		paramMap.put("amount", amount);
		
		sqlSession.update(Namespace + ".updateReplycnt", paramMap);
		
	}

	@Override//댓글 숫자갱신
	public void renew() throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(Namespace+".renew");
	}



	
}
