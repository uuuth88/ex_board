package com.uth.membership.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.uth.membership.board.service.BoardService;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/commons")
@Log4j
public class CommonController {
	@Autowired 
	BoardService boardService;
	
	@RequestMapping(value="/like/{bno}", method= {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> updateLike(@PathVariable("bno") int bno){
		log.info("\n호출 컨트롤러는 CommonController... 실행 메소드는 updateLike()");
		ResponseEntity<String> entity = null;
		
		try {
			boardService.updateLike(bno);
			
			entity= new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value="/hate/{bno}", method= {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> updateHate(@PathVariable("bno") int bno){
		log.info("\n호출 컨트롤러는 CommonController... 실행 메소드는 updateLike()");
		ResponseEntity<String> entity = null;
		
		try {
			boardService.updateHate(bno);
			
			entity= new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
