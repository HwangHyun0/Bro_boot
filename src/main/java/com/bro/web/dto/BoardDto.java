package com.bro.web.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class BoardDto {
	
	private String boardCd;
    private Integer boardNo;
    private String fileNm; 
    private String title;
	private String contents;
	private String sysRegDttm;
	
	public BoardDto(String boardCd, Integer boardNo, Object fileNm, String title, String contents, String sysRegDttm) {
        this.boardCd = boardCd;
        this.boardNo = boardNo;
        this.fileNm = (fileNm != null) ? fileNm.toString() : null;  // 안전하게 String 변환
        this.title = title;
        this.contents = contents;
        this.sysRegDttm = sysRegDttm;
    }
}

