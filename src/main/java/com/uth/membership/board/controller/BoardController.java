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
import com.uth.membership.common.model.Criteria;
import com.uth.membership.common.model.PageNavigator;
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
	public void listArticle(Model model, Criteria cri) {
		log.info("\n------------listArticle.uth");
		List<BoardVO> listArticles = new ArrayList<>();
		int total = service.getTotalArticle(cri);
		listArticles = service.getList(cri);
		model.addAttribute("articles", listArticles);
		model.addAttribute("pageNav", new PageNavigator(total, cri));
		
		//---- login member
		model.addAttribute("loginmember", member());
		//---- login member
		
	}
	
	@GetMapping("/readArticle.uth")
	public void readArticle(@RequestParam("bno") int bno, Model model, Criteria cri) {
		log.info("\n----------readArticle.uth");
		//		회원 시스템 구축 후 실행
		//		service.updateView(bno);
		BoardVO vo = new BoardVO();
		vo = service.getArticle(bno);
		
		model.addAttribute("getArticle", vo);
		model.addAttribute("cri", cri);
		
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
	public void modifyArticle(Model model, @RequestParam("bno")int bno, Criteria cri) {

		model.addAttribute("board", service.getArticle(bno));
		model.addAttribute("cri", cri);
		
		//---- login member
		model.addAttribute("loginmember", member());
		//---- login member
	}
	@PostMapping("/modifyArticle.uth")
	public String modifyArticle(BoardVO vo, @RequestParam("bno")int bno, Criteria cri, RedirectAttributes reAttr) {

		service.modifyArticle(vo);
		
		reAttr.addAttribute("pageNo", cri.getPageNo());
		reAttr.addAttribute("pageSize", cri.getPageSize());
		
		log.info("\n-- 글번호 : "+bno);
		
		return "redirect:/board/readArticle.uth?bno="+bno;
	}
	@PostMapping("/delete.uth")
	public String delete(@RequestParam("bno")int bno) {
		
		
		return "redirect:/board/listArticle.uth";
	}
}
