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
<title>회원가입완료창</title>
<body>


	<!-- 타이틀 -->
	<div
		style="padding-top: 50px; margin-top: 50px; margin-bottoem: 200px;">


		<!-- 타이틀 끝 -->
		<!-- 최근 본 상품 -->


		<div
			style="padding-top: 120px; border: 1px solid #eeeeee; width: 600px; height: 400px; margin-bottom: 200px; margin-left: 620px;">
			<div class="container" style="text-align: center;">
				<div style="padding-bottom: 40px">
					<h4 style="font-size: 20px; color: gray; font-weight: bold;">축하합니다!
						회원가입이 성공적으로 완료되었습니다.</h4>
					<h4 style="font-size: 18px; color: gray;">알차고 실속있는 서비스로
						찾아뵙겠습니다.</h4>
				</div>
				<div>
					<div style="padding-right: 15px">
						<button onclick="location.href='${contextPath}/main.do'"
							style="width: 262px; margin-right:20px;background-color: white; color: gray; border: none; border-radius: 2px; width: 130px; height: 45px; border: 1px solid #eeeeee;">
							<i class="go_login-06"></i><span>홈으로</span>
						</button>
						<button onclick="location.href='${contextPath}/login_01.do'"
							style="width: 262px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 130px; height: 45px;">
							<i class="go_login-06"></i><span>로그인</span>
						</button>

					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>














