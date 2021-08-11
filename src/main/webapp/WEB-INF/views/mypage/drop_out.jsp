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

#Drop out { /*아이디 선택자*/
	display: flex;
	flex-direction: column;
	width: 1300px;
	height: 100px;
	align-items: center;
	padding-top: 10px;
	font-size: 20px;
}

.order_text {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding-bottom: 20px;
	font-size: 20px;
}

#main-back {
	padding-top: 20px;
	text-align: center;
}
</style>
</head>
<title>회원탈퇴완료창</title>
<body>


	<!-- 타이틀(음영X) -->
	<section class="ftco-section testimony-section">
		<div class="container">
			<div id=main_box>
				<div id="Drop out">
					<h1 class="mb-4">회원탈퇴</h1>
				</div>
				<!-- 타이틀 끝 -->
				<!-- 내용 -->
				<section class="ftco-section testimony-section">
					<div class="container">
						<div class="order_text">
							<h4>회원 탈퇴가 완료되었습니다.</h4>
							<h4>그동안 Simple서비스를 아끼고 사랑해주셔서 고맙습니다.</h4>
							<h4>더욱 더 노력하고 발전하는 Simple이 되겠습니다.</h4>
						</div>
					</div>

					<div class="container">
						<div id="main-back">
							<button onclick="location.href='${contextPath}/main.do'"
								style="height: 40px; width: 210px; font-size: 17px; background-color: #212529; color: white;">Simple
								홈 바로가기</button>
						</div>
					</div>
				</section>
			</div>
		</div>
	</section>
	<!-- 내용 끝 -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
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














