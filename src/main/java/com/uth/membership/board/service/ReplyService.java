package com.uth.membership.board.service;

import org.apache.ibatis.annotations.Param;

import com.uth.membership.board.model.ReplyListVO;
import com.uth.membership.board.model.ReplyVO;

public interface ReplyService {
//	댓글 등록	
	public int insert(ReplyVO vo);
//	댓글 개수 업데이트
	public void updateRplCnt(int bno);
//	댓글 리스트		
	public ReplyListVO replyList(@Param("bno") int bno);
	public int delete(int rno);
//	댓글 수정
	public int modifyReply(ReplyVO vo);	
//	댓글 조회
	public ReplyVO selectReply(int rno);	
}
	
	
