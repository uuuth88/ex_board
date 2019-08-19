package com.uth.membership.board.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.uth.membership.board.model.BoardVO;

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
//		vo.setWriter("test01@uth.com");
//		
//		service.writeArticle(vo);
//		
//		log.info("\n--"+vo);
//	}
//	글 수정 테스트
	@Test
	public void test() {
		BoardVO vo = service.getArticle(22);
		vo.setTitle("수정 Test title");
		vo.setContent("수정 Test content");
		
		service.modifyArticle(vo);
		log.info("\n-- bno : "+vo.getBno());
		log.info("\n-- modify : "+service.getArticle(22));
	}
}
