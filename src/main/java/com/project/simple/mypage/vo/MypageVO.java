package com.project.simple.mypage.vo;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;

import org.springframework.stereotype.Component;


@Component("mypageVO")

public class MypageVO {
	//마이페이지 주문/배송조회
	private int memOrderSeqNum;
	private int memOrderNum;
	private String memId;
	private String memName;
	private String memAdr;
	private String memPhoneNum;
	private String productNum;
	private String memSpName;
	private String memSpPhoneNum1;
	private String memSpPhoneNum2;
	private String memSpAdr;
	private String memOrderMsg;
	private String memDepositorName;
	private String memPaymentMethod;
	private String totalPrice;
	private Date memOrderDate;
	private int productCnt;
	private String productImage;
	private String option2Name;
	private String option1Name;
	private String option1value;
	private String option2value;
	private String productName;
	private String productPrice;
	private String deliveryStatus;
	private String purchaseConfirm;
	private String reviewConfirm;
	private String returnConfirm;
	
	
	//마이페이지 리뷰
	private int reviewNum;
	private String productReviewTitle;
	private Date reviewDate;
	private String productContent;
	private String reviewFile;
	
	
	//마이페이지 반품
	private int returnNum;
	private String returnType;
	private String returnContent;
	private String currentStatus;
	private Date returnDate;


	
	
	//notice 게시판
	public MypageVO() {
		System.out.println("ArticleVO 생성자");
	}
	
	public int getMemOrderSeqNum() {
		return memOrderSeqNum;
	}
	
	public void setMemOrderSeqNum(int memOrderSeqNum) {
		this.memOrderSeqNum = memOrderSeqNum;
	}
	
	public int getMemOrderNum() {
		return memOrderNum;
	}
	
	public void setMemOrderNum(int memOrderNum) {
		this.memOrderNum = memOrderNum;
	}
	
	public String getMemId() {
		return memId;
	}
	
	public void setMemId(String memId) {
		this.memId = memId;
	}
	
	public String getMemName() {
		return memName;
	}
	
	public void setMemName(String memName) {
		this.memName = memName;
	}
	
	public String getMemAdr() {
		return memAdr;
	}
	
	public void setMemAdr(String memAdr) {
		this.memAdr = memAdr;
	}
	
	public String getMemPhoneNum() {
		return memPhoneNum;
	}
	
	public void setMemPhoneNum(String memPhoneNum) {
		this.memPhoneNum = memPhoneNum;
	}
	
	public String getProductNum() {
		return productNum;
	}
	
	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}
	
	public String getMemSpName() {
		return memSpName;
	}
	
	public void setMemSpName(String memSpName) {
		this.memSpName = memSpName;
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
	
	public String getMemSpAdr() {
		return memSpAdr;
	}
	
	public void setMemSpAdr(String memSpAdr) {
		this.memSpAdr = memSpAdr;
	}
	
	public String getMemOrderMsg() {
		return memOrderMsg;
	}
	
	public void setMemOrderMsg(String memOrderMsg) {
		this.memOrderMsg = memOrderMsg;
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
	
	public String getTotalPrice() {
		return totalPrice;
	}
	
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	public Date getMemOrderDate() {
		return memOrderDate;
	}
	
	public void setMemOrderDate(Date memOrderDate) {
		this.memOrderDate = memOrderDate;
	}
	
	public int getProductCnt() {
		return productCnt;
	}
	
	public void setProductCnt(int productCnt) {
		this.productCnt = productCnt;
	}
	
	public String getProductImage() {
		return productImage;
	}
	
	public void setProductImage(String productImage) {
		this.productImage = productImage;
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
	
	public String getProductName() {
		return productName;
	}
	
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	public String getProductPrice() {
		return productPrice;
	}
	
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	
	public String getDeliveryStatus() {
		return deliveryStatus;
	}
	
	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}
	
	public String getPurchaseConfirm() {
		return purchaseConfirm;
	}
	
	public void setPurchaseConfirm(String purchaseConfirm) {
		this.purchaseConfirm = purchaseConfirm;
	}

	
	public int getReturnNum() {
		return returnNum;
	}
	
	public void setReturnNum(int returnNum) {
		this.returnNum = returnNum;
	}
	
	public String getReturnType() {
		return returnType;
	}
	
	public void setReturnType(String returnType) {
		this.returnType = returnType;
	}
	
	public String getReturnContent() {
		return returnContent;
	}
	
	public void setReturnContent(String returnContent) {
		this.returnContent = returnContent;
	}
	
	public String getCurrentStatus() {
		return currentStatus;
	}
	
	public void setCurrentStatus(String currentStatus) {
		this.currentStatus = currentStatus;
	}
	
	public Date getReturnDate() {
		return returnDate;
	}
	
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}
	
	public String getReviewConfirm() {
		return reviewConfirm;
	}
	
	public void setReviewConfirm(String reviewConfirm) {
		this.reviewConfirm = reviewConfirm;
	}
	
	public String getReturnConfirm() {
		return returnConfirm;
	}
	
	public void setReConfirm(String returnConfirm) {
		this.returnConfirm = returnConfirm;
	}
	
	//상품리뷰
	//상품 리뷰
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}	
	
	public String getProductReviewTitle() {
		return productReviewTitle;
	}
	public void setProductReviewTitle(String productReviewTitle) {
		this.productReviewTitle = productReviewTitle;
	}
	
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	
	public String getProductContent() {
		return productContent;
	}
	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}
	
	public String getOption1Name() {
		return option1Name;
	}
	public void setOption1Name(String option1Name) {
		this.option1Name = option1Name;
	}
	
	public String getOption2Name() {
		return option2Name;
	}
	public void setOption2Name(String option2Name) {
		this.option2Name = option2Name;
	}
	
	public String getReviewFile() {
		return reviewFile;
	}
	public void setReviewFile(String reviewFile) {
		this.reviewFile = reviewFile;
	}

	
	
}

