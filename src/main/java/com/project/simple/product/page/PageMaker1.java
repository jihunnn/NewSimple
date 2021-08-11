package com.project.simple.product.page;

public class PageMaker1 {
	  
    private Criteria1 cri;
    private int totalCount;
    private int startPage;
    private int endPage;
    private boolean prev;
    private boolean next;
    private int displayPageNum = 10;
    
    public Criteria1 getCri() {
        return cri;
    }
    public void setCri(Criteria1 cri) {
        this.cri = cri;
    }
    public int getTotalCount() {
        return totalCount;
    }
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        calcData();
    }
    
    private void calcData() {
        //끝페이지 번호  = (현재 페이지 번호/화면에 보여질 페이지 번호의 갯수) * 화면에 보여질 페이지 번호의 갯수 
        endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
        
        //시작 페이지 번호=(끝페이지 번호 - 화면에 보여질 페이지 번호의 갯수)
        startPage = (endPage - displayPageNum) + 1;
        if(startPage <= 0) startPage = 1;
        
        //마지막 페이지 번호 = 총상품 수/한페이지당 보여줄 상품수
        int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
        if (endPage > tempEndPage) {
            endPage = tempEndPage;
        }
        
        //이전 버튼 생성 여부 = 시작페이지번호 ==1?false : true
        prev = startPage == 1 ? false : true;
        
        //다음 버튼 생성 여부 = 끝페이지번호 * 한페이지당 보여줄 게시글의 갯수
        next = endPage * cri.getPerPageNum() < totalCount ? true : false;
        
    }
    //특정 페이지의 상품 시작번호, 상품 시작 행 번호
    public int getStartPage() {
        return startPage;
    }
    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }
    public int getEndPage() {
        return endPage;
    }
    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }
    public boolean isPrev() {
        return prev;
    }
    public void setPrev(boolean prev) {
        this.prev = prev;
    }
    public boolean isNext() {
        return next;
    }
    public void setNext(boolean next) {
        this.next = next;
    }
    public int getDisplayPageNum() {
        return displayPageNum;
    }
    public void setDisplayPageNum(int displayPageNum) {
        this.displayPageNum = displayPageNum;
    }

}
