package com.project.simple.mypage.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.project.simple.board.vo.ArticleVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;
import com.project.simple.product.vo.ProductVO;
import com.project.simple.mypage.vo.MypageVO;

public interface MypageService {


	
	public Map<String ,Object> listMyOrderInfo (Map<String ,Object> myOrderInfoMap) throws Exception;
	public int myOrderInfoCount(String memId) throws Exception;
	public List<MypageVO> viewMyOrderInfo(int memOrderSeqNum) throws Exception ;
	public MypageVO viewMyOrderInfoMem(int memOrderSeqNum) throws Exception ;
	public Map<String ,Object> myOrderInfoSearch(Map<String ,Object> myOrderInfoSearchMap) throws Exception;
	public int myOrderInfoSearchCount(Map<String, Object> search) throws Exception;
	public void purchaseConfirm(MypageVO mypageVO) throws Exception;
	
	public Map<String ,Object> listMypageReview(Map<String ,Object> mypageReviewMap) throws Exception;
	public int mypageReviewCount(String memId) throws Exception;
	public Map<String ,Object> reviewSearch(Map<String ,Object> reviewSearchMap) throws Exception;
	public int reviewSearchCount(Map<String, Object> search) throws Exception;
	public MypageVO reviewWrite(int memOrderSeqNum) throws Exception ;
	public int addNewReview(Map reviewMap) throws Exception;
	public MypageVO reviewForm(int reviewNum) throws Exception;
	public void modReview(Map reviewMap) throws Exception;
	public void removeReview(Map<String,Object> reviewMap) throws Exception;
	
	public Map<String ,Object> listMypageReturn(Map<String ,Object> mypageReturnMap) throws Exception;
	public int mypageReturnCount(String memId) throws Exception;
	public Map<String ,Object> returnSearch(Map<String ,Object> returnSearchMap) throws Exception;
	public int returnSearchCount(Map<String, Object> search) throws Exception;
	public void addNewReturn(Map returnMap) throws Exception;
	public MypageVO viewReturn(int returnNum) throws Exception;
	public void modReturn(Map returnMap) throws Exception ;
	public void removeReturn(Map<String,Object> returnMap) throws Exception ;
	
	public int orderCount(String memId) throws Exception;
	public int returnCount(String memId) throws Exception;
	public int cartCount(String memId) throws Exception;
	public int order_rc_Count(String memId) throws Exception;
	public int payment_cp_Count(String memId) throws Exception;
	public int product_pp_Count(String memId) throws Exception;
	public int deliveryCount(String memId) throws Exception;
	public int deliver_cp_Count(String memId) throws Exception;
	
	public List<ArticleVO> listInquiry(String memId) throws Exception;
	public List<ArticleVO> listAsCenter(String memId) throws Exception;

}
