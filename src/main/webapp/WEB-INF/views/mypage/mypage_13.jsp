<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>


<!-- 날짜위젯 -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 조회기간 선택 자바스크립트 -->
<script>
	$(function() {
		//input을 datepicker로 선언
		$("#datepicker1, #datepicker2")
				.datepicker(
						{
							dateFormat : 'yy-mm-dd' //달력 날짜 형태
							,
							showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
							,
							showMonthAfterYear : true // 월- 년 순서가아닌 년도 - 월 순서
							,
							changeYear : true //option값 년 선택 가능
							,
							changeMonth : true //option값  월 선택 가능                
							,
							showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
							,
							buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
							,
							buttonImageOnly : true //버튼 이미지만 깔끔하게 보이게함
							,
							buttonText : "선택" //버튼 호버 텍스트              
							,
							yearSuffix : "년" //달력의 년도 부분 뒤 텍스트
							,
							monthNamesShort : [ '1월', '2월', '3월', '4월', '5월',
									'6월', '7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 텍스트
							,
							monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
									'7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip
							,
							dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 텍스트
							,
							dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일',
									'금요일', '토요일' ] //달력의 요일 Tooltip
							,
							minDate : "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
							,
							maxDate : "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
						});

		//초기값을 오늘 날짜로 설정해줘야 합니다.
		$('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
	});
</script>

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
<title>주문결제창</title>
<body>

	<!-- 타이틀 -->
	<section class="ftco-section"
		style="padding-top: 50px; margin-bottom: 50px; padding-bottom: 0px;">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3"
				style="background-color: #f5f5f5; border: 1px solid #e7e7e7; margin-top: 50px;">
				<div class="col-md-20 heading-section ftco-animate"
					style="height: 60px;">
					<h2 class="mb-4" style="font-size: 35px; margin-top: 15px;">마이페이지</h2>
				</div>
			</div>
			<!-- 타이틀 끝 -->
			<!-- 최근 본 상품 -->
		<jsp:include page="/WEB-INF/views/common/quick.jsp" flush="false" />

			<!-- Left Menu -->
			<jsp:include page="/WEB-INF/views/common/mypage_sidemenu.jsp"
				flush="false" />

			<!-- left Menu -->
			<jsp:include page="/WEB-INF/views/common/mypage_topmenu.jsp"
				flush="false" />
			<div class="table_01"
				style="padding-top: 30px; margin-top: 20px; margin-left: 50px;">

				<div>
					<table
						style="width: 1000px; height: 80px; align: center; padding-top: 10px;">
						<tbody id="MyPage_center3">
							<tr height="50%">
								<th
									style="font-size: 18px; font-weight: bold; padding-top: 40px;"
									colspan="4">상품 리뷰</th>
							</tr>
							<tr align="center" style="padding-top: 10px; padding-left: 10px;"
								height="35%">
								<th style="text-align: left; font-size: 15px;">작성기간 <input
									type="text" id="datepicker1"
									style="width: 120px; margin-right: 50px; margin-top: 10px; height: 30px; flaot: left; border: 1px solid #bebebe; border-radius: 2px; display: inline !important;">

									<span class="glyphicon glyphicon-calendar" aria-hidden="true"
									style="margin-left: -35px;"> </span> ~ <input type="text"
									id="datepicker2"
									style="width: 120px; margin-right: 50px; height: 30px; flaot: left; border: 1px solid #bebebe; border-radius: 2px; display: inline !important;">

									<span class="glyphicon glyphicon-calendar" aria-hidden="true"
									style="margin-left: -35px;"> </span>

									<button type="submit" class="btn btn-default"
										style="background-color: #dcdcdc; fmargin-left: 380px; margin-top: 0px; width: 80px; height: 28px; display: inline !important; background-color: #212529; color: white; border-radius: 2px; height: 30px; margin-right: 500px;">조회</button>
						</tbody>
					</table>
				</div>
				<div id="MyPage_top" style="padding-top: 20px;"></div>
				<form action="" name="modify" method="post">
					<div id="MyPage_top3" style="padding-left: 220px;">
						<table border="1"
							style="width: 980px; height: 300px; align: center;">
							<tbody id="MyPage_center2">
								<tr
									style="height: 30px; background-color: #212529; color: white;">
									<th colspan="2">
										<div style="text-align: center; font-size: 15px; padding: 5px">
											<a>상품명</a>
										</div>
										<div
											style="font-size: 10px; text-align: right; padding-right: 5px">
											<a>작성 날짜 :</a> <a>2021-6-14</a>
										</div>
									</th>
								</tr>
								<tr style="height: 120px">
									<th
										style="width: 130px; text-align: left; padding: 10px; flex-direction: row;"
										onClick="location.href='Product-02'"><img
										src="${contextPath}/resources/images/image_1.jpg" width="110"
										height="110"></th>
									<th style="padding: 10px; border-left: hidden;">
										<div>
											<div>
												<a>패브릭 소파(2인용)</a>
											</div>
											<div>
												<a>옵션1 :</a>
											</div>
											<div>
												<a>옵션2 :</a>
											</div>
										</div>
									</th>
								</tr>
								<tr style="height: 100px">
									<th colspan="2" style="padding-left: 5px;"><input
										type="text"
										style="width: 970px; height: 100px; margin-top: 10px; cols: 78px; rows: 4px;"></th>
								</tr>
								<tr style="height: 30px; border-top: hidden;">
									<th style="width: 130px; padding-left: 5px"></th>
									<th
										style="text-align: right; padding: 5px; border-left: hidden;">
										<input type="submit" name="modify" value="수 정 "
										style="background-color: #212529; color: white;"> <input
										type="button" name="delete" value="삭 제"
										onclick="location.href='#'"
										style="background-color: #212529; color: white;">
									</th>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
			</div>
			<!-- 내용 -->
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
	<br>
	<br>
</body>
</html>