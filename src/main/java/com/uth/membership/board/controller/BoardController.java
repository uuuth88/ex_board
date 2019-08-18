package com.uth.membership.board.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.uth.membership.board.model.BoardVO;
import com.uth.membership.board.service.BoardService;
import com.uth.membership.member.model.MemberVO;
import com.uth.membership.member.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board")
@Log4j
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/listArticle.uth")
	public void listArticle(Model model) {
		log.info("\n------------listArticle.uth");
		List<BoardVO> listArticles = new ArrayList<>();
		
		listArticles = service.getList();
		
		//---- login member
		MemberVO member = new MemberVO();
		member = memberService.getMember();
		log.info("\n-------memberVO : "+member);
		model.addAttribute("loginmember", member);
		//---- login member

		model.addAttribute("articles", listArticles);
		
	}
	
	@GetMapping("/readArticle.uth")
	public void readArticle(@RequestParam("bno") int bno, Model model) {
		log.info("\n----------readArticle.uth");
		
		BoardVO vo = new BoardVO();
		vo = service.getArticle(bno);
		
		model.addAttribute("getArticle", vo);
		//---- login member
		MemberVO member = new MemberVO();
		member = memberService.getMember();
		log.info("\n-------memberVO : "+member);
		model.addAttribute("loginmember", member);
		//---- login member
		
	}
	
	@GetMapping("/writeArticle.uth")
	public void writeArticle() {
		
	}
	@GetMapping("/modifyArticle.uth")
	public void modifyArticle() {
		
	}
	
}
