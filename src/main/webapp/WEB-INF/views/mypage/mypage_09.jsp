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
#Mypage { /*아이디 선택자*/
	display: flex;
	flex-direction: column;
	width: 1300px;
	height: 100px;
	align-items: center;
	padding-top: 10px;
	padding-right: 20px;
	font-size: 10px;
}
.my_row {
	flex-direction: row;
}
.container1 {
	width: 250px;
}
.container2 {
	width: 800px;
}
#sect {
	display: flex;
	flex-direction: row;
	padding-bottom: 10px;
}
.nav_MyPage {
	width: 120px;
	list-style-type: none;
	margin: 0;
	padding: 0;
	font-size: 14px;
}
#MyPage_center1 {
	border: 1px solid rgb(140, 140, 140);
}
.nav_MyPage li a {
	display: block;
	color: #000000;
	padding: 8px;
	text-align: center;
	text-decoration: none;
	font-weight: bold;
}
.nav_MyPage li a.current {
	background-color: rgb(200, 200, 200);
	color: block;
}
.nav_MyPage li a: hover:not(.current) {
	background-color: #CD853F;
	color: white;
}
#MyPage_top {
	padding-top: 50px;
	align-items: center;
	width: 700px;
	height: 100px;
}
#MyPage_top1 {
	padding-top: 50px;
	align-items: center;
	padding-left: 330px;
	width: 700px;
	height: 100px;
}
#MyPage_top2 {
	padding-top: 50px;
	align-items: center;
	padding-left: 200px;
	width: 700px;
	height: 100px;
}
.PASSWORD_confirm_text {
	position: relative;
	left: 15px;
}
#MyPage_top3 {
	align-items: center;
	padding-left: 300px;
	width: 700px;
	height: 100px;
}
.btn_PASSWORD_confirm {
	position: relative;
	font-size: 15px;
	width: 80px;
}
.btn_main_back {
	position: relative;
	left: 14px;
	font-size: 15px;
	width: 80px;
}
#Mypage_nav {
	width: 400px;
}
#Mypage-center {
	display: flex;
	flex-direction: row;
}
#Mypage_nav {
	display: flex;
	flex-direction: column;
	width: 120px;
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
</style>
</head>
<title>최근 본 상품창</title>
<body>
	<section class="ftco-section"
		style="padding-top: 50px; margin-bottom: 50px; padding-bottom: 0px; margin-bottom:500px;">
		<div class="container" style="margin-bottom: 100px;">
			<div class="row justify-content-center mb-5 pb-3"
				style="background-color: #f5f5f5; border: 1px solid #e7e7e7; margin-top: 50px;">
				<div class="col-md-20 heading-section ftco-animate"
					style="height: 60px;">
					<h2 class="mb-4" style="font-size: 35px; margin-top: 15px;">최근
						본 상품</h2>
				</div>
			</div>

			<!-- 최근 본 상품 -->
		<jsp:include page="/WEB-INF/views/common/quick.jsp" flush="false" />

			<!-- 내용 -->


			<div class="order_list">

				<table class="table" style="width: 1400px;">
					<thead class="table-dark" align=center>
						<tr align="center"
							style="background-color: #212529; color: white;">
							<td scope="col" width="300"></td>
							<td scope="col" width="800" align="center">상품</td>
							<td scope="col" width="300">금액</td>
				
						</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${empty quickListAll}">
						<tr height="200">
							<td colspan="5" style="background-color:white; padding-top:100px;">
								<p align="center">
									<b><span style="color:black;">최근 본 상품이 없습니다.</span></b>
								</p>
							</td>
						</tr>	
					</c:when>
					<c:when test="${!empty quickListAll }">
					<c:forEach var="item" items="${quickListAll}">
						<tr>
							
							<td scope="col" align="center">
							<img  class="block-20" style="width: 130px; height:130px;"src="${contextPath}/download_product.do?productNum=${item.productNum}&productImage=${item.productImage}" id="preview" /></td>
							<td scope="col" align="center" style="padding-top: 0px;"><br>
							<br>
							<br><a href="${contextPath}/product/viewProduct.do?productNum=${item.productNum}">${item.productName}</a></td>
							<td scope="col" align="center" style="padding-top: 0px;"><br>
							<br>
							<br><fmt:formatNumber pattern="###,###,###" value="${item.productPrice}"/></td>
						</tr>

                     </c:forEach>
                     </c:when>
                     </c:choose>
	
						

					</tbody>
				</table>

			</div>
		</div>
	</section>



  </body>
</html>