package com.multi.ggo.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Board_DAOImpl implements Board_DAO {
	SqlSession session;
	
	@Autowired
	public Board_DAOImpl(SqlSession session) {
		super();
		this.session = session;
	}

	@Override  //글등록
	public int b_insert(Board_DTO dto) {
		return session.insert("com.multi.ggo.board.b_insert", dto);
	}

	@Override // 전체글조회
	public List<Board_DTO> b_list() {
		return session.selectList("com.multi.ggo.board.b_list");
	}

	@Override //카테고리별조회
	public List<Board_DTO> findByCategory(String category) {
		return session.selectList("com.multi.ggo.board.findByCategory", category);
	}

	@Override //읽기
	public Board_DTO b_read(String no) {
		return session.selectOne("com.multi.ggo.board.b_read", no);
	}

	//----------------------------------------------------------

	
	//첨부파일등록
	@Override
	public int insertFile(List<Board_FileDTO> boardfilelist) {
		return session.insert("com.multi.ggo.board.fileinsert", boardfilelist);
	}
	

	//업로드한거조회
	@Override
	public List<Board_FileDTO> getFileList(String no) {
		return session.selectList("com.multi.ggo.board.fileselect", no);
	}

	
	//다운로드 ( @PathVariable String id, @PathVariable String no, @PathVariable String boardFileno 일치하는 boardFileDTO정보가져오기)
	@Override
	public Board_FileDTO getFile(Board_FileDTO inputdata) {
		return session.selectOne("com.multi.ggo.board.getFile", inputdata);
	}

	@Override // 조회
	public void increaseHit(String no) {
		session.update("com.multi.ggo.board.hits", no);
		
	}

//	@Override // 페이징1
//	public List<Board_DTO> pagingList(Criteria_DTO criteria) {
//		System.out.println("dao임플 criteria 확인 : " + criteria);
//		return session.selectList("com.multi.ggo.board.pagingList", criteria);
//	}

	
	
	
	
	
	//페이징 - 테스트2
	@Override
	public int countBoard() {
		return session.selectOne("com.multi.ggo.board.countBoard");
	}

	@Override
	public List<PagingVO> selectBoard(PagingVO vo) {
		return session.selectList("com.multi.ggo.board.selectBoard", vo);
	}

	@Override
	public List<Board_DTO> searchData(String tag, String searchData) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("tag", tag);
		map.put("searchData", searchData);
		//System.out.println("맵체크" +map);
		return session.selectList("com.multi.ggo.board.searchData", map);
	}



}
