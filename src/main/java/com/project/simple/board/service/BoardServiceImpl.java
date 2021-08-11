package com.project.simple.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.project.simple.board.dao.BoardDAO;
import com.project.simple.board.vo.ArticleVO;
import com.project.simple.page.Criteria;


@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)

public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardDAO boardDAO;
	

	
	//notice게시판 >> DB에서 전체 글 조회 
	public List<ArticleVO> listNotice(Criteria cri) throws Exception{
		List<ArticleVO> noticeList = boardDAO.selectAllNoticeList(cri);
		return noticeList;
	}
	
	public int noticeCount() throws Exception{
		int noticeCount = boardDAO.selectNoticeCount();
		return noticeCount;
	}
	
	//DB에서 글번호에 해당하는 상세보기 조회
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public ArticleVO viewNotice(int noticeNum) throws Exception {
		boardDAO.noticeHit(noticeNum);
		ArticleVO articleVO = boardDAO.selectNotice(noticeNum);
		
		return articleVO;
	}
	

	
	
	//qustion 게시판
	public List<ArticleVO> listQuestion(Criteria cri) throws Exception{
		List<ArticleVO> questionList = boardDAO.selectAllQuestionList(cri);
		return questionList;
	}
	
	public int questionCount() throws Exception{
		int questionCount = boardDAO.selectQuestionCount();
		return questionCount;
	}
	
	public Map<String ,Object> questionSearch(Map<String ,Object> questionSearchMap) throws Exception{
		List<ArticleVO> questionSearchList=boardDAO.questionSearchList(questionSearchMap);

		questionSearchMap.put("questionSearchList", questionSearchList);
		return questionSearchMap;
	}
	
	public int questionSearchCount(String search) throws Exception{
		int questionSearchCount = boardDAO.questionSeachCount(search);
		return questionSearchCount;
	}
	
	
	//inquiry 게시판
	public Map<String ,Object> listInquiry(Map<String ,Object> inquiryMap) throws Exception{
		List<ArticleVO> inquiryList=boardDAO.selectInquiryList(inquiryMap);
		inquiryMap.put("inquiryList", inquiryList);
		return inquiryMap;
	}
	
	public int inquiryCount(String memId) throws Exception{
		int inquiryCount = boardDAO.selectInquiryCount(memId);
		return inquiryCount;
	}	
	
	public Map<String ,Object> inquirySearch(Map<String ,Object> inquirySearchMap) throws Exception{

		List<ArticleVO> inquirySearchList=boardDAO.inquirySearchList(inquirySearchMap);

		inquirySearchMap.put("inquirySearchList", inquirySearchList);
		

		return inquirySearchMap;
	}

	public int inquirySearchCount(Map<String, Object> search) throws Exception{

		int inquirySearchCount = boardDAO.inquirySeachCount(search);
		return inquirySearchCount;
	}
	
	public Map<String ,Object> adminInquirySearch(Map<String ,Object> inquirySearchMap) throws Exception{

		List<ArticleVO> inquirySearchList=boardDAO.adminInquirySearchList(inquirySearchMap);

		inquirySearchMap.put("inquirySearchList", inquirySearchList);
		

		return inquirySearchMap;
	}

	public int adminInquirySearchCount(Map<String, Object> search) throws Exception{

		int inquirySearchCount = boardDAO.adminInquirySeachCount(search);
		return inquirySearchCount;
	}
	
	@Override
	public int addNewInquiry(Map inquiryMap) throws Exception{
		return boardDAO.insertNewInquiry(inquiryMap);
	}
	
	@Override
	public ArticleVO viewInquiry(int inquiryNum) throws Exception {
		ArticleVO articleVO = boardDAO.selectInquiry(inquiryNum);
		return articleVO;
	}
	

	@Override
	public ArticleVO inquiryForm(int inquiryNum) throws Exception {
		ArticleVO articleVO = boardDAO.selectInquiry1(inquiryNum);
		return articleVO;
	}
	
	@Override
	public void modInquiry(Map inquiryMap) throws Exception {
		boardDAO.updateInquiry(inquiryMap);
	}
	
	@Override
	public void removeInquiry(int inquiryNum) throws Exception {
		boardDAO.deleteInquiry(inquiryNum);
	}


	//AS센터
	@Override
	public List<ArticleVO> listAsCenter(Criteria cri) throws Exception{
		List<ArticleVO> ascenterList = boardDAO.selectAllAsCenterList(cri);
		return ascenterList;
	}
	
	@Override
	public int asCenterCount() throws Exception{
		int ascenterCount = boardDAO.selectAsCenterCount();
		return ascenterCount;
	}

	@Override
	public ArticleVO viewAsCenter(int asCenterNum) throws Exception {
		ArticleVO articleVO = boardDAO.selectAsCenter(asCenterNum);
		return articleVO;
	}

	@Override
	public int addNewAsCenter(Map asCenterMap) throws Exception{
		return boardDAO.insertNewAsCenter(asCenterMap);
	}
	
	@Override
	public void modAsCenter(Map asCenterMap) throws Exception {
		boardDAO.updateAsCenter(asCenterMap);
	}
	
	@Override
	public void removeAsCenter(int asCenterNum) throws Exception {
		boardDAO.deleteAsCenter(asCenterNum);
	}
	
	public Map<String ,Object> asCenterSearch(Map<String ,Object> asCenterSearchMap) throws Exception{

		List<ArticleVO> asCenterSearchList=boardDAO.asCenterSearchList(asCenterSearchMap);

		asCenterSearchMap.put("asCenterSearchList", asCenterSearchList);
		

		return asCenterSearchMap;
	}
	

	@Override
	public int asCenterSearchCount(Map<String, Object> search) throws Exception{

		int asCenterSearchCount = boardDAO.asCenterSeachCount(search);
		return asCenterSearchCount;
	}

	
	
}	
