package com.project.simple.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.simple.board.vo.ArticleVO;
import com.project.simple.page.Criteria;
import com.project.simple.product.vo.ProductVO;

public interface AdminController {

	public ModelAndView listAllInquiry(Criteria cri, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ResponseEntity addNewNotice(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;

	public ResponseEntity removeNotice(@RequestParam("noticeNum") int noticeNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ResponseEntity addNewQuestion(@ModelAttribute("question") ArticleVO question, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ResponseEntity removeQuestion(@RequestParam("questionNum") int questionNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public ResponseEntity addNewInquiryAnswer(@ModelAttribute("inquiry") ArticleVO inquiry, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	
	public ResponseEntity modNewInquiryAnswer(@ModelAttribute("inquiry") ArticleVO inquiry, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	
	public ResponseEntity removeInquiryAnswer(@RequestParam("inquiryNum") int inquiryNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public ModelAndView listProductQuestion(Criteria cri, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	
	public ResponseEntity addProductQuestion(@ModelAttribute("productQuestion") ProductVO productQuestion, HttpServletRequest request,
			HttpServletResponse response) throws Exception ;
	
	public ResponseEntity modNewProductAnswer(@ModelAttribute("productQuestion") ProductVO productQuestion, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	
	public ResponseEntity removeProductQuestion(@RequestParam("productQuestionNum") int productQuestionNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public ResponseEntity removeProductAnswer(
			@RequestParam("productQuestionNum") int productQuestionNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception ;
	
	public ModelAndView questionSearch(@RequestParam("search") String search,
			@RequestParam("searchType") String searchType, Criteria cri, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
}
