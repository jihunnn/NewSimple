package com.project.simple.mypage.dao;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.simple.product.vo.ProductVO;
import com.project.simple.mypage.vo.MypageVO;
import com.project.simple.board.vo.ArticleVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;

@Repository("mypageDAO")
public class MypageDAOImpl implements MypageDAO {
	@Autowired
	private SqlSession sqlSession;

	// 상품 주문내역조회
	@Override
	public List<MypageVO> selectMyOrderInfoList(Map<String, Object> myOrderInfoMap) throws DataAccessException {
		List<MypageVO> myOrderInfoList = sqlSession.selectList("mapper.mypage.selectAllMyOrderInfoList",
				myOrderInfoMap);

		return myOrderInfoList;
	}

	@Override
	public int selectMyOrderInfoCount(String memId) throws DataAccessException {
		int myOrderInfoCount = sqlSession.selectOne("mapper.mypage.selectMyOrderInfoCount", memId);

		return myOrderInfoCount;
	}

	@Override
	public List<MypageVO> selectViewMyOrderInfo(int memOrderNum) throws DataAccessException {
		return sqlSession.selectList("mapper.mypage.selectMyOrderInfo", memOrderNum);
	}

	@Override
	public MypageVO selectViewMyOrderInfoMem(int memOrderSeqNum) throws DataAccessException {
		return sqlSession.selectOne("mapper.mypage.selectMyOrderInfoMem", memOrderSeqNum);
	}

	// 상품 주문내역 -->>기간검색
	@Override
	public List<MypageVO> myOrderInfoSearchList(Map<String, Object> myOrderInfoSearchMap) throws DataAccessException {

		List<MypageVO> myOrderInfoSearchList = sqlSession.selectList("mapper.mypage.myOrderInfoSearchList",
				myOrderInfoSearchMap);
		return myOrderInfoSearchList;
	}

	@Override
	public int myOrderInfoSearchCount(Map<String, Object> search) throws DataAccessException {
		int myOrderInfoSearchCount = sqlSession.selectOne("mapper.mypage.myOrderInfoSearchCount", search);

		return myOrderInfoSearchCount;
	}

	@Override
	public void updatePurchaseConfirm(MypageVO mypageVO) throws DataAccessException {
		sqlSession.update("mapper.mypage.updatePurchaseConfirm", mypageVO);
	}

	// mypage 상품 리뷰
	@Override
	public List<ProductVO> selectMypageReviewList(Map<String, Object> mypageReviewMap) throws DataAccessException {
		List<ProductVO> mypageReviewList = sqlSession.selectList("mapper.product.selectAllMypageReviewList",
				mypageReviewMap);

		return mypageReviewList;
	}

	@Override
	public int selectMypageReviewCount(String memId) throws DataAccessException {
		int mypageReviewCount = sqlSession.selectOne("mapper.product.selectMypageReviewCount", memId);

		return mypageReviewCount;
	}

	// 상품 리뷰내역 -->>기간검색
	@Override
	public List<MypageVO> reviewSearchList(Map<String, Object> reviewSearchMap) throws DataAccessException {

		List<MypageVO> reviewSearchList = sqlSession.selectList("mapper.mypage.reviewSearchList", reviewSearchMap);
		return reviewSearchList;
	}

	@Override
	public int reviewSearchCount(Map<String, Object> search) throws DataAccessException {
		int reviewSearchCount = sqlSession.selectOne("mapper.mypage.reviewSearchCount", search);

		return reviewSearchCount;
	}

	@Override
	public MypageVO selectReviewWrite(int memOrderSeqNum) throws DataAccessException {
		return sqlSession.selectOne("mapper.mypage.selectReviewWrite", memOrderSeqNum);
	}

	@Override
	public int insertNewReview(Map reviewMap) throws DataAccessException {
		int reviewNum = selectNewReviewNum();
		reviewMap.put("reviewNum", reviewNum);
		sqlSession.insert("mapper.mypage.insertNewReview", reviewMap);
		sqlSession.update("mapper.mypage.updateReviewConfirm", reviewMap);
		return reviewNum;
	}

	private int selectNewReviewNum() throws DataAccessException {
		return sqlSession.selectOne("mapper.mypage.selectNewReviewNum");

	}

	@Override
	public MypageVO selectReview(int reviewNum) throws DataAccessException {
		return sqlSession.selectOne("mapper.mypage.selectReview", reviewNum);
	}

	@Override
	public void updateReview(Map reviewMap) throws DataAccessException {
		sqlSession.update("mapper.mypage.updateReview", reviewMap);

	}

	@Override
	public void deleteReview(Map<String, Object> reviewMap) throws DataAccessException {
		sqlSession.delete("mapper.mypage.deleteReview", reviewMap);
		sqlSession.update("mapper.mypage.updateReviewOrder", reviewMap);
	}

