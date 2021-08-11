package com.project.simple.order.vo;

import org.springframework.stereotype.Component;


@Component("orderVO")

public class OrderVO {
	
	private int memOrderSeqNum;
	
	//공통변수
	private String productNum;
	private String productName;
	private int productCnt;
	private String productPrice;	
	private String totalPrice;
	private String memSpPhoneNum1;  //관리자 주문리스트조회할때 사용
	private String memSpPhoneNum2;  //관리자 주문리스트조회할때 사용
	private String memOrderDate;   	//관리자 주문리스트조회할때 사용
	
	//회원주문페이지
	private String memId;
	private String memName;
	private String memPwd;
	private String memEmail;
	private String memEmail1;
	
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemPwd() {
		return memPwd;
	}
	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemEmail1() {
		return memEmail1;
	}
	public void setMemEmail1(String memEmail1) {
		this.memEmail1 = memEmail1;
	}
	public String getMemPhoneNum() {
		return memPhoneNum;
	}
	public void setMemPhoneNum(String memPhoneNum) {
		this.memPhoneNum = memPhoneNum;
	}
	public String getMemPhoneNum1() {
		return memPhoneNum1;
	}
	public void setMemPhoneNum1(String memPhoneNum1) {
		this.memPhoneNum1 = memPhoneNum1;
	}
	public String getMemPhoneNum2() {
		return memPhoneNum2;
	}
	public void setMemPhoneNum2(String memPhoneNum2) {
		this.memPhoneNum2 = memPhoneNum2;
	}
	public String getMemAdr() {
		return memAdr;
	}
	public void setMemAdr(String memAdr) {
		this.memAdr = memAdr;
	}
	public String getMemAdr1() {
		return memAdr1;
	}
	public void setMemAdr1(String memAdr1) {
		this.memAdr1 = memAdr1;
	}
	public String getMemAdr2() {
		return memAdr2;
	}
	public void setMemAdr2(String memAdr2) {
		this.memAdr2 = memAdr2;
	}
	private String memPhoneNum;
	private String memPhoneNum1;
	private String memPhoneNum2;
	private String memAdr;
	private String memAdr1;
	private String memAdr2;

	private String memSpName;
	private int memCartId;
	private String memOrderMsg;
	private int memOrderNum;
	private String memDepositorName;
	private String memPaymentMethod;
	private String option1value;
	private String option2value;
	private String option1name;
	private String option2name;

	private String productimage;
	private String deliverycharge;	
	private String memSpPhoneNum1_0;
	private String memSpPhoneNum1_1;
	private String memSpPhoneNum1_2;	
	private String memSpPhoneNum2_0;
	private String memSpPhoneNum2_1;
	private String memSpPhoneNum2_2;	
	private String memSpAdr;
	private String memSpAdr1;
	private String memSpAdr2;
	
