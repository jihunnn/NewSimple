package com.project.simple.mypage.service;

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

import com.project.simple.board.vo.ArticleVO;
import com.project.simple.mypage.dao.MypageDAO;
import com.project.simple.product.vo.ProductVO;
import com.project.simple.mypage.vo.MypageVO;
import com.project.simple.page.Criteria;

@Service("mypageService")

public class MypageServiceImpl implements MypageService{
	@Autowired
	MypageDAO mypageDAO;
	
	

	

	
	//마이페이지 주문조회
	public Map<String ,Object> listMyOrderInfo (Map<String ,Object> myOrderInfoMap) throws Exception{
		List<MypageVO> myOrderInfoList=mypageDAO.selectMyOrderInfoList(myOrderInfoMap);
		myOrderInfoMap.put("myOrderInfoList", myOrderInfoList);
		
		return myOrderInfoMap;
	}
	
	public int myOrderInfoCount(String memId) throws Exception{
		int myOrderInfoCount = mypageDAO.selectMyOrderInfoCount(memId);
		return myOrderInfoCount;
	}
	
	//마이페이지 주문조회  -->기간검색
	public Map<String ,Object> myOrderInfoSearch(Map<String ,Object> myOrderInfoSearchMap) throws Exception{

		List<MypageVO> myOrderInfoSearchList=mypageDAO.myOrderInfoSearchList(myOrderInfoSearchMap);

		myOrderInfoSearchMap.put("myOrderInfoSearchList", myOrderInfoSearchList);
		

		return myOrderInfoSearchMap;
	}

	public int myOrderInfoSearchCount(Map<String, Object> search) throws Exception{

		int myOrderInfoSearchCount = mypageDAO.myOrderInfoSearchCount(search);
		return myOrderInfoSearchCount;
	}
	
	//마이페이지 구매확정
	@Override
	public void purchaseConfirm(MypageVO mypageVO) throws Exception {
		mypageDAO.updatePurchaseConfirm(mypageVO);	
	}

	
	//mypage 상품 리뷰 목록
	public Map<String ,Object> listMypageReview(Map<String ,Object> mypageReviewMap) throws Exception{
		List<ProductVO> mypageReviewList=mypageDAO.selectMypageReviewList(mypageReviewMap);
		mypageReviewMap.put("mypageReviewList", mypageReviewList);
		return mypageReviewMap;
	}
	
	public int mypageReviewCount(String memId) throws Exception{
		int mypageReviewCount = mypageDAO.selectMypageReviewCount(memId);
		return mypageReviewCount;
	}
	
	//마이페이지 반품 상세보기
	@Override
	public List<MypageVO> viewMyOrderInfo(int memOrderNum) throws Exception {
		List<MypageVO> mypageVO = mypageDAO.selectViewMyOrderInfo(memOrderNum);
		return mypageVO;
	}
	
	@Override
	public MypageVO viewMyOrderInfoMem(int memOrderSeqNum) throws Exception {
		MypageVO mypageVO = mypageDAO.selectViewMyOrderInfoMem(memOrderSeqNum);
		return mypageVO;
	}
	
	//마이페이지 리뷰조회  -->기간검색
	public Map<String ,Object> reviewSearch(Map<String ,Object> reviewSearchMap) throws Exception{

		List<MypageVO> reviewSearchList=mypageDAO.reviewSearchList(reviewSearchMap);
		reviewSearchMap.put("reviewSearchList", reviewSearchList);	

		return reviewSearchMap;
	}

	public int reviewSearchCount(Map<String, Object> search) throws Exception{

		int reviewSearchCount = mypageDAO.reviewSearchCount(search);
		return reviewSearchCount;
	}
	
	//마이페이지 리뷰 글쓰기창 
	@Override
	public MypageVO reviewWrite(int memOrderSeqNum) throws Exception {
		MypageVO mypageVO = mypageDAO.selectReviewWrite(memOrderSeqNum);
		return mypageVO;
	}
	
	//마이페이지 리뷰 글쓰기
	@Override
	public int addNewReview(Map reviewMap) throws Exception{
		return mypageDAO.insertNewReview(reviewMap);
	}
	
	//마이페이지 리뷰 수정 글쓰기창 
	@Override
	public MypageVO reviewForm(int reviewNum) throws Exception {
		MypageVO mypageVO = mypageDAO.selectReview(reviewNum);
		return mypageVO;
	}
	
