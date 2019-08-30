package com.uth.membership.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.uth.membership.board.model.ReplyVO;
@Repository
public class ReplyDaoImpl implements ReplyDao {
	
	@Autowired
	private SqlSession ss;
	
	public final String NAMESPACE = "com.uth.mapper.ReplyMapper";

	@Override
	public int insert(ReplyVO vo) {
		return ss.insert(NAMESPACE+".insert", vo);
	}

}
