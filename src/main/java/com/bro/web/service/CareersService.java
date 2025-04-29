package com.bro.web.service;

import java.util.List;

import com.bro.web.model.CareersVo;

public interface CareersService {
	
	Integer selectCareersCount(CareersVo vo) throws Exception;
	
	List<CareersVo> selectCareersList(CareersVo vo) throws Exception;
	
	Integer deleteCareers(CareersVo vo) throws Exception;
	
	Integer insertCareers(CareersVo vo) throws Exception;
	
	CareersVo selectCareers(CareersVo vo) throws Exception;
}
