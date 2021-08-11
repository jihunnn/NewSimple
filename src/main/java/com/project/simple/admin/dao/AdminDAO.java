package com.project.simple.admin.dao;


import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.project.simple.admin.vo.AdminVO;
import com.project.simple.board.vo.ArticleVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;
import com.project.simple.product.vo.ProductVO;


public interface AdminDAO {
	
	public AdminVO adminloginById(AdminVO adminVO) throws DataAccessException;
	
	public MemberVO selectMember(String memId) throws DataAccessException;
	
	public List<ArticleVO> selectAllInquiryList(Criteria cri) throws DataAccessException;
	public int selectInquiryCount() throws DataAccessException;
	
	public ArticleVO selectNotice(int noticeNum) throws DataAccessException ;
	public int insertNewNotice(Map noticeMap) throws DataAccessException;
	public void updateNotice(Map noticeMap) throws DataAccessException;
	public void deleteNotice(int noticeNum) throws DataAccessException;
	
	public void insertNewQuestion(ArticleVO question) throws DataAccessException ;
	public ArticleVO selectQuestion(int questionNum) throws DataAccessException;
	public void updateQuestion(ArticleVO question) throws DataAccessException ;
	public void deleteQuestion(int questionNum) throws DataAccessException;
	
	public ArticleVO selectInquiryAnswer(int inquiryNum) throws DataAccessException ;
	public void insertNewInquiryAnswer(ArticleVO inquiry) throws DataAccessException;
	public void deleteInquiryAnswer(int inquiryNum) throws DataAccessException ;
	public void updateAsCenterConfirm(int asCenterNum) throws DataAccessException;
	
	public int updateAdminMember(MemberVO modmember) throws DataAccessException;

	public void deleteSelectRemoveMember(String memId) throws DataAccessException;
	


}
