package com.an.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Test {

	@RequestMapping("/test")
	public String test() {
		System.out.println("test확인");
		return "test.jsp";
	}
	
}
