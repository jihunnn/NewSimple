package com.project.simple.nonmember.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.project.simple.nonmember.vo.NonmemberVO;

public interface NonmemberDAO {

	public List<NonmemberVO> nonmemberorderById(NonmemberVO nonmemberVO)throws DataAccessException;


}
