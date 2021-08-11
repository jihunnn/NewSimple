package com.project.simple.favorite.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.simple.favorite.dao.FavoriteDAO;
import com.project.simple.favorite.vo.FavoriteVO;
import com.project.simple.product.vo.ProductVO;

@Service("favoriteService")
@Transactional(propagation = Propagation.REQUIRED)
public class FavoriteServiceImpl implements FavoriteService{
	
	@Autowired
	private FavoriteDAO favoriteDAO;
	
	public Map<String ,List> myFavoriteList(FavoriteVO favoriteVO) throws Exception{
		Map<String,List> favoriteMap=new HashMap<String,List>();
		List<FavoriteVO> myFavoriteList=favoriteDAO.selectFavoriteList(favoriteVO); //관심상품페이지에 표시할 관심상품 정보 조회
		if(myFavoriteList.size()==0){ //관심상품에 저장된 상품이없는 경우 null반환
			return null;
		}
		List<ProductVO> myProductList=favoriteDAO.selectProductList(myFavoriteList); //관심상품 페이지에 표시할 상품정보를 조회
		favoriteMap.put("myFavoriteList", myFavoriteList);
		favoriteMap.put("myProductList", myProductList);
		return favoriteMap; //관심상품 정보와 상품 정보를 favoriteMap에 저장하여 반환
	}

	@Override
	public boolean findFavoriteProduct(FavoriteVO favoriteVO) throws Exception {
		return favoriteDAO.selectCountInFavorite(favoriteVO);
	}//테이블에 추가하기 전에 동일한 상품 번호의 개수를 조회

	@Override
	public void addProductInFavorite(FavoriteVO favoriteVO) throws Exception {
		favoriteDAO.insertProductInFavorite(favoriteVO);
		
	}//관심상품 추가

	@Override
	public void removeFavoriteProduct(Map<String, Object> map) throws Exception {
		favoriteDAO.deleteFavoriteProduct(map);
		
	}
	@Override
	public void removeFavorite(FavoriteVO favoriteVO) throws Exception {
		favoriteDAO.deleteRemoveFavorite(favoriteVO);
	}//상품상세페이지에서 찜 취소
	
	@Override
	public int favoriteCount(String productNum) throws Exception {
		int favoriteCount = favoriteDAO.selectFavoriteCount(productNum);
		
		return favoriteCount;
	}//관심상품 count

	

}