	//마이페이지 리뷰 수정하기
	@Override
	public void modReview(Map reviewMap) throws Exception {

		mypageDAO.updateReview(reviewMap);
	}
	
	//마이페이지 리뷰 삭제하기
	@Override
	public void removeReview(Map<String,Object> reviewMap) throws Exception {
		mypageDAO.deleteReview(reviewMap);
	}
	
	//mypage 반품 목록
	@Override
	public Map<String ,Object> listMypageReturn(Map<String ,Object> mypageReturnMap) throws Exception{
		List<MypageVO> mypageReturnList=mypageDAO.selectMypageReturnList(mypageReturnMap);
		mypageReturnMap.put("mypageReturnList", mypageReturnList);
		return mypageReturnMap;
	}
	
	public int mypageReturnCount(String memId) throws Exception{
		int mypageReturnCount = mypageDAO.selectMypageReturnCount(memId);
		return mypageReturnCount;
	}
	
	//마이페이지 반품 검색
	public Map<String ,Object> returnSearch(Map<String ,Object> returnSearchMap) throws Exception{

		List<MypageVO> returnSearchList=mypageDAO.returnSearchList(returnSearchMap);
		returnSearchMap.put("returnSearchList", returnSearchList);
		
		return returnSearchMap;
	}

	public int returnSearchCount(Map<String, Object> search) throws Exception{

		int returnSearchCount = mypageDAO.returnSearchCount(search);
		return returnSearchCount;
	}
	
	//마이페이지 반품 글쓰기
	@Override
	public void addNewReturn(Map returnMap) throws Exception{
		mypageDAO.insertNewReturn(returnMap);
	}
	
	

	
	//마이페이지 반품 상세보기
	@Override
	public MypageVO viewReturn(int returnNum) throws Exception {
		MypageVO mypageVO = mypageDAO.selectReturn(returnNum);
		return mypageVO;
	}
	
	//마이페이지 반품 수정하기
	@Override
	public void modReturn(Map returnMap) throws Exception {
		mypageDAO.updateReturn(returnMap);
	}
	
	//마이페이지 반품신청 삭제하기
	@Override
	public void removeReturn(Map<String,Object> returnMap) throws Exception {
		mypageDAO.deleteReturn(returnMap);
	}
	
	//마이페이지 공통 UI 주문내역 count
	public int orderCount(String memId) throws Exception{
		int orderCount = mypageDAO.selectOrderCount(memId);
		return orderCount;
	}
	
	//마이페이지 공통 UI 반품내역 count
	public int returnCount(String memId) throws Exception{
		int returnCount = mypageDAO.selectReturnCount(memId);
		return returnCount;
	}
	
	//마이페이지 공통 UI 장바구니 count
	public int cartCount(String memId) throws Exception{
		int cartCount = mypageDAO.selectCartCount(memId);
		return cartCount;
	}
	
	//마이페이지 주문접수 count
	public int order_rc_Count(String memId) throws Exception{
		int order_rc_Count = mypageDAO.selectOrder_rc_Count(memId);
		return order_rc_Count;
	}
	
	//마이페이지 결제완료 count
	public int payment_cp_Count(String memId) throws Exception{
		int payment_cp_Count = mypageDAO.selectPayment_cp_Count(memId);
		return payment_cp_Count;
	}
	
	//마이페이지 배송준비 count
	public int product_pp_Count(String memId) throws Exception{
		int product_pp_Count = mypageDAO.selectProduct_pp_Count(memId);
		return product_pp_Count;
	}
	
	//마이페이지 배송중 count
	public int deliveryCount(String memId) throws Exception{
		int deliveryCount = mypageDAO.selectDeliveryCount(memId);
		return deliveryCount;
	}
	
	//마이페이지 배송완료 count
	public int deliver_cp_Count(String memId) throws Exception{
		int deliver_cp_Count = mypageDAO.selectDeliver_cp_Count(memId);
		return deliver_cp_Count;
	}
	
	//마이페이지 1:1문의 내역
	public List<ArticleVO> listInquiry(String memId) throws Exception{
		List<ArticleVO> listInquiry = mypageDAO.selectListInquiry(memId);
		return listInquiry;
	}
	
	//마이페이지 as센터 내역
	public List<ArticleVO> listAsCenter(String memId) throws Exception{
		List<ArticleVO> listAsCenter = mypageDAO.selectListAsCenter(memId);
		return listAsCenter;
	}
	
	
}
