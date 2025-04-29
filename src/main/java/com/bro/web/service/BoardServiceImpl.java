package com.bro.web.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bro.web.dto.BoardDto;
import com.bro.web.repository.BoardRepository;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	private final BoardRepository boardRepository;
	
	public BoardServiceImpl(BoardRepository boardRepository) {
        this.boardRepository = boardRepository;
    }
	
	@Override
    public List<BoardDto> findByBoardUserList(String boardCd) {
        return boardRepository.findByBoardUserList(boardCd);
    }
	/*
	 * @Resource(name="boardDao") private BoardDao boardDao;
	 */
	/*
	 * @Override public Integer selectBoardCount(BoardVo vo) throws Exception {
	 * 
	 * return boardDao.selectBoardCount(vo); }
	 * 
	 * @Override public List<BoardVo> selectBoardList(BoardVo vo) throws Exception {
	 * 
	 * return boardDao.selectBoardList(vo); }
	 * 
	 * @Override public Integer insertBoardItem(BoardVo vo) throws Exception {
	 * 
	 * return boardDao.insertBoardItem(vo); }
	 * 
	 * @Override public BoardVo selectBoardItem(BoardVo vo) throws Exception {
	 * 
	 * return boardDao.selectBoardItem(vo); }
	 * 
	 * @Override public Integer updateBoardItem(BoardVo vo) throws Exception {
	 * 
	 * return boardDao.updateBoardItem(vo); }
	 * 
	 * @Override public Integer deleteBoardItem(BoardVo vo) throws Exception {
	 * 
	 * return boardDao.deleteBoardItem(vo); }
	 */

}
