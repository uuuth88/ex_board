package com.uth.membership.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.uth.membership.board.model.BoardVO;
@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession ss;
	
	public final String NAMESPACE = "com.uth.mapper.BoardMapper";
	
	@Override
	public List<BoardVO> getList() {
		return ss.selectList(NAMESPACE+".selectList");
	}

}
