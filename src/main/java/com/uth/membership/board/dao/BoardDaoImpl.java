package com.uth.membership.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.uth.membership.board.model.BoardVO;
import com.uth.membership.common.model.Criteria;
@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession ss;
	
	public final String NAMESPACE = "com.uth.mapper.BoardMapper";
	
	@Override
	public List<BoardVO> getList(Criteria cri) {
		return ss.selectList(NAMESPACE+".selectList", cri);
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
	public int updateView(int bno) {
		return ss.update(NAMESPACE+".updateView", bno);
	}
	
	@Override
	public void writeArticle(BoardVO vo) {
		ss.insert(NAMESPACE+".write", vo);
	}

	@Override
	public int modifyArticle(BoardVO vo) {
		return ss.update(NAMESPACE+".modify", vo);
	}

	@Override
	public int deleteArticle(int bno) {
		return ss.delete(NAMESPACE+".delete", bno);
	}

	@Override
	public int getTotalArticle(Criteria cri) {
		return ss.selectOne(NAMESPACE+".getTotalArticle", cri);
	}


	
}
