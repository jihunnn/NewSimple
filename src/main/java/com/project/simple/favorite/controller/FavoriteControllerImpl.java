package com.project.simple.favorite.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.simple.favorite.service.FavoriteService;
import com.project.simple.favorite.vo.FavoriteVO;
import com.project.simple.member.vo.MemberVO;

@Controller("favoriteController")
public class FavoriteControllerImpl implements FavoriteController {

	@Autowired
	private FavoriteService favoriteService;
	@Autowired
	private FavoriteVO favoriteVO;
	@Autowired
	private MemberVO memberVO;

	@RequestMapping(value = "/mypage_08.do", method = RequestMethod.GET)
	public ModelAndView myFavoriteMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memId = memberVO.getmemId();
		favoriteVO.setmemId(memId);
		// System.out.println(memId);

		Map<String, List> favoriteMap = favoriteService.myFavoriteList(favoriteVO);// 관심 상품페이지에 표시할 상품 정보를 조회
		System.out.println(favoriteMap);

		session.setAttribute("favoriteMap", favoriteMap);// 관심 상품 목록을 세션에 저장한다.
		// mav.addObject("favoriteMap", favoriteMap);
		return mav;
	}

	@RequestMapping(value = "/addProductInFavorite.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String addProductInFavorite(@RequestParam("productNum") String productNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memId = memberVO.getmemId();

		favoriteVO.setmemId(memId);
		// 관심 상품에 등록된 상품인지 판별
		favoriteVO.setproductNum(productNum);
		boolean isAreadyExisted = favoriteService.findFavoriteProduct(favoriteVO); // 상품번호가 관심상품테이블에 있는지 조회
		// System.out.println("isAreadyExisted:"+isAreadyExisted);
		if (isAreadyExisted == true) {// 상품 번호가 이미 관심상품 테이블에 있으면 이미 추가되었다는 메시지 전송		
			favoriteService.removeFavorite(favoriteVO);//상품 상세페이지에서 찜 제거
			return "already_existed";
		} else {// 없으면 관심상품 테이블에 추가
			favoriteService.addProductInFavorite(favoriteVO);
			return "add_success";
		}
	}

	@RequestMapping(value = "/removeFavoriteProduct.do", method = RequestMethod.POST)
	public ModelAndView removeFavoriteProduct(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memId = memberVO.getmemId();
		Map<String,Object> map = new HashMap();
	
				
		ModelAndView mav = new ModelAndView();
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for (int i = 0; i < size; i++) {
			map.put("productNum", ajaxMsg[i]);
			map.put("memId", memId);
			favoriteService.removeFavoriteProduct(map);
		}

		mav.setViewName("redirect:/mypage_08.do");
		return mav;
	}

	@RequestMapping(value = "/favoriteInquiry.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String favoritInquiry(@RequestParam("productNum") String productNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memId = memberVO.getmemId();

		favoriteVO.setmemId(memId);
		// 관심 상품에 등록된 상품인지 판별
		favoriteVO.setproductNum(productNum);
		
		boolean isAreadyExisted = favoriteService.findFavoriteProduct(favoriteVO); // 상품번호가 관심상품테이블에 있는지 조회
		// System.out.println("isAreadyExisted:"+isAreadyExisted);
		if (isAreadyExisted == true) {// 상품 번호가 이미 관심상품 테이블에 있으면 이미 추가되었다는 메시지 전송
			return "already_existed";
		} else {// 없으면 존재하지 않는다는 메세지 전송			
			return "not_existed";
		}
	}
	@RequestMapping(value = "/favoriteCount.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String favoriteCount(@RequestParam("productNum") String productNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int favoriteCount = favoriteService.favoriteCount(productNum); // 상품번호가 관심상품테이블에 있는지 조회
		 String fvaoriteCount1 = Integer.toString(favoriteCount);
		return fvaoriteCount1;
		
	}


}
