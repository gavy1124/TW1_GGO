package com.multi.ggo.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Board_ServiceImpl implements Board_Service {

	Board_DAO dao;
	
	@Autowired
	public Board_ServiceImpl(Board_DAO dao) {
		super();
		this.dao = dao;
	}

	//페이징1
//		public List<Board_DTO> pagingList(Criteria_DTO critera){
//			return dao.pagingList(critera);
//			
//		}
		
	
	
	
	
	
	
	
	
	

	@Override //글조회
	public List<Board_DTO> b_list() {
		return dao.b_list();
	}

	@Override //카테고리별조회
	public List<Board_DTO> findByCategory(String category) {
		List<Board_DTO> list = null;
		if(category != null) {
			if(category.equals("all")) {
				//System.out.println("서비스임플 all로 읽음");
				list = dao.b_list();
			}else {
				list = dao.findByCategory(category);
			}
		}
		return list;
	}

	@Override //읽기
	public Board_DTO b_read(String no) {
		return dao.b_read(no);
	}

	
	
	//----------------------------------------------------------
	@Override //첨부파일조회
	public List<Board_FileDTO> getFileList(String no) {
		return dao.getFileList(no);
	}
//	@Override //글등록 
//	public int b_insert(Board_DTO dto) {
//		return dao.b_insert(dto);
//	}
//	
		
	
	
	//dao클래스에 정의된 두개의 메서드를 호출
	@Override //게시글글등록  ( + 첨부파일등록)
	public int b_insert(Board_DTO dto, List<Board_FileDTO> boardfiledtolist) {
		
		if(boardfiledtolist.isEmpty()) {
			dao.b_insert(dto);
		}else{
			System.out.println("____________________boardfiledtolist임플체크 : " + boardfiledtolist);
			dao.b_insert(dto);
			dao.insertFile(boardfiledtolist);
		}
		
		return 0;
	}


	//다운로드 ( @PathVariable String id, @PathVariable String no, @PathVariable String boardFileno 일치하는 boardFileDTO정보가져오기)
	@Override
	public Board_FileDTO getFile(Board_FileDTO inputdata) {
		return dao.getFile(inputdata);
	}



	@Override // 조회
	public void increaseHit(String no) {
		dao.increaseHit(no);
		
	}

	
	
	// 페이징- 테스트2
	@Override
	public int countBoard() {
		return dao.countBoard();
	}

	@Override
	public List<PagingVO> selectBoard(PagingVO vo) {
		return dao.selectBoard(vo);
	}

	@Override //하단검색
	public List<Board_DTO> searchData(String tag, String searchData) {
		return dao.searchData(tag, searchData);
	}
	
	
	
}
