package com.project.simple.delmember.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.simple.delmember.vo.DelMemberVO;

@Repository("delmemberDAO")
public class DelMemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	//db에서 회원 탈퇴한 사용자 목록 조회
	public List<DelMemberVO> selectRetireMember() throws Exception{
		return sqlSession.selectList("mapper.delmember.selectRetireMember");
		
	}
	
	//db에서 회언 탈퇴된 사용자 삭제
	public int deleteRetireMember(DelMemberVO delmemberVO) throws Exception{
		return sqlSession.delete("mapper.delmember.deleteRetireMember", delmemberVO);
	}

}
