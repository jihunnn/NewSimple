package com.project.simple.product.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.simple.product.page.Criteria1;
import com.project.simple.product.vo.ProductVO;

@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ProductVO> selectAllProductList(Map<String, Object>ProductMap) throws DataAccessException{
		
		List<ProductVO> productList = sqlSession.selectList("mapper.product.selectAllProductList", ProductMap);
		System.out.println(productList);
		return productList;
	}
	@Override
	public List<ProductVO> admin_selectAllProductList(Criteria1 cri) throws DataAccessException{
		List<ProductVO> productList = sqlSession.selectList("mapper.product.admin_selectAllProductList", cri);
		return productList;
	}
	
	@Override
	public int insertProduct(Map productMap)throws DataAccessException{
		int result=sqlSession.insert("mapper.product.insertProduct", productMap);
		return result;
	}
	
	@Override
	public Map<String, Object> selectOptionvalue(String productNum) throws DataAccessException {
		List<ProductVO> optionList1 = sqlSession.selectList("mapper.product.selectOptionList1", productNum);
		List<ProductVO> optionList2 = sqlSession.selectList("mapper.product.selectOptionList2", productNum);
		Map<String, Object> option = new HashMap<String, Object>();
		option.put("optionList1", optionList1);
		option.put("optionList2", optionList2);
		return option;
	}

	@Override
	public ProductVO selectProduct(String productNum) throws DataAccessException {
		return sqlSession.selectOne("mapper.product.selectProduct", productNum);
	}
	


	@Override
	public List<String> selectKeywordSearch(String keyword) throws DataAccessException {
		 List<String> list=(ArrayList)sqlSession.selectList("mapper.product.selectKeywordSearch",keyword);
		   return list;
	}

	@Override
	public List<ProductVO> selectProductBySearchWord(String searchWord) throws DataAccessException {
		ArrayList list=(ArrayList)sqlSession.selectList("mapper.product.selectProductBySearchWord",searchWord);
		 return list;
	}
	@Override
	public void deleteProduct(String productNum) throws DataAccessException{
		sqlSession.delete("mapper.product.deleteProduct", productNum);
	}
	@Override
	public void updateProduct(Map productMap) throws DataAccessException {
		sqlSession.update("mapper.product.updateProduct", productMap);
		
	}
	
	
	@Override
	public List<ProductVO> selectAllProductReviewList(Map<String, Object> productMap) throws DataAccessException {
		List<ProductVO> productReviewList = sqlSession.selectList("mapper.product.selectAllProductReviewList", productMap);
		return productReviewList;
	}
	
	@Override
	public int selectProductReviewCount(String productNum) throws DataAccessException {
		int productReviewCount = sqlSession.selectOne("mapper.product.selectProductReviewCount",productNum);

		return productReviewCount;
	}
	
	@Override
	public List<ProductVO> selectAllProductQuestionList(Map<String, Object> productMap) throws DataAccessException {
		List<ProductVO> productQuestionList = sqlSession.selectList("mapper.product.selectAllProductQuestionList", productMap);
		return productQuestionList;
	}
	
	@Override
	public int selectProductQuestionCount(String productNum) throws DataAccessException {
		int productQuestionCount = sqlSession.selectOne("mapper.product.selectProductQuestionCount",productNum);

		return productQuestionCount;
	}
	@Override
	public int selectProductCount() throws DataAccessException {
		int productCount = sqlSession.selectOne("mapper.product.selectProductCount");

		return productCount;
	}
	@Override
	public List<ProductVO> productSearchList(Map<String, Object> productSearchMap) throws DataAccessException {
		List<ProductVO> productSearchList = sqlSession.selectList("mapper.product.productSearchList",productSearchMap);		
		return productSearchList;
	}
	@Override
	public int productSearchCount(Map<String, Object> search) throws DataAccessException {
		int productSearchCount = sqlSession.selectOne("mapper.product.productSearchCount",search);

		return productSearchCount;
	}
	@Override
	public List<ProductVO> selectBestList() throws DataAccessException {
		List<ProductVO> bestList = (List)sqlSession.selectList("mapper.product.selectBestList");
	
		return bestList;
	}
	@Override
	public List<ProductVO> selectProductList(List<ProductVO> bestList) throws DataAccessException {
		List<ProductVO> myProductList;
		myProductList = sqlSession.selectList("mapper.product.selectProductList",bestList);
		return myProductList;
	}
	
	@Override
	public void insertNewQuestion(ProductVO question) throws DataAccessException {
		sqlSession.insert("mapper.product.insertNewQuestion", question);

	}
	
	@Override
	public void deleteQuestion(int productQuestionNum) throws DataAccessException {
		sqlSession.delete("mapper.product.deleteQuestion", productQuestionNum);
	}
	
	@Override
	public void updateQuestion(ProductVO question) throws DataAccessException {
		sqlSession.update("mapper.product.updateQuestion", question);
	}
	
	//상품 옵션 이름 선택
	@Override
	public List<String> selectOptionName() throws DataAccessException {
		List<String> selectOptionName = sqlSession.selectList("mapper.product.selectOption1Name");
		List<String> selectOption2Name = sqlSession.selectList("mapper.product.selectOption2Name");
		for(int i=0; i<selectOption2Name.size(); i++) {
			selectOptionName.add(selectOption2Name.get(i));
		}

		return selectOptionName;
	}
	
	//상품 옵션 값 선택
	@Override
	public List<String> selectOption1Value(Map<String,Object> option1Value) throws DataAccessException {
		List<String> selectOptionValue = sqlSession.selectList("mapper.product.selectOption1Value",option1Value);
		
		if(selectOptionValue.size() == 0) {
			selectOptionValue = sqlSession.selectList("mapper.product.selectOption2Value",option1Value);
		}

		return selectOptionValue;
	}

	
	


}
