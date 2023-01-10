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

	@Override //글등록
	public int b_insert(Board_DTO dto) {
		return dao.b_insert(dto);
	}

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

	@Override
	public Board_DTO b_read(String no) {
		return dao.b_read(no);
	}
		
	
	
		

	
	
}
