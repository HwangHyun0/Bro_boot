package com.bro.web.controller;

import jakarta.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PartenerController {
	private static final String VIEW_PATH = "/view/partner/";
	
	@RequestMapping(value = "/partner/partnership.do")
	public String partnership(HttpServletRequest request, Model model) {
		
		return VIEW_PATH + "partnership";
	}
	
}
