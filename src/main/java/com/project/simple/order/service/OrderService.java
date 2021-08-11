package com.project.simple.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.project.simple.cart.vo.CartVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.order.vo.OrderVO;
import com.project.simple.page.Criteria;

public interface OrderService {
	public List<OrderVO> listOrders(Criteria cri) throws Exception;
	public int orderCount() throws Exception;
	public Map<String, Object> orderSearch(Map<String, Object> orderSearchMap) throws Exception;
	public int orderSearchCount(Map<String, Object> search) throws Exception ;
	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws Exception;
	public void addNewOrder(OrderVO orderVO) throws Exception;
	public OrderVO findMyOrder(String order_id) throws Exception;
	public OrderVO selectcartlist(String memCartId) throws Exception;
	public List<OrderVO> memOrderNumList(int memOrderNum) throws Exception;
	public MemberVO memOrderId(int memOrderNum)throws Exception;
	public OrderVO memOrderInfo(int memOrderNum)throws Exception;

	
	
}
