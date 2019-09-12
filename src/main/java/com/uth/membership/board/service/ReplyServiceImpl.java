package com.uth.membership.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uth.membership.board.dao.ReplyDao;
import com.uth.membership.board.model.ReplyListVO;
import com.uth.membership.board.model.ReplyVO;
@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDao dao;

//	댓글 등록
	@Override
	public int insert(ReplyVO vo) {
		return dao.insert(vo);
	}
	
//	댓글 리스트	
	@Override
	public ReplyListVO replyList(int bno) {
		return new ReplyListVO(dao.getReplyCount(bno), dao.replyList(bno));
	}

//	댓글 삭제	
	@Override
	public int delete(int rno) {
		return dao.delete(rno);
	}

	@Override
	public void updateRplCnt(int bno) {
		dao.updateRplCnt(bno);
	}
//	댓글 수정	
	@Override
	public int modifyReply(ReplyVO vo) {
		return dao.modifyReply(vo);
	}
//	댓글 조회
	@Override
	public ReplyVO selectReply(int rno) {
		return dao.selectReply(rno);
	}

}
