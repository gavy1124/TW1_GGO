package com.multi.ggo.board;

public class Board_FileDTO {
	private String no;
	private String originalFilename;
	private String storeFilename;
	private String boardFileno;
	
	public Board_FileDTO() {
		
	}
	
	
	
	public Board_FileDTO(String originalFilename, String storeFilename) {
		super();
		this.originalFilename = originalFilename;
		this.storeFilename = storeFilename;
	}


	//select요청시
	public Board_FileDTO(String no, String originalFilename, String storeFilename, String boardFileno) {
		super();
		this.no = no;
		this.originalFilename = originalFilename;
		this.storeFilename = storeFilename;
		this.boardFileno = boardFileno;
	}



	//boardFile의 상세정보 - insert
	public Board_FileDTO(String originalFilename, String storeFilename, String boardFileno) {
		super();
		this.originalFilename = originalFilename;
		this.storeFilename = storeFilename;
		this.boardFileno = boardFileno;
	}





	@Override
	public String toString() {
		return "Board_FileDTO [no=" + no + ", originalFilename=" + originalFilename + ", storeFilename=" + storeFilename
				+ ", boardFileno=" + boardFileno + "]";
	}



	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getOriginalFilename() {
		return originalFilename;
	}

	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}

	public String getStoreFilename() {
		return storeFilename;
	}

	public void setStoreFilename(String storeFilename) {
		this.storeFilename = storeFilename;
	}

	public String getBoardFileno() {
		return boardFileno;
	}

	public void setBoardFileno(String boardFileno) {
		this.boardFileno = boardFileno;
	}

	
	
	
	
}
