package com.uth.membership.common.model;

public class Criteria {
	private int pageNo;
	private int pageSize;
	
//	검색을 위한 변수 1.검색 조건(key), 2. 검색어(word)
	private String key;
	private String word;
//	검색 조건 설정 메소드
	public String[] getKeyArr() {
		/*검색 조건이 설정되지 않았다면 새로운 스트링배열을 만들고
		설정 되어있다면 ""를 기준으로 조건들을 배열 시키고 리턴 해준다.*/
		String[] selectedKey = key == null ? new String[] {} : key.split("");
		
		return selectedKey;
	}
	
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

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}
	
}
