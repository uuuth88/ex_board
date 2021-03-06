package com.uth.membership.board.service;

import java.util.List;

import com.uth.membership.board.model.BoardVO;
import com.uth.membership.common.model.Criteria;

public interface BoardService {
//	Dao와 마찬가지로 Criteria 매개변수 추가	
	public List<BoardVO> getList(Criteria cri);
//	전체 글
	public int getTotalArticle(Criteria cri);
	public BoardVO getArticle(int bno);
//	추천, 비추천 기능	
	public int updateLike(int bno);
	public int updateHate(int bno);
//	글 조회 수 
	public int updateView(int bno);	
//	글 작성
	public void writeArticle(BoardVO vo);
//	글 수정
	public int modifyArticle(BoardVO vo);
//	글 삭제
	public int deleteArticle(int bno);	
}
