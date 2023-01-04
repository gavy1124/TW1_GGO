package com.multi.ggo;

import java.util.List;

public interface MemberService {
	//등록
	int insert(MemberDTO dto);
	
	//전체리스트
	List<MemberDTO> memberlist();
	
	//회원 상세조회
		MemberDTO memberIdRead(String id);
		
	//회원 삭제
	int delete(String id);
	
	//회원 업데이트
	int update(MemberDTO dto);
	
	//로그인
	MemberDTO login(MemberDTO idInfo);
	
	
	//하단검색
	List<MemberDTO> Search(String data);
	List<MemberDTO> Search(String tag, String searchData); //아래쪽셀렉터 + 문구입력 + 검색 
	
	//회원번호, 아이디, 작성일 검색 
	List<MemberDTO> findByCategory(String sort); //셀렉트 카테고리 구분
	 
	 
	 
	 }
