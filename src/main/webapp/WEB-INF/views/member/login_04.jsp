<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>


<style>
#main_box { /*아이디 선택자*/
	display: flex;
	flex-direction: column;
	align-items: center;
	padding-top: 10px;
}

#login { /*아이디 선택자*/
	display: flex;
	flex-direction: column;
	width: 1300px;
	height: 100px;
	align-items: center;
	padding-top: 10px;
	font-size: 20px;
}

h3 {
	color: block;
}

.Easy-sgin-in-wrap5 {
	display: flex;
	flex-direction: column; /*column으로 정렬 */
	align-items: center;
	padding-right: 90px;
}

.Easy-sgin-in-wrap5 .sign-button-list5 {
	list-style: none;
	width: 300px;
	display: flex;
	flex-direction: column;
}

.Easy-sgin-in-wrap5 .sign-button-list5 li {
	padding-bottom: 10px;
}

.Easy-sgin-in-wrap5 .sign-button-list5 li button {
	width: 300px;
	height: 40px;
	border: 1px solid rgb(0, 0, 0);
	text-align: center;
	background: rgb(255, 255, 255);
}

.Easy-sgin-in-wrap5 .sign-button-list5 li button i {
	font-size: 25px;
}
</style>
</head>
<title>아이디찾기완료창</title>
<body>

	<!-- 타이틀 -->
	<section class="ftco-section testimony-section"
		style="padding-top: 140px;">
		<div class="container">

			<!-- 타이틀 끝 -->
			<!-- 최근 본 상품 -->
			<jsp:include page="/WEB-INF/views/common/quick.jsp" flush="false" />
	

				<section class="ftco-section testimony-section" id="sect"
					style="padding-top: 10px; padding-bottom: 20px; border: 1px solid #eeeeee; width: 500px; left: 380px;">
					<div class="container" style="text-align: center;">
				<div style="margin-bottom: 10px;">
					<h3 style="color: #7e9c8c;  font-size: 20px; font-weight: bold; text-align: left;">아이디
						확인</h3>
				</div>
						<div style="font-size: 13px; margin-top:20px; background-color:#fbfbfb; border: 1px solid #eeeeee; height:80px; padding-top:25px;">
							<c:if test="${findId == true && member != null}">
								<a style="color: #7e9c8c; font-weight: bold;">${member.memName}</a>
								<a>님의 아이디는</a>
								<a style="color: #7e9c8c; font-weight: bold;">${member.memId}</a>
								<a>입니다.</a>
							</c:if>
						</div>

					</div>
				</section>
		</div>
	</section>

	<div class="container">
		<section class="Easy-sgin-in-wrap5">
			<ul class="sign-button-list5">
				<li><button
						style="background-color: #7e9c8c; color: white; font-size: 13px; cursor: pointer; border: none;"
						onclick="location.href='${contextPath}/login_01.do'">
						<i class="back_login-01"></i><span>로그인으로 돌아가기</span>
					</button></li>
				<li><button
						style="background-color: white; color: gray; font-size: 13px; cursor: pointer; border: 1px solid #eeeeee;"
						onclick="location.href='${contextPath}/login_03.do'">
						<i class="go_Login-03"></i><span>비밀번호 찾기</span>
					</button></li>
			</ul>
		</section>

	</div>

	<br>
	<br>
	<br>
	<br>

</body>
</html>














