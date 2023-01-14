package com.multi.ggo.board;
// 1. lastPage 와 endPage차이??
// 2. startPage란? 
// 2. cntPage란? 페이지수??

public class PagingVO {
		private int nowPage; //현재페이지
		private int startPage; // 시작페이지
		private int endPage;   // 끝페이지
		private int total;     // 게시글총개수       (계산)
		private int cntPerPage;// 페이지당 글개수
		private int lastPage;  // 마지막페이지       (계산)
		private int start;     // 쿼리문 start
		private int end;       // 쿼리문 end
		
		
		private int cntPage = 5;  //페이지 수
		
		
		
		public PagingVO() {  //기본생성자
		}
		
		
		
		//게시글총개수 // 현재페이지//  페이지당개수   = 생성자통해서 전달받기
		public PagingVO(int total, int nowPage, int cntPerPage) {  
			setNowPage(nowPage);
			setCntPerPage(cntPerPage);
			setTotal(total);
			
			calcLastPage(getTotal(), getCntPerPage()); // 총개수 / 페이지당수 =  올림(LastPage)
			calcStartEndPage(getNowPage(), cntPage);   // 현재페이지 / 페이지 수 = 올림(StartEndPage)  //시작,끝페이지
			calcStartEnd(getNowPage(), getCntPerPage()); // 현재페이지 / 페이지당 글수 = StartEnd
		}
		
		
		
		// 제일 마지막 페이지 계산
		public void calcLastPage(int total, int cntPerPage) {
			setLastPage((int) Math.ceil((double)total / (double)cntPerPage));// 총개수 / 페이지당수 =  올림(LastPage)
		}
		
		
		// 시작, 끝 페이지 계산
		public void calcStartEndPage(int nowPage, int cntPage) { //현재페이지 / 페이지 수 = 올림(StartEndPage)  //시작,끝페이지
			setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
			if (getLastPage() < getEndPage()) { 
				setEndPage(getLastPage()); // end페이지가 더 크면,___ end페이지 =  last페이지
			}
			
			
			setStartPage(getEndPage() - cntPage + 1); // StartPage = end페이지 - 페이지수 + 1
			if (getStartPage() < 1) { // 시작페이지가 0보다작으면 1을 넣는다? 0페이지는 없으니까?
				setStartPage(1);
			}
		}
		
		
		// DB 쿼리에서 사용할 start, end값 계산
		public void calcStartEnd(int nowPage, int cntPerPage) { //현재페이지, 페이지당 수
			setEnd(nowPage * cntPerPage); // 현재페이지 * 페이지당 수 = end
			setStart(getEnd() - cntPerPage + 1); // end - 페이지당수 + 1 = start
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
		public int getStart() {
			return start;
		}
		public void setStart(int start) {
			this.start = start;
		}
		public int getEnd() {
			return end;
		}
		public void setEnd(int end) {
			this.end = end;
		}	
		public int setCntPage() {
			return cntPage;
		}
		public void getCntPage(int cntPage) {
			this.cntPage = cntPage;
		}
		@Override
		public String toString() {
			return "PagingVO [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", total=" + total
					+ ", cntPerPage=" + cntPerPage + ", lastPage=" + lastPage + ", start=" + start + ", end=" + end
					+ ", cntPage=" + cntPage + "]";
		}
}
