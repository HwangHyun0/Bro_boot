package com.bro.web.service;

import jakarta.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bro.web.dao.LoginDao;
import com.bro.web.model.MemberVo;


@Service("loginService")
public class LoginServiceImpl implements LoginService {

	@Resource(name="loginDao")
	private LoginDao dao;
	
	@Override
	public MemberVo selectMemberInfo(MemberVo vo) throws Exception {
		MemberVo memberVo = dao.selectMemberInfo(vo);
		
		return memberVo;
	}

}
