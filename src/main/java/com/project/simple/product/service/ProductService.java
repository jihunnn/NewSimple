package com.project.simple.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.project.simple.board.vo.ArticleVO;
import com.project.simple.page.Criteria;
import com.project.simple.product.page.Criteria1;
import com.project.simple.product.vo.ProductVO;

public interface ProductService {
	public List<ProductVO> listProduct(Map<String, Object> ProductMap) throws Exception;
	public List<ProductVO> admin_listProduct(Criteria1 cri) throws DataAccessException;
	public int addProduct(Map productMap) throws DataAccessException;
	public void removeProduct(String productNum) throws Exception;
	public ProductVO viewProduct(String productNum) throws Exception;
	public ProductVO admin_detailproduct(String productNum) throws Exception;
	public List<String> keywordSearch(String keyword) throws Exception;
	public List<ProductVO> searchProduct(String searchWord) throws Exception;
	public void modProduct(Map productMap) throws Exception;
	public ProductVO productForm(String productNum) throws Exception;
	public Map<String, Object> viewOptionvalue(String productNum) throws Exception;
	public List<ProductVO> listProductReview(Map<String, Object> productMap) throws Exception;
	public int productReviewCount(String productNum) throws Exception;
	public List<ProductVO> listProductQuestion(Map<String, Object> productMap) throws Exception;
	public int productQuestionCount(String productNum) throws Exception;


	public Map<String, Object> productSearch(Map<String, Object> productSearchMap)throws Exception;
	public int productCount() throws Exception;
	public int productSearchCount(Map<String, Object> search) throws Exception;
	public Map<String, List> BestProductList()throws Exception;
	
	public void addNewQuestion(ProductVO question) throws Exception;
	public void removeQuestion(int productQuestionNum) throws Exception ;
	public void modQuestion(ProductVO question) throws Exception;
	
	public List<String> selectOptionName() throws Exception ;
	public Map<String,Object> selectOption1Value(Map<String,Object> option1Value) throws Exception;



}
