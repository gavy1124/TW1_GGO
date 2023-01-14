package com.multi.ggo.board;


public class Page_DTO {

	private int startPage; // 페이지네이션 부분의    첫페이지
	private int endPage; // 페이지네이션 부분의    마지막 페이지
	private boolean prev, next; // 이전 or 다음 페이지,   있으면true  없으면 false
	
	private int total; // 데이터개수
	private Criteria_DTO criteria; // 현재페이지 + 화면에 보여줄 데이터개수 
	//       private int pageNum; //현재페이지 - page
	//       private int amount; // 한페이지에 표시되는 데이터수 - perPageNum
	
	
	
	// 생성자에서 값을 전달받아 셋팅
	public Page_DTO(Criteria_DTO criteria, int total) {  //total은 DB에서가져온다
		this.criteria = criteria;
		this.total = total;
			
			//화면에 보여줄 페이지 계산
			this.endPage = (int) (Math.ceil(criteria.getPageNum() / 10.0) * 10);  //한화면에 보여지는 마지막 페지네이션??
			this.startPage = this.endPage - 9;
			
			//전체데이터의 마지막페이지 계산
			int realEnd = (int)(Math.ceil((total * 1.0) / criteria.getAmount()));
			
			//endPage는 realEnd를 초과할수 없다. 그래서 계산결과 초과가 되면 endPage를 realEnd로 바꿔야한다.
			if(realEnd < endPage) this.endPage = realEnd;
			
			this.prev = this.startPage > 1;
			this.next = this.endPage < realEnd;
			
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


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}




	public Criteria_DTO getCriteria() {
		return criteria;
	}
	public void setCriteria(Criteria_DTO criteria) {
		this.criteria = criteria;
	}
	@Override
	public String toString() {
		return "Page_DTO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + "]";
	}
	
	
	
	
	
	
	
}