	//비회원주문페이지	
	private int nonmemOrderSeqNum;         //비회원 주문 상품 일련 번호
	private int nonmemOrderNum;            //비회원 주문 번호
	private String nonmemName;             //비회원 주문자
	private String nonmemSpName;      		 //비회원 받는 사람
	private String nonmemSpPhoneNum1_0;             //비회원 전화번호	
	private String nonmemSpPhoneNum1_1;             //비회원 받는 사람 전화번호1
	private String nonmemSpPhoneNum1_2;             //비회원 받는 사람 전화번호2
	private String nonmemSpPhoneNum2_0;             //비회원 전화번호	
	private String nonmemSpPhoneNum2_1;             //비회원 받는 사람 전화번호1
	private String nonmemSpPhoneNum2_2;             //비회원 받는 사람 전화번호2
	private String nonmemSpAdr;
	private String nonmemSpAdr1;   
	private String nonmemSpAdr2;   
	private String nonmemOrderMsg;             //주문 메시지
	private String nonmemDepositorName;         
	private String nonmemPaymentMethod;             //지불 방법
	private String productImage;
	
	
	public String getMemOrderDate() {
		return memOrderDate;
	}
	public void setMemOrderDate(String memOrderDate) {
		this.memOrderDate = memOrderDate;
	}
	public String getProductNum() {
		return productNum;
	}
	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	
	public int getMemOrderSeqNum() {
		return memOrderSeqNum;
	}
	public void setMemOrderSeqNum(int memOrderSeqNum) {
		this.memOrderSeqNum = memOrderSeqNum;
	}
	public String getMemSpPhoneNum1() {
		return memSpPhoneNum1;
	}
	public void setMemSpPhoneNum1(String memSpPhoneNum1) {
		this.memSpPhoneNum1 = memSpPhoneNum1;
	}
	public String getMemSpPhoneNum2() {
		return memSpPhoneNum2;
	}
	public void setMemSpPhoneNum2(String memSpPhoneNum2) {
		this.memSpPhoneNum2 = memSpPhoneNum2;
	}
	public int getProductCnt() {
		return productCnt;
	}
	public void setProductCnt(int productCnt) {
		this.productCnt = productCnt;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemSpName() {
		return memSpName;
	}
	public void setMemSpName(String memSpName) {
		this.memSpName = memSpName;
	}
	public int getMemCartId() {
		return memCartId;
	}
	public void setMemCartId(int memCartId) {
		this.memCartId = memCartId;
	}
	public String getMemOrderMsg() {
		return memOrderMsg;
	}
	public void setMemOrderMsg(String memOrderMsg) {
		this.memOrderMsg = memOrderMsg;
	}
	public int getMemOrderNum() {
		return memOrderNum;
	}
	public void setMemOrderNum(int memOrderNum) {
		this.memOrderNum = memOrderNum;
	}
	public String getMemDepositorName() {
		return memDepositorName;
	}
	public void setMemDepositorName(String memDepositorName) {
		this.memDepositorName = memDepositorName;
	}
	public String getMemPaymentMethod() {
		return memPaymentMethod;
	}
	public void setMemPaymentMethod(String memPaymentMethod) {
		this.memPaymentMethod = memPaymentMethod;
	}
	public String getOption1value() {
		return option1value;
	}
	public void setOption1value(String option1value) {
		this.option1value = option1value;
	}
	public String getOption2value() {
		return option2value;
	}
	public void setOption2value(String option2value) {
		this.option2value = option2value;
	}
	public String getOption1name() {
		return option1name;
	}
	public void setOption1name(String option1name) {
		this.option1name = option1name;
	}
	public String getOption2name() {
		return option2name;
	}
	public void setOption2name(String option2name) {
		this.option2name = option2name;
	}
	public String getProductimage() {
		return productimage;
	}
	public void setProductimage(String productimage) {
		this.productimage = productimage;
	}
	public String getDeliverycharge() {
		return deliverycharge;
	}
	public void setDeliverycharge(String deliverycharge) {
		this.deliverycharge = deliverycharge;
	}
	public String getMemSpPhoneNum1_0() {
		return memSpPhoneNum1_0;
	}
	public void setMemSpPhoneNum1_0(String memSpPhoneNum1_0) {
		this.memSpPhoneNum1_0 = memSpPhoneNum1_0;
	}
	public String getMemSpPhoneNum1_1() {
		return memSpPhoneNum1_1;
	}
	public void setMemSpPhoneNum1_1(String memSpPhoneNum1_1) {
		this.memSpPhoneNum1_1 = memSpPhoneNum1_1;
	}
	public String getMemSpPhoneNum1_2() {
		return memSpPhoneNum1_2;
	}
	public void setMemSpPhoneNum1_2(String memSpPhoneNum1_2) {
		this.memSpPhoneNum1_2 = memSpPhoneNum1_2;
	}
	public String getMemSpPhoneNum2_0() {
		return memSpPhoneNum2_0;
	}
	public void setMemSpPhoneNum2_0(String memSpPhoneNum2_0) {
		this.memSpPhoneNum2_0 = memSpPhoneNum2_0;
	}
	public String getMemSpPhoneNum2_1() {
		return memSpPhoneNum2_1;
	}
	public void setMemSpPhoneNum2_1(String memSpPhoneNum2_1) {
		this.memSpPhoneNum2_1 = memSpPhoneNum2_1;
	}
	public String getMemSpPhoneNum2_2() {
		return memSpPhoneNum2_2;
	}
	public void setMemSpPhoneNum2_2(String memSpPhoneNum2_2) {
		this.memSpPhoneNum2_2 = memSpPhoneNum2_2;
	}
	public String getMemSpAdr() {
		return memSpAdr;
	}
	public void setMemSpAdr(String memSpAdr) {
		this.memSpAdr = memSpAdr;
	}
	public String getMemSpAdr1() {
		return memSpAdr1;
	}
	public void setMemSpAdr1(String memSpAdr1) {
		this.memSpAdr1 = memSpAdr1;
	}
	public String getMemSpAdr2() {
		return memSpAdr2;
	}
	public void setMemSpAdr2(String memSpAdr2) {
		this.memSpAdr2 = memSpAdr2;
	}
	public int getNonmemOrderSeqNum() {
		return nonmemOrderSeqNum;
	}
	public void setNonmemOrderSeqNum(int nonmemOrderSeqNum) {
		this.nonmemOrderSeqNum = nonmemOrderSeqNum;
	}
	public int getNonmemOrderNum() {
		return nonmemOrderNum;
	}
	public void setNonmemOrderNum(int nonmemOrderNum) {
		this.nonmemOrderNum = nonmemOrderNum;
	}
	public String getNonmemName() {
		return nonmemName;
	}
	public void setNonmemName(String nonmemName) {
		this.nonmemName = nonmemName;
	}
	public String getNonmemSpName() {
		return nonmemSpName;
	}
	public void setNonmemSpName(String nonmemSpName) {
		this.nonmemSpName = nonmemSpName;
	}
	
	public String getNonmemSpPhoneNum1_0() {
		return nonmemSpPhoneNum1_0;
	}
	public void setNonmemSpPhoneNum1_0(String nonmemSpPhoneNum1_0) {
		this.nonmemSpPhoneNum1_0 = nonmemSpPhoneNum1_0;
	}
	public String getNonmemSpPhoneNum1_1() {
		return nonmemSpPhoneNum1_1;
	}
	public void setNonmemSpPhoneNum1_1(String nonmemSpPhoneNum1_1) {
		this.nonmemSpPhoneNum1_1 = nonmemSpPhoneNum1_1;
	}
	public String getNonmemSpPhoneNum1_2() {
		return nonmemSpPhoneNum1_2;
	}
	public void setNonmemSpPhoneNum1_2(String nonmemSpPhoneNum1_2) {
		this.nonmemSpPhoneNum1_2 = nonmemSpPhoneNum1_2;
	}
	public String getNonmemSpPhoneNum2_0() {
		return nonmemSpPhoneNum2_0;
	}
	public void setNonmemSpPhoneNum2_0(String nonmemSpPhoneNum2_0) {
		this.nonmemSpPhoneNum2_0 = nonmemSpPhoneNum2_0;
	}
	public String getNonmemSpPhoneNum2_1() {
		return nonmemSpPhoneNum2_1;
	}
	public void setNonmemSpPhoneNum2_1(String nonmemSpPhoneNum2_1) {
		this.nonmemSpPhoneNum2_1 = nonmemSpPhoneNum2_1;
	}
	public String getNonmemSpPhoneNum2_2() {
		return nonmemSpPhoneNum2_2;
	}
	public void setNonmemSpPhoneNum2_2(String nonmemSpPhoneNum2_2) {
		this.nonmemSpPhoneNum2_2 = nonmemSpPhoneNum2_2;
	}
	public String getNonmemSpAdr() {
		return nonmemSpAdr;
	}
	public void setNonmemSpAdr(String nonmemSpAdr) {
		this.nonmemSpAdr = nonmemSpAdr;
	}
	public String getNonmemSpAdr1() {
		return nonmemSpAdr1;
	}
	public void setNonmemSpAdr1(String nonmemSpAdr1) {
		this.nonmemSpAdr1 = nonmemSpAdr1;
	}
	public String getNonmemSpAdr2() {
		return nonmemSpAdr2;
	}
	public void setNonmemSpAdr2(String nonmemSpAdr2) {
		this.nonmemSpAdr2 = nonmemSpAdr2;
	}
	public String getNonmemOrderMsg() {
		return nonmemOrderMsg;
	}
	public void setNonmemOrderMsg(String nonmemOrderMsg) {
		this.nonmemOrderMsg = nonmemOrderMsg;
	}
	public String getNonmemDepositorName() {
		return nonmemDepositorName;
	}
	public void setNonmemDepositorName(String nonmemDepositorName) {
		this.nonmemDepositorName = nonmemDepositorName;
	}
	public String getNonmemPaymentMethod() {
		return nonmemPaymentMethod;
	}
	public void setNonmemPaymentMethod(String nonmemPaymentMethod) {
		this.nonmemPaymentMethod = nonmemPaymentMethod;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}


	
	
	
	
	

	
	

	
	
}

