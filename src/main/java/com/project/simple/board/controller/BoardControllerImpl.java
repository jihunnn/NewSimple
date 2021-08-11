package com.project.simple.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

import com.project.simple.board.service.BoardService;
import com.project.simple.board.vo.ImageVO;
import com.project.simple.board.vo.ArticleVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.PageMaker;
import com.project.simple.page.Criteria;

@Controller("boardController")
public class BoardControllerImpl implements BoardController {
	private static final String ARTICLE_IMAGE_REPO_inquiry = "C:\\spring\\inquiry_image";
	private static final String ARTICLE_IMAGE_REPO_asCenter = "C:\\spring\\asCenter_image";;

	@Autowired
	private BoardService boardService;
	@Autowired
	private ArticleVO articleVO;

	@Autowired
	private MemberVO memberVO;

	@Autowired
	BCryptPasswordEncoder pwdEncoder;

	// 공지사항 리스트
	@Override
	@RequestMapping(value = "board/listNotice.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listNotice(Criteria cri, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<ArticleVO> noticeList = boardService.listNotice(cri);
		int noticeCount = boardService.noticeCount();
		ModelAndView mav = new ModelAndView(viewName);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(noticeCount);
		mav.addObject("noticeList", noticeList);
		mav.addObject("pageMaker", pageMaker);

		return mav;
	}

