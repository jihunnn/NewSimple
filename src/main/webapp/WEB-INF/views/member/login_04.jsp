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
		style="padding-top: 50px;">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3"
				style="background-color: #f5f5f5; border: 1px solid #e7e7e7; margin-top: 50px;">
				<div class="col-md-20 heading-section ftco-animate"
					style="height: 60px;">
					<h2 class="mb-4" style="font-size: 35px; margin-top: 15px;">아이디
						찾기</h2>
				</div>
			</div>
			<!-- 타이틀 끝 -->
			<!-- 최근 본 상품 -->
			<div id="recentlyProduct"
				style="position: absolute; width: 120px; height: 310px; margin-left: 1370px; border: 1px solid #d2d2d2; margin-top: -100px;">
				<ul
					style="list-style: none; margin-top: 10px; padding-left: 20px; margin-bottom: 10px;">
					<li><a href="#"
						style="padding-left: -10px; padding-bottom: 1px; color: black;">최근본상품</a></li>
				</ul>
				<hr style="margin-top: 0px; margin-bottom: 0px; color: #d2d2d2;">
				<ul style="list-style: none; padding-top: 5px;">
					<li><a href="#"><img
							src="${contextPath}/resources/images/image_1.jpg"
							style="width: 100px; height: 100px; padding-top: 10px; margin-left: -30px;"></a></li>
					<li><a href="#"><img
							src="${contextPath}/resources/images/image_2.jpg"
							style="width: 100px; height: 100px; padding-top: 10px; padding-top: 10px; margin-left: -30px;"></a></li>
				</ul>
				<hr style="margin-top: 0px; margin-bottom: 0px; color: #d2d2d2;">
				<ul
					style="list-style: none; padding-left: 30px; margin-bottom: 10px; margin-top: 8px;">
					<li><a href="#"
						style="color: black; text-align: center; margin-top: 8px; padding-top: 30px;">더보기▼</a></li>
				</ul>
			</div>


			<section class="ftco-section testimony-section" id="sect"
				style="padding-top: 60px; padding-bottom: 50px;">
				<div class="container" style="text-align: center;">
					<div>
						<h3>아이디 확인</h3>
					</div>
					<div>
						<c:if  test="${findId == true && member != null}">
		                        <a>${member.memName}</a> <a>님의 아이디는</a> <a>${member.memId}</a> <a>입니다.</a>
		                </c:if>
					</div>

				</div>
			</section>
		</div>
	</section>

	<div class="container">
		<section class="Easy-sgin-in-wrap5">
			<ul class="sign-button-list5">
				<li><button style="background-color: #212529; color: white;"
						onclick="location.href='${contextPath}/login_01.do'">
						<i class="back_login-01"></i><span>로그인으로 돌아가기</span>
					</button></li>
				<li><button style="background-color: #212529; color: white;"
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














