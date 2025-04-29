package com.bro.web.controller;

import java.util.List;

import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bro.web.dto.BoardDto;
import com.bro.web.model.MessageVO;
import com.bro.web.service.BoardService;
import com.bro.web.service.FileService;


@Controller
public class MainController {
	
	@Autowired
	private BoardService boardService;
	
	@Resource(name="fileService")
	private FileService fileService;
	
	
	@GetMapping("/")
    public String home() {
        return "redirect:/main/main.do";
    }
	
	@RequestMapping(value = "/main/main.do")
	public String main(HttpServletRequest request, Model model) {
		try {
			List<BoardDto> babyList;
			babyList = boardService.findByBoardUserList("01");
			model.addAttribute("babyList", babyList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "main/main";
	}
	
	@PostMapping(value = "/main/message.do")
	public String message(HttpServletRequest request, Model model, MessageVO msgVo) {
		try {
			//Integer result = boardService.insertBoardItem(msgVo);
			model.addAttribute("msg", "서비스 준비중입니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "main/main";
	}
	
	

}
