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
	
	@Test
	public void test() {
		for(int i=1; i<11; i++) {
			
		ReplyVO vo = new ReplyVO();
		vo.setBno(20482);
		vo.setRplContent("댓글 테스트 "+i);
		vo.setWriter("tester@uth.com");
		
		service.insert(vo);
		log.info(vo);
		}
	}

}
