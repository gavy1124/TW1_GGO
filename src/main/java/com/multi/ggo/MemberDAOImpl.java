package com.multi.ggo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

	SqlSession sqlSession;
	
	@Autowired
	public MemberDAOImpl(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}


	@Override
	public int insert(MemberDTO memberdto) {    //등록
		return sqlSession.insert("com.multi.ggo.write", memberdto);
	}


	@Override
	public List<MemberDTO> memberlist() {   // 전체리스트
		return sqlSession.selectList("com.multi.ggo.selectall");
	}


	@Override
	public MemberDTO memberIdRead(String id) {  //읽기
		return sqlSession.selectOne("com.multi.ggo.idRead",id);
	}


	@Override  
	public int delete(String id) {   //삭제
		return sqlSession.delete("com.multi.ggo.idDelete", id);
	}


	@Override
	public int update(MemberDTO dto) { //수정
		return sqlSession.update("com.multi.ggo.idUpdate", dto);
	}


	
	@Override
	public MemberDTO login(MemberDTO idInfo) { //로그인
		MemberDTO login = sqlSession.selectOne("com.multi.ggo.login",idInfo);
		return login;
	}


	
	
	
	

	@Override
	public List<MemberDTO> findByCategory(String sort) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<MemberDTO> Search(String data) { //하단검색
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.multi.ongo.bottomSearch",data);
	}


	@Override
	public List<MemberDTO> Search(String tag, String searchData) { //하단검색
		//search와 tag 한쌍으로 넘어와야 하니까 Map사용
		Map<String,String> map = new HashMap<String, String>();
		map.put("tag", tag);
		map.put("searchData", searchData);
		return sqlSession.selectList("com.multi.ggo.dynamicSearch", map);
	}


	@Override
	public List<MemberDTO> boardCategory(String sort) { // 조회타입
		System.out.println("dao임플의 sort : " + sort);
		return sqlSession.selectList("com.multi.ggo.boardCategory",sort);
	}


	

	


	
	
	
	
	
	
	
	
	
	
	
	
	
}
