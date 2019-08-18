package com.uth.membership.board.service;

import java.util.List;

import com.uth.membership.board.model.BoardVO;

public interface BoardService {
	public List<BoardVO> getList();
	public BoardVO getArticle(int bno);
	public int updateLike(int bno);
	public int updateHate(int bno);
}
