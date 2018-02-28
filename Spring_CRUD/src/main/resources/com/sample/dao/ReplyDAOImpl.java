package com.sample.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sample.dto.Criteria;
import com.sample.dto.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	@Inject
	SqlSession sqlSession;
	
	private static String namespace="com.sample.mappers.replyMapper";
	
	//댓글목록
	@Override
	public List<ReplyVO> list(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".list", no);
	}
	//댓글 작성
	@Override
	public void create(ReplyVO vo) {
		sqlSession.insert(namespace+".create",vo);		
	}
	//댓글 수정
	@Override
	public void update(ReplyVO vo) {
		sqlSession.update(namespace+".update", vo);		
	}
	//댓글 삭제
	@Override
	public void delete(int no) {
		sqlSession.update(namespace+".delete", no);		
	}
	
	//댓글 페이징
	@Override
	public List<ReplyVO> listPage(int no, Criteria cri) throws Exception {
		Map<String , Object> paramMap = new HashMap<>();
		
		paramMap.put("no", no);
		paramMap.put("cri", cri);
		
		return sqlSession.selectList(namespace + ".listPage", paramMap);
	}
	@Override
	public int count(int no) throws Exception {
	
		return sqlSession.selectOne(namespace + ".count", no);
	}
	
}
