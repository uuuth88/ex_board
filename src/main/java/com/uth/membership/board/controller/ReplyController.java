package com.uth.membership.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import com.uth.membership.board.model.ReplyPageVO;
import com.uth.membership.board.service.ReplyService;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/reply/")
@Log4j
public class ReplyController {
	@Autowired
	private ReplyService service;
	
	@GetMapping(value="/{bno}", produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyPageVO> replyList(@PathVariable("bno")int bno){
		log.info(".../댓글 리스트");
		return new ResponseEntity<>(service.replyList(bno), HttpStatus.OK);
	}
	
}
