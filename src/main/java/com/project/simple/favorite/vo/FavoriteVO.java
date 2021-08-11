package com.project.simple.favorite.vo;

import org.springframework.stereotype.Component;

@Component("favoriteVO")
public class FavoriteVO {
	private int favoriteNum;
	private String memId;
	private String productNum;
	
	public int getfavoriteNum() {
		return favoriteNum;
	}
	public void setfavoriteNum(int favoriteNum) {
		this.favoriteNum = favoriteNum;
	}
	
	public String getmemId() {
		return memId;
	}
	public void setmemId(String memId) {
		this.memId = memId;
	}
	public String getproductNum() {
		return productNum;
	}
	public void setproductNum(String productNum) {
		this.productNum = productNum;
	}
	

}
