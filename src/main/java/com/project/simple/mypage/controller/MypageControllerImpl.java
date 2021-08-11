package com.project.simple.mypage.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.simple.mypage.service.MypageService;
import com.project.simple.product.vo.ProductVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.mypage.vo.MypageVO;
import com.project.simple.page.PageMaker;
import com.project.simple.page.Criteria;

@Controller("mypageController")
public class MypageControllerImpl implements MypageController {
	
	private static final String ARTICLE_IMAGE_REPO_review = "C:\\spring\\review_image";


	private static final Collection Integer = null;

	@Autowired
	private MypageService mypageService;

	@Autowired
	private ProductVO productVO;

	@Autowired
	private MypageVO mypageVO;

	@Autowired
	private MemberVO memberVO;
	
	
	@RequestMapping(value = "/mypage_01.do", method = RequestMethod.GET)
	private ModelAndView mypage_01(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memId = memberVO.getmemId();
		Map<String, Object> myInfo = new HashMap<String, Object>();
		myInfo.put("order",mypageService.orderCount(memId));
		myInfo.put("orderReturn",mypageService.returnCount(memId));
		myInfo.put("cart",mypageService.cartCount(memId));
		myInfo.put("order_rc",mypageService.order_rc_Count(memId));
		myInfo.put("payment_cp",mypageService.payment_cp_Count(memId));
		myInfo.put("product_pp",mypageService.product_pp_Count(memId));
		myInfo.put("delivery",mypageService.deliveryCount(memId));
		myInfo.put("deliver_cp",mypageService.deliver_cp_Count(memId));
		myInfo.put("deliver_cp",mypageService.deliver_cp_Count(memId));
		myInfo.put("listInquiry",mypageService.listInquiry(memId));
		myInfo.put("listAsCenter",mypageService.listAsCenter(memId));
		
		
		session.setAttribute("myInfo", myInfo);
		
		return mav;
	}
	
	
	// 마이페이지 주문조회
	@Override
	@RequestMapping(value = "/mypage_04.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listMyOrderInfo(Criteria cri, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memId = memberVO.getmemId();
		productVO.setMemId(memId);

		Map<String, Object> myOrderInfoMap = new HashMap<String, Object>();
		int pageStart = cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		myOrderInfoMap.put("memId", memId);
		myOrderInfoMap.put("pageStart", pageStart);
		myOrderInfoMap.put("perPageNum", perPageNum);
		myOrderInfoMap = mypageService.listMyOrderInfo(myOrderInfoMap);
		int myOrderInfoCount = mypageService.mypageReviewCount(memId);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int pageNum = pageMaker.getCri().getPage();
		myOrderInfoMap.put("pageNum", pageNum);
		pageMaker.setTotalCount(myOrderInfoCount);
		mav.addObject("myOrderInfoMap", myOrderInfoMap);
		mav.addObject("pageMaker", pageMaker);
		return mav;

	}
	
