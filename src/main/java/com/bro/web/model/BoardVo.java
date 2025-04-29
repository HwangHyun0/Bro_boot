package com.bro.web.model;

import java.util.Arrays;
import java.util.List;

public class BoardVo extends SearchVo{
	
	private String board_cd;
	private Integer board_no;
	private String board_classify_cd;
	private String board_classify_cd_nm;
	private String title;
	private String contents;
	private String de_contents;
	private String use_yn;
	private Integer view_cnt;
	private Integer logo_file_group_no;
	private List<FileVo> logo_file_list;
	private Integer thumb_file_group_no;
	private List<FileVo> thumb_file_list;
	private Integer visual_file_group_no;
	private String project_client;
	private String[] project_keyword_list;
	private String project_keyword;
	private String project_technology;
	private String project_start_dt;
	private String project_end_dt;
	private String publish_dt;
	private String sys_reg_dttm;
	private String sys_upd_dttm;
	private String del_yn;
	private String view_yn;
	private String top_yn; 
	private String list_type_yn;
	private String experience;
	private String file_nm;
	
	public String getTop_yn() {
		return top_yn;
	}
	public void setTop_yn(String top_yn) {
		this.top_yn = top_yn;
	}
	public String getBoard_cd() {
		return board_cd;
	}
	public void setBoard_cd(String board_cd) {
		this.board_cd = board_cd;
	}
	public Integer getBoard_no() {
		return board_no;
	}
	public void setBoard_no(Integer board_no) {
		this.board_no = board_no;
	}
	public String getBoard_classify_cd() {
		return board_classify_cd;
	}
	public void setBoard_classify_cd(String board_classify_cd) {
		this.board_classify_cd = board_classify_cd;
	}
	public String getBoard_classify_cd_nm() {
		return board_classify_cd_nm;
	}
	public void setBoard_classify_cd_nm(String board_classify_cd_nm) {
		this.board_classify_cd_nm = board_classify_cd_nm;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getDe_contents() {
		return de_contents;
	}
	public void setDe_contents(String de_contents) {
		this.de_contents = de_contents;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public Integer getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(Integer view_cnt) {
		this.view_cnt = view_cnt;
	}
	public Integer getLogo_file_group_no() {
		return logo_file_group_no;
	}
	public void setLogo_file_group_no(Integer logo_file_group_no) {
		this.logo_file_group_no = logo_file_group_no;
	}
	public List<FileVo> getLogo_file_list() {
		return logo_file_list;
	}
	public void setLogo_file_list(List<FileVo> logo_file_list) {
		this.logo_file_list = logo_file_list;
	}
	public Integer getThumb_file_group_no() {
		return thumb_file_group_no;
	}
	public void setThumb_file_group_no(Integer thumb_file_group_no) {
		this.thumb_file_group_no = thumb_file_group_no;
	}
	public List<FileVo> getThumb_file_list() {
		return thumb_file_list;
	}
	public void setThumb_file_list(List<FileVo> thumb_file_list) {
		this.thumb_file_list = thumb_file_list;
	}
	public Integer getVisual_file_group_no() {
		return visual_file_group_no;
	}
	public void setVisual_file_group_no(Integer visual_file_group_no) {
		this.visual_file_group_no = visual_file_group_no;
	}
	public String getProject_client() {
		return project_client;
	}
	public void setProject_client(String project_client) {
		this.project_client = project_client;
	}
	public String[] getProject_keyword_list() {
		return project_keyword_list;
	}
	public void setProject_keyword_list(String[] project_keyword_list) {
		this.project_keyword_list = project_keyword_list;
	}
	public String getProject_keyword() {
		return project_keyword;
	}
	public void setProject_keyword(String project_keyword) {
		this.project_keyword = project_keyword;
	}
	public String getProject_technology() {
		return project_technology;
	}
	public void setProject_technology(String project_technology) {
		this.project_technology = project_technology;
	}
	public String getProject_start_dt() {
		return project_start_dt;
	}
	public void setProject_start_dt(String project_start_dt) {
		this.project_start_dt = project_start_dt;
	}
	public String getProject_end_dt() {
		return project_end_dt;
	}
	public void setProject_end_dt(String project_end_dt) {
		this.project_end_dt = project_end_dt;
	}
	public String getPublish_dt() {
		return publish_dt;
	}
	public void setPublish_dt(String publish_dt) {
		this.publish_dt = publish_dt;
	}
	public String getSys_reg_dttm() {
		return sys_reg_dttm;
	}
	public void setSys_reg_dttm(String sys_reg_dttm) {
		this.sys_reg_dttm = sys_reg_dttm;
	}
	public String getSys_upd_dttm() {
		return sys_upd_dttm;
	}
	public void setSys_upd_dttm(String sys_upd_dttm) {
		this.sys_upd_dttm = sys_upd_dttm;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	public String getView_yn() {
		return view_yn;
	}
	public void setView_yn(String view_yn) {
		this.view_yn = view_yn;
	}
	public String getList_type_yn() {
		return list_type_yn;
	}
	public void setList_type_yn(String list_type_yn) {
		this.list_type_yn = list_type_yn;
	}
	@Override
	public String toString() {
		return "BoardVo [board_cd=" + board_cd + ", board_no=" + board_no + ", board_classify_cd=" + board_classify_cd
				+ ", board_classify_cd_nm=" + board_classify_cd_nm + ", title=" + title + ", contents=" + contents
				+ ", de_contents=" + de_contents + ", use_yn=" + use_yn + ", view_cnt=" + view_cnt
				+ ", logo_file_group_no=" + logo_file_group_no + ", logo_file_list=" + logo_file_list
				+ ", thumb_file_group_no=" + thumb_file_group_no + ", thumb_file_list=" + thumb_file_list
				+ ", visual_file_group_no=" + visual_file_group_no + ", project_client=" + project_client
				+ ", project_keyword_list=" + Arrays.toString(project_keyword_list) + ", project_keyword="
				+ project_keyword + ", project_technology=" + project_technology + ", project_start_dt="
				+ project_start_dt + ", project_end_dt=" + project_end_dt + ", publish_dt=" + publish_dt
				+ ", sys_reg_dttm=" + sys_reg_dttm + ", sys_upd_dttm=" + sys_upd_dttm + ", del_yn=" + del_yn
				+ ", view_yn=" + view_yn + ", top_yn=" + top_yn + "]";
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getFile_nm() {
		return file_nm;
	}
	public void setFile_nm(String file_nm) {
		this.file_nm = file_nm;
	}
	
	

}
