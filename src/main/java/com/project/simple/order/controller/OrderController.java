package com.project.simple.order.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.simple.order.vo.OrderVO;
import com.project.simple.page.Criteria;

public interface OrderController {
	public ModelAndView orderEachGoods(@ModelAttribute("orderVO") OrderVO _orderVO,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView listorder(Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView orderSearch(@RequestParam("search") String search, @RequestParam("searchType") String searchType,
			Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception ;
	//public ModelAndView orderAllCartGoods(@RequestParam  String[] cart_goods_qty,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	//public ModelAndView payToOrderGoods(@RequestParam Map<String, String> orderMap,HttpServletRequest request, HttpServletResponse response)  throws Exception;
}