	//마이페이지 주문내역 상세보기
	@RequestMapping(value = "/mypage/viewMyOrderInfo.do", method = RequestMethod.GET)
	public ModelAndView viewMyOrderInfo(@RequestParam("memOrderNum") int memOrderNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

	
		List<MypageVO> myOrderList = mypageService.viewMyOrderInfo(memOrderNum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("memOrderNum", myOrderList);

		return mav;
	}
	
	//날짜로 주문 조회
	@Override
	@RequestMapping(value = "/mypage/myOrderInfoSearch.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myOrderInfoSearch(@RequestParam("search1") String search1, @RequestParam("search2") String search2,
			Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memId = memberVO.getmemId();
		mypageVO.setMemId(memId);

		Map<String, Object> myOrderInfoSearchMap = new HashMap<String, Object>();
		int pageStart = cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		myOrderInfoSearchMap.put("pageStart", pageStart);
		myOrderInfoSearchMap.put("perPageNum", perPageNum);
		myOrderInfoSearchMap.put("search1", search1);
		myOrderInfoSearchMap.put("search2", search2);
		myOrderInfoSearchMap.put("memId", memId);
		myOrderInfoSearchMap = mypageService.myOrderInfoSearch(myOrderInfoSearchMap);
		int myOrderInfoSearchCount = mypageService.myOrderInfoSearchCount(myOrderInfoSearchMap);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int pageNum = pageMaker.getCri().getPage();
		myOrderInfoSearchMap.put("pageNum", pageNum);
		pageMaker.setTotalCount(myOrderInfoSearchCount);
		mav.addObject("myOrderInfoSearchMap", myOrderInfoSearchMap);
		session.setAttribute("pageMaker", pageMaker);
		session.setAttribute("pageNum", pageNum);

		return mav;

	}

	// 주문내역 구매확정
	@RequestMapping(value = "/mypage/purchaseConfirm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity purchaseConfirm(@RequestParam("memOrderSeqNum") int memOrderSeqNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		String message;
		mypageVO.setMemOrderSeqNum(memOrderSeqNum);

		try {
			mypageService.purchaseConfirm(mypageVO);
			message = "<script>";
			message += " alert('구매확정되었습니다.');";
			message += " location.href='" + request.getContextPath() + "/mypage_04.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해주세요');";
			message += "  location.href='" + request.getContextPath() + "/mypage_04.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	// 마이페이지 리뷰 글쓰기 폼
	@RequestMapping(value = "/mypage/reviewWrite.do", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView reviewWrite(@RequestParam("memOrderSeqNum") int memOrderSeqNum,
			@RequestParam("productNum") String productNum, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession session = request.getSession();
		mypageVO = mypageService.reviewWrite(memOrderSeqNum);
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memName = memberVO.getmemName();
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		session.setAttribute("productNum", productNum);
		session.setAttribute("memOrderSeqNum", memOrderSeqNum);
		mav.addObject("mypageVO", mypageVO);
		mav.addObject("memName", memName);
		return mav;
	}

	// 마이페이지 상품리뷰 리스트
	@Override
	@RequestMapping(value = "/mypage_14.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listMypageReview(Criteria cri, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		// 기존 memOrderSeqNum과 productNum 세션 해제
		if (session.getAttribute("memOrderSeqNum") != null && session.getAttribute("productNum") != null) {
			session.removeAttribute("memOrderSeqNum");
			session.removeAttribute("productNum");
		}
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memId = memberVO.getmemId();
		productVO.setMemId(memId);

		Map<String, Object> mypageReviewMap = new HashMap<String, Object>();
		int pageStart = cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		mypageReviewMap.put("memId", memId);
		mypageReviewMap.put("pageStart", pageStart);
		mypageReviewMap.put("perPageNum", perPageNum);
		mypageReviewMap = mypageService.listMypageReview(mypageReviewMap);
		int mypageReviewCount = mypageService.mypageReviewCount(memId);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int pageNum = pageMaker.getCri().getPage();
		mypageReviewMap.put("pageNum", pageNum);
		pageMaker.setTotalCount(mypageReviewCount);
		mav.addObject("mypageReviewMap", mypageReviewMap);
		mav.addObject("pageMaker", pageMaker);
		return mav;

	}
	
	//날짜로 리뷰 조회
	@Override
	@RequestMapping(value = "/mypage/reviewSearch.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView reviewSearch(@RequestParam("search1") String search1, @RequestParam("search2") String search2,
			Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memId = memberVO.getmemId();
		mypageVO.setMemId(memId);

		Map<String, Object> reviewSearchMap = new HashMap<String, Object>();
		int pageStart = cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		reviewSearchMap.put("pageStart", pageStart);
		reviewSearchMap.put("perPageNum", perPageNum);
		reviewSearchMap.put("search1", search1);
		reviewSearchMap.put("search2", search2);
		reviewSearchMap.put("memId", memId);
		reviewSearchMap = mypageService.reviewSearch(reviewSearchMap);
		int reviewSearchCount = mypageService.reviewSearchCount(reviewSearchMap);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int pageNum = pageMaker.getCri().getPage();
		reviewSearchMap.put("pageNum", pageNum);
		pageMaker.setTotalCount(reviewSearchCount);
		mav.addObject("reviewSearchMap", reviewSearchMap);
		session.setAttribute("pageMaker", pageMaker);
		session.setAttribute("pageNum", pageNum);
		return mav;

	}

	// 마이페이지 리뷰 글쓰기
	@Override
	@RequestMapping(value = "/mypage/addNewReview.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewReview(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {

		multipartRequest.setCharacterEncoding("utf-8");
		

		Map<String, Object> reviewMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			reviewMap.put(name, value);
		}

		String reviewFile = uploadReview(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		int memOrderSeqNum = (Integer) session.getAttribute("memOrderSeqNum");
		String productNum = (String) session.getAttribute("productNum");
		String memId = memberVO.getmemId();

		reviewMap.put("reviewNum", 0);
		reviewMap.put("memId", memId);
		reviewMap.put("memOrderSeqNum", memOrderSeqNum);
		reviewMap.put("productNum", productNum);
		reviewMap.put("reviewFile", reviewFile);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int reviewNum = mypageService.addNewReview(reviewMap);

			if (reviewFile != null && reviewFile.length() != 0) {
				File srcFile = new File(ARTICLE_IMAGE_REPO_review + "\\" + "temp" + "\\" + reviewFile);
				File destDir = new File(ARTICLE_IMAGE_REPO_review + "\\" + reviewNum);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}

			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += "  location.href='" + multipartRequest.getContextPath() + "/mypage_14.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO_review + "\\" + "temp" + "\\" + reviewFile);
			srcFile.delete();

			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해주세요');";
			message += "  location.href='" + multipartRequest.getContextPath() + "/mypage/reviewWrite.do?productNum="
					+ productNum + "&memOrderSeqNum=" + memOrderSeqNum + "';";

			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	private String uploadReview(MultipartHttpServletRequest multipartRequest) throws Exception {
		String reviewFile = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();

			MultipartFile mFile = multipartRequest.getFile(fileName);
			reviewFile = mFile.getOriginalFilename();
			File file = new File(ARTICLE_IMAGE_REPO_review + "\\" + "temp" + "\\" + fileName);
			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(ARTICLE_IMAGE_REPO_review + "\\" + "temp" + "\\" + reviewFile));// 임시로
																												// 저장되
																												// multipartFile을
																												// 실제
																												// 파일로
																												// 전송

				}
			}
		}
		return reviewFile;

	}

	@RequestMapping(value = "/mypage/modReview.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView reviewForm(@RequestParam("reviewNum") int reviewNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memName = memberVO.getmemName();
		String viewName = (String) request.getAttribute("viewName");
		mypageVO = mypageService.reviewForm(reviewNum);
		mypageVO.setMemName(memName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("reviewNum", mypageVO);

		return mav;
	}

	@RequestMapping(value = "/mypage/modNewReview.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity modReview(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> reviewMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			reviewMap.put(name, value);

		}

		String reviewFile = uploadReview(multipartRequest);
		reviewMap.put("reviewFile", reviewFile);

		String reviewNum = (String) reviewMap.get("reviewNum");
		reviewMap.put("reviewNum", reviewNum);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {

			mypageService.modReview(reviewMap);

			if (reviewFile != null && reviewFile.length() != 0) {
				String OrignReviewFile = (String) reviewMap.get("OrignReviewFile");

				File oldFile = new File(ARTICLE_IMAGE_REPO_review + "\\" + reviewNum + "\\" + OrignReviewFile);
				oldFile.delete();

				File srcFile = new File(ARTICLE_IMAGE_REPO_review + "\\" + "temp" + "\\" + reviewFile);
				File destDir = new File(ARTICLE_IMAGE_REPO_review + "\\" + reviewNum);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);

			}
			message = "<script>";
			message += " alert('리뷰를 수정했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/mypage_14.do" + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO_review + "\\" + "temp" + "\\" + reviewFile);
			srcFile.delete();
			message = "<script>";
			message += " alert('오류가 발생했습니다.다시 수정해주세요');";
			message += " location.href='" + multipartRequest.getContextPath() + "/mypage/modReview.do?reviewNum="
					+ reviewNum + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}

