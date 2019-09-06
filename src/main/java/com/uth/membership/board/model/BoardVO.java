package com.uth.membership.board.model;

import java.util.Date;
import org.springframework.stereotype.Component;

@Component
public class BoardVO {
	
	private int bno;
	private String title;
	private String content;
	private Date writeDate;
	private Date modifyDate;
	private int viewCnt;
	private int likeCnt;
	private int hateCnt;
	private int rplCnt;
	private String writer;
	
	public BoardVO() {}

	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	public int getHateCnt() {
		return hateCnt;
	}
	public void setHateCnt(int hateCnt) {
		this.hateCnt = hateCnt;
	}
	public int getRplCnt() {
		return rplCnt;
	}
	public void setRplCnt(int rplCnt) {
		this.rplCnt = rplCnt;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}

//	글 작성자 가져오기
	private String nickname;
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
}
