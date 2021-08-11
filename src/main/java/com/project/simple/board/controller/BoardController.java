package com.project.simple.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.project.simple.page.Criteria;

public interface BoardController {
	
	public ModelAndView listNotice(Criteria cri,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView viewNotice(@RequestParam("noticeNum") int noticeNum, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView listQuestion(Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception;	
	public ModelAndView questionSearch(@RequestParam("search") String search , Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView listInquiry(Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView inquirySearch(@RequestParam("search1") String search1 , @RequestParam("search2") String search2, Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addNewInquiry(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;	
	public ModelAndView viewInquiry(@RequestParam("totalNum") int totalNum, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView inquiryForm(@RequestParam("inquiryNum") int inquiryNum, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	public ResponseEntity removeInquiry(@RequestParam("inquiryNum") int inquiryNum, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView listAscenter(Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addNewAsCenter(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	public ResponseEntity removeAsCenter(@RequestParam("asCenterNum") int asCenterNum, HttpServletRequest request,HttpServletResponse response) throws Exception;
	public ModelAndView asCenterSearch(@RequestParam("search") String search, @RequestParam("searchType") String searchType,
			Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception ;

	
	
}
