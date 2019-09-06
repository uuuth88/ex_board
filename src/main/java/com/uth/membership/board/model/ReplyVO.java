package com.uth.membership.board.model;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class ReplyVO {
	private int rno;
	private int bno;
	private String rplContent;
	private String writer;
	private Date rplDate;
	private Date rplModify;
	private int rplLike;
	private int rplHate;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getRplContent() {
		return rplContent;
	}
	public void setRplContent(String rplContent) {
		this.rplContent = rplContent;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRplDate() {
		return rplDate;
	}
	public void setRplDate(Date rplDate) {
		this.rplDate = rplDate;
	}
	public Date getRplModify() {
		return rplModify;
	}
	public void setRplModify(Date rplModify) {
		this.rplModify = rplModify;
	}
	public int getRplLike() {
		return rplLike;
	}
	public void setRplLike(int rplLike) {
		this.rplLike = rplLike;
	}
	public int getRplHate() {
		return rplHate;
	}
	public void setRplHate(int rplHate) {
		this.rplHate = rplHate;
	}
	
//	댓글 작성자 가져오기	
	private String nickname;
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
}
