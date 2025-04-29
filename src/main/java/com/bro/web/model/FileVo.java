package com.bro.web.model;

public class FileVo {
	private Integer file_group_no;
	private String file_path;
	private Integer file_seq;
	private String org_file_nm;
	private String re_file_nm;
	private String file_extension;
	
	public Integer getFile_group_no() {
		return file_group_no;
	}
	public void setFile_group_no(Integer file_group_no) {
		this.file_group_no = file_group_no;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public Integer getFile_seq() {
		return file_seq;
	}
	public void setFile_seq(Integer file_seq) {
		this.file_seq = file_seq;
	}
	public String getOrg_file_nm() {
		return org_file_nm;
	}
	public void setOrg_file_nm(String org_file_nm) {
		this.org_file_nm = org_file_nm;
	}
	public String getRe_file_nm() {
		return re_file_nm;
	}
	public void setRe_file_nm(String re_file_nm) {
		this.re_file_nm = re_file_nm;
	}
	public String getFile_extension() {
		return file_extension;
	}
	public void setFile_extension(String file_extension) {
		this.file_extension = file_extension;
	}
	
	
}
