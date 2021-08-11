package com.project.simple.nonmember.vo;

import org.springframework.stereotype.Component;

@Component("nonmemberVO")
public class NonmemberVO {
	
	private int nonMemOrderSeqNum;         //비회원 주문 상품 일련 번호
	private String productNum;             //상품 번호
	private int nonMemOrderNum;            //비회원 주문 번호
	private String nonMemName;             //비회원 주문자
	private String nonMemPwd;             //비회원 주문 비밀번호
	private String nonEmail;             //비회원 이메일
	private String nonMemPhoneNum;             //비회원 전화번호
	private String nonMemSpName;             //비회원 받는 사람
	private String nonMemPhoneNum1;             //비회원 받는 사람 전화번호1
	private String nonMemPhoneNum2;             //비회원 받는 사람 전화번호2
	private String nonMemSpAdr;             //비회원 받는 사람 주소
	private String nonMemOrderMsg;             //주문 메시지
	private String nonMemDepositorName;             //
	private String nonMemPaymentMethod;             //지불 방법
	private int totalPrice;                   //총 가격
	private String nonMemOrderDate;             //주문 날짜
	private int productCnt;
	private String productPrice;
	private String productImage;
	private String currentStatus;
	private String productName;
	
	public NonmemberVO() {

	}
	public int getnonMemOrderSeqNum() {
		return nonMemOrderSeqNum;
	}
	public void setnonMemOrderSeqNum(int nonMemOrderSeqNum) {
		this.nonMemOrderSeqNum = nonMemOrderSeqNum;
	}
	public String getproductNum() {
		return productNum;
	}
	public void setproductNum(String productNum) {
		this.productNum = productNum;
	}
	public int getnonMemOrderNum() {
		return nonMemOrderNum;
	}
	public void setnonMemOrderNum(int nonMemOrderNum) {
		this.nonMemOrderNum = nonMemOrderNum;
	}
	public String getnonMemName() {
		return nonMemName;
	}
	public void setnonMemName(String nonMemName) {
		this.nonMemName = nonMemName;
	}
	public String getnonMemPwd() {
		return nonMemPwd;
	}
	public void setnonMemPwd(String nonMemPwd) {
		this.nonMemPwd = nonMemPwd;
	}
	public String getnonEmail() {
		return nonEmail;
	}
	public void setnonEmail(String nonEmail) {
		this.nonEmail = nonEmail;
	}
	public String getnonMemPhoneNum() {
		return nonMemPhoneNum;
	}
	public void setnonMemPhoneNum(String nonMemPhoneNum) {
		this.nonMemPhoneNum = nonMemPhoneNum;
	}
	public String getnonMemSpName() {
		return nonMemSpName;
	}
	public void setnonMemSpName(String nonMemSpName) {
		this.nonMemSpName = nonMemSpName;
	}
	public String getnonMemPhoneNum1() {
		return nonMemPhoneNum1;
	}
	public void setnonMemPhoneNum1(String nonMemPhoneNum1) {
		this.nonMemPhoneNum1 = nonMemPhoneNum1;
	}
	public String getnonMemPhoneNum2() {
		return nonMemPhoneNum2;
	}
	public void setnonMemPhoneNum2(String nonMemPhoneNum2) {
		this.nonMemPhoneNum2 = nonMemPhoneNum2;
	}
	public String getnonMemSpAdr() {
		return nonMemSpAdr;
	}
	public void setnonMemSpAdr(String nonMemSpAdr) {
		this.nonMemSpAdr = nonMemSpAdr;
	}
	public String getnonMemOrderMsg() {
		return nonMemOrderMsg;
	}
	public void setnonMemOrderMsg(String nonMemOrderMsg) {
		this.nonMemOrderMsg = nonMemOrderMsg;
	}
	public String getnonMemDepositorName() {
		return nonMemDepositorName;
	}
	public void setnonMemDepositorName(String nonMemDepositorName) {
		this.nonMemDepositorName = nonMemDepositorName;
	}
	public String getnonMemPaymentMethod() {
		return nonMemPaymentMethod;
	}
	public void setnonMemPaymentMethod(String nonMemPaymentMethod) {
		this.nonMemPaymentMethod = nonMemPaymentMethod;
	}
	public int gettotalPrice() {
		return totalPrice;
	}
	public void settotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getnonMemOrderDate() {
		return nonMemOrderDate;
	}
	public void setnonMemOrderDate(String nonMemOrderDate) {
		this.nonMemOrderDate = nonMemOrderDate;
	}
	public int getproductCnt() {
		return productCnt;
	}
	public void setproductCnt(int productCnt) {
		this.productCnt = productCnt;
	}
	public String getproductPrice() {
		return productPrice;
	}
	public void setproductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public String getproductImage() {
		return productImage;
	}
	public void setproductImage(String productImage) {
		this.productImage = productImage;
	}
	public String getcurrentStatus() {
		return currentStatus;
	}
	public void setcurrentStatus(String currentStatus) {
		this.currentStatus = currentStatus;
	}
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	

}
