package com.bro.web.controller;

import java.util.List;

import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bro.web.model.MailVo;
import com.bro.web.service.MailService;

@Controller
public class MailController {
	
	@Resource(name="mailService")
	private MailService mailService;
	
	//admin mail조회 
	/*mail*/
	@RequestMapping(value = "/admin/mail/mail.do" , method = RequestMethod.GET)
	public String mail(HttpServletRequest request , Model model) throws Exception{
		if(request.getSession().getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인을 해주세요.");
			model.addAttribute("url", "/login/login.do");
			return "/view/common/redirect";
		}else {
		System.out.println("mailController");
		
		
		List<MailVo> mailList=mailService.selectMailList();
		
		model.addAttribute("mailList",mailList);
		
		return "/view/admin/test/test";
		}
		
	}
	
	//insert 메일
	@RequestMapping(value="/mail/handler/insertmail.do", method = {RequestMethod.GET , RequestMethod.POST})
	public String insertMail(Model model, MailVo mailVo) throws Exception{
		
		mailService.insertMail(mailVo);
		
		
		model.addAttribute("msg", "신청되셨습니다.");
		model.addAttribute("url", "/admin/mail/mail.do");

		return "/view/common/redirect";

	}
	
	@ResponseBody
	@RequestMapping(value="/admin/mail/handler/selectMailList.do", method = {RequestMethod.GET , RequestMethod.POST})
	public void selectMailList(){
		System.out.println("selectMailList");
		
		
	}
	
}
