package com.uth.membership.board.service;

import org.apache.ibatis.annotations.Param;

import com.uth.membership.board.model.ReplyPageVO;
import com.uth.membership.board.model.ReplyVO;

public interface ReplyService {
	public int insert(ReplyVO vo);
	public ReplyPageVO replyList(@Param("bno") int bno);
}
