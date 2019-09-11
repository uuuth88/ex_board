package com.uth.membership.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.uth.membership.board.model.ReplyVO;

@Repository
public class ReplyDaoImpl implements ReplyDao {
	
	@Autowired
	private SqlSession ss;
	
	public final String NAMESPACE = "com.uth.mapper.ReplyMapper";

	@Override
	public int insert(ReplyVO vo) {
		return ss.insert(NAMESPACE+".insert", vo);
	}
//	댓글 리스트	
	@Override
	public List<ReplyVO> replyList(int bno) {
		return ss.selectList(NAMESPACE+".replyList", bno);
	}

	@Override
	public int getReplyCount(int bno) {
		return ss.selectOne(NAMESPACE+".getReplyCount", bno);
	}

	@Override
	public int delete(int rno) {
		return ss.delete(NAMESPACE+".deleteReply", rno);
	}

	@Override
	public void updateRplCnt(int bno) {
		ss.update(NAMESPACE+".updateRplCnt", bno);
	}
	
//	댓글 수정	
	@Override
	public int modifyReply(ReplyVO vo) {
		return ss.update(NAMESPACE+".modifyReply", vo);
	}
//	댓글 조회	
	@Override
	public ReplyVO selectReply(int rno) {
		return ss.selectOne(NAMESPACE+".selectReply", rno);
	}
}
