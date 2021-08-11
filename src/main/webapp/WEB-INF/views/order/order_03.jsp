<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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

.order_text {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding-bottom: 20px;
	font-size: 20px;
}

table {
	height: 100px;
}

th, td {
	text-align: center;
}

th:nth-child(2n+1), td:nth-child(2n+1) {
	background-color: rgb(200, 200, 200);
}

#main-back {
	padding-top: 20px;
	text-align: center;
}
</style>
</head>
<title>주문결제창</title>
<body>


	<!-- 최근 본 상품 -->
	<div id="recentlyProduct"
		style="position: absolute; width: 120px; height: 310px; margin-left: 1700px; border: 1px solid #d2d2d2; margin-top: 0px;">
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
	<!-- 최근본상품끝 -->

	<!-- 내용 -->
	<section class="ftco-section"
		style="padding-top: 100px; padding-bottom: 0px;"></section>

<c:choose>
<c:when test="${isLogOn==true}">
	<section class="ftco-section testimony-section"
		style="padding-top: 0px;">
		<div class="container">
			<div>
				<h4 class="order_text" style="margin-bottom: 50px; font-size: 20px;">주문
					결제가 정상적으로 완료되었습니다.</h4>
			</div>
		</div>
		<div class="container" style="padding-bottom: 50px">
			<table border="1" width="1000" align="center"
				style="font-size: 14px; border: 1px solid #eeeeee;">
				<tr height="60">
					<th width="250"
						style="background-color: #eeeeee; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #c6c8ca; font-size: 15px;">주문번호</th>
					<th width="300"
						style="border-bottom: 1px solid #c6c8ca; border-top: 1px solid #7e9c8c;">${memOrderNum}</th>
					<th width="250"
						style="background-color: #eeeeee; border-top: 1px solid #7e9c8c; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #c6c8ca; font-size: 15px;">결제방법</th>
					<th width="300"
						style="border-bottom: 1px solid #c6c8ca; border-top: 1px solid #7e9c8c;">${memPaymentMethod}</th>
				</tr>
				<tr height="60">
					<th width="250"
						style="background-color: #eeeeee; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #c6c8ca; font-size: 15px;">결제금액</th>
					<th width="300"
						style="border-bottom: 1px solid #c6c8ca; border-top: 1px solid #7e9c8c;">${Price}원</th>
					<th width="250"
						style="background-color: #eeeeee; border-top: 1px solid #7e9c8c; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #c6c8ca; font-size: 15px;">지급 예정 적립금</th>
					<th width="300"
						style="border-bottom: 1px solid #c6c8ca; border-top: 1px solid #7e9c8c;">${point}원</th>
						
				</tr>
			</table>
		</div>
		<div class="container">
			<div id="main-back">
				<button onclick="location='${contextPath}/main.do'"
					style="padding-left: 10px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 130px; height: 45px;">확인</button>
			</div>
		</div>
	</section>
	</c:when>
	<c:otherwise>
	<section class="ftco-section testimony-section"
		style="padding-top: 0px;">
		<div class="container">
			<div>
				<h4 class="order_text" style="margin-bottom: 50px; font-size: 20px;">주문
					결제가 정상적으로 완료되었습니다.</h4>
			</div>
		</div>
		<div class="container" style="padding-bottom: 50px">
			<table border="1" width="1000" align="center"
				style="font-size: 14px; border: 1px solid #eeeeee;">
				<tr height="60">
					<th width="250"
						style="background-color: #eeeeee; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #c6c8ca; font-size: 15px;">주문번호</th>
					<th width="300"
						style="border-bottom: 1px solid #c6c8ca; border-top: 1px solid #7e9c8c;">${nonmemOrderNum}</th>
					<th width="250"
						style="background-color: #eeeeee; border-top: 1px solid #7e9c8c; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #c6c8ca; font-size: 15px;">결제방법</th>
					<th width="300"
						style="border-bottom: 1px solid #c6c8ca; border-top: 1px solid #7e9c8c;">${nonmemPaymentMethod}</th>
				</tr>
				<tr height="60">
					<th width="250"
						style="background-color: #eeeeee; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #c6c8ca; font-size: 15px;">결제금액</th>
					<th colspan="3" width="300"
						style="border-bottom: 1px solid #c6c8ca;"><a>${Price}원</a></th>
				</tr>
			</table>
		</div>
		<div class="container">
			<div id="main-back">
				<button onclick="location='${contextPath}/main.do'"
					style="padding-left: 10px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 130px; height: 45px;">확인</button>
			</div>
		</div>
	</section>
	</c:otherwise>
	</c:choose>
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














