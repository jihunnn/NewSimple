package com.project.simple.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.dao.DataAccessException;

import com.project.simple.board.vo.ArticleVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;


public interface BoardDAO{
	public List selectAllNoticeList(Criteria cri) throws DataAccessException;
	public ArticleVO selectNotice(int noticeNum) throws DataAccessException;
	public int selectNoticeCount() throws DataAccessException;
	public void noticeHit(int noticeNum) throws Exception;
	
	
	public List selectAllQuestionList(Criteria cri) throws DataAccessException;
	public int selectQuestionCount() throws DataAccessException;
	public List<ArticleVO> questionSearchList(Map<String ,Object> questionSearchMap) throws DataAccessException;
	public int questionSeachCount(String search) throws DataAccessException;
	
	public List<ArticleVO> selectInquiryList(Map<String ,Object> inquiryMap) throws DataAccessException;
	public int selectInquiryCount(String memId) throws DataAccessException;
	public List<ArticleVO> inquirySearchList(Map<String ,Object> qinquirySearchMap) throws DataAccessException;
	public int inquirySeachCount(Map<String, Object> search) throws DataAccessException ;
	public List<ArticleVO> adminInquirySearchList(Map<String ,Object> inquirySearchMap) throws DataAccessException;
	public int adminInquirySeachCount(Map<String, Object> search) throws DataAccessException;
	public int insertNewInquiry(Map inquiryMap) throws DataAccessException;
	public ArticleVO selectInquiry(int inquiryNum) throws DataAccessException;
	public ArticleVO selectInquiry1(int inquiryNum) throws DataAccessException;
	public void updateInquiry(Map inquiryMap) throws DataAccessException ;
	public void deleteInquiry(int inquiryNum) throws DataAccessException;
	
	public List<ArticleVO> selectAllAsCenterList(Criteria cri) throws DataAccessException;
	public int selectAsCenterCount() throws DataAccessException; 
	public ArticleVO selectAsCenter(int asCenterNum) throws DataAccessException;
	public int insertNewAsCenter(Map asCenterMap) throws DataAccessException;
	public void updateAsCenter(Map asCenterMap) throws DataAccessException;
	public void deleteAsCenter(int asCenterNum) throws DataAccessException;
	public List<ArticleVO> asCenterSearchList(Map<String ,Object> asCenterSearchMap) throws DataAccessException;
	public int asCenterSeachCount(Map<String, Object> search) throws DataAccessException;
}