package com.uth.membership.board.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.uth.membership.board.model.ReplyVO;

public interface ReplyDao {
//	댓글 등록
	public int insert(ReplyVO vo);
//	댓글 개수 업데이트
	public void updateRplCnt(int bno);
//	댓글 리스트	
	public List<ReplyVO> replyList(@Param("bno") int bno);
//	댓글 개수 구하기	
	public int getReplyCount(int bno);
//	댓글 삭제
	public int delete(int rno);
//	댓글 수정
	public int modifyReply(ReplyVO vo);
//	댓글 조회
	public ReplyVO selectReply(int rno);
}
