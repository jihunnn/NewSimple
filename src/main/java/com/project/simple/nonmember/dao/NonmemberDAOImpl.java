package com.project.simple.nonmember.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


import com.project.simple.nonmember.vo.NonmemberVO;



@Repository("nonmemberDAO")
public class NonmemberDAOImpl implements NonmemberDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<NonmemberVO> nonmemberorderById(NonmemberVO nonmemberVO) throws DataAccessException {
		List nonOrderLookupList= sqlSession.selectList("mapper.nonmember.nonmemberorderById", nonmemberVO);
		System.out.println(nonOrderLookupList);
		return nonOrderLookupList;
	}


}
