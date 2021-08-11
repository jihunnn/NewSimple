package com.project.simple.admin.vo;

import org.springframework.stereotype.Component;

@Component("adminVO")
public class AdminVO {
	private String adminId;
	private String adminPwd;
	
	public AdminVO() {
		
	}
	public AdminVO(String adminId, String adminPwd) {
		this.adminId = adminId;
		this.adminPwd = adminPwd;
		
	}
	public String getadminId() {
		return adminId;
	}
	
	public void setadminId(String adminId) {
		this.adminId = adminId;
	}
	public String getadminPwd() {
		return adminPwd;
	}
	
	public void setadminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}
}
