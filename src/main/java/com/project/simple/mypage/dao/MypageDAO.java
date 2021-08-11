package com.project.simple.mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.dao.DataAccessException;

import com.project.simple.mypage.vo.MypageVO;
import com.project.simple.board.vo.ArticleVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;
import com.project.simple.product.vo.ProductVO;

public interface MypageDAO {


	
	public List<MypageVO> selectMyOrderInfoList(Map<String ,Object> myOrderInfoMap) throws DataAccessException ;
	public int selectMyOrderInfoCount(String memId) throws DataAccessException;
	public List<MypageVO> selectViewMyOrderInfo(int memOrderSeqNum) throws DataAccessException;
	public MypageVO selectViewMyOrderInfoMem(int memOrderSeqNum) throws DataAccessException;
	public List<MypageVO> myOrderInfoSearchList(Map<String ,Object> myOrderInfoSearchMap) throws DataAccessException;
	public int myOrderInfoSearchCount(Map<String, Object> search) throws DataAccessException ;
	public void updatePurchaseConfirm(MypageVO mypageVO) throws DataAccessException;
	
	public List<ProductVO> selectMypageReviewList(Map<String ,Object> mypageReviewMap) throws DataAccessException;
	public int selectMypageReviewCount(String memId) throws DataAccessException;
	public List<MypageVO> reviewSearchList(Map<String ,Object> reviewSearchMap) throws DataAccessException ;
	public int reviewSearchCount(Map<String, Object> search) throws DataAccessException;
	public MypageVO selectReviewWrite(int memOrderSeqNum) throws DataAccessException ;
	public int insertNewReview(Map reviewMap) throws DataAccessException;
	public MypageVO selectReview(int reviewNum) throws DataAccessException;
	public void updateReview(Map reviewMap) throws DataAccessException;
	public void deleteReview(Map<String,Object> reviewMap) throws DataAccessException;
	
	public List<MypageVO> selectMypageReturnList(Map<String ,Object> mypageReturnMap) throws DataAccessException;
	public int selectMypageReturnCount(String memId) throws DataAccessException ;
	public List<MypageVO> returnSearchList(Map<String ,Object> returnSearchMap) throws DataAccessException ;
	public int returnSearchCount(Map<String, Object> search) throws DataAccessException;
	public void insertNewReturn(Map returnMap) throws DataAccessException ;
	public MypageVO selectReturn(int returnNum) throws DataAccessException ;
	public void updateReturn(Map returnMap) throws DataAccessException ;
	public void deleteReturn(Map<String,Object> returnMap) throws DataAccessException ;
	
	public int selectOrderCount(String memId) throws DataAccessException ;
	public int selectReturnCount(String memId) throws DataAccessException;
	public int selectCartCount(String memId) throws DataAccessException;
	public int selectOrder_rc_Count(String memId) throws DataAccessException;
	public int selectPayment_cp_Count(String memId) throws DataAccessException ;
	public int selectProduct_pp_Count(String memId) throws DataAccessException;
	public int selectDeliveryCount(String memId) throws DataAccessException;
	public int selectDeliver_cp_Count(String memId) throws DataAccessException;
	
	public List<ArticleVO> selectListInquiry(String memId) throws DataAccessException;
	public List<ArticleVO> selectListAsCenter(String memId) throws DataAccessException ;
	
}
