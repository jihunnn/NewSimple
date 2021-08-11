package com.project.simple.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.project.simple.board.vo.ArticleVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;
	
	// 비밀번호 변경
	@Transactional
	public int update_pw(MemberVO memberVO) throws Exception{
		return sqlSession.update("mapper.member.update_pw", memberVO);
	}
	
	@Override
	public List<MemberVO> selectAllMemberList(Criteria cri) throws DataAccessException{
		List<MemberVO> membersList = sqlSession.selectList("mapper.member.selectAllMemberList", cri);
		return membersList;
	}
	
	@Override
	public int insertMember(MemberVO memberVO)throws DataAccessException{
		int result=sqlSession.insert("mapper.member.insertMember", memberVO);
		return result;
	}
	
	@Override
	public int insertMember_naver(MemberVO memberVO)throws DataAccessException{
		int result=sqlSession.insert("mapper.member.insertMember_naver", memberVO);
		return result;
	}
	
	@Override
	public int deleteMember(MemberVO removemember) throws DataAccessException{
		int result=sqlSession.delete("mapper.member.deleteMember", removemember);
		
		return result;
	}
	
	//로그인 기능 구현 추가
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException{
		MemberVO vo = sqlSession.selectOne("mapper.member.loginById", memberVO);
		return vo;
	}
	
	//네이버로로그인 기능 구현 추가
		public MemberVO loginBynaver(MemberVO memberVO) throws DataAccessException{
			MemberVO vo = sqlSession.selectOne("mapper.member.loginBynaver", memberVO);
			return vo;
		}
	
	public int updateMember(MemberVO modmember) throws DataAccessException{
		int result = sqlSession.update("mapper.member.updateMember", modmember);
		return result;
	}

	@Override
	public int selectMemberCount() throws DataAccessException {
		int memberCount = sqlSession.selectOne("mapper.member.selectMemberCount");

		return memberCount;
	}

	@Override
	public List<MemberVO> memberSearchList(Map<String, Object> memberSearchMap) throws DataAccessException {
		List<MemberVO> memberSearchList =sqlSession.selectList("mapper.member.memberSearchList",memberSearchMap);		
		return memberSearchList;
	}

	@Override
	public int memberSearchCount(Map<String, Object> search) throws DataAccessException {
		int memberSearchCount = sqlSession.selectOne("mapper.member.memberSearchCount",search);

		return memberSearchCount;
	}

	@Override
	public MemberVO deleteMemberlist(String memId) throws DataAccessException {
		MemberVO result = sqlSession.selectOne("mapper.member.deleteMemberlist",memId);
		return result;
	}

	@Override
	public MemberVO find_Id(MemberVO memberVO) throws DataAccessException {
		MemberVO vo = sqlSession.selectOne("mapper.member.find_Id", memberVO);
		return vo;
	}

	@Override
	public String selectOverlappedID(String memId) throws DataAccessException {
		String result =  sqlSession.selectOne("mapper.member.selectOverlappedID",memId);
		return result;
	}

	// 아이디 중복 검사
	@Override
	public int check_id(String memId) throws Exception{
		return sqlSession.selectOne("mapper.member.check_id", memId);
	}
	
	// 로그인 검사
	@Override
	public MemberVO check_email(String memId) throws Exception{
		return sqlSession.selectOne("mapper.member.check_email", memId);
	}

	@Override
	public MemberVO EmailConfirm(String approval_key) throws Exception {
		MemberVO result =  sqlSession.selectOne("mapper.member.EmailConfirm",approval_key);
		return result;
	}

	@Override
	public int updatenewPassWord(MemberVO member) throws DataAccessException {
		System.out.println(member);
		int result = sqlSession.update("mapper.member.updatenewPassWord", member);
	
		return result;
	}

	@Override
	public MemberVO loginBykakao(MemberVO memberVO) throws DataAccessException {
		MemberVO vo = sqlSession.selectOne("mapper.member.loginBykakao", memberVO);
		return vo;
	}

	@Override
	public int insertMember_kakao(MemberVO memberVO) throws DataAccessException {
		int result=sqlSession.insert("mapper.member.insertMember_kakao", memberVO);
		return result;
	}

	@Override
	public MemberVO check_phone(String memId) throws Exception {
		return sqlSession.selectOne("mapper.member.check_phone", memId);
	}



}