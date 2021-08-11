package com.project.simple.product.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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

import com.project.simple.board.vo.ArticleVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;
import com.project.simple.page.PageMaker;
import com.project.simple.product.page.Criteria1;
import com.project.simple.product.page.Criteria2;
import com.project.simple.product.page.PageMaker1;
import com.project.simple.product.page.PageMaker2;
import com.project.simple.product.service.ProductService;
import com.project.simple.product.vo.ProductVO;

@Controller("productController")

public class ProductControllerImpl implements ProductController {
	private static final String ARTICLE_IMAGE_REPO = "C:\\spring\\product_image";
	private static final String ARTICLE_IMAGE_REPO_review = "C:\\spring\\review_image";
	@Autowired
	private ProductService productService;
	@Autowired
	private ProductVO productVO;
	private static final Logger logger = LoggerFactory.getLogger(ProductControllerImpl.class);
	
	
	@Override // 메인 best상품 조회
	@RequestMapping(value = "/main.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		Map<String ,List> BestProductMap= productService.BestProductList();
		System.out.println(BestProductMap);
		mav.addObject("BestProductMap", BestProductMap);
		return mav;
	}

	

	@Override //상품등록하기
	@RequestMapping(value="product/addProduct.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addProduct(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)throws Exception{
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> productMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			productMap.put(name, value);


		}
	

		List<String> productImage1 = upload(multipartRequest);
		String productImage = productImage1.get(0).toString();
		String productContentImage = productImage1.get(1).toString();
		productMap.put("productImage", productImage);
		productMap.put("productContentImage", productContentImage);

		//HttpSession session = multipartRequest.getSession();
		//MemberVO memberVO = (MemberVO) session.getAttribute("member");
		//String memId = memberVO.getmemId();
		
		//inquiryMap.put("memId", memId);

		String productNum = (String) productMap.get("productNum");


		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {

			if (productImage1 != null && productImage1.size() != 0) {
				Iterator<String> it = productImage1.iterator();
				while(it.hasNext()) {
					String productImg =it.next();
					File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + productImg);
					File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + productNum);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
					
			
				}

