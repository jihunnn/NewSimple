package com.project.simple.product.page;

import com.project.simple.product.page.Criteria2;

public class PageMaker2 {
	  private Criteria2 cri2;
	    private int totalCount2;
	    private int startPage2;
	    private int endPage2;
	    private boolean prev2;
	    private boolean next2;
	    private int displayPageNum2 = 10;
	    
	    public Criteria2 getCri2() {
	        return cri2;
	    }
	    public void setCri2(Criteria2 cri2) {
	        this.cri2 = cri2;
	    }
	    public int getTotalCount2() {
	        return totalCount2;
	    }
	    public void setTotalCount2(int totalCount2) {
	        this.totalCount2 = totalCount2;
	        calcData2();
	    }
	    
	    private void calcData2() {
	        //끝페이지 번호  = (현재 페이지 번호/화면에 보여질 페이지 번호의 갯수) * 화면에 보여질 페이지 번호의 갯수 
	        endPage2 = (int) (Math.ceil(cri2.getPage2() / (double) displayPageNum2) * displayPageNum2);
	        
	        //시작 페이지 번호=(끝페이지 번호 - 화면에 보여질 페이지 번호의 갯수)
	        startPage2 = (endPage2 - displayPageNum2) + 1;
	        if(startPage2 <= 0) startPage2 = 1;
	        
	        //마지막 페이지 번호 = 총게시글 수/한페이지당 보여줄 게시글수
	        int tempEndPage2 = (int) (Math.ceil(totalCount2 / (double) cri2.getPerPageNum2()));
	        if (endPage2 > tempEndPage2) {
	            endPage2 = tempEndPage2;
	        }
	        
	        //이전 버튼 생성 여부 = 시작페이지번호 ==1?false : true
	        prev2 = startPage2 == 1 ? false : true;
	        
	        //다음 버튼 생성 여부 = 끝페이지번호 * 한페이지당 보여줄 게시글의 갯수
	        next2 = endPage2 * cri2.getPerPageNum2() < totalCount2 ? true : false;
	        
	    }
	    //특정 페이지의 게시글 시작번호, 게시글 시작 행 번호
	    public int getStartPage2() {
	        return startPage2;
	    }
	    public void setStartPage2(int startPage2) {
	        this.startPage2 = startPage2;
	    }
	    public int getEndPage() {
	        return endPage2;
	    }
	    public void setEndPage2(int endPage2) {
	        this.endPage2 = endPage2;
	    }
	    public boolean isPrev2() {
	        return prev2;
	    }
	    public void setPrev2(boolean prev2) {
	        this.prev2 = prev2;
	    }
	    public boolean isNext2() {
	        return next2;
	    }
	    public void setNext2(boolean next2) {
	        this.next2 = next2;
	    }
	    public int getDisplayPageNum2() {
	        return displayPageNum2;
	    }
	    public void setDisplayPageNum2(int displayPageNum2) {
	        this.displayPageNum2 = displayPageNum2;
	    }
	 
	}



