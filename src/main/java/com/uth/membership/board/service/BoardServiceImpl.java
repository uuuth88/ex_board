package com.uth.membership.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uth.membership.board.dao.BoardDao;
import com.uth.membership.board.model.BoardVO;
@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao dao;
	
	@Override
	public List<BoardVO> getList() {
		return dao.getList();
	}

	@Override
	public BoardVO getArticle(int bno) {
		return dao.getArticle(bno);
	}

	@Override
	public int updateLike(int bno) {
		return dao.updateLike(bno);
	}

	@Override
	public int updateHate(int bno) {
		return dao.updateHate(bno);
	}

	@Override
	public void writeArticle(BoardVO vo) {
		dao.writeArticle(vo);
	}

	@Override
	public int modifyArticle(BoardVO vo) {
		return dao.modifyArticle(vo);
	}

}
