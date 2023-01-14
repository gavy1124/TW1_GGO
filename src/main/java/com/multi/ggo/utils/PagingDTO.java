package com.multi.ggo.utils;

public class PagingDTO {

	// 현재페이지, 시작페이지, 끝페이지, 게시글 총 개수, 페지글당 글개수(cntPerPage), 마지막페이지, sql쿼리용(start,
	// end)
	//
	//	cntPerPage는 페이지당 표시해 줄 글 갯수 정의용도
	   
	// ?? 의미비슷한데??
	
	// lastPage <> endPage
	// cntPerPge <> cntPage
	
	private int nowPage, startPage, endPage, total, cntPerPage, lastPage, queryStart, queryEnd;
	private int cntPage = 5;  //  cntPage는 총 페이지 갯수 정의용도 

	public PagingDTO() {

	}
	
	
	//계산하여 넣도록 생성자추가
	public PagingDTO(int total, int nowPage, int cntperPage) {
		setNowPage(nowPage);
		setCntPerPage(cntperPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEnd(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
		
	}	
	
	

	
	// 제일 마지막 페이지 계산 = 전체페이지 / 페이지당 글개수
	// LastPage
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double) total / (double) cntPerPage));
	}

	// 시작페이지, 끝 페이지 계산  = 현재페이지 / 페이지수?
	// startPage,  endPage
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage( (int)Math.ceil((double)nowPage/(double)cntPage));
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if(getStartPage() < 1) {
			setStartPage(1);
		}
	}
	
	
	// DB 쿼리에서 사용할 start, end값 계산
	public void calcStartEnd(int nowPge, int cntPerPage) {
		setQueryEnd(nowPage * cntPerPage);
		setQueryStart(getQueryEnd() - cntPerPage + 1);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

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

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getQueryStart() {
		return queryStart;
	}

	public void setQueryStart(int queryStart) {
		this.queryStart = queryStart;
	}

	public int getQueryEnd() {
		return queryEnd;
	}

	public void setQueryEnd(int queryEnd) {
		this.queryEnd = queryEnd;
	}

	public int getCntpage() {
		return cntPage;
	}

	public void setCntpage(int cntpage) {
		this.cntPage = cntpage;
	}


	@Override
	public String toString() {
		return "PagingVO [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", total=" + total
				+ ", cntPerPage=" + cntPerPage + ", lastPage=" + lastPage + ", queryStart=" + queryStart + ", queryEnd="
				+ queryEnd + ", cntpage=" + cntPage + "]";
	}

	
	
	
	
}
