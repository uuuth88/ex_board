package com.uth.membership.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uth.membership.board.dao.ReplyDao;
import com.uth.membership.board.model.ReplyPageVO;
import com.uth.membership.board.model.ReplyVO;
@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDao dao;
	
	@Override
	public int insert(ReplyVO vo) {
		return dao.insert(vo);
	}

	@Override
	public ReplyPageVO replyList(int bno) {
		return new ReplyPageVO(dao.getReplyCount(bno), dao.replyList(bno));
	}

	@Override
	public int delete(int rno) {
		return dao.delete(rno);
	}

	@Override
	public void updateRplCnt(int bno) {
		dao.updateRplCnt(bno);
	}

}
