package com.bro.web.repository;

import com.bro.web.dto.BoardDto;
import com.bro.web.entity.Board;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface BoardRepository extends JpaRepository<Board, String>{
	

	@Query("SELECT new com.bro.web.dto.BoardDto(b.boardCd, b.boardNo, function('fn_getOrgFileNm', b.boardNo), " +
		   "b.title, b.contents, b.sysRegDttm) " +
           "FROM Board b " +
           "WHERE b.boardCd = :boardCd " +
           "AND b.delYn <> 'Y' " +
           "AND b.useYn = 'Y' " +
           "ORDER BY b.sysRegDttm DESC")
    List<BoardDto> findByBoardUserList(@Param("boardCd") String boardCd);
}
