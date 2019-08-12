package com.uth.membership.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board")
@Log4j
public class BoardController {
	
	@GetMapping("/listArticle.uth")
	public void listArticle() {
		
	}
	@GetMapping("/readArticle.uth")
	public void readArticle() {
		
	}
	@GetMapping("/writeArticle.uth")
	public void writeArticle() {
		
	}
	@GetMapping("/modifyArticle.uth")
	public void modifyArticle() {
		
	}

}
