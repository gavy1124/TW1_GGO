package com.multi.ggo.board;

import java.util.List;

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

	@Override
	public Board_DTO b_read(String no) {
		return session.selectOne("com.multi.ggo.board.b_read", no);
	}


}
