package com.bro.web.controller;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AboutController {
	
	/*user*/
	@RequestMapping(value = "/about/about.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String user_careers(HttpServletRequest request, Model model) throws Exception {
		
		return "/view/about/about";
	}
}
