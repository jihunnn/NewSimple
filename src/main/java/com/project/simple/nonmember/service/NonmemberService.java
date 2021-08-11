package com.project.simple.nonmember.service;

import java.util.List;

import com.project.simple.nonmember.vo.NonmemberVO;

public interface NonmemberService {

	public List<NonmemberVO> order_lookup(NonmemberVO nonmemberVO) throws Exception;


}
