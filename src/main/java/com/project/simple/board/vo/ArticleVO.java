package com.project.simple.board.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component("articleVO")

public class ArticleVO {
	// notice 게시판
	private int noticeNum;
	private Date noticeDate;
	private String noticeTitle;
	private String noticeWriter;
	private String noticeContent;
	private String noticeImg;
	private int noticeHit;

	// question 게시판
	private int questionNum;
	private String questionTitle;
	private String questionContent;

	// inquiry 게시판
	private String memId;
	private int inquiryNum;
	private String inquiryType;
	private Date inquiryDate;
	private String inquiryTitle;
	private String inquiryContent;
	private String inquiryFile;
	private String inquiryAnswer;
	private String inquiryReq;

	// AS센터
	private int asCenterNum;
	private String asCenterTitle;
	private Date asCenterDate;
	private String asCenterContent;
	private String asCenterStatus;
	private String asCenterPwd;
	private String memName;
	private String asCenterFile;

	// notice 게시판
	public ArticleVO() {
		System.out.println("ArticleVO 생성자");
	}

	public int getNoticeNum() {
		return noticeNum;
	}

	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeImg() {
		return noticeImg;
	}

	public void setNoticeImg(String noticeImg) {

		this.noticeImg = noticeImg;

	}

	public int getNoticeHit() {
		return noticeHit;
	}

	public void setNoticeHit(int noticeHit) {
		this.noticeHit = noticeHit;
	}

	// question 게시판
	public int getQuestionNum() {
		return questionNum;
	}

	public void setQuestionNum(int questionNum) {
		this.questionNum = questionNum;
	}

	public String getQuestionTitle() {
		return questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	// inquiry 게시판
	public String getmemId() {
		return memId;
	}

	public void setmemId(String memId) {
		this.memId = memId;
	}

	public int getInquiryNum() {
		return inquiryNum;
	}

	public void setInquiryNum(int inquiryNum) {
		this.inquiryNum = inquiryNum;
	}

	public String getInquiryType() {
		return inquiryType;
	}

	public void setInquiryNum(String inquiryType) {
		this.inquiryType = inquiryType;
	}

	public Date getInquiryDate() {
		return inquiryDate;
	}

	public void setInquiryDate(Date inquiryDate) {
		this.inquiryDate = inquiryDate;
	}

	public String getInquiryTitle() {
		return inquiryTitle;
	}

	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}

	public String getInquiryContent() {
		return inquiryContent;
	}

	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}

	public String getInquiryFile() {
		return inquiryFile;
	}

	public void setInquiryFile(String inquiryFile) {
		this.inquiryFile = inquiryFile;
	}

	public String getInquiryAnswer() {
		return inquiryAnswer;
	}

	public void setInquiryAnswer(String inquiryAnswer) {
		this.inquiryAnswer = inquiryAnswer;
	}

	public String getInquiryReq() {
		return inquiryReq;
	}

	public void setInquiryReq(String inquiryReq) {
		this.inquiryReq = inquiryReq;
	}

	// AS 센터

	public int getAsCenterNum() {
		return asCenterNum;
	}

	public void setAsCenterNum(int asCenterNum) {
		this.asCenterNum = asCenterNum;
	}

	public String getAsCenterTitle() {
		return asCenterTitle;
	}

	public void setAsCenterTitle(String asCenterTitle) {
		this.asCenterTitle = asCenterTitle;
	}

	public Date getAsCenterDate() {
		return asCenterDate;
	}

	public void setAsCenterDate(Date asCenterDate) {
		this.asCenterDate = asCenterDate;
	}

	public String getAsCenterContent() {
		return asCenterContent;
	}

	public void setAsCenterContent(String asCenterContent) {
		this.asCenterContent = asCenterContent;
	}

	public String getAsCenterStatus() {
		return asCenterStatus;
	}

	public void setAsCenterStatus(String asCenterStatus) {
		this.asCenterStatus = asCenterStatus;
	}

	public String getAsCenterPwd() {
		return asCenterPwd;
	}

	public void setAsCenterPwd(String asCenterPwd) {
		this.asCenterPwd = asCenterPwd;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getAsCenterFile() {
		return asCenterFile;
	}

	public void setAsCenterFile(String asCenterFile) {
		this.asCenterFile = asCenterFile;
	}

}
