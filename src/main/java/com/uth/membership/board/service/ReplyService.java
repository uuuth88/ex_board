package com.uth.membership.board.service;

import org.apache.ibatis.annotations.Param;

import com.uth.membership.board.model.ReplyListVO;
import com.uth.membership.board.model.ReplyVO;

public interface ReplyService {
	public int insert(ReplyVO vo);
//	댓글 개수 업데이트
	public void updateRplCnt(int bno);
//	댓글 리스트		
	public ReplyListVO replyList(@Param("bno") int bno);
	public int delete(int rno);
}
	
	
