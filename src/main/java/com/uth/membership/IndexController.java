package com.uth.membership;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class IndexController {
	@GetMapping("/index.uth")
	public void index() {
		log.info("index...");
	}
}
