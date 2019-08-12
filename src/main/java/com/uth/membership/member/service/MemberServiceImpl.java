package com.uth.membership.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uth.membership.member.dao.MemberDao;
import com.uth.membership.member.model.MemberVO;
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao dao;
	//test할동안만.. 사용 후 삭제..
	@Override
	public MemberVO getMember() {
		return dao.getMember();
	}

}
