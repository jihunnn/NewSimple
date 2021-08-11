<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>


<style>
#main_box { /*아이디 선택자*/
	display: flex;
	flex-direction: column;
	align-items: center;
	padding-top: 10px;
}

#Join { /*아이디 선택자*/
	display: flex;
	flex-direction: column;
	width: 1300px;
	height: 100px;
	align-items: center;
	padding-top: 10px;
	font-size: 20px;
}

.Easy-sgin-in-wrap {
	display: flex;
	flex-direction: column; /*column으로 정렬 */
	float: right;
}

.Easy-sgin-in-wrap .sign-button-list {
	list-style: none;
	width: 350px;
	display: flex;
	flex-direction: column;
}

.Easy-sgin-in-wrap .sign-button-list li {
	padding-top: 10px;
}

.Easy-sgin-in-wrap .sign-button-list li button {
	width: 350px;
	height: 40px;
	border: 1px solid rgb(0, 0, 0);
	text-align: center;
	background: rgb(255, 255, 255);
}

.Easy-sgin-in-wrap .sign-button-list li button i {
	font-size: 10px;
}

#sect {
	display: flex;
	flex-direction: row;
	padding-bottom: 10px;
}

#RightBox {
	width: 350px;
	height: 300px;
	border: 1px solid rgb(0, 0, 0);
	margin: 10 10 10 10;
}

#Non_login_text {
	padding: 20px;
	margin-right: 20px;
	font-size: 20px;
}

#pwd_find {
	width: 430px;
	height: 200px;
}

.pwd_find>div {
	float: left;
}

.pwd_find {
	padding-top: 25px;
	padding-left: 40px;
}

#confirm {
	
}

#phone_confirm {
	width: 130px;
	height: 100px;
	padding-left: 10px;
}

#email_confirm {
	width: 130px;
	height: 100px;
}

h3 {
	color: block;
}
</style>
</head>
<title>회원수정완료창</title>
<body>


	<!-- 타이틀 -->
	<section class="ftco-section testimony-section"
		style="padding-top: 50px;">
		<div class="container" style="margin-bottom:500px;">
			<div class="row justify-content-center mb-5 pb-3"
				style="background-color: #f5f5f5; border: 1px solid #e7e7e7; margin-top: 50px;">
				<div class="col-md-20 heading-section ftco-animate"
					style="height: 60px;">
					<h2 class="mb-4" style="font-size: 35px; margin-top: 15px;">회원가입</h2>
				</div>
			</div>
			<!-- 타이틀 끝 -->
			<!-- 최근 본 상품 -->
			<jsp:include page="/WEB-INF/views/common/quick.jsp" flush="false" />

			<section class="ftco-section testimony-section" id="sect"
				style="padding-top: 50px;">
				<div class="container" style="text-align: center;">
					<div style="padding-bottom: 40px">
						<h4 style="font-size: 22px;">회원정보가 성공적으로 수정되었습니다. 다시 로그인 해주세요!</h4>
					</div>
					<div>
						<div style="padding-right: 15px">
							<button onclick="location.href='${contextPath}/login_01.do'"
								style="width: 262px; background-color: #212529; color: white;">
								<i class="go_login-06"></i><span>로그인으로 돌아가기</span>
							</button>
						</div>
					</div>

				</div>
			</section>
		</div>
	</section>
</body>
</html>














