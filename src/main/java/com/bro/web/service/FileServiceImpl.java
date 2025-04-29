package com.bro.web.service;

import java.util.List;
import jakarta.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bro.web.dao.FileDao;
import com.bro.web.model.FileVo;

@Service("fileService")
public class FileServiceImpl implements FileService {
	
	@Resource(name="fileDao")
	private FileDao dao;

	@Override
	public Integer selectMaxFileGroupNo() throws Exception {
		
		return dao.selectMaxFileGroupNo();
	}
	
	@Override
	public List<FileVo> selectFileGroupItem(FileVo vo) throws Exception {

		return dao.selectFileGroupItem(vo);
	}
	
	@Override
	public Integer insertFileGroup(FileVo vo) throws Exception {

		return dao.insertFileGroup(vo);
	}

	@Override
	public Integer insertFileGroupItem(FileVo vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.insertFileGroupItem(vo);
	}

}
