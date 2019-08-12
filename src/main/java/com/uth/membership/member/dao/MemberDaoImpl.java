package com.uth.membership.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.uth.membership.member.model.MemberVO;
@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession ss;
	
	public final String NAMESPACE = "com.uth.mapper.MemberMapper";
	//test할동안만.. 사용 후 삭제..
	@Override
	public MemberVO getMember() {
		return ss.selectOne(NAMESPACE+".getMember");
	}

}
