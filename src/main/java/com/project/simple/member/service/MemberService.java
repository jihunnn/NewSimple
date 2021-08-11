package com.project.simple.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;

import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;

public interface MemberService{
	public List<MemberVO> listMembers(Criteria cri) throws DataAccessException;
	
	public int memberCount() throws Exception;
	
	public int addMember(MemberVO memberVO) throws DataAccessException;
	
	public int addMember_naver(MemberVO memberVO) throws DataAccessException;
	
	public int modMember(MemberVO modmember) throws DataAccessException;
	
	public int removeMember(MemberVO removemember) throws DataAccessException;
	
	public MemberVO login(MemberVO memberVO) throws Exception;

	public MemberVO login_naver(MemberVO memberVO) throws Exception;

	public Map<String, Object> memberSearch(Map<String, Object> memberSearchMap)throws Exception;

	public int memberSearchCount(Map<String, Object> search) throws Exception;

	public MemberVO admin_removeMember(String memId) throws DataAccessException;
	
	public MemberVO findId(MemberVO memberVO) throws Exception;

	public String overlapped(String memId)throws Exception;

	public void send_mail(MemberVO memberVO, String div) throws Exception;

	public void find_pw(HttpServletRequest request,HttpServletResponse response, MemberVO memberVO) throws Exception;

	public void check_id(String memId, HttpServletResponse response) throws Exception;

	public MemberVO email_confirm(String approval_key)throws Exception;

	public int newPassWord(MemberVO member) throws  DataAccessException ;

	public MemberVO login_kakao(MemberVO memberVO)throws Exception;

	public int addMember_kakao(MemberVO memberVO) throws DataAccessException;

	public void certifiedPhoneNumber(String phoneNumber, String approval_key)throws Exception;

	public int check_id(String memId)throws Exception;

	public MemberVO check_phone(String memId)throws Exception;

	public void update_pw(MemberVO memberVO)throws Exception;



	

	
	
}