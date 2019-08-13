package com.uth.membership.board.service;

import java.util.List;

import com.uth.membership.board.model.BoardVO;

public interface BoardService {
	public List<BoardVO> getList();
	public BoardVO getArticle(int bno);
	public void updateLike();
	public void updateHate();
}
