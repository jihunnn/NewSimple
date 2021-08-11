package com.project.simple.product.page;

public class Criteria2 {
	 private int page2;//현재 페이지
	    private int perPageNum2;  //perPageNum 한페이지당 보여줄 게시글의 갯수   
	    public int getPageStart2() {

	        return (this.page2-1)*perPageNum2;
	    }
	    
	    public Criteria2() {
	        this.page2 = 1;
	        this.perPageNum2 = 10;
	    }
	    
	    public int getPage2() {
	        return page2;
	    }
	    public void setPage2(int page) {
	        if(page <= 0) {
	            this.page2 = 1;
	        } else {
	            this.page2 = page;
	        }
	    }
	    
	    public int getPerPageNum2() {
	        return perPageNum2;
	    }
	    
	    public void setPerPageNum2(int pageCount2) {
	        int cnt2 = this.perPageNum2;
	        if(pageCount2 != cnt2) {
	            this.perPageNum2 = cnt2;
	        } else {
	            this.perPageNum2 = pageCount2;
	        }
	    }
	    
	}



