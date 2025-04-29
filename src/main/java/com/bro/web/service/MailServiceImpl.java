package com.bro.web.service;

import java.util.List;

import jakarta.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bro.web.dao.MailDao;
import com.bro.web.model.MailVo;

//by영훈 21-06-18
@Service("mailService")
public class MailServiceImpl implements MailService {
	
	@Resource(name="mailDao")
	private MailDao mailDao;
	
	@Override
	public List<MailVo> selectMailList() {
		
		return  mailDao.selectMailList();
	}// MailServiceImpl 끝
	
	
	
	@Override
	public void insertMail(MailVo mailVo) throws Exception {
		System.out.println("mailinsert");
		
		mailDao.insertMail(mailVo);
		
	}

	
		
}
