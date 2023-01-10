package com.multi.ggo.board;

import java.util.List;

public interface Board_DAO {
	//글등록
		public int b_insert(Board_DTO dto);
		
	//글조회
	public List<Board_DTO> b_list();	
	
	//카테고리조회
	public List<Board_DTO> findByCategory(String category);
	
	
	
	
	//글읽기
	public Board_DTO b_read(String no);
		
}
