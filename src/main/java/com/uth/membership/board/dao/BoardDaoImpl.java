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

	@Override
	public BoardVO getArticle(int bno) {
		return ss.selectOne(NAMESPACE+".read", bno);
	}

	@Override
	public int updateLike(int bno) {
		return ss.update(NAMESPACE+".updateLike", bno);
	}

	@Override
	public int updateHate(int bno) {
		return ss.update(NAMESPACE+".updateHate", bno);
		
	}

	@Override
	public void writeArticle(BoardVO vo) {
		ss.insert(NAMESPACE+".write", vo);
	}

	
}
