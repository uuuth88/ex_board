package com.uth.membership.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uth.membership.board.dao.ReplyDao;
import com.uth.membership.board.model.ReplyVO;
@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDao dao;
	
	@Override
	public int insert(ReplyVO vo) {
		return dao.insert(vo);
	}

}
