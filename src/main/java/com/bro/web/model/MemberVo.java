package com.bro.web.model;

public class MemberVo {
	
	private Integer member_no;
	private String member_id;
	private String member_nm;
	private String member_pwd;
	private String out_yn;
	private String out_dttm;
	private String sys_reg_dttm;
	private String sys_upd_dttm;
	
	public Integer getMember_no() {
		return member_no;
	}
	public void setMember_no(Integer member_no) {
		this.member_no = member_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_nm() {
		return member_nm;
	}
	public void setMember_nm(String member_nm) {
		this.member_nm = member_nm;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getOut_yn() {
		return out_yn;
	}
	public void setOut_yn(String out_yn) {
		this.out_yn = out_yn;
	}
	public String getOut_dttm() {
		return out_dttm;
	}
	public void setOut_dttm(String out_dttm) {
		this.out_dttm = out_dttm;
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
	
	

}