			productService.addProduct(productMap);	
			
			
			

			}

			message = "<script>";
			message += " alert('상품 등록이 완료되었습니다.');";
			message += "  location.href='" + multipartRequest.getContextPath() + "/product/admin_listProduct.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			Iterator<String> it = productImage1.iterator();
			while(it.hasNext()) {
				String productImg =it.next();
				File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + productImg);
				srcFile.delete();
			}

			

			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해주세요');";
			message += "  location.href='" + multipartRequest.getContextPath() + "/product/add_product.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	private List<String> upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		String productImage = null;
		List<String> product = new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();

			MultipartFile mFile = multipartRequest.getFile(fileName);
			productImage = mFile.getOriginalFilename();
			File file = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + fileName);
			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + productImage));// 임시로 저장되 multipartFile을 실제 파일로 전송
					product.add(productImage);
																							
				}
					
				
			}
		}
		return product;

	}

	// 상품추가뷰
	@RequestMapping(value = "product/add_product.do", method = RequestMethod.GET)
	private ModelAndView add_product(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		List<String> optionName = productService.selectOptionName();

		mav.addObject("optionName", optionName);

		return mav;
	}

	@Override // 상품목록 조회
	@RequestMapping(value = "product/listProduct.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listProduct(@RequestParam("sort") String sort, @RequestParam("subsort") String subsort,
			@RequestParam("filter") String filter, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> ProductMap = new HashMap<String, Object>();

		// -------------------------침대카테고리--------------------------------------
		if ("침대".equals(sort)) {
			if ("x".equals(subsort)) {
				if ("x".equals(filter)) {
					ProductMap.put("sort", sort);
					ProductMap.put("subsort", subsort);
					ProductMap.put("filter", filter);
					List<ProductVO> productList = productService.listProduct(ProductMap);
					mav.addObject("productList", productList);
					mav.setViewName("product/listProduct_bed");
				} else if (filter != null) {
					ProductMap.put("sort", sort);
					ProductMap.put("subsort", subsort);
					ProductMap.put("filter", filter);
					List<ProductVO> productList = productService.listProduct(ProductMap);
					mav.addObject("productList", productList);
					mav.setViewName("product/listProduct_bed");
				}
			}
		}
		if ("침대".equals(sort) && subsort != null) {
			if ("x".equals(filter)) {
				ProductMap.put("sort", sort);
				ProductMap.put("subsort", subsort);
				ProductMap.put("filter", filter);
				List<ProductVO> productList = productService.listProduct(ProductMap);
				mav.addObject("productList", productList);
				mav.setViewName("product/listProduct_bed");
			} else if (filter != null) {
				ProductMap.put("sort", sort);
				ProductMap.put("subsort", subsort);
				ProductMap.put("filter", filter);
				List<ProductVO> productList = productService.listProduct(ProductMap);
				mav.addObject("productList", productList);
				mav.setViewName("product/listProduct_bed");
			}
		}

		// -------------------소파카테고리------------------------------------------------
		if ("소파".equals(sort)) {
			if ("x".equals(subsort)) {
				if ("x".equals(filter)) {
					ProductMap.put("sort", sort);
					ProductMap.put("subsort", subsort);
					ProductMap.put("filter", filter);
					List<ProductVO> productList = productService.listProduct(ProductMap);
					mav.addObject("productList", productList);
					mav.setViewName("product/listProduct_sofa");
				} else if (filter != null) {
					ProductMap.put("sort", sort);
					ProductMap.put("subsort", subsort);
					ProductMap.put("filter", filter);
					List<ProductVO> productList = productService.listProduct(ProductMap);
					mav.addObject("productList", productList);
					mav.setViewName("product/listProduct_sofa");
				}
			}
		}
		if ("소파".equals(sort) && subsort != null) {
			if ("x".equals(filter)) {
				ProductMap.put("sort", sort);
				ProductMap.put("subsort", subsort);
				ProductMap.put("filter", filter);
				List<ProductVO> productList = productService.listProduct(ProductMap);
				mav.addObject("productList", productList);
				mav.setViewName("product/listProduct_sofa");
			} else if (filter != null) {
				ProductMap.put("sort", sort);
				ProductMap.put("subsort", subsort);
				ProductMap.put("filter", filter);
				List<ProductVO> productList = productService.listProduct(ProductMap);
				mav.addObject("productList", productList);
				mav.setViewName("product/listProduct_sofa");
			}
		}
		// -------------------화장대/옷장/수납 카테고리----------------------------

		if ("화장대/옷장/수납".equals(sort)) {
			if ("x".equals(subsort)) {
				if ("x".equals(filter)) {
					ProductMap.put("sort", sort);
					ProductMap.put("subsort", subsort);
					ProductMap.put("filter", filter);
					List<ProductVO> productList = productService.listProduct(ProductMap);
					mav.addObject("productList", productList);
					mav.setViewName("product/listProduct_wardrobe");
				} else if (filter != null) {
					ProductMap.put("sort", sort);
					ProductMap.put("subsort", subsort);
					ProductMap.put("filter", filter);
					List<ProductVO> productList = productService.listProduct(ProductMap);
					mav.addObject("productList", productList);
					mav.setViewName("product/listProduct_wardrobe");
				}
			}
		}
		if ("화장대/옷장/수납".equals(sort) && subsort != null) {
			if ("x".equals(filter)) {
				ProductMap.put("sort", sort);
				ProductMap.put("subsort", subsort);
				ProductMap.put("filter", filter);
				List<ProductVO> productList = productService.listProduct(ProductMap);
				mav.addObject("productList", productList);
				mav.setViewName("product/listProduct_wardrobe");
			} else if (filter != null) {
				ProductMap.put("sort", sort);
				ProductMap.put("subsort", subsort);
				ProductMap.put("filter", filter);
				List<ProductVO> productList = productService.listProduct(ProductMap);
				mav.addObject("productList", productList);
				mav.setViewName("product/listProduct_wardrobe");
			}
		}
		
		//-------------------식탁/의자-----------------------------------------
		if ("식탁/의자".equals(sort)) {
			if ("x".equals(subsort)) {
				if ("x".equals(filter)) {
					ProductMap.put("sort", sort);
					ProductMap.put("subsort", subsort);
					ProductMap.put("filter", filter);
					List<ProductVO> productList = productService.listProduct(ProductMap);
					mav.addObject("productList", productList);
					mav.setViewName("product/listProduct_table01");
				} else if (filter != null) {
					ProductMap.put("sort", sort);
					ProductMap.put("subsort", subsort);
					ProductMap.put("filter", filter);
					List<ProductVO> productList = productService.listProduct(ProductMap);
					mav.addObject("productList", productList);
					mav.setViewName("product/listProduct_table01");
				}
			}
		}
		if ("식탁/의자".equals(sort) && subsort != null) {
			if ("x".equals(filter)) {
				ProductMap.put("sort", sort);
				ProductMap.put("subsort", subsort);
				ProductMap.put("filter", filter);
				List<ProductVO> productList = productService.listProduct(ProductMap);
				mav.addObject("productList", productList);
				mav.setViewName("product/listProduct_table01");
			} else if (filter != null) {
				ProductMap.put("sort", sort);
				ProductMap.put("subsort", subsort);
				ProductMap.put("filter", filter);
				List<ProductVO> productList = productService.listProduct(ProductMap);
				mav.addObject("productList", productList);
				mav.setViewName("product/listProduct_table01");
			}
		}
		
		// -------------------테이블/책상/책장------------------------------------
		
		if ("테이블/책상/책장".equals(sort)) {
			if ("x".equals(subsort)) {
				if ("x".equals(filter)) {
					ProductMap.put("sort", sort);
					ProductMap.put("subsort", subsort);
					ProductMap.put("filter", filter);
					List<ProductVO> productList = productService.listProduct(ProductMap);
					mav.addObject("productList", productList);
					mav.setViewName("product/listProduct_table02");
				} else if (filter != null) {
					ProductMap.put("sort", sort);
					ProductMap.put("subsort", subsort);
					ProductMap.put("filter", filter);
					List<ProductVO> productList = productService.listProduct(ProductMap);
					mav.addObject("productList", productList);
					mav.setViewName("product/listProduct_table02");
				}
			}
		}
		if ("테이블/책상/책장".equals(sort) && subsort != null) {
			if ("x".equals(filter)) {
				ProductMap.put("sort", sort);
				ProductMap.put("subsort", subsort);
				ProductMap.put("filter", filter);
				List<ProductVO> productList = productService.listProduct(ProductMap);
				mav.addObject("productList", productList);
				mav.setViewName("product/listProduct_table02");
			} else if (filter != null) {
				ProductMap.put("sort", sort);
				ProductMap.put("subsort", subsort);
				ProductMap.put("filter", filter);
				List<ProductVO> productList = productService.listProduct(ProductMap);
				mav.addObject("productList", productList);
				mav.setViewName("product/listProduct_table02");
			}
		}
		return mav;
	}

	@Override // 관리자 상품목록 조회
	@RequestMapping(value = "product/admin_listProduct.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView admin_listProduct(Criteria1 cri, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<ProductVO> admin_productList = productService.admin_listProduct(cri);
		int productCount = productService.productCount();
		ModelAndView mav = new ModelAndView(viewName);
		PageMaker1 pageMaker1 = new PageMaker1();
		pageMaker1.setCri(cri);
		pageMaker1.setTotalCount(productCount);
		int pageNum = pageMaker1.getCri().getPage();
		
		mav.addObject("pageNum", pageNum);
		mav.addObject("admin_productList", admin_productList);
		mav.addObject("pageMaker1", pageMaker1);
		
		return mav;
	}

	@Override
	@RequestMapping(value = "/product/admin_listProduct/productSearch.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productSearch(@RequestParam("search") String search, @RequestParam("searchType") String searchType,
			Criteria1 cri, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		Map<String, Object> productSearchMap = new HashMap<String, Object>();
		int pageStart = cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		productSearchMap.put("pageStart", pageStart);
		productSearchMap.put("perPageNum", perPageNum);
		productSearchMap.put("search", search);
		System.out.println(search);
		productSearchMap.put("searchType", searchType);
		System.out.println(searchType);
		productSearchMap = productService.productSearch(productSearchMap);
		System.out.println(productSearchMap);
		int productSearchCount = productService.productSearchCount(productSearchMap);
		PageMaker1 pageMaker1 = new PageMaker1();
		pageMaker1.setCri(cri);
		int pageNum = pageMaker1.getCri().getPage();
		productSearchMap.put("pageNum", pageNum);
		pageMaker1.setTotalCount(productSearchCount);
		mav.addObject("productSearchMap", productSearchMap);
		mav.addObject("pageMaker1", pageMaker1);
		mav.addObject("pageNum", pageNum);
		System.out.println(productSearchMap);
		
		return mav;

	}

	// 수정화면
	@RequestMapping(value = "/product/modProduct.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productForm(@RequestParam("productNum") String productNum,
			MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {

		String viewName = (String) multipartRequest.getAttribute("viewName");
		productVO = productService.productForm(productNum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("productNum", productVO);

		return mav;
	}

	
	@RequestMapping(value = "/product/modNewProduct.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity modProduct(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> productMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			productMap.put(name, value);

		}
		
		List<String> productImage = upload(multipartRequest);

				

		String productImage1 = productImage.get(0).toString();
				
		String productContentImage1 = productImage.get(1).toString();
	

		

		productMap.put("productImage1", productImage1);
		productMap.put("productContentImage1", productContentImage1);
		
		String productNum = (String) productMap.get("productNum");
		productMap.put("productNum", productNum);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
	
			productService.modProduct(productMap);

			if (productImage != null && productImage.size() != 0) {

				String OrignProductImage = (String) productMap.get("OrignProductImage");
				String OrignProductContentImage = (String) productMap.get("OrignProductContentImage");
				
				if(OrignProductImage !=null) {
					File oldFile = new File(ARTICLE_IMAGE_REPO + "\\" + productNum + "\\" + OrignProductImage);
					oldFile.delete();}
				if (OrignProductContentImage != null){					
					File oldFile1 = new File(ARTICLE_IMAGE_REPO + "\\" + productNum + "\\" + OrignProductContentImage);
					oldFile1.delete();}

				if(productImage1 !=null) {
				File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + productImage1);
				File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + productNum);
				FileUtils.moveFileToDirectory(srcFile, destDir, true); } 
				if(productContentImage1 !=null){
					File srcFile1 = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + productContentImage1);
					File destDir1 = new File(ARTICLE_IMAGE_REPO + "\\" + productNum);
					FileUtils.moveFileToDirectory(srcFile1, destDir1, true);
				}

			}
			message = "<script>";
			message += "alert('상품을 수정했습니다.');";
			message += "location.href='" + multipartRequest.getContextPath()
					+ "/product/admin_detailproduct.do?productNum=" + productNum + "';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + productImage);
			srcFile.delete();
			message = "<script>";
			message += "alert('오류가 발생했습니다. 다시 수정해주세요');";
			message += "location.href='" + multipartRequest.getContextPath()
					+ "/product/admin_detailproduct.do?productNum=" + productNum + "';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}
			

	@Override
	@RequestMapping(value = "/product/removeProduct.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeProduct(@RequestParam("productNum") String productNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			productService.removeProduct(productNum);
			File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + productNum);
			FileUtils.deleteDirectory(destDir);

			message = "<script>";
			message += " alert('상품을 삭제했습니다.');";
			message += "  location.href='" + request.getContextPath() + "/product/admin_listProduct.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {

			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해주세요');";
			message += "  location.href='" + request.getContextPath() + "/product/admin_listProduct.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
  	@RequestMapping(value = "/product/viewProduct.do", method = RequestMethod.GET)
