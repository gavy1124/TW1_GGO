package com.multi.ggo.board;

public class Board_FileDTO {
	private String no;
	private String originalFilename;
	private String storeFilename;
	
	public Board_FileDTO() {
		
	}
	
	public Board_FileDTO(String no, String originalFilename, String storeFilename) {
		super();
		this.no = no;
		this.originalFilename = originalFilename;
		this.storeFilename = storeFilename;
	}
	@Override
	public String toString() {
		return "Board_FIleDTO [no=" + no + ", originalFilename=" + originalFilename + ", storeFilename=" + storeFilename
				+ "]";
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

	
	
	
	
}
