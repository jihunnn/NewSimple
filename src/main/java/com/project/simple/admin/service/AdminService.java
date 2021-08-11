package com.project.simple.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.project.simple.admin.vo.AdminVO;
import com.project.simple.board.vo.ArticleVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;
import com.project.simple.product.vo.ProductVO;

public interface AdminService {
	public AdminVO login(AdminVO adminVO) throws Exception;
	
	public MemberVO viewMember(String memId) throws Exception;
	
	public List<ArticleVO> listAllInquiry(Criteria cri) throws Exception;
	public int inquiryCount() throws Exception;
	
	public int addNewNotice(Map noticeMap) throws Exception;
	public ArticleVO noticeForm(int noticeNum) throws Exception;
	public void modNotice(Map noticeMap) throws Exception;
	public void removeNotice(int noticeNum) throws Exception;
	
	public void addNewQuestion(ArticleVO question) throws Exception;
	public ArticleVO questionForm(int questionNum) throws Exception;
	public void modQuestion(ArticleVO question) throws Exception;
	public void removeQuestion(int questionNum) throws Exception;
	
	public ArticleVO inquiryAnswerForm(int inquiryNum) throws Exception;
	public void addNewInquiryAnswer(ArticleVO inquiry) throws Exception;
	public ArticleVO viewInquiryAnswer(int inquiryNum) throws Exception ;
	public void removeInquiryAnswer(int inquiryNum) throws Exception;
	public void asCenterConfirm(int asCenterNum) throws Exception;

	public int admin_modMember(MemberVO modmember) throws DataAccessException;

	public void admin_selectremoveMember(String memId) throws Exception ;
	
	


}
