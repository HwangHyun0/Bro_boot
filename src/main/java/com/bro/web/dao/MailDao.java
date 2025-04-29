package com.bro.web.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.bro.web.model.MailVo;

@Repository("mailDao")
public class MailDao {

	
	public List<MailVo> selectMailList(){
		System.out.println("Dao");
		
		//test
		List<MailVo> mailList = new ArrayList<MailVo>();
		for(int i = 0; i<10; i++){
			
			MailVo vo = new MailVo();
			vo.setMail_no(i);
			vo.setMail("ggg"+i+"@naver.com");
			vo.setDate(i+""+i+""+i+""+i+""+ "-"+i+""+i+"-"+i+""+i);
			
			if((i % 3 )== 1){
			vo.setPrivate_yn("Y");
			
			}else{
				vo.setPrivate_yn("N");
			}
			
			mailList.add(vo);
		}
		//test 끝
		
		return mailList;
		
	}

	public void insertMail(MailVo mailVo) {
		System.out.println(mailVo);
		
	}
}
