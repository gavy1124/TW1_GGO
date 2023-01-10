package com.multi.ggo.board;

import java.sql.Date;

public class Board_DTO {
	String no;
	String id;
	String category;
	String title;
	String content;
	Date write_date;
	
	
	public Board_DTO() {
		
	}


	public Board_DTO(String no, String id, String category, String title, String content, Date write_date) {
		super();
		this.no = no;
		this.id = id;
		this.category = category;
		this.title = title;
		this.content = content;
		this.write_date = write_date;
	}


	@Override
	public String toString() {
		return "Board_DTO [no=" + no + ", id=" + id + ", category=" + category + ", title=" + title + ", content="
				+ content + ", write_date=" + write_date + "]";
	}


	public String getNo() {
		return no;
	}


	public void setNo(String no) {
		this.no = no;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Date getWrite_date() {
		return write_date;
	}


	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}


	
	
	
	
	
	
	
}
