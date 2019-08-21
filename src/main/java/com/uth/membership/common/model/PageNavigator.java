package com.uth.membership.common.model;

public class PageNavigator {
	private int start;
	private int end;
	private boolean prev;
	private boolean next;
	private int total;
	private Criteria cri;
	
	public PageNavigator(int total, Criteria cri) {
		
		this.total = total;
		this.cri = cri;
		
		this.end = (int)(Math.ceil(cri.getPageNo()/10.0))*10;
		this.start = this.end - 9;
		
		int boardEnd = (int)(Math.ceil((total*1.0)/cri.getPageSize()));
		
		if(boardEnd < this.end) {
			this.end = boardEnd;
		}
		
		this.prev = this.start > 1;
		this.next = this.end < boardEnd;
		
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	
}
