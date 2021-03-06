package com.project.simple.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.project.simple.admin.vo.AdminVO;
import com.project.simple.board.vo.ArticleVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.order.vo.OrderVO;
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

	public void admin_selectremoveMemOrder(String memOrderNum) throws Exception ;

	public void admin_selectremoveNonMemOrder(String nonMemOrderNum) throws Exception ;
	
	public List<ProductVO> listProductQuestion(Criteria cri) throws Exception;
	public int productQuestionCount() throws Exception;
	
	public void addProductQuestion(ProductVO productQuestion) throws Exception;	
	public void modNewProductAnswer(ProductVO productQuestion) throws Exception;
	public void removeProductQuestion(int productQuestionNum) throws Exception ;
	public void removeProductAnswer(int productQuestionNum) throws Exception;
	public Map<String, Object> questionSearch(Map<String, Object> questionSearchMap) throws Exception;
	public int questionSearchCount(Map<String, Object> search) throws Exception;

}
