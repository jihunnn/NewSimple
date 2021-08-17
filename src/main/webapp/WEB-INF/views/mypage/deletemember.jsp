<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head></head>
<title></title>
<body>
	<!-- 마이페이지 타이틀 -->
	<section class="ftco-section"
		style="padding-top: 100px; margin-bottom: 50px; padding-bottom: 0px; height: 700px;">
		<div class="container">

			<!-- 마이페이지 타이틀 끝 -->
			<!-- 최근 본 상품 -->
			<jsp:include page="/WEB-INF/views/common/quick.jsp" flush="false" />
			<!-- 최근 본 상품 끝 -->
			<!-- Left Menu -->
			<jsp:include page="/WEB-INF/views/common/mypage_sidemenu.jsp"
				flush="false" />
			<!-- left Menu 끝-->
			<c:choose>
				<c:when test="${loginType eq '일반'}">
					<div style="text-align: center; font-size: 13px;">
						<h3
							style="font-size: 20px; font-weight: bold; padding-bottom: 50px; color: #7e9c8c; padding-top: 100px;">아이디와
							비밀번호를 입력해주세요</h3>
						<form action="${contextPath}/removeMember.do" method="POST">
							아이디 <input type="text" name="memId"
								style="border: 1px solid #dcdcdc; margin-bottom: 10px; height: 29px;"><br>
							비밀번호 <input type="password"
								style="border: 1px solid #dcdcdc; height: 29px; margin-bottom: 10px; margin-right: 13px;"
								name="memPwd"> <br> <input
								style="background-color: #5f5f5f; cursor: pointer; margin-left: 42px; width: 145px; height: 30px; color: white; font-size: 13px; border: none; border-radius: 2px;"
								type="submit" value="탈퇴하기">
						</form>
					</div>
				</c:when>
				<c:otherwise>
					<div style="text-align: center; font-size: 13px;">
						<h3
							style="font-size: 20px; font-weight: bold; padding-bottom: 50px; color: #7e9c8c; padding-top: 100px;">회원탈퇴를
							원하시면 "지금탈퇴"를 입력해주세요</h3>
						<form action="${contextPath}/removeMember_SNSmember.do"
							method="POST">
							<input type="text" name="SNS"
								style="border: 1px solid #dcdcdc; margin-bottom: 10px; height: 29px;"><br>
							<input
								style="background-color: #5f5f5f; cursor: pointer; margin-left: 0px; width: 145px; height: 30px; color: white; font-size: 13px; border: none; border-radius: 2px;"
								type="submit" value="탈퇴하기">
						</form>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</section>



</body>
</html>