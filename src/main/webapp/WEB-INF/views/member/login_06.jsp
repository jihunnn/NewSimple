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

#sect {
	display: flex;
	flex-direction: row;
	padding-bottom: 10px;
}
</style>
</head>
<title>새비밀번호완료창</title>
<body>
	

	<section class="ftco-section testimony-section"
		style="padding-top: 200px;">
		<div class="container">

			<!-- 최근 본 상품 -->
<jsp:include page="/WEB-INF/views/common/quick.jsp" flush="false" />


			<section class="ftco-section testimony-section" id="sect">
				<div class="container" style="text-align: center;">
					<div style="padding-bottom: 40px">
						<h4
							style="margin-top: 20px; margin-bottom: 30px; font-size: 20px; color:#5f5f5f; font-weight:bold;">비밀번호가
							정상적으로 변경되었습니다.</h4>
					</div>
					<div class="pass_input_confirm">
						<div>
							<button onclick="location.href='${contextPath}/login_01.do'"
								style="width: 262px; background-color: #7e9c8c; color: white; border:none; font-size:13px; height:40px;">
								<i class="go_login-06"></i><span>로그인으로 돌아가기</span>
							</button>
						</div>
					</div>

				</div>
			</section>
		</div>

	</section>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>














