package com.project.simple.cart.service;

import java.util.List;
import java.util.Map;

import com.project.simple.cart.vo.CartVO;

public interface CartService {

	//public Map<String ,List> myCartList(CartVO cartVO) throws Exception;

	public boolean findCartProduct(CartVO cartVO) throws Exception;

	public List<CartVO> selectcartlist(String memId) throws Exception;
	public void removeCartProduct(String memCartId)throws Exception;
	public void removeCompleteCartlist(String memCartId) throws Exception;

	public int addcartlist(CartVO cartVO)throws Exception;
}
