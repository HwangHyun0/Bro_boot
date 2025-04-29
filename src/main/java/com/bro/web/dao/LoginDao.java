package com.bro.web.dao;

import org.springframework.stereotype.Repository;

import com.bro.web.common.dao.AbstractDAO;
import com.bro.web.model.MemberVo;


@Repository("loginDao")
public class LoginDao extends AbstractDAO{
	
	public MemberVo selectMemberInfo(MemberVo vo) throws Exception {
		
		return (MemberVo)selectOne("member.selectMemberInfo", vo);
	}

}
