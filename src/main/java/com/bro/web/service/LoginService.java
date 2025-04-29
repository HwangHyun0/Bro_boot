package com.bro.web.service;

import com.bro.web.model.MemberVo;

public interface LoginService {
	
	MemberVo selectMemberInfo(MemberVo vo) throws Exception;
	

}
