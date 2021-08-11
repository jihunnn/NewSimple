package com.project.simple.cart.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.simple.cart.dao.CartDAO;
import com.project.simple.cart.vo.CartVO;
import com.project.simple.product.vo.ProductVO;

@Service("cartService")
@Transactional(propagation = Propagation.REQUIRED)
public class CartServiceImpl implements CartService{


	@Autowired
	private CartDAO cartDAO;
	
	/*
	public Map<String ,List> myCartList(CartVO cartVO) throws Exception{
		Map<String,List> cartMap=new HashMap<String,List>();
		List<CartVO> myCartList=cartDAO.selectCartList(cartVO);//장바구니에 표시할 장바구니 정보 조회
		if(myCartList.size()==0){ //카트에 저장된 상품이없는 경우
			return null;
		}
		List<ProductVO> myProductList=cartDAO.selectProductList(myCartList);//장바구니 페이지에 표시할 상품정보를 조회
		cartMap.put("myCartList", myCartList);
		cartMap.put("myProductList",myProductList);
		return cartMap; //장바구니 정보와 상품 정보를 cartMap에 저장하여 반환
	}
	*/

	@Override
	public boolean findCartProduct(CartVO cartVO) throws Exception {
		return cartDAO.selectCountInCart(cartVO);
	}//테이블에 추가하기 전에 동일한 상품 번호의 개수를 조회

	public int addcartlist(CartVO cartVO) throws Exception{
		return cartDAO.insertcartlist(cartVO);
	}
	
	public List<CartVO> selectcartlist(String memId) throws Exception{
		
		return cartDAO.selectCartList(memId);
	}
	
	//주문완료한 내역 장바구니에서 삭제
	@Override
	public void removeCompleteCartlist(String memCartId) throws Exception{
		cartDAO.deleteCompleteCartlist(memCartId);
	}
	
	
	//장바구니 선택목록 삭제
	@Override
	public void removeCartProduct(String memCartId) throws Exception {
		cartDAO.deleteCartProduct(memCartId);
		
	}
}