	@Override
	@RequestMapping(value = "/mypage/removeReview.do", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity removeReview(@RequestParam("reviewNum") int reviewNum,
			@RequestParam("memOrderSeqNum") int memOrderSeqNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		response.setContentType("text/html; charset-utf-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		Map<String, Object> reviewMap = new HashMap<String, Object>();
		reviewMap.put("reviewNum", reviewNum);
		reviewMap.put("memOrderSeqNum", memOrderSeqNum);
		try {
			mypageService.removeReview(reviewMap);
			File destDir = new File(ARTICLE_IMAGE_REPO_review + "\\" + reviewNum);
			FileUtils.deleteDirectory(destDir);

			message = "<script>";
			message += " alert('리뷰를 삭제했습니다.');";
			message += " location.href='" + request.getContextPath() + "/mypage_14.do" + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 삭제해주세요.);";
			message += " location.href='" + request.getContextPath() + "/mypage_14.do" + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;

	}

	@Override
	@RequestMapping(value = "/mypage_07.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listMypageReturn(Criteria cri, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		// 기존 memOrderSeqNum, productNum 세션 해제
		if (session.getAttribute("memOrderSeqNum") != null && session.getAttribute("productNum") != null) {
			session.removeAttribute("memOrderSeqNum");
			session.removeAttribute("productNum");
		}
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memId = memberVO.getmemId();
		productVO.setMemId(memId);
		System.out.println(memId);

		Map<String, Object> mypageReturnMap = new HashMap<String, Object>();
		int pageStart = cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		mypageReturnMap.put("memId", memId);
		mypageReturnMap.put("pageStart", pageStart);
		mypageReturnMap.put("perPageNum", perPageNum);
		mypageReturnMap = mypageService.listMypageReturn(mypageReturnMap);
		int mypageReturnCount = mypageService.mypageReturnCount(memId);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int pageNum = pageMaker.getCri().getPage();
		mypageReturnMap.put("pageNum", pageNum);
		pageMaker.setTotalCount(mypageReturnCount);
		mav.addObject("mypageReturnMap", mypageReturnMap);
		mav.addObject("pageMaker", pageMaker);
		return mav;

	}
	
	//날짜로 반품 조회
	@Override
	@RequestMapping(value = "/mypage/returnSearch.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView returnSearch(@RequestParam("search1") String search1, @RequestParam("search2") String search2,
			Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memId = memberVO.getmemId();
		mypageVO.setMemId(memId);

		Map<String, Object> returnSearchMap = new HashMap<String, Object>();
		int pageStart = cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		returnSearchMap.put("pageStart", pageStart);
		returnSearchMap.put("perPageNum", perPageNum);
		returnSearchMap.put("search1", search1);
		returnSearchMap.put("search2", search2);
		returnSearchMap.put("memId", memId);
		returnSearchMap = mypageService.returnSearch(returnSearchMap);
		int returnSearchCount = mypageService.returnSearchCount(returnSearchMap);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int pageNum = pageMaker.getCri().getPage();
		returnSearchMap.put("pageNum", pageNum);
		pageMaker.setTotalCount(returnSearchCount);
		mav.addObject("returnSearchMap", returnSearchMap);
		session.setAttribute("pageMaker", pageMaker);
		session.setAttribute("pageNum", pageNum);
		System.out.println(returnSearchMap);
		
		return mav;

	}

	@RequestMapping(value = "/mypage/returnWrite.do", method = RequestMethod.GET)
	private ModelAndView ReturnWrite(@RequestParam("memOrderSeqNum") int memOrderSeqNum,
			@RequestParam("productNum") String productNum, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession session = request.getSession();

		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memName = memberVO.getmemName();
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		session.setAttribute("memOrderSeqNum", memOrderSeqNum);
		session.setAttribute("productNum", productNum);
		mav.addObject("memName", memName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/mypage/addNewReturn.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewRetrun(Criteria cri, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		request.setCharacterEncoding("utf-8");
		Map<String, Object> returnMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			returnMap.put(name, value);
		}

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		int memOrderSeqNum = (Integer) session.getAttribute("memOrderSeqNum");
		String productNum = (String) session.getAttribute("productNum");
		String memId = memberVO.getmemId();

		returnMap.put("memId", memId);
		returnMap.put("memOrderSeqNum", memOrderSeqNum);
		returnMap.put("productNum", productNum);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			mypageService.addNewReturn(returnMap);

			message = "<script>";
			message += " alert('반품신청이 완료되었습니다.');";
			message += "  location.href='" + request.getContextPath() + "/mypage_07.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {

			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해주세요');";
			message += "  location.href='" + request.getContextPath() + "/mypage/returnWrite.do?productNum="
					+ productNum + "&memOrderSeqNum=" + memOrderSeqNum + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	@RequestMapping(value = "/mypage/viewReturn.do", method = RequestMethod.GET)
	public ModelAndView viewReturn(@RequestParam("returnNum") int returnNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memId = memberVO.getmemId();
		mypageVO.setMemId(memId);
		mypageVO = mypageService.viewReturn(returnNum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("returnNum", mypageVO);
		return mav;
	}

	@RequestMapping(value = "/mypage/modNewReturn.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity modReturn(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> returnMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			returnMap.put(name, value);

		}

		String returnNum = (String) returnMap.get("returnNum");
		returnMap.put("returnNum", returnNum);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {

			mypageService.modReturn(returnMap);

			message = "<script>";
			message += " alert('반품신청을 수정했습니다.');";
			message += " location.href='" + request.getContextPath() + "/mypage_07.do" + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 발생했습니다.다시 수정해주세요');";
			message += " location.href='" + request.getContextPath() + "/mypage/viewReturn.do?returnNum=" + returnNum
					+ "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}

	@Override
	@RequestMapping(value = "/mypage/removeReturn.do", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity removeReturn(@RequestParam("returnNum") int returnNum, @RequestParam("memOrderSeqNum") int memOrderSeqNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		response.setContentType("text/html; charset-utf-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("returnNum", returnNum);
		returnMap.put("memOrderSeqNum", memOrderSeqNum);
		try {
			
			mypageService.removeReturn(returnMap);

			message = "<script>";
			message += " alert('리뷰를 삭제했습니다.');";
			message += " location.href='" + request.getContextPath() + "/mypage_07.do" + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 삭제해주세요.);";
			message += " location.href='" + request.getContextPath() + "/mypage/viewReturn.do?returnNum=" + returnNum
					+ "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;

	}

}