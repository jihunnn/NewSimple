package com.project.simple.board.dao;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


import com.project.simple.board.vo.ArticleVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;


@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO{
	@Autowired
	private SqlSession sqlSession;
	//notice게시판 >> DB에서 전체 글 조회 
	@Override
	public List<ArticleVO> selectAllNoticeList(Criteria cri) throws DataAccessException {
		List<ArticleVO> noticeList = sqlSession.selectList("mapper.board.selectAllNoticeList", cri);
		return noticeList;
	}
	
	
	@Override
	public int selectNoticeCount() throws DataAccessException {
		int noticeCount = sqlSession.selectOne("mapper.board.selectNoticeCount");

		return noticeCount;
	}
	
	//DB에서 글번호에 해당하는 상세보기 조회
	@Override
	public ArticleVO selectNotice(int noticeNum) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNotice", noticeNum);
	}
	
	@Override
	public void noticeHit(int noticeNum) throws Exception {
		sqlSession.update("mapper.board.updateNoticeHit", noticeNum);
	}
	
	

	
	//question 게시판
	@Override
	public List<ArticleVO> selectAllQuestionList(Criteria cri) throws DataAccessException {
		List<ArticleVO> questionList = sqlSession.selectList("mapper.board.selectAllQuestionList", cri);
		return questionList;
	}

	@Override
	public int selectQuestionCount() throws DataAccessException {
		int questionCount = sqlSession.selectOne("mapper.board.selectQuestionCount");
		return questionCount;
	}
	
	@Override
	public List<ArticleVO> questionSearchList(Map<String ,Object> questionSearchMap) throws DataAccessException {
		List<ArticleVO> questionSearchList =sqlSession.selectList("mapper.board.questionSearchList",questionSearchMap);		
		return questionSearchList;
	}
	
	@Override
	public int questionSeachCount(String search) throws DataAccessException {
		int questionSearchCount = sqlSession.selectOne("mapper.board.questionSearchCount",search);
		return questionSearchCount;
	}
	
	//inquiry 게시판
	@Override
	public List<ArticleVO> selectInquiryList(Map<String ,Object> inquiryMap) throws DataAccessException {
		List<ArticleVO> inquiryList =sqlSession.selectList("mapper.board.selectAllInquiryList",inquiryMap);		


		return inquiryList;
	}
	
	@Override
	public int selectInquiryCount(String memId) throws DataAccessException {
		int selectInquiryCount = sqlSession.selectOne("mapper.board.selectInquiryCount",memId);
		return selectInquiryCount;
	}
	
	@Override
	public List<ArticleVO> inquirySearchList(Map<String ,Object> inquirySearchMap) throws DataAccessException {
		List<ArticleVO> inquirySearchList =sqlSession.selectList("mapper.board.inquirySearchList",inquirySearchMap);			
		return inquirySearchList;
	}
	
	@Override
	public int inquirySeachCount(Map<String, Object> search) throws DataAccessException {
		int inquirySearchCount = sqlSession.selectOne("mapper.board.inquirySearchCount",search);

		return inquirySearchCount;
	}
	
	@Override
	public List<ArticleVO> adminInquirySearchList(Map<String ,Object> inquirySearchMap) throws DataAccessException {
		List<ArticleVO> inquirySearchList =sqlSession.selectList("mapper.board.adminInquirySearchList",inquirySearchMap);			
		return inquirySearchList;
	}
	
	@Override
	public int adminInquirySeachCount(Map<String, Object> search) throws DataAccessException {
		int inquirySearchCount = sqlSession.selectOne("mapper.board.adminInquirySearchCount",search);

		return inquirySearchCount;
	}
	
	@Override
	public int insertNewInquiry(Map inquiryMap) throws DataAccessException {
		int inquiryNum = selectNewInquiryNum();
		inquiryMap.put("inquiryNum", inquiryNum);
		sqlSession.insert("mapper.board.insertNewInquiry", inquiryMap);
		return inquiryNum;
	}
	
	private int selectNewInquiryNum() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNewInquiryNum");
		
	}
	
	@Override
	public ArticleVO selectInquiry(int inquiryNum) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectInquiry", inquiryNum);
	}
	
	
	@Override
	public ArticleVO selectInquiry1(int inquiryNum) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectInquiry", inquiryNum);
	}
	
	@Override
	public void updateInquiry(Map inquiryMap) throws DataAccessException {
		sqlSession.update("mapper.board.updateInquiry", inquiryMap);
	}
	
	@Override
	public void deleteInquiry(int inquiryNum) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteInquiry", inquiryNum);
	}
	
	//AS센터
	@Override
	public List<ArticleVO> selectAllAsCenterList(Criteria cri) throws DataAccessException {
		List<ArticleVO> asCenterList = sqlSession.selectList("mapper.board.selectAllAsCenterList", cri);
		return asCenterList;
	}
	
	@Override
	public int selectAsCenterCount() throws DataAccessException {
		int asCenterCount = sqlSession.selectOne("mapper.board.selectAsCenterCount");

		return asCenterCount;
	}
	
	@Override
	public ArticleVO selectAsCenter(int asCenterNum) throws DataAccessException {

		return sqlSession.selectOne("mapper.board.selectAsCenter", asCenterNum);
	}
	
	@Override
	public int insertNewAsCenter(Map asCenterMap) throws DataAccessException {
		int asCenterNum = selectNewAsCenterNum();
		asCenterMap.put("asCenterNum", asCenterNum);
		sqlSession.insert("mapper.board.insertNewAsCenter", asCenterMap);
		return asCenterNum;
	}
	
	
	private int selectNewAsCenterNum() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNewAsCenterNum");
		
	}
	
	@Override
	public void updateAsCenter(Map asCenterMap) throws DataAccessException {
		sqlSession.update("mapper.board.updateAsCenter", asCenterMap);
	}
	
	@Override
	public void deleteAsCenter(int asCenterNum) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteAsCenter", asCenterNum);
	}
	
	@Override
	public List<ArticleVO> asCenterSearchList(Map<String ,Object> asCenterSearchMap) throws DataAccessException {

		List<ArticleVO> asCenterSearchList =sqlSession.selectList("mapper.board.asCenterSearchList",asCenterSearchMap);		
		return asCenterSearchList;
	}
	
	@Override
	public int asCenterSeachCount(Map<String, Object> search) throws DataAccessException {
		int asCenterSearchCount = sqlSession.selectOne("mapper.board.asCenterSearchCount",search);

		return asCenterSearchCount;
	}
}	
