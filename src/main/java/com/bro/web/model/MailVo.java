package com.bro.web.model;

public class MailVo {
	
	private int mail_no;
	private String mail;
	private String date;
	private String private_yn;
	

	public int getMail_no() {
		return mail_no;
	}
	public void setMail_no(int mail_no) {
		this.mail_no = mail_no;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getPrivate_yn() {
		return private_yn;
	}
	public void setPrivate_yn(String private_yn) {
		this.private_yn = private_yn;
	}
	
	@Override
	public String toString() {
		return "MailVo [mail_no=" + mail_no + ", mail=" + mail + ", date=" + date + ", private_yn=" + private_yn + "]";
	}
	
	
	
	
}
