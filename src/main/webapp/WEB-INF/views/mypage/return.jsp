<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="mypageReturnList"
	value="${mypageReturnMap.mypageReturnList}" />
<c:set var="returnSearchList"
	value="${returnSearchMap.returnSearchList}" />
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
	padding-left: 130px;
	font-size: 10px;
}

.my_row {
	flex-direction: row;
	padding-right: 70px;
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
	align-items: top;
	float: center;
	margin-bottom: 10;
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

	<!-- 타이틀 끝 -->
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
			<!-- left Menu 끝-->

			<!-- 내용 -->
			<div
				style="font-size: 20px; font-weight: bold; margin-left: 18px; padding-bottom: 7px;">취소/반품내역</div>
			<div class="table_01" >
				<jsp:include page="/WEB-INF/views/common/mypage_topmenu.jsp" />
				<div id="MyPage_top" style="padding-top: 40px;">
					<form name="returnSearch"
						action="${contextPath}/mypage/returnSearch.do" method="post">
						<table
							style="width: 980px; height: 80px; align: center; padding-top: 10px;">
							<tbody id="MyPage_center3">
								<tr height="50%">
									<th style="font-size: 18px; font-weight: bold;" colspan="4">취소/반품내역(최근
										1개월)</th>
								</tr>
								<tr align="center"
									style="padding-top: 10px; padding-left: 10px; font-size: 14px;"
									height="35%">

									<th>
										<div style="display: inline !important;">
											<p style="float: left; width: 80px;">구매기간</p>

											<input type="text" id="datepicker1" name="search1"
												autocomplete='off'
												style="width: 120px; margin-right: 50px; height: 30px; flaot: left; border: 1px solid #bebebe; border-radius: 2px; display: inline !important;">

											<span class="glyphicon glyphicon-calendar" aria-hidden="true"
												style="margin-left: -35px;"> </span> ~ <input type="text"
												name="search2" id="datepicker2" autocomplete='off'
												style="width: 120px; margin-right: 50px; height: 30px; flaot: left; border: 1px solid #bebebe; border-radius: 2px; display: inline !important;">

											<span class="glyphicon glyphicon-calendar" aria-hidden="true"
												style="margin-left: -35px;"> </span>

											<button type="submit" class="btn btn-default"
												style="background-color: #dcdcdc; fmargin-left: 380px; margin-top: 0px; width: 80px; height: 28px; display: inline !important; background-color: #212529; color: white; border-radius: 2px; height: 30px; margin-right: 500px; padding-bottom: 5px;">조회</button>
										</div>




									</th>
								</tr>

							</tbody>
						</table>
					</form>
				</div>
				<c:choose>
					<c:when test="${!empty returnSearchMap.search1}">
						<div id="MyPage_top">
							<table border="1"
								style="width: 995px; height: 180px; align: center;">
								<tbody id="MyPage_center2">
									<tr style="background-color: #212529; color: white;">
										<th style="font-size: 15px; text-align: center; height: 40px;"
											width="100">반품일자</th>
										<th style="font-size: 15px; text-align: center;" width="250">상품명</th>
										<th style="font-size: 15px; text-align: center;" width="70">수량</th>
										<th style="font-size: 15px; text-align: center;" width="110">금액</th>
										<th style="font-size: 15px; text-align: center;" width="130">현재상태</th>
									</tr>
									<c:choose>
										<c:when test="${empty returnSearchList}">
											<tr style="background-color: white;">
												<td colspan="5"
													style="color: black; height: 300px; text-align: center;">조회
													된 반품 내역이 없습니다.</td>
											</tr>

										</c:when>
										<c:when test="${!empty returnSearchList}">
											<c:forEach var="returnSearchList" items="${returnSearchList}">
												<tr height="80%">
													<th style="text-align: center;"><fmt:formatDate
															value="${returnSearchList.returnDate}" /></th>
													<th style="padding: 10px; text-align: center;"
														onClick="location.href='Product-02'">
														<div>
														<a href="${contextPath}/product/viewProduct.do?productNum=${returnSearchList.productNum}">
															<img src="${contextPath}/resources/images/image_1.jpg"
																width="110" height="110" style="float: left;"></a> <a
																style="margin-left: 0px; padding-right: 10px;"
																href="${contextPath}/product/viewProduct.do?productNum=${returnSearchList.productNum}">${returnSearchList.productName}</a>
															<c:if test="${returnSearchList.option1value != null}">
																<p
																	style="margin-left: 140px; font-size: 13px; width: 100px;">${returnSearchList.option1value}</p>
															</c:if>
															<c:if test="${returnSearchList.option1value != null}">
																<p
																	style="margin-left: 140px; font-size: 13px; width: 100px;">${returnSearchList.option2value}</p>
															</c:if>
														</div>
													</th>
													<th style="text-align: center;"><a>${returnSearchList.productCnt}</a></th>
													<th style="text-align: center;"><a>${returnSearchList.productPrice}</a></th>
													<th style="text-align: center;"><a id="now-state"
														style="color: red; font-size: 14px;">${returnSearchList.currentStatus}</a><br>
														<input type="button"
														style="font-size: 14px; width: 110px; background-color: #212529; margin-bottom: 5px; color: white;"
														onclick="location.href='${contextPath}/mypage/viewReturn.do?returnNum=${returnSearchList.returnNum}'"
														value="반품상세보기"></th>
												</tr>
											</c:forEach>
										</c:when>
									</c:choose>
								</tbody>
							</table>

						</div>
						<div class="page_wrap" align="center"
							style="margin-left: 80px; margin-top: 60px; width: 1300px;">
							<div class="page_nation">

								<c:if test="${pageMaker.prev}">

									<a class="arrow prev"
										href='<c:url value="/mypage/returnSearch.do?page=${pageMaker.startPage-1 }"/>'><i
										class="fa fa-chevron-left"></i></a>

								</c:if>
								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="pageNum">

									<a
										href='<c:url value="/mypage/returnSearch.do?page=${pageNum }"/>'><i
										class="fa">${pageNum }</i></a>

								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

									<a class="arrow next"
										href='<c:url value="/mypage/returnSearch.do?page=${pageMaker.endPage+1 }"/>'><i
										class="fa fa-chevron-right"></i></a>

								</c:if>

							</div>
						</div>
					</c:when>
					<c:when test="${empty returnSearchMap.search1}">
						<div id="MyPage_top">
							<table border="1"
								style="width: 995px; height: 180px; align: center;">
								<tbody id="MyPage_center2">
									<tr style="background-color: #212529; color: white;">
										<th style="font-size: 15px; text-align: center; height: 40px;"
											width="100">반품일자</th>
										<th style="font-size: 15px; text-align: center;" width="250">상품명</th>
										<th style="font-size: 15px; text-align: center;" width="70">수량</th>
										<th style="font-size: 15px; text-align: center;" width="110">금액</th>
										<th style="font-size: 15px; text-align: center;" width="130">현재상태</th>
									</tr>


									<c:choose>
										<c:when test="${empty mypageReturnList}">
											<tr style="background-color: white;">
												<td colspan="5"
													style="color: black; height: 300px; text-align: center;">반품
													내역이 없습니다.</td>
											</tr>

										</c:when>
										<c:when test="${!empty mypageReturnList}">
											<c:forEach var="mypageReturnList" items="${mypageReturnList}">
												<tr height="80%">
													<th style="text-align: center;"><fmt:formatDate
															value="${mypageReturnList.returnDate}" /></th>
													<th style="padding: 10px; text-align: center;"
														onClick="location.href='Product-02'">
														<div>
														<a href="${contextPath}/product/viewProduct.do?productNum=${mypageReturnList.productNum}">
															<img src="${contextPath}/resources/images/image_1.jpg"
																width="110" height="110" style="float: left;"></a> <a
																style="margin-left: 0px; padding-right: 10px;"
																href="${contextPath}/product/viewProduct.do?productNum=${mypageReturnList.productNum}">${mypageReturnList.productName}</a>
															<c:if test="${mypageReturnList.option1value != null}">
																<p
																	style="margin-left: 140px; font-size: 13px; width: 100px;">${mypageReturnList.option1value}</p>
															</c:if>
															<c:if test="${mypageReturnList.option2value != null}">
																<p
																	style="margin-left: 140px; font-size: 13px; width: 100px;">${mypageReturnList.option2value}</p>
															</c:if>
														</div>
													</th>
													<th style="text-align: center;">${mypageReturnList.productCnt}</th>
													<th style="text-align: center;">${mypageReturnList.productPrice}</th>
													<th style="text-align: center;"><a id="now-state"
														style="color: red; font-size: 14px;">${mypageReturnList.currentStatus}</a><br>
														<input type="button"
														style="font-size: 14px; width: 110px; background-color: #212529; margin-bottom: 5px; color: white;"
														onclick="location.href='${contextPath}/mypage/viewReturn.do?returnNum=${mypageReturnList.returnNum}'"
														value="반품상세보기"></th>
												</tr>
											</c:forEach>
										</c:when>
									</c:choose>
								</tbody>
							</table>

						</div>
						<div class="page_wrap" align="center"
							style="margin-left: 80px; margin-top: 60px; width: 1300px;">
							<div class="page_nation">

								<c:if test="${pageMaker.prev}">

									<a class="arrow prev"
										href='<c:url value="/mypage_07.do?page=${pageMaker.startPage-1 }"/>'><i
										class="fa fa-chevron-left"></i></a>

								</c:if>
								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="pageNum">

									<a href='<c:url value="/mypage_07.do?page=${pageNum }"/>'><i
										class="fa">${pageNum }</i></a>

								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

									<a class="arrow next"
										href='<c:url value="/mypage_07.do?page=${pageMaker.endPage+1 }"/>'><i
										class="fa fa-chevron-right"></i></a>

								</c:if>

							</div>
						</div>
					</c:when>
				</c:choose>
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