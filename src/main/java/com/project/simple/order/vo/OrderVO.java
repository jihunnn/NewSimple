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
	private int nonMemOrderNum;            //비회원 주문 번호
	private String nonMemName;             //비회원 주문자
	private String nonMemSpName;      		 //비회원 받는 사람
	private String nonMemSpPhoneNum1;
	private String nonMemSpPhoneNum1_0;             //비회원 전화번호	
	private String nonMemSpPhoneNum1_1;             //비회원 받는 사람 전화번호1
	private String nonMemSpPhoneNum1_2;             //비회원 받는 사람 전화번호2
	private String nonMemSpPhoneNum2;
	private String nonMemSpPhoneNum2_0;             //비회원 전화번호	
	private String nonMemSpPhoneNum2_1;             //비회원 받는 사람 전화번호1
	private String nonMemSpPhoneNum2_2;             //비회원 받는 사람 전화번호2
	private String nonMemSpAdr;
	private String nonMemSpAdr1;   
	private String nonMemSpAdr2;   
	private String nonMemOrderMsg;             //주문 메시지
	private String nonMemDepositorName;         
	private String nonMemPaymentMethod;             //지불 방법
	private String nonMemOrderDate;
	private String productImage;
	
    private String deliveryStatus;
	
	
	
	public String getDeliveryStatus() {
		return deliveryStatus;
	}
	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}
	
	
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
	
	public int getNonMemOrderNum() {
		return nonMemOrderNum;
	}
	public void setNonMemOrderNum(int nonMemOrderNum) {
		this.nonMemOrderNum = nonMemOrderNum;
	}

	public String getNonMemName() {
		return nonMemName;
	}
	public void setNonMemName(String nonMemName) {
		this.nonMemName = nonMemName;
	}
	public String getNonMemSpName() {
		return nonMemSpName;
	}
	public void setNonMemSpName(String nonMemSpName) {
		this.nonMemSpName = nonMemSpName;
	}

	
	public String getNonMemSpPhoneNum1() {
		return nonMemSpPhoneNum1;
	}
	public void setNonMemSpPhoneNum1(String nonMemSpPhoneNum1) {
		this.nonMemSpPhoneNum1 = nonMemSpPhoneNum1;
	}
	public String getNonMemSpPhoneNum2() {
		return nonMemSpPhoneNum2;
	}
	public void setNonMemSpPhoneNum2(String nonMemSpPhoneNum2) {
		this.nonMemSpPhoneNum2 = nonMemSpPhoneNum2;
	}
	public String getNonMemSpPhoneNum1_0() {
		return nonMemSpPhoneNum1_0;
	}
	public void setNonMemSpPhoneNum1_0(String nonMemSpPhoneNum1_0) {
		this.nonMemSpPhoneNum1_0 = nonMemSpPhoneNum1_0;
	}
	public String getNonMemSpPhoneNum1_1() {
		return nonMemSpPhoneNum1_1;
	}
	public void setNonMemSpPhoneNum1_1(String nonMemSpPhoneNum1_1) {
		this.nonMemSpPhoneNum1_1 = nonMemSpPhoneNum1_1;
	}
	public String getNonMemSpPhoneNum1_2() {
		return nonMemSpPhoneNum1_2;
	}
	public void setNonMemSpPhoneNum1_2(String nonMemSpPhoneNum1_2) {
		this.nonMemSpPhoneNum1_2 = nonMemSpPhoneNum1_2;
	}
	public String getNonMemSpPhoneNum2_0() {
		return nonMemSpPhoneNum2_0;
	}
	public void setNonMemSpPhoneNum2_0(String nonMemSpPhoneNum2_0) {
		this.nonMemSpPhoneNum2_0 = nonMemSpPhoneNum2_0;
	}
	public String getNonMemSpPhoneNum2_1() {
		return nonMemSpPhoneNum2_1;
	}
	public void setNonMemSpPhoneNum2_1(String nonMemSpPhoneNum2_1) {
		this.nonMemSpPhoneNum2_1 = nonMemSpPhoneNum2_1;
	}
	public String getNonMemSpPhoneNum2_2() {
		return nonMemSpPhoneNum2_2;
	}
	public void setNonMemSpPhoneNum2_2(String nonMemSpPhoneNum2_2) {
		this.nonMemSpPhoneNum2_2 = nonMemSpPhoneNum2_2;
	}
	public String getNonMemSpAdr() {
		return nonMemSpAdr;
	}
	public void setNonMemSpAdr(String nonMemSpAdr) {
		this.nonMemSpAdr = nonMemSpAdr;
	}
	public String getNonMemSpAdr1() {
		return nonMemSpAdr1;
	}
	public void setNonMemSpAdr1(String nonMemSpAdr1) {
		this.nonMemSpAdr1 = nonMemSpAdr1;
	}
	public String getNonMemSpAdr2() {
		return nonMemSpAdr2;
	}
	public void setNonMemSpAdr2(String nonMemSpAdr2) {
		this.nonMemSpAdr2 = nonMemSpAdr2;
	}
	public String getNonMemOrderMsg() {
		return nonMemOrderMsg;
	}
	public void setNonMemOrderMsg(String nonMemOrderMsg) {
		this.nonMemOrderMsg = nonMemOrderMsg;
	}
	
	public String getNonMemDepositorName() {
		return nonMemDepositorName;
	}
	public void setNonMemDepositorName(String nonMemDepositorName) {
		this.nonMemDepositorName = nonMemDepositorName;
	}
	
	public String getNonMemPaymentMethod() {
		return nonMemPaymentMethod;
	}
	public void setNonMemPaymentMethod(String nonMemPaymentMethod) {
		this.nonMemPaymentMethod = nonMemPaymentMethod;
	}
	
	public String getNonMemOrderDate() {
		return nonMemOrderDate;
	}
	public void setNonMemOrderDate(String nonMemOrderDate) {
		this.nonMemOrderDate = nonMemOrderDate;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}


	
	
	
	
	

	
	

	
	
}

