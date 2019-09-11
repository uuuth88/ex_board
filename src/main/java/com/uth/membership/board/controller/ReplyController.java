package com.uth.membership.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import com.uth.membership.board.model.ReplyListVO;
import com.uth.membership.board.model.ReplyVO;
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
	
	@PostMapping(value="/insert", consumes="application/json", produces="text/plain; charset=utf-8")
	public ResponseEntity<String> insertReply(@RequestBody ReplyVO vo){
		int cnt = service.insert(vo);
		service.updateRplCnt(vo.getBno());
		return cnt == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)//200
						: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);//500
	}
	
	@PutMapping(value="/modify/{rno}", consumes="application/json", produces="text/plain; charset=utf-8")
	public ResponseEntity<String> modifyReply(@RequestBody ReplyVO vo, @PathVariable("rno") int rno){

		vo.setRno(rno);
		
		log.info("수정할 댓글 번호는 : "+rno);
		
		return service.modifyReply(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
											: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/select/{rno}", produces="application/json; charset=utf-8")
	public ResponseEntity<ReplyVO> selectReply(@PathVariable("rno")int rno){
		log.info("조회할 댓글 번호는 : "+rno);
		return new ResponseEntity<>(service.selectReply(rno), HttpStatus.OK);
	}
}
