package com.uth.membership.board.dao;

import java.util.List;

import com.uth.membership.board.model.BoardVO;

public interface BoardDao {
	public List<BoardVO> getList();
	public BoardVO getArticle(int bno);
//	추천, 비추천	
	public int updateLike(int bno);
	public int updateHate(int bno);
//	글 작성
	public void writeArticle(BoardVO vo);
//	글 수정
	public int modifyArticle(BoardVO vo);
}
