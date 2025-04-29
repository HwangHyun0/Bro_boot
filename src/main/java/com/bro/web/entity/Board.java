package com.bro.web.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.util.List;

import com.bro.web.model.FileVo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;

@Entity			
@Table(name = "TB_BOARD_ITEM") // DB 테이블명
@Getter
@Setter
@NoArgsConstructor
public class Board {

	   @Id
	    @Column(name = "board_cd")
	    private String boardCd;

	    @Column(name = "board_no")
	    private Integer boardNo;

	    @Column(name = "title")
	    private String title;

	    @Column(name = "contents")
	    private String contents;

	    @Column(name = "de_contents")
	    private String deContents;

	    @Column(name = "use_yn")
	    private String useYn;

	    @Column(name = "view_cnt")
	    private Integer viewCnt;

	    @Column(name = "logo_file_group_no")
	    private Integer logoFileGroupNo;

	    @Transient
	    private List<FileVo> logoFileList;

	    @Column(name = "thumb_file_group_no")
	    private Integer thumbFileGroupNo;

	    @Transient
	    private List<FileVo> thumbFileList;

	    @Column(name = "visual_file_group_no")
	    private Integer visualFileGroupNo;

	    @Column(name = "project_client")
	    private String projectClient;

	    @Transient
	    private String[] projectKeywordList;

	    @Column(name = "project_keyword")
	    private String projectKeyword;

	    @Column(name = "project_technology")
	    private String projectTechnology;

	    @Column(name = "project_start_dt")
	    private String projectStartDt;

	    @Column(name = "project_end_dt")
	    private String projectEndDt;

	    @Column(name = "publish_dt")
	    private String publishDt;

	    @Column(name = "sys_reg_dttm")
	    private String sysRegDttm;

	    @Column(name = "sys_upd_dttm")
	    private String sysUpdDttm;

	    @Column(name = "del_yn")
	    private String delYn;

	    @Column(name = "view_yn")
	    private String viewYn;

	    @Column(name = "top_yn")
	    private String topYn;

	    @Column(name = "list_type_yn")
	    private String listTypeYn;
}
