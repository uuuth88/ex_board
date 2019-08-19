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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.uth.membership.board.model.BoardVO;
import com.uth.membership.board.service.BoardService;
import com.uth.membership.member.model.MemberVO;
import com.uth.membership.member.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private MemberService memberService;
	
	public MemberVO member() {
		MemberVO member = new MemberVO();
		member = memberService.getMember();
		return member;
	}
	
	@GetMapping("/listArticle.uth")
	public void listArticle(Model model) {
		log.info("\n------------listArticle.uth");
		List<BoardVO> listArticles = new ArrayList<>();
		
		listArticles = service.getList();
		
		//---- login member
		model.addAttribute("loginmember", member());
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
		model.addAttribute("loginmember", member());
		//---- login member
		
	}
	
	@GetMapping("/writeArticle.uth")
	public void writeArticle(Model model) {
		
		//---- login member
		model.addAttribute("loginmember", member());
		//---- login member
		
	}
	@PostMapping("/writeArticle.uth")
	public String writeArticle(BoardVO vo, Model model) {
		log.info("\n---------- 포스트 방식 writeArticle.uth");
		service.writeArticle(vo);
		
		int bno = vo.getBno();
		log.info("\n-- 글번호 : "+bno);
		
		//---- login member
		model.addAttribute("loginmember", member());
		//---- login member
		
		return "redirect:/board/readArticle.uth?bno="+bno;
	}
	
	@GetMapping("/modifyArticle.uth")
	public void modifyArticle(Model model, @RequestParam("bno")int bno) {

		model.addAttribute("board", service.getArticle(bno));
		
		//---- login member
		model.addAttribute("loginmember", member());
		//---- login member
	}
	@PostMapping("/modifyArticle.uth")
	public String modifyArticle(BoardVO vo) {
		service.modifyArticle(vo);
		
		log.info("\n-- BoardVO : "+vo);
		
		int bno = vo.getBno();
		log.info("\n-- 글번호 : "+bno);
		
		return "redirect:/board/readArticle.uth?bno="+bno;
	}
	
}
