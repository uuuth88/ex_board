package com.uth.membership.board.service;

import java.util.List;

import com.uth.membership.board.model.BoardVO;

public interface BoardService {
	public List<BoardVO> getList();
	public BoardVO getArticle(int bno);
//	추천, 비추천 기능	
	public int updateLike(int bno);
	public int updateHate(int bno);
//	글 작성
	public void writeArticle(BoardVO vo);
}