	// 공지사항 상세보기
	@RequestMapping(value = "/board/viewNotice.do", method = RequestMethod.GET)
	public ModelAndView viewNotice(@RequestParam("noticeNum") int noticeNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		articleVO = boardService.viewNotice(noticeNum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("notice", articleVO);
		return mav;
	}

	// 자주묻는 질문 리스트
	@Override
	@RequestMapping(value = "board/listQuestion.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listQuestion(Criteria cri, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<ArticleVO> questionList = boardService.listQuestion(cri);
		int questionCount = boardService.questionCount();
		ModelAndView mav = new ModelAndView(viewName);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(questionCount);
		int pageNum = pageMaker.getCri().getPage();
		mav.addObject("questionList", questionList);
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("pageNum", pageNum);
		return mav;
	}

	@Override
	@RequestMapping(value = "/board/questionSearch.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView questionSearch(@RequestParam("search") String search, Criteria cri, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		Map<String, Object> questionSearchMap = new HashMap<String, Object>();
		int pageStart = cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		questionSearchMap.put("pageStart", pageStart);
		questionSearchMap.put("perPageNum", perPageNum);
		questionSearchMap.put("search", search);
		questionSearchMap = boardService.questionSearch(questionSearchMap);
		int questionSearchCount = boardService.questionSearchCount(search);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int pageNum = pageMaker.getCri().getPage();
		questionSearchMap.put("pageNum", pageNum);
		pageMaker.setTotalCount(questionSearchCount);

		mav.addObject("questionSearchMap", questionSearchMap);
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("pageNum", pageNum);
		return mav;

	}

	// 1:1문의 리스트
	@Override
	@RequestMapping(value = "/board/listInquiry.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listInquiry(Criteria cri, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memId = memberVO.getmemId();
		articleVO.setmemId(memId);

		Map<String, Object> inquiryMap = new HashMap<String, Object>();
		int pageStart = cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		inquiryMap.put("memId", memId);
		inquiryMap.put("pageStart", pageStart);
		inquiryMap.put("perPageNum", perPageNum);
		inquiryMap = boardService.listInquiry(inquiryMap);
		int inquiryCount = boardService.inquiryCount(memId);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int pageNum = pageMaker.getCri().getPage();
		inquiryMap.put("pageNum", pageNum);
		pageMaker.setTotalCount(inquiryCount);
		session.setAttribute("inquiryMap", inquiryMap);
		session.setAttribute("pageMaker", pageMaker);
		mav.addObject("pageNum", pageNum);
		return mav;

	}

	@Override
	@RequestMapping(value = "/board/inquirySearch.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView inquirySearch(@RequestParam("search1") String search1, @RequestParam("search2") String search2,
			Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception {
		int inquirySearchCount;
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		HttpSession session = request.getSession();

		if (session.getAttribute("member") != null) {
			MemberVO memberVO = (MemberVO) session.getAttribute("member");
		}
		String memId = memberVO.getmemId();
		articleVO.setmemId(memId);

		Map<String, Object> inquirySearchMap = new HashMap<String, Object>();
		int pageStart = cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		inquirySearchMap.put("pageStart", pageStart);
		inquirySearchMap.put("perPageNum", perPageNum);
		inquirySearchMap.put("search1", search1);
		inquirySearchMap.put("search2", search2);
		inquirySearchMap.put("memId", memId);
		if (session.getAttribute("admin") != null) {
			inquirySearchMap = boardService.adminInquirySearch(inquirySearchMap);
			inquirySearchCount = boardService.adminInquirySearchCount(inquirySearchMap);
		} else {
			inquirySearchMap = boardService.inquirySearch(inquirySearchMap);
			inquirySearchCount = boardService.inquirySearchCount(inquirySearchMap);
		}
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int pageNum = pageMaker.getCri().getPage();
		inquirySearchMap.put("pageNum", pageNum);
		pageMaker.setTotalCount(inquirySearchCount);
		mav.addObject("inquirySearchMap", inquirySearchMap);
		session.setAttribute("pageMaker", pageMaker);
		session.setAttribute("pageNum", pageNum);

		return mav;

	}

	// 1:1문의 글쓰기 폼, A/S 글쓰기 폼, AS비밀번호 입력
	@RequestMapping(value = "/board/*Form.do", method = RequestMethod.GET)
	private ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	// 1:1문의 글쓰기
	@Override
	@RequestMapping(value = "/board/addNewInquiry.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewInquiry(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {

		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> inquiryMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			inquiryMap.put(name, value);

		}

		String inquiryFile = upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memId = memberVO.getmemId();
		inquiryMap.put("inquiryNum", 0);
		inquiryMap.put("memId", memId);
		inquiryMap.put("inquiryFile", inquiryFile);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int inquiryNum = boardService.addNewInquiry(inquiryMap);
			if (inquiryFile != null && inquiryFile.length() != 0) {
				File srcFile = new File(ARTICLE_IMAGE_REPO_inquiry + "\\" + "temp" + "\\" + inquiryFile);
				File destDir = new File(ARTICLE_IMAGE_REPO_inquiry + "\\" + inquiryNum);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}

			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += "  location.href='" + multipartRequest.getContextPath() + "/board/listInquiry.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO_inquiry + "\\" + "temp" + "\\" + inquiryFile);
			srcFile.delete();

			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해주세요');";
			message += "  location.href='" + multipartRequest.getContextPath() + "/board/inquiryForm.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		String inquiryFile = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();

			MultipartFile mFile = multipartRequest.getFile(fileName);
			inquiryFile = mFile.getOriginalFilename();
			File file = new File(ARTICLE_IMAGE_REPO_inquiry + "\\" + "temp" + "\\" + fileName);
			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(ARTICLE_IMAGE_REPO_inquiry + "\\" + "temp" + "\\" + inquiryFile));// 임시로
																												// 저장되
																												// multipartFile을
																												// 실제
																												// 파일로
																												// 전송

				}
			}
		}
		return inquiryFile;

	}

	// 1:1문의 상세보기
	@RequestMapping(value = "/board/viewInquiry.do", method = RequestMethod.GET)
	public ModelAndView viewInquiry(@RequestParam("inquiryNum") int inquiryNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String search1 = request.getParameter("search1");
		String search2 = request.getParameter("search2");
		String pageNum = request.getParameter("pageNum");
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		if (session.getAttribute("member") != null) {
			MemberVO memberVO = (MemberVO) session.getAttribute("member");
			String memId = memberVO.getmemId();
			articleVO.setmemId(memId);
		}
		articleVO = boardService.viewInquiry(inquiryNum);

		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		if (search1 != null) {
			mav.addObject("search1", search1);
			mav.addObject("search2", search2);
			mav.addObject("pageNum", pageNum);
		}
		mav.addObject("inquiry", articleVO);
		return mav;
	}

	@RequestMapping(value = "/board/modInquiry.do", method = RequestMethod.POST)
	public ModelAndView inquiryForm(@RequestParam("inquiryNum") int inquiryNum,
			MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {

		String viewName = (String) multipartRequest.getAttribute("viewName");
		articleVO = boardService.inquiryForm(inquiryNum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("inquiryNum", articleVO);

		return mav;
	}

	@RequestMapping(value = "/board/modNewInquiry.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity modInquiry(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {

		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> inquiryMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			inquiryMap.put(name, value);

		}

		String inquiryFile = upload(multipartRequest);
		inquiryMap.put("inquiryFile", inquiryFile);

		String inquiryNum = (String) inquiryMap.get("inquiryNum");
		inquiryMap.put("inquiryNum", inquiryNum);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {

			boardService.modInquiry(inquiryMap);
			if (inquiryFile != null && inquiryFile.length() != 0) {
				String OrignInquiryFile = (String) inquiryMap.get("OrignInquiryFile");

				File oldFile = new File(ARTICLE_IMAGE_REPO_inquiry + "\\" + inquiryNum + "\\" + OrignInquiryFile);
				oldFile.delete();

				File srcFile = new File(ARTICLE_IMAGE_REPO_inquiry + "\\" + "temp" + "\\" + inquiryFile);
				File destDir = new File(ARTICLE_IMAGE_REPO_inquiry + "\\" + inquiryNum);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);

			}
			message = "<script>";
			message += " alert('글을 수정했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/viewInquiry.do?inquiryNum="
					+ inquiryNum + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO_inquiry + "\\" + "temp" + "\\" + inquiryFile);
			srcFile.delete();
			message = "<script>";
			message += " alert('오류가 발생했습니다.다시 수정해주세요');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/viewInquiry.do?inquiryNum="
					+ inquiryNum + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}

	// 1:1문의 삭제하기
	@Override
	@RequestMapping(value = "/board/removeInquiry.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeInquiry(@RequestParam("inquiryNum") int inquiryNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		response.setContentType("text/html; charset-utf-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			boardService.removeInquiry(inquiryNum);
			File destDir = new File(ARTICLE_IMAGE_REPO_inquiry + "\\" + inquiryNum);
			FileUtils.deleteDirectory(destDir);

			message = "<script>";
			message += " location.href='" + request.getContextPath() + "/board/listInquiry.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 수정해주세요);";
			message += " location.href='" + request.getContextPath() + "/board/viewInquiry.do?inquiryNum=" + inquiryNum
					+ "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;

	}

	// AS센터
	@Override
	@RequestMapping(value = "board/listAsCenter.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listAscenter(Criteria cri, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<ArticleVO> asCenterList = boardService.listAsCenter(cri);
		int asCenterCount = boardService.asCenterCount();

		ModelAndView mav = new ModelAndView(viewName);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(asCenterCount);
		int pageNum = pageMaker.getCri().getPage();

		mav.addObject("pageNum", pageNum);
		mav.addObject("asCenterList", asCenterList);
		mav.addObject("pageMaker", pageMaker);

		return mav;
	}

	@RequestMapping(value = "/board/viewAsCenter.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView viewAsCenter(@RequestParam("asCenterNum") int asCenterNum, HttpServletRequest request,
			HttpServletResponse response, RedirectAttributes redirectAttributes) throws Exception {
		String asCenterPwdConfirm = request.getParameter("asCenterPwdConfirm");
		ModelAndView mav = new ModelAndView();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		articleVO = boardService.viewAsCenter(asCenterNum);
		String asCenterPwd = articleVO.getAsCenterPwd();
		HttpSession session1 = request.getSession();
		if (session1.getAttribute("admin") != null) {

			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			mav.addObject("asCenter", articleVO);
		}

		else {
			boolean pwdMatch = pwdEncoder.matches(asCenterPwdConfirm, asCenterPwd);
			if (pwdMatch == true) {
				String viewName = (String) request.getAttribute("viewName");
				mav.setViewName(viewName);
				mav.addObject("asCenter", articleVO);
				HttpSession session = request.getSession();
				session.setAttribute("asCenterPwdConfirm", asCenterPwdConfirm);
			} else {
				redirectAttributes.addAttribute("asCenterNum", asCenterNum);
				out.println("<script>");
				out.println("alert('비밀번호가 일치하지 않습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
			}

			return mav;
		}
		return mav;
	}

	// AS 센터 비밀번호 체크
	@RequestMapping(value = "/board/pwdConfirm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView pwdConfirm(@RequestParam("asCenterNum") int asCenterNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session1 = request.getSession();

		if (session1.getAttribute("asCenterPwdConfirm") != null ) {
			session1.removeAttribute("asCenterPwdConfirm");
		}
		
		if(session1.getAttribute("admin") != null) {
			mav.setViewName("redirect:/board/viewAsCenter.do?asCenterNum="+asCenterNum);
			return mav;
		}
		
		String pageNum = request.getParameter("page");

		HttpSession session = request.getSession();
		session.setAttribute("asCenterNum", asCenterNum);
		session.setAttribute("pageNum", pageNum);

		return mav;
	}

	@RequestMapping(value = "/board/asCenterWrite.do", method = RequestMethod.GET)
	private ModelAndView asCenterWrite(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// asCenter글쓰기시 asCenterNum 세션 해제
		HttpSession session = request.getSession();
		if (session.getAttribute("asCenterNum") != null) {
			session.removeAttribute("asCenterNum");
		}
		
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memName = memberVO.getmemName();

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("memName", memName);
		return mav;
	}

	// a/s센터 글쓰기
	@Override
	@RequestMapping(value = "/board/addNewAsCenter.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewAsCenter(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {

		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> asCenterMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			asCenterMap.put(name, value);

		}

		String asCenterFile = uploadAsCenter(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memId = memberVO.getmemId();
		String asCenterPwd = multipartRequest.getParameter("asCenterPwd");
		String asCenterPwd1 = pwdEncoder.encode(asCenterPwd);
		asCenterMap.put("asCenterNum", 0);
		asCenterMap.put("memId", memId);
		asCenterMap.put("asCenterPwd", asCenterPwd1);
		asCenterMap.put("asCenterFile", asCenterFile);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int asCenterNum = boardService.addNewAsCenter(asCenterMap);
			if (asCenterFile != null && asCenterFile.length() != 0) {
				File srcFile = new File(ARTICLE_IMAGE_REPO_asCenter + "\\" + "temp" + "\\" + asCenterFile);
				File destDir = new File(ARTICLE_IMAGE_REPO_asCenter + "\\" + asCenterNum);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}

			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += "  location.href='" + multipartRequest.getContextPath() + "/board/listAsCenter.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO_asCenter + "\\" + "temp" + "\\" + asCenterFile);
			srcFile.delete();

			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해주세요');";
			message += "  location.href='" + multipartRequest.getContextPath() + "/board/asCenterWrite.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	private String uploadAsCenter(MultipartHttpServletRequest multipartRequest) throws Exception {
		String asCenterFile = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();

			MultipartFile mFile = multipartRequest.getFile(fileName);
			asCenterFile = mFile.getOriginalFilename();
			File file = new File(ARTICLE_IMAGE_REPO_asCenter + "\\" + "temp" + "\\" + fileName);
			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(ARTICLE_IMAGE_REPO_asCenter + "\\" + "temp" + "\\" + asCenterFile));// 임시로
																													// 저장되
																													// multipartFile을
																													// 실제
																													// 파일로
																													// 전송

				}
			}
		}
		return asCenterFile;

	}

	@RequestMapping(value = "/board/modAsCenter.do", method = RequestMethod.POST)
	public ModelAndView asCenterForm(@RequestParam("asCenterNum") int asCenterNum,
			MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {

		String viewName = (String) multipartRequest.getAttribute("viewName");
		articleVO = boardService.viewAsCenter(asCenterNum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("asCenter", articleVO);

		return mav;
	}

	@RequestMapping(value = "/board/modNewAsCenter.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity modAsCenter(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {

		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> asCenterMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			asCenterMap.put(name, value);

		}

		String asCenterFile = uploadAsCenter(multipartRequest);
		asCenterMap.put("asCenterFile", asCenterFile);

		String asCenterPwd = multipartRequest.getParameter("asCenterPwd");
		String asCenterPwd1 = pwdEncoder.encode(asCenterPwd);
		asCenterMap.put("asCenterPwd", asCenterPwd1);

		String asCenterNum = (String) asCenterMap.get("asCenterNum");
		asCenterMap.put("asCenterNum", asCenterNum);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {

			boardService.modAsCenter(asCenterMap);
			if (asCenterFile != null && asCenterFile.length() != 0) {
				String OrignAsCenterFile = (String) asCenterMap.get("OrignAsCenterFile");

				File oldFile = new File(ARTICLE_IMAGE_REPO_asCenter + "\\" + asCenterNum + "\\" + OrignAsCenterFile);
				oldFile.delete();

				File srcFile = new File(ARTICLE_IMAGE_REPO_asCenter + "\\" + "temp" + "\\" + asCenterFile);
				File destDir = new File(ARTICLE_IMAGE_REPO_asCenter + "\\" + asCenterNum);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);

			}
			message = "<script>";
			message += " alert('글을 수정했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/viewAsCenter.do?asCenterNum="
					+ asCenterNum + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO_asCenter + "\\" + "temp" + "\\" + asCenterFile);
			srcFile.delete();
			message = "<script>";
			message += " alert('오류가 발생했습니다.다시 수정해주세요');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/viewAsCenter.do?asCenterNum="
					+ asCenterNum + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}

	@Override
	@RequestMapping(value = "/board/removeAsCenter.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeAsCenter(@RequestParam("asCenterNum") int asCenterNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		response.setContentType("text/html; charset-utf-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			boardService.removeAsCenter(asCenterNum);
			File destDir = new File(ARTICLE_IMAGE_REPO_asCenter + "\\" + asCenterNum);
			FileUtils.deleteDirectory(destDir);

			message = "<script>";
			message += " location.href='" + request.getContextPath() + "/board/listAsCenter.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 수정해주세요);";
			message += " location.href='" + request.getContextPath() + "/board/viewAsCenter.do?asCenterNum="
					+ asCenterNum + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;

	}

	@Override
	@RequestMapping(value = "/board/asCenterSearch.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView asCenterSearch(@RequestParam("search") String search,
			@RequestParam("searchType") String searchType, Criteria cri, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		Map<String, Object> asCenterSearchMap = new HashMap<String, Object>();
		int pageStart = cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		asCenterSearchMap.put("pageStart", pageStart);
		asCenterSearchMap.put("perPageNum", perPageNum);
		asCenterSearchMap.put("search", search);
		asCenterSearchMap.put("searchType", searchType);
		asCenterSearchMap = boardService.asCenterSearch(asCenterSearchMap);
		int asCenterSearchCount = boardService.asCenterSearchCount(asCenterSearchMap);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int pageNum = pageMaker.getCri().getPage();
		asCenterSearchMap.put("pageNum", pageNum);
		pageMaker.setTotalCount(asCenterSearchCount);
		mav.addObject("asCenterSearchMap", asCenterSearchMap);
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("pageNum", pageNum);

		return mav;

	}

}