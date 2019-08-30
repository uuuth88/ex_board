package com.uth.membership.board.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.uth.membership.board.model.BoardVO;
import com.uth.membership.common.model.Criteria;

import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardServiceTest {

	@Autowired
	private BoardService service;
//	글 조회 테스트	
//	@Test
//	public void test() {
//		log.info(service.getArticle(11));
//	}
//	글 작성 테스트
//	@Test
//	public void test() {
//		BoardVO vo = new BoardVO();
//		vo.setTitle("BoardService테스트");
//		vo.setContent("BoardService테스트");
//		vo.setWriter("tester@uth.com");
//		
//		service.writeArticle(vo);
//		
//		log.info("\n--"+vo);
//	}
//	글 수정 테스트
//	@Test
//	public void test() {
//		BoardVO vo = service.getArticle(22);
//		vo.setTitle("수정 Test title");
//		vo.setContent("수정 Test content");
//		
//		service.modifyArticle(vo);
//		log.info("\n-- bno : "+vo.getBno());
//		log.info("\n-- modify : "+service.getArticle(22));
//	}
//	글 페이징 처리 테스트
//	@Test
//	public void test() {
//		Criteria cri = new Criteria();
//		List<BoardVO> list = service.getList(cri);
//		list.forEach(board -> log.info(board));
//	}
//	검색어 처리 테스트
//	@Test
//	public void test() {
//		Criteria cri = new Criteria();
//		cri.setKey("C");
//		cri.setWord("처리");
//		
//		List<BoardVO> list = service.getList(cri);
//		list.forEach(board -> log.info(board));
//	}
}
