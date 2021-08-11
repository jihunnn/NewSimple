package com.project.simple.member.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO{
	private String memId;
	private String memName;
	private String memPwd;
	private String memEmail;
	private String memEmail1;
	private String memPhoneNum;
	private String memPhoneNum1;
	private String memPhoneNum2;
	private String memAdr;
	private String memAdr1;
	private String memAdr2;
	private String logintype;
	private String memRegdate;
	private String Approval_key;
	private String SNS;
	
	public MemberVO() {
		
	}
	
	public MemberVO(String memId, String memName, String memPwd, String memEmail, String memEmail1, String memPhoneNum,String memPhoneNum1,String memPhoneNum2, String memAdr, String memAdr1, String memAdr2, String logintype, String memRegdate) {
		this.memId = memId;
		this.memName = memName;
		this.memPwd = memPwd;
		this.memEmail = memEmail;
		this.memPhoneNum = memPhoneNum;
		this.memPhoneNum = memPhoneNum1;
		this.memPhoneNum = memPhoneNum2;
		this.memAdr = memAdr;
		this.memAdr = memAdr1;
		this.memAdr = memAdr2;
		this.memEmail1 = memEmail1;
		this.logintype = logintype;
		this.memRegdate = memRegdate;
	}
	
	public String getmemId() {
		return memId;
	}
	
	public void setmemId(String memId) {
		this.memId = memId;
	}
	
	public String getmemName() {
		return memName;
	}
	
	public void setmemName(String memName) {
		this.memName=memName;
	}
	
	
	public String getSNS() {
		return SNS;
	}

	public void setSNS(String sNS) {
		SNS = sNS;
	}

	public String getmemPwd() {
		return memPwd;
	}
	
	public void setmemPwd(String memPwd) {
		this.memPwd=memPwd;
	}
	
	public String getmemEmail() {
		return memEmail;
	}
	
	public void setmemEmail(String memEmail) {
		this.memEmail=memEmail;
	}
	
	public String getmemEmail1() {
		return memEmail1;
	}
	
	public void setmemEmail1(String memEmail1) {
		this.memEmail1=memEmail1;
	}
	
	public String getmemPhoneNum() {
		return memPhoneNum;
	}
	
	public void setmemPhoneNum(String memPhoneNum) {
		this.memPhoneNum = memPhoneNum;
	}
	
	public String getmemPhoneNum1() {
		return memPhoneNum1;
	}
	
	public void setmemPhoneNum1(String memPhoneNum1) {
		this.memPhoneNum1 = memPhoneNum1;
	}
	
	public String getmemPhoneNum2() {
		return memPhoneNum2;
	}
	
	public void setmemPhoneNum2(String memPhoneNum2) {
		this.memPhoneNum2 = memPhoneNum2;
	}
	
	public String getmemAdr() {
		return memAdr;
	}
	
	public void setmemAdr(String memAdr) {
		this.memAdr = memAdr;
	}
	
	public String getmemAdr1() {
		return memAdr1;
	}
	
	public void setmemAdr1(String memAdr1) {
		this.memAdr1 = memAdr1;
	}
	
	public String getmemAdr2() {
		return memAdr2;
	}
	
	public void setmemAdr2(String memAdr2) {
		this.memAdr2 = memAdr2;
	}
	public String getlogintype() {
		return logintype;
	}
	
	public void setlogintype(String logintype) {
		this.logintype = logintype;
	}
	public String getmemRegdate() {
		return memRegdate;
	}
	
	public void setmemRegdate(String memRegdate) {
		this.memRegdate = memRegdate;
	}

	public String getApproval_key() {
		return Approval_key;
	}
	public void setApproval_key(String Approval_key) {
		this.Approval_key = Approval_key;
	}

}