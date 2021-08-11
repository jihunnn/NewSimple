package com.project.simple.favorite.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.simple.favorite.vo.FavoriteVO;
import com.project.simple.product.vo.ProductVO;

@Repository("favoriteDAO")
public class FavoriteDAOImpl implements FavoriteDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<FavoriteVO> selectFavoriteList(FavoriteVO favoriteVO) throws DataAccessException {
		List<FavoriteVO> favoriteList =(List)sqlSession.selectList("mapper.favorite.selectFavoriteList",favoriteVO);
		return favoriteList;
	}

	@Override
	public List<ProductVO> selectProductList(List<FavoriteVO> favoriteList) throws DataAccessException {
		List<ProductVO> myProductList;
		myProductList = sqlSession.selectList("mapper.favorite.selectProductList",favoriteList);
		return myProductList;
	}

	@Override
	public boolean selectCountInFavorite(FavoriteVO favoriteVO) throws DataAccessException {
		String result=sqlSession.selectOne("mapper.favorite.selectCountInFavorite",favoriteVO);
		return Boolean.parseBoolean(result);
	}//이미 관심상품에 추가된 상품인지 조회

	@Override
	public void insertProductInFavorite(FavoriteVO favoriteVO) throws DataAccessException {
		int favoriteNum = selectMaxFavoriteId();
		favoriteVO.setfavoriteNum(favoriteNum);
		sqlSession.insert("mapper.favorite.insertProductInFavorite",favoriteVO);
		
	}//관심상품에 추가

	private int selectMaxFavoriteId() throws DataAccessException{
		int favoriteNum = sqlSession.selectOne("mapper.favorite.selectMaxFavoriteId");
		return favoriteNum;
	}

	@Override
	public void deleteFavoriteProduct(Map<String, Object> map) throws DataAccessException {
		sqlSession.delete("mapper.favorite.deleteFavoriteProduct",map);
		
	}

	@Override
	public void deleteRemoveFavorite(FavoriteVO favoriteVO) throws DataAccessException {
		sqlSession.delete("mapper.favorite.deleteRemoveFavorite",favoriteVO);
		
	}
	
	
	//관심상품 count
	public int selectFavoriteCount(String productNum) throws DataAccessException{
		int favoriteCount = sqlSession.selectOne("mapper.favorite.selectFavoriteCount",productNum);
		return favoriteCount;
	}







}
