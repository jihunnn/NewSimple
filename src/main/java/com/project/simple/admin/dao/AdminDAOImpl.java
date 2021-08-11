package com.project.simple.admin.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.simple.admin.vo.AdminVO;
import com.project.simple.board.vo.ArticleVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.mypage.vo.MypageVO;
import com.project.simple.page.Criteria;
import com.project.simple.product.vo.ProductVO;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSession sqlSession;

	// 로그인 기능 구현 추가
	public AdminVO adminloginById(AdminVO adminVO) throws DataAccessException {
		AdminVO vo = sqlSession.selectOne("mapper.admin.adminloginById", adminVO);
		return vo;
	}

	// DB에서 멤버 아이디에 해당하는 정보 조회
	@Override
	public MemberVO selectMember(String memId) throws DataAccessException {
		return sqlSession.selectOne("mapper.admin.selectMember", memId);
	}

	// Inquiry 전체 목록 조회
	@Override
	public List<ArticleVO> selectAllInquiryList(Criteria cri) throws DataAccessException {
		List<ArticleVO> inquiryList = sqlSession.selectList("mapper.admin.selectAllInquiryList", cri);
		return inquiryList;
	}

	@Override
	public int selectInquiryCount() throws DataAccessException {
		int inquiryCount = sqlSession.selectOne("mapper.admin.selectInquiryCount");

		return inquiryCount;
	}
	
	@Override
	public int insertNewNotice(Map noticeMap) throws DataAccessException {
		int noticeNum = selectNewNoticeNum();
		noticeMap.put("noticeNum", noticeNum);
		sqlSession.insert("mapper.admin.insertNewNotice", noticeMap);
		return noticeNum;
	}
	
	private int selectNewNoticeNum() throws DataAccessException {
		return sqlSession.selectOne("mapper.admin.selectNewNoticeNum");
		
	}
	
	// notice 수정하기폼
	@Override
	public ArticleVO selectNotice(int noticeNum) throws DataAccessException {
		return sqlSession.selectOne("mapper.admin.selectNotice", noticeNum);
	}
	
	//notice 수정하기
	@Override
	public void updateNotice(Map noticeMap) throws DataAccessException {
		sqlSession.update("mapper.admin.updateNotice", noticeMap);
	}
	
	//공지사항 삭제하기
	@Override
	public void deleteNotice(int noticeNum) throws DataAccessException {
		sqlSession.delete("mapper.admin.deleteNotice", noticeNum);
	}
	
	//자주묻는 질문 글쓰기
	@Override
	public void insertNewQuestion(ArticleVO question) throws DataAccessException {
		sqlSession.insert("mapper.admin.insertNewQuestion", question);

	}
	
	// 자주묻는 질문 수정하기폼
	@Override
	public ArticleVO selectQuestion(int questionNum) throws DataAccessException {
		return sqlSession.selectOne("mapper.admin.selectQuestion", questionNum);
	}
	
	//자주묻는 질문 수정하기
	@Override
	public void updateQuestion(ArticleVO question) throws DataAccessException {
		sqlSession.update("mapper.admin.updateQuestion", question);
	}
	
	//자주묻는 질문 삭제하기
	@Override
	public void deleteQuestion(int questionNum) throws DataAccessException {
		sqlSession.delete("mapper.admin.deleteQuestion",questionNum);
	}
	
	//1:1문의 답변 등록 폼
	@Override
	public ArticleVO selectInquiryAnswer(int inquiryNum) throws DataAccessException {
		return sqlSession.selectOne("mapper.admin.selectInquiryAnswer", inquiryNum);
	}
	
	//1:1문의 답변 등록
	@Override
	public void insertNewInquiryAnswer(ArticleVO inquiry) throws DataAccessException {
		sqlSession.update("mapper.admin.insertNewInquiryAnswer", inquiry);

	}
	
	//1:1문의 답변 삭제하기
	@Override
	public void deleteInquiryAnswer(int inquiryNum) throws DataAccessException {
		sqlSession.delete("mapper.admin.deleteInquiryAnswer", inquiryNum);
	}
	
	//asCenter 접수완료
	@Override
	public void updateAsCenterConfirm(int asCenterNum) throws DataAccessException {
		sqlSession.update("mapper.admin.updateAsCenterConfirm", asCenterNum);
	}


	@Override
	public int updateAdminMember(MemberVO modmember) throws DataAccessException {
		int result = sqlSession.update("mapper.admin.updateAdminMember", modmember);
		return result;
	}

	@Override
	public void deleteSelectRemoveMember(String memId) throws DataAccessException {
		sqlSession.delete("mapper.admin.deleteSelectRemoveMember",memId);
		
	}

}
