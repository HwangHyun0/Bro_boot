package com.bro.web.controller;


import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bro.web.entity.Member;
import com.bro.web.model.MemberVo;
import com.bro.web.repository.MemberRepository;
import com.bro.web.security.CustomUserDetails;
import com.bro.web.service.LoginService;


@Controller
@RequiredArgsConstructor
public class LoginController {
	
	//private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	private final MemberRepository memberRepository; 
	 
	@RequestMapping(value = "/login/login.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String login(HttpServletRequest request, Model model) {
		if(request.getSession().getAttribute("loginInfo") != null) {
			model.addAttribute("msg", "이미 로그인 된 상태입니다.");
			model.addAttribute("url", "/admin/bro/baby.do");
			return "common/redirect";
		}else {
			return "admin/login/login";
		}
	}
	
	@RequestMapping(value="/login/handler/login.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String handlerLogin(HttpServletRequest request, Model model, MemberVo vo) throws Exception {
		Member member = memberRepository.findByMemberId(vo.getMember_id())
	            .orElse(null);

		
		//ID 존재여부 확인
		if(member == null) {
			model.addAttribute("msg", "입력정보를 확인해주세요.");
			model.addAttribute("url", "/login/login.do");
			return "common/redirect";
		}
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		boolean isPasswordMatch = encoder.matches(vo.getMember_pwd(), member.getMemberPwd()); 
		
		//비밀번호 일치 확인
		if (!isPasswordMatch) {
	        model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
	        model.addAttribute("url", "/login/login.do");
	        return "common/redirect";
	    }
		
		 // [여기부터 추가]
	    // 1. CustomUserDetails를 만들어야 함 (Member 객체를 기반으로)
	    CustomUserDetails userDetails = new CustomUserDetails(member);

	    // 2. 인증 토큰 만들기
	    UsernamePasswordAuthenticationToken authentication =
	            new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());

	    // 3. SecurityContext에 등록
	    SecurityContextHolder.getContext().setAuthentication(authentication);

	    // 4. 세션에도 등록 (선택, 강제 초기화 방지용)
	    request.getSession().setAttribute("SPRING_SECURITY_CONTEXT", SecurityContextHolder.getContext());
	    // [여기까지 추가]
		
		model.addAttribute("msg", "로그인되었습니다.");
		model.addAttribute("url", "/admin/bro/baby.do");
		request.getSession().setAttribute("loginInfo", member);
		return "common/redirect";
	}
	
	@RequestMapping(value="/login/handler/logout.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String handlerLogout(HttpServletRequest request, Model model, MemberVo vo) throws Exception {
		request.getSession().removeAttribute("loginInfo");
		
		model.addAttribute("msg", "로그아웃되었습니다.");
		model.addAttribute("url", "/login/login.do");
		
		return "common/redirect";
	}
	
}
