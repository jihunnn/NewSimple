package com.project.simple.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;

public interface MemberDAO{
	public List<MemberVO> selectAllMemberList(Criteria cri) throws DataAccessException;
	public int selectMemberCount() throws DataAccessException;
	public int insertMember(MemberVO memberVO) throws DataAccessException;
	public int insertMember_naver(MemberVO memberVO) throws DataAccessException;
	public int deleteMember(MemberVO removemember) throws DataAccessException;
	public int updateMember(MemberVO modmember) throws DataAccessException;
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
	public MemberVO loginBynaver(MemberVO memberVO) throws DataAccessException;
	public List<MemberVO> memberSearchList(Map<String, Object> memberSearchMap)throws DataAccessException;
	public int memberSearchCount(Map<String, Object> search) throws DataAccessException;
	public MemberVO deleteMemberlist(String memId) throws DataAccessException;
	public MemberVO find_Id(MemberVO memberVO) throws DataAccessException;
	public String selectOverlappedID(String memId) throws DataAccessException;
	public int update_pw(MemberVO memberVO) throws Exception;
	public int check_id(String memId) throws Exception;
	public MemberVO check_email(String memId) throws Exception;
	public MemberVO EmailConfirm(String approval_key) throws Exception;
	public int updatenewPassWord(MemberVO member)throws DataAccessException;
	public MemberVO loginBykakao(MemberVO memberVO)throws DataAccessException;
	public int insertMember_kakao(MemberVO memberVO)throws DataAccessException;
	public MemberVO check_phone(String memId) throws Exception;


	
}