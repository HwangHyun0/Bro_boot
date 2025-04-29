package com.bro.web.controller;

import jakarta.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CompanyController {
	
	private static final String VIEW_PATH = "/view/company/";
	
	@RequestMapping(value = "/company/financial.do")
	public String financial(HttpServletRequest request, Model model) {
		
		return VIEW_PATH + "financial";
	}
	
	@RequestMapping(value = "/company/history.do")
	public String history(HttpServletRequest request, Model model) {
		
		return VIEW_PATH + "history";
	}
	
	@RequestMapping(value = "/company/introduction.do")
	public String introduction(HttpServletRequest request, Model model) {
		
		return VIEW_PATH + "introduction";
	}
	
	@RequestMapping(value = "/company/location.do")
	public String location(HttpServletRequest request, Model model) {
		
		return VIEW_PATH + "location";
	}
	
	@RequestMapping(value = "/company/organization.do")
	public String organization(HttpServletRequest request, Model model) {
		
		return VIEW_PATH + "organization";
	}
	
	@RequestMapping(value = "/company/vision.do")
	public String vision(HttpServletRequest request, Model model) {
		
		return VIEW_PATH + "vision";
	}
}
