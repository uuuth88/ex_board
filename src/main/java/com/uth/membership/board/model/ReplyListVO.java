package com.uth.membership.board.model;

import java.util.List;

public class ReplyListVO {
	private int rplCnt;
	private List<ReplyVO> rplList;
	
	public ReplyListVO(int rplCnt, List<ReplyVO> rplList) {
		this.rplCnt = rplCnt;
		this.rplList = rplList;
	}
	 
	public int getRplCnt() {
		return rplCnt;
	}
	public void setRplCnt(int rplCnt) {
		this.rplCnt = rplCnt;
	}
	public List<ReplyVO> getRplList() {
		return rplList;
	}
	public void setRplList(List<ReplyVO> rplList) {
		this.rplList = rplList;
	}
	
	
}
