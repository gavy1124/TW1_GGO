package com.multi.ggo.board;

import java.util.List;

public interface Board_DAO {
	//페이징
	public List<Board_DTO> pagingList(Criteria_DTO criteria);	
		
	
	//글등록
	public int b_insert(Board_DTO dto);
		
	//글조회
	public List<Board_DTO> b_list();	
	
	//카테고리조회
	public List<Board_DTO> findByCategory(String category);
	
	//글읽기
	public Board_DTO b_read(String no);
		
	
	//조회수
	public void increaseHit(String no);	
	//----------------------------------------------------------
	
	//첨부파일 등록   (혼자서 존재할수없는 child테이블)
	public int insertFile(List<Board_FileDTO> boardfilelist); 
	
	
	//첨부파일 읽기시 업로드한파일의 목록조회
	public List<Board_FileDTO> getFileList(String no);
	
	
	//다운로드 ( @PathVariable String id, @PathVariable String no, @PathVariable String boardFileno 일치하는 boardFileDTO정보가져오기)
	Board_FileDTO getFile(Board_FileDTO inputdata);
	
	
}
