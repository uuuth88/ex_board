package com.uth.membership.board.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class BoardControllerTest {
	@Autowired
	private WebApplicationContext wac;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
	}
//	수정 컨트롤러 테스트	
//	@Test
//	public void test() throws Exception{
//		String result = mockMvc.perform(MockMvcRequestBuilders.post("/board/modifyArticle.uth").param("title", "수정 컨트롤러 테스트")
//																					   		  .param("content", "수정 컨트롤러 테스트"))
//						.andReturn()
//						.getModelAndView()
//						.getViewName();
//		log.info(result);
//	}
//	페이징 컨트롤러 테스트
	@Test
	public void test() {
		try {
			log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/listArticle.uth").param("pageNo", "7").param("pageSize", "30")).andReturn().getModelAndView().getModelMap());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
