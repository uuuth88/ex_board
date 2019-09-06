package com.uth.membership.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.uth.membership.board.model.ReplyListVO;
import com.uth.membership.board.service.ReplyService;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/reply")
@Log4j
public class ReplyController {
	@Autowired
	private ReplyService service;
	
	@GetMapping(value="/{bno}", produces="application/json; charset=utf-8")
	public ResponseEntity<ReplyListVO> replyList(@PathVariable("bno") int bno){
		log.info(".../댓글 리스트");
		return new ResponseEntity<>(service.replyList(bno), HttpStatus.OK);
	}
	
}
