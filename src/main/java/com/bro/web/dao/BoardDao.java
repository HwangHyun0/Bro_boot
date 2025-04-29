package com.bro.web.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bro.web.common.dao.AbstractDAO;
import com.bro.web.model.BoardVo;

@Repository("boardDao")
public class BoardDao extends AbstractDAO{
	
	public Integer selectBoardCount(BoardVo vo) throws Exception {
		
		return (Integer)selectOne("board.selectBoardCount", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<BoardVo> selectBoardList(BoardVo vo) throws Exception {
		
		return (List<BoardVo>)selectList("board.selectBoardList", vo);
	}
	
	public Integer insertBoardItem(BoardVo vo) throws Exception {
		
		return (Integer)insert("board.insertBoardItem", vo);
	}
	
	public BoardVo selectBoardItem(BoardVo vo) throws Exception {
		
		return (BoardVo)selectOne("board.selectBoardItem", vo);
	}
	public Integer updateBoardItem(BoardVo vo) throws Exception {
		
		return (Integer)update("board.updateBoardItem", vo);
	}
	public Integer deleteBoardItem(BoardVo vo) throws Exception{
		
		return (Integer)update("board.deleteBoardItem", vo);
	}

}
