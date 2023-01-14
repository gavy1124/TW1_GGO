package com.multi.ggo.board;


public class Criteria_DTO {
	private int pageNum=1; //현재페이지 - page
	private int amount=5; // 한페이지에 표시되는 데이터수 - perPageNum
	
	
	//변수값을 세팅하는 방법 - 초기화 블록 : {~~}  ,  생성자:클래스명(){~~} 사 용, setter()

		//생성자를 이용한 기본값 세팅

//	public Criteria_DTO(int pageNum, int amount) {
//		super();
//		this.pageNum = pageNum;
//		this.amount = amount;
//	}



	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + "]";
	}
	
	
	
	
	
	
}
