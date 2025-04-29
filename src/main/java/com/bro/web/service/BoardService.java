package com.bro.web.service;

import java.util.List;

import com.bro.web.dto.BoardDto;

public interface BoardService {
	
	List<BoardDto> findByBoardUserList(String boardCd);
	/*
	 * Integer selectBoardCount(BoardVo vo) throws Exception;
	 * 
	 * List<BoardVo> selectBoardList(BoardVo vo) throws Exception;
	 * 
	 * Integer insertBoardItem(BoardVo vo) throws Exception;
	 * 
	 * BoardVo selectBoardItem(BoardVo vo) throws Exception;
	 * 
	 * Integer updateBoardItem(BoardVo vo) throws Exception;
	 * 
	 * Integer deleteBoardItem(BoardVo vo) throws Exception;
	 */
}
