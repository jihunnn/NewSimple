package com.project.simple.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.project.simple.page.Criteria;

public interface MypageController {


	
	public ModelAndView listMyOrderInfo(Criteria cri, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView myOrderInfoSearch(@RequestParam("search1") String search1, @RequestParam("search2") String search,Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView listMypageReview(Criteria cri, HttpServletRequest request, HttpServletResponse response)throws Exception;

	public ResponseEntity addNewReview(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)throws Exception;
	public ResponseEntity removeReview(@RequestParam("reviewNum") int reviewNum, @RequestParam("memOrderSeqNum") int memOrderSeqNum, HttpServletRequest request,HttpServletResponse response) throws Exception;
	public ModelAndView reviewSearch(@RequestParam("search1") String search1, @RequestParam("search2") String search2,
			Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView listMypageReturn(Criteria cri, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView returnSearch(@RequestParam("search1") String search1, @RequestParam("search2") String search2,
			Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception ;
	public ResponseEntity addNewRetrun(Criteria cri, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ResponseEntity removeReturn(@RequestParam("returnNum") int returnNum,  @RequestParam("memOrderSeqNum") int memOrderSeqNum,HttpServletRequest request,HttpServletResponse response) throws Exception;
	
	
	
}
