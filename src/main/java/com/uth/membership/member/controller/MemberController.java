package com.uth.membership.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {
	@GetMapping("/loginForm.uth")
	public void loginForm() {
		
	}
	@GetMapping("/registerForm.uth")
	public void registerForm() {
		
	}
	@GetMapping("/modifyForm.uth")
	public void modifyForm() {
		
	}
}