public ModelAndView viewProduct(@RequestParam("productNum") String productNum, Criteria cri,Criteria2 cri2, HttpServletRequest request,
	HttpServletResponse response) throws Exception {
Map<String, Object> productMap = new HashMap();
String viewName = (String) request.getAttribute("viewName");
HttpSession session=request.getSession();
productVO = productService.viewProduct(productNum);
Map<String, Object> option = (Map<String, Object>) productService.viewOptionvalue(productNum);
ModelAndView mav = new ModelAndView();

int pageStart = cri.getPageStart();
int perPageNum = cri.getPerPageNum();
int pageStart2 = cri2.getPageStart2();
int perPageNum2 = cri2.getPerPageNum2();
productMap.put("pageStart", pageStart);
productMap.put("perPageNum", perPageNum);
productMap.put("pageStart2", pageStart2);
productMap.put("perPageNum2", perPageNum2);
productMap.put("productNum", productNum);
List<ProductVO> productReviewList= productService.listProductReview(productMap);
int productReviewCount = productService.productReviewCount(productNum);
List<ProductVO> productQuestionList = productService.listProductQuestion(productMap);
int productQuestionCount = productService.productQuestionCount(productNum);
PageMaker pageMaker = new PageMaker();
pageMaker.setCri(cri);
pageMaker.setTotalCount(productReviewCount);
int pageNum = pageMaker.getCri().getPage();

PageMaker2 pageMaker2 = new PageMaker2();
pageMaker2.setCri2(cri2);
pageMaker2.setTotalCount2(productQuestionCount);
int pageNum2 = pageMaker2.getCri2().getPage2();

addQuick(productNum,productVO,session);
mav.setViewName(viewName);
mav.addObject("option", option);
mav.addObject("product", productVO);
mav.addObject("productReviewList", productReviewList);
mav.addObject("productQuestionList", productQuestionList);
mav.addObject("pageMaker", pageMaker);
mav.addObject("pageNum", pageNum);
mav.addObject("pageMaker2", pageMaker2);
mav.addObject("pageNum2", pageNum2);


return mav;

}



	@RequestMapping(value = "product/admin_detailproduct.do", method = RequestMethod.GET)
	public ModelAndView admin_detailproduct(@RequestParam("productNum") String productNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		productVO = productService.viewProduct(productNum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("product", productVO);

		return mav;
	}

	// 키워드 검색
	@RequestMapping(value = "/keywordSearch.do", method = RequestMethod.GET, produces = "application/text; charset=utf8") // 브라우저로
																															// 전송하는
																															// json데이터의
																															// 한글
																															// 인코딩을
																															// 지정
	public @ResponseBody String keywordSearch(@RequestParam("keyword") String keyword, // 검색할 키워드 가져옴
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		// System.out.println(keyword);
		if (keyword == null || keyword.equals(""))
			return null;

		keyword = keyword.toUpperCase();
		List<String> keywordList = productService.keywordSearch(keyword);// 가져온 키워드가 포함된 상품 제목 조회

		// 최종 완성될 JSONObject 선언(전체)
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("keyword", keywordList); // 조회한 데이터를 json에 저장

		String jsonInfo = jsonObject.toString(); // json을 문자열로 변환한 후 브라우저로 출력
		// System.out.println(jsonInfo);
		return jsonInfo;
	}

	@RequestMapping(value = "/searchProduct.do", method = RequestMethod.GET)
	public ModelAndView searchProduct(@RequestParam("searchWord") String searchWord, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<ProductVO> productList = productService.searchProduct(searchWord); // 검색창에서 가져온 단어가 포함된 상품 제목을 조회

		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("productList", productList);
		return mav;

	}
	
	//최근본 상품
	private void addQuick(String productNum,ProductVO productVO,HttpSession session){
		boolean already_existed=false;
		List<ProductVO> quickList; //최근 본 상품 저장 ArrayList
		List<ProductVO> quickListAll;
		
		//MemberVO memberVO=(MemberVO)session.getAttribute("member");
		//String memId=memberVO.getmemId();
		
		quickList=(ArrayList<ProductVO>)session.getAttribute("quickList");//세션에 저장된 최근 본 상품 목록을 가져옴
		quickListAll=(ArrayList<ProductVO>)session.getAttribute("quickListAll");
		
		if(quickList!=null){//최근 본 상품이 있는 경우
			
			if(quickList.size() < 2){ //미리본 상품 리스트에 상품개수가 2개 이하인 경우
				for(int i=0; i<quickList.size();i++){
					ProductVO productBean=(ProductVO)quickList.get(i);
					if(productNum.equals(productBean.getproductNum())){					
						already_existed=true;
						break;
					}
				}//상품 목록을 가져와 이미 존재하는 상품인지 비교
				if(already_existed==false){
					quickList.add(productVO);
					
				}//already_existed가 false이면 상품 정보를 목록에 저장
			}
			else {
				for(int i=0; i<quickList.size();i++){
					ProductVO productBean=(ProductVO)quickList.get(i);
					if(productNum.equals(productBean.getproductNum())){					
						already_existed=true;
						break;
					}
				}//상품 목록을 가져와 이미 존재하는 상품인지 비교
				if(already_existed==false){
					for(int i=0; i<2;i++) {
						Collections.reverse(quickList);
					quickList.set(i,productVO);}
					
				}//already_existed가 false이면 상품 정보를 목록에 저장
				
			
			}
			
		}else{
			quickList =new ArrayList<ProductVO>();
			quickList.add(productVO);
			
		}//최근 본 상품 목록이 없으면 생성하여 상품 정보를 저장
		
		//quickList =new ArrayList<ProductVO>();
		//quickList.add(productVO);
		
		session.setAttribute("quickList",quickList);//최근 본 상품 목록을 세션에 저장
		session.setAttribute("quickListNum", quickList.size());//최근 본 상품 목록에 저장된 상품개수를 세션에 저장
		
		if(quickListAll!=null){//최근 본 상품이 있는 경우
				for(int i=0; i<quickListAll.size();i++){
					ProductVO productBean=(ProductVO)quickListAll.get(i);
					if(productNum.equals(productBean.getproductNum())){
						already_existed=true;
						break;
					}
				}//상품 목록을 가져와 이미 존재하는 상품인지 비교
				if(already_existed==false){
					quickListAll.add(productVO);
					Collections.reverse(quickList);
					
				}//already_existed가 false이면 상품 정보를 목록에 저장
			
		
		}else{
			quickListAll =new ArrayList<ProductVO>();
			quickListAll.add(productVO);
			
		}//최근 본 상품 목록이 없으면 생성하여 상품 정보를 저장
		session.setAttribute("quickListAll",quickListAll);//최근 본 상품 목록을 세션에 저장
		session.setAttribute("quickListAllNum", quickListAll.size());//최근 본 상품 목록에 저장된 상품개수를 세션에 저장

		
	}
	
	@RequestMapping(value="/mypage_09.do" ,method = RequestMethod.GET)
	public ModelAndView QuickMain(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		List<ProductVO> quickListAll; //최근 본 상품 저장 ArrayList
		quickListAll=(ArrayList<ProductVO>)session.getAttribute("quickListAll");//세션에 저장된 최근 본 상품 목록을 가져옴
		session.setAttribute("quickListAll",quickListAll);//최근 본 상품 목록을 세션에 저장
		session.setAttribute("quickListAllNum", quickListAll.size());//최근 본 상품 목록에 저장된 상품개수를 세션에 저장
		System.out.println(quickListAll);
		
	
		return mav;
	}
	
	//상품 상세페이지 상품문의 글 등록
	@Override
	@RequestMapping(value = "/addNewQuestion.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewQuestion(@ModelAttribute("question") ProductVO question, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memId = memberVO.getmemId();
		
		question.setMemId(memId);
		String productNum = question.getproductNum();
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			productService.addNewQuestion(question);

			message = "<script>";
			message += " alert('글 등록을 완료하였습니다.');";
			message += "  location.href='" + request.getContextPath() + "/product/viewProduct.do?productNum="+ productNum  + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {

			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해주세요');";
			message += "  location.href='" + request.getContextPath() + "/product/viewProduct.do?productNum="+ productNum  + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	@Override
	@RequestMapping(value = "/removeQuestion.do", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity removeQuestion(@RequestParam("productNum") String productNum, @RequestParam("productQuestionNum") int productQuestionNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		response.setContentType("text/html; charset-utf-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			productService.removeQuestion(productQuestionNum);

			message = "<script>";
			message += " location.href='" + request.getContextPath() +"/product/viewProduct.do?productNum="+ productNum  + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 수정해주세요);";
			message += " location.href='" + request.getContextPath() + "/product/viewProduct.do?productNum="+ productNum  + "';";
					
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;

	}
	
	@RequestMapping(value = "/modNewQuestion.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity modNewQuestion(@ModelAttribute("question") ProductVO question, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

	
		request.setCharacterEncoding("utf-8");


		String productNum = question.getproductNum();
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			productService.modQuestion(question);

			message = "<script>";
			message += " alert('글을 수정했습니다.');";
			message += "  location.href='" + request.getContextPath() + "/product/viewProduct.do?productNum="+ productNum  + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {

			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해주세요');";
			message += "  location.href='" + request.getContextPath() + "/product/viewProduct.do?productNum="+ productNum  + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	// 상품옵션 value 가져오기
	@RequestMapping(value = "product/option1Value.do", method = RequestMethod.GET)
	@ResponseBody
	private Map<String,Object> optionValue(@RequestParam("option1Name") String option1Name, HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		Map<String,Object> option1Value = new HashMap<String,Object>();
		option1Value.put("option1Name", option1Name);
		productService.selectOption1Value(option1Value);

		option1Value.remove("option1Name");

		return option1Value;
	}


}