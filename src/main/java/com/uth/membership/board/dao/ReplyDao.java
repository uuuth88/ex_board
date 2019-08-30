package com.uth.membership.board.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.uth.membership.board.model.ReplyVO;

public interface ReplyDao {
	public int insert(ReplyVO vo);
	public List<ReplyVO> replyList(@Param("bno") int bno);
	public int getReplyCount(int bno);
}
