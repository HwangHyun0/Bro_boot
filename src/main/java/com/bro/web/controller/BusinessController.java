package com.bro.web.controller;

import jakarta.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BusinessController {

	private static final String VIEW_PATH = "/view/business/";
	
	
	@RequestMapping(value = "/business/finance.do")
	public String finance(HttpServletRequest request, Model model) {
		
		return VIEW_PATH + "finance";
	}
	
	@RequestMapping(value = "/business/distribution.do")
	public String distribution(HttpServletRequest request, Model model) {
		
		return VIEW_PATH + "distribution";
	}
	
	@RequestMapping(value = "/business/solution.do")
	public String solution(HttpServletRequest request, Model model) {
		
		return VIEW_PATH + "solution";
	}
		
	
}

