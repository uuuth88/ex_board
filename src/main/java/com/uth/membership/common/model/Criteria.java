package com.uth.membership.common.model;

public class Criteria {
	private int pageNo;
	private int pageSize;
	
	public Criteria() {
//		기본설정 1페이지, 20개 글
		this.pageNo = 1;
		this.pageSize = 20;
	}

	public Criteria(int pageNo, int pageSize) {
		super();
		this.pageNo = pageNo;
		this.pageSize = pageSize;
	}
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
}
