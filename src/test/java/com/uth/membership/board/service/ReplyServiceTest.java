package com.uth.membership.board.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.uth.membership.board.model.ReplyVO;

import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyServiceTest {

	@Autowired
	private ReplyService service;
//	댓글 등록 테스트
	@Test
	public void test() {
		for(int i=1; i<11; i++) {
			
		ReplyVO vo = new ReplyVO();
		vo.setBno(43001);
		vo.setRplContent("댓글 테스트 "+i);
		vo.setWriter("tester@uth.com");
		
		service.insert(vo);
		service.updateRplCnt(vo.getBno());
		
		log.info(vo);
		}
	}
//	댓글 리스트 조회	
//	@Test
//	public void test() {
//		log.info(service.replyList(43003));
//	}
//	댓글 삭제
//	@Test
//	public void test() {
//		service.delete(76);
//		service.updateRplCnt(43006);
//	}
}
