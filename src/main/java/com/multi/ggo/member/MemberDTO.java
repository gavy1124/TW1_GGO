package com.multi.ggo.member;

import java.sql.Date;

public class MemberDTO {
	private String no;
	private String id;
	private String pass;
	private String name;
	private String tel;
	private String addr;
	private String email;
	private String sort;
	private Date regdate;
	public MemberDTO() {	
		
	}
	public MemberDTO(String no, String id, String pass, String name, String tel, String addr, String email, String sort,
			Date regdate) {
		super();
		this.no = no;
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.tel = tel;
		this.addr = addr;
		this.email = email;
		this.sort = sort;
		this.regdate = regdate;
	}
	
	
	
	
	

	@Override
	public String toString() {
		return "MemberDTO [no=" + no + ", id=" + id + ", pass=" + pass + ", name=" + name + ", tel=" + tel + ", addr="
				+ addr + ", email=" + email + ", sort=" + sort + ", regdate=" + regdate + "]";
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
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