	// 마이페이지 반품 리스트
	@Override
	public List<MypageVO> selectMypageReturnList(Map<String, Object> mypageReturnMap) throws DataAccessException {
		System.out.println(mypageReturnMap);
		List<MypageVO> mypageReturnList = sqlSession.selectList("mapper.mypage.selectAllMypageReturnList",
				mypageReturnMap);
		System.out.println(mypageReturnList);
		return mypageReturnList;
	}

	@Override
	public int selectMypageReturnCount(String memId) throws DataAccessException {
		int mypageReturnCount = sqlSession.selectOne("mapper.mypage.selectMypageReturnCount", memId);

		return mypageReturnCount;
	}

	// 상품 반품내역 -->>기간검색
	@Override
	public List<MypageVO> returnSearchList(Map<String, Object> returnSearchMap) throws DataAccessException {

		List<MypageVO> returnSearchList = sqlSession.selectList("mapper.mypage.returnSearchList", returnSearchMap);
		return returnSearchList;
	}

	@Override
	public int returnSearchCount(Map<String, Object> search) throws DataAccessException {
		int returnSearchCount = sqlSession.selectOne("mapper.mypage.returnSearchCount", search);

		return returnSearchCount;
	}

	@Override
	public void insertNewReturn(Map returnMap) throws DataAccessException {
		sqlSession.insert("mapper.mypage.insertNewReturn", returnMap);
		sqlSession.update("mapper.mypage.updateReturnConfirm", returnMap);

	}

	@Override
	public MypageVO selectReturn(int returnNum) throws DataAccessException {
		return sqlSession.selectOne("mapper.mypage.selectReturn", returnNum);
	}

	@Override
	public void updateReturn(Map returnMap) throws DataAccessException {
		sqlSession.update("mapper.mypage.updateReturn", returnMap);
	}

	@Override
	public void deleteReturn(Map<String, Object> returnMap) throws DataAccessException {
		sqlSession.delete("mapper.mypage.deleteReturn", returnMap);
		sqlSession.update("mapper.mypage.updateReturnOrder", returnMap);
	}

	// 마이페이지 공통 UI 주문내역 count
	@Override
	public int selectOrderCount(String memId) throws DataAccessException {
		int orderCount = sqlSession.selectOne("mapper.mypage.selectOrderCount", memId);
		return orderCount;
	}

	// 마이페이지 공통 UI 반품내역 count
	@Override
	public int selectReturnCount(String memId) throws DataAccessException {
		int returnCount = sqlSession.selectOne("mapper.mypage.selectReturnCount", memId);
		return returnCount;
	}

	// 마이페이지 공통 UI 장바구니 count
	@Override
	public int selectCartCount(String memId) throws DataAccessException {
		int cartCount = sqlSession.selectOne("mapper.mypage.selectCartCount", memId);
		return cartCount;
	}

	// 마이페이지 주문접수 count
	@Override
	public int selectOrder_rc_Count(String memId) throws DataAccessException {
		int order_rc_Count = sqlSession.selectOne("mapper.mypage.selectOrder_rc_Count", memId);

		return order_rc_Count;
	}

	// 마이페이지 결제완료 count
	@Override
	public int selectPayment_cp_Count(String memId) throws DataAccessException {
		int payment_cp_Count = sqlSession.selectOne("mapper.mypage.selectPayment_cp_Count", memId);
		return payment_cp_Count;
	}

	// 마이페이지 상품준비 count
	@Override
	public int selectProduct_pp_Count(String memId) throws DataAccessException {
		int product_pp_Count = sqlSession.selectOne("mapper.mypage.selectProduct_pp_Count", memId);
		return product_pp_Count;
	}

	// 마이페이지 배송중 count
	@Override
	public int selectDeliveryCount(String memId) throws DataAccessException {
		int deliveryCount = sqlSession.selectOne("mapper.mypage.selectDeliveryCount", memId);
		return deliveryCount;
	}

	// 마이페이지 상품준비 count
	@Override
	public int selectDeliver_cp_Count(String memId) throws DataAccessException {
		int deliver_cp_Count = sqlSession.selectOne("mapper.mypage.selectDeliver_cp_Count", memId);
		return deliver_cp_Count;
	}

	// 마이페이지 1:1문의내역
	@Override
	public List<ArticleVO> selectListInquiry(String memId) throws DataAccessException {
		List<ArticleVO> listInquiry = sqlSession.selectList("mapper.mypage.selectListInquiry", memId);
		return listInquiry;
	}

	// 마이페이지 as센터 내역
	@Override
	public List<ArticleVO> selectListAsCenter(String memId) throws DataAccessException {
		List<ArticleVO> listAsCenter = sqlSession.selectList("mapper.mypage.selectListAsCenter", memId);
		return listAsCenter;
	}

}
