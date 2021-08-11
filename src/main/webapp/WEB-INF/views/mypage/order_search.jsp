<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="myOrderInfoList" value="${myOrderInfoMap.myOrderInfoList}" />
<c:set var="myOrderInfoSearchList"
	value="${myOrderInfoSearchMap.myOrderInfoSearchList}" />
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

	//구매확정 이벤트창
	function confirmOrderConfirm(obj) {
		if (confirm("구매확정하시겠습니까??") == true) { //확인
			var memOrderSeqNum = jQuery('#memOrderSeqNum').val();
			obj.action = "${contextPath}/mypage/purchaseConfirm.do?memOrderSeqNum=memOrderSeqNum";
			obj.submit();

		} else { //취소

			return false;

		}

	}
	function reviewConfirmResult() {

		alert("이미 리뷰를 작성하였습니다.")
		location.href = "${contextPath}/mypage_14.do"
	}
	function returnConfirmResult() {

		alert("이미 반품을 신청하셨습니다. 반품내역을 확인해주세요.")
		location.href = "${contextPath}/mypage_07.do"
	}
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

	<!-- 마이페이지 타이틀 -->
	<section class="ftco-section"
		style="padding-top: 50px; margin-bottom: 50px; padding-bottom: 0px; height: 700px;">
		<div class="container">

			<!-- 마이페이지 타이틀 끝 -->
			<!-- 최근 본 상품 -->
		    <jsp:include page="/WEB-INF/views/common/quick.jsp" flush="false" />
			<!-- 최근 본 상품 끝 -->
			<!-- Left Menu -->
			<jsp:include page="/WEB-INF/views/common/mypage_sidemenu.jsp"
				flush="false" />
			<!-- left Menu 끝-->
			<!-- 마이페이지 상단 공통 ui -->
			<div
				style="font-size: 20px; font-weight: bold; margin-left: 18px; padding-bottom: 7px;">주문/배송조회</div>
			
			<jsp:include page="/WEB-INF/views/common/mypage_topmenu.jsp"/>
			<!-- 마이페이지 상단 공통 ui 끝-->

			<div class="table_01" style="padding-top: 30px; height: 100px;">


				<form name="myOrderInfoSearch"
					action="${contextPath}/mypage/myOrderInfoSearch.do" method="post">
					<table
						style="width: 1000px; height: 80px; align: center; border-right: none; border-left: none;">
						<tbody id="MyPage_center3">


							<tr align="center"
								style="padding-top: 10px; padding-left: 10px; font-size: 15px;"
								height="35%">
								<th style="text-align: left;">

									<div style="display: inline !important;">
										<p style="float: left; width: 70px; margin-top: 10px;">구매기간</p>

										<input type="text" id="datepicker1" name="search1"
											autocomplete='off'
											style="width: 120px; margin-right: 50px; margin-top: 10px; height: 30px; flaot: left; border: 1px solid #bebebe; border-radius: 2px; display: inline !important;">

										<span class="glyphicon glyphicon-calendar" aria-hidden="true"
											style="margin-left: -35px;"> </span> ~ㅤ<input type="text"
											autocomplete='off' name="search2" id="datepicker2"
											style="width: 120px; margin-right: 50px; height: 30px; flaot: left; border: 1px solid #bebebe; border-radius: 2px; display: inline !important;">

										<span class="glyphicon glyphicon-calendar" aria-hidden="true"
											style="margin-left: -35px;"> </span>

										<button type="submit" class="btn btn-default"
											style="background-color: #dcdcdc; fmargin-left: 380px; margin-top: 0px; width: 80px; height: 28px; display: inline !important; background-color: #212529; color: white; border-radius: 2px; height: 30px; margin-right: 500px; padding-top: 4px; font-size: 14px;">조회</button>
									</div>

								</th>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<c:choose>
				<c:when test="${!empty myOrderInfoSearchMap.search1}">
					<div id="MyPage_top">
						<table border="1"
							style="width: 1000px; height: 180px; align: center;">
							<tbody id="MyPage_center2">
								<tr height="30%"
									style="background-color: #212529; color: white;">
									<th
										style="font-size: 14px; text-align: center; border-left: 0;"
										width="100" height="40"
										style="background-color: #212529; color: white;">주문일자</th>
									<th style="font-size: 15px; text-align: center;" width="250"
										style="background-color: #212529; color: white;">상품명</th>
									<th style="font-size: 15px; text-align: center;" width="70"
										style="background-color: #212529; color: white;">수량</th>
									<th style="font-size: 15px; text-align: center;" width="110"
										style="background-color: #212529; color: white;">금액</th>
									<th
										style="font-size: 14px; text-align: center; border-right: 0;"
										width="130">현재상태</th>
								</tr>
								<c:choose>
									<c:when
										test="${empty myOrderInfoSearchMap.myOrderInfoSearchList}">
										<tr style="backgroundcolor: white; width: 1000px;">
											<td colspan="5">찾으시는 결과가 없습니다.</td>
										</tr>
									</c:when>
									<c:when
										test="${!empty myOrderInfoSearchMap.myOrderInfoSearchList}">
										<c:forEach var="myOrderInfoSearchList"
											items="${myOrderInfoSearchList}">
											<tr height="70%">
												<th
													style="text-align: center; font-size: 14px; border-right: 1px solid #c6c8ca;"><fmt:formatDate
														value="${myOrderInfoSearchList.memOrderDate}" /></th>
												<th
													style="padding: 10px; text-align: left; height: 120px; border: 1px solid #c6c8ca;">
													<div>
															<a href="${contextPath}/product/viewProduct.do?productNum=${myOrderInfoSearchList.productNum}">
														<img
															src="${contextPath}/download_product.do?productNum=${myOrderInfoSearchList.productNum}&productImage=${myOrderInfoSearchList.productImage}"
															width="90" height="90" style="float: left;"></a> <a
															style="margin-left: 30px; font-size: 14px;"
															href="${contextPath}/product/viewProduct.do?productNum=${myOrderInfoSearchList.productNum}">${myOrderInfoSearchList.productName}</a>
														<c:if test="${myOrderInfoSearchList.option1value !=null}">
															<p style="margin-left: 121px; font-size: 12px;">${myOrderInfoSearchList.option1Name}
																: ${myOrderInfoSearchList.option1value}</p>
														</c:if>
														<c:if test="${myOrderInfoSearchList.option2value !=null}">
															<p style="margin-left: 121px; font-size: 12px;">${myOrderInfoSearchList.option2Name}
																: ${myOrderInfoSearchList.option2value}</p>
														</c:if>
													</div>

												</th>
												<th
													style="text-align: center; font-size: 14px; border: 1px solid #c6c8ca;">${myOrderInfoSearchList.productCnt}</th>
												<th
													style="text-align: center; font-size: 14px; border: 1px solid #c6c8ca;">${myOrderInfoSearchList.productPrice}</th>
												<th
													style="text-align: center; height: 120px; font-size: 14px;"><ins
														onclick="location='#'" id="now-state"
														style="color: red; font-size: 12px; border-left: 1px solid #c6c8ca;"">
														${myOrderInfoSearchList.deliveryStatus}<br>
													</ins> <c:choose>
														<c:when
															test="${myOrderInfoSearchList.purchaseConfirm =='구매확정(미)'}">

															<form>
																<input type="button" name="purchaseConfirm"
																	style="font-size: 12px; width: 110px; border: none; background-color: #212529; margin-bottom: 5px; color: white; font-size: 14px;"
																	class="confirmation"
																	onclick="confirmOrderConfirm(this.form)" value="구매확정">
																<input type="hidden" id="memOrderSeqNum"
																	name="memOrderSeqNum" style="font-size: 14px;"
																	value="${myOrderInfoSearchList.memOrderSeqNum}" />
															</form>
															<c:choose>
																<c:when
																	test="${myOrderInfoSearchList.returnConfirm == '반품신청(미)'}">
																	<input type="button"
																		style="font-size: 12px; width: 110px; background-color: #212529; border: none; margin-bottom: 5px; color: white; font-size: 14px;"
																		onclick="location.href='${contextPath}/mypage/returnWrite.do?&productNum=${myOrderInfoSearchList.productNum}&memOrderSeqNum=${myOrderInfoSearchList.memOrderSeqNum}'"
																		value="반품신청">
																</c:when>
																<c:when
																	test="${myOrderInfoSearchList.returnConfirm == '반품신청(완)'}">
																	<input type="button"
																		style="font-size: 12px; width: 110px; background-color: #212529; border: none; margin-bottom: 5px; color: white; font-size: 14px;"
																		onclick="returnConfirmResult()" value="반품신청">
																</c:when>
															</c:choose>

														</c:when>
														<c:when
															test="${myOrderInfoSearchList.purchaseConfirm =='구매확정(완)'}">


															<c:choose>
																<c:when
																	test="${myOrderInfoSearchList.reviewConfirm == '리뷰작성(미)'}">
																	<input type="button" name="reviewConfirm"
																		style="font-size: 12px; width: 110px; border: none; background-color: #212529; margin-bottom: 5px; font-size: 14px; color: white;"
																		id="pressbtn1" class="confirmation"
																		onclick="location.href='${contextPath}/mypage/reviewWrite.do?productNum=${myOrderInfoSearchList.productNum}&memOrderSeqNum=${myOrderInfoSearchList.memOrderSeqNum}'"
																		value="리뷰작성">
																</c:when>
																<c:when
																	test="${myOrderInfoSearchList.reviewConfirm == '리뷰작성(완)'}">
																	<input type="button" name="reviewConfirm"
																		style="font-size: 12px; width: 110px; border: none; background-color: #212529; margin-bottom: 5px; color: white; font-size: 14px;"
																		id="pressbtn1" class="confirmation"
																		onclick="reviewConfirmResult()" value="리뷰작성">
																</c:when>
															</c:choose>
														</c:when>
													</c:choose>
													<button
														style="font-size: 12px; width: 110px; background-color: #212529; border: none; color: white; font-size: 14px;"
														onclick="location.href='${contextPath}/mypage/viewMyOrderInfo.do?memOrderNum=${myOrderInfoSearchList.memOrderNum}&memOrderSeqNum=${myOrderInfoSearchList.memOrderSeqNum}'">주문
														상세보기</button></th>
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
									style="border: none; color: black; margin-right: 0px; margin-left: 0px;"
									href='<c:url value="/mypage/myOrderInfoSearch.do?search1=${myOrderInfoSearchMap.search1}&search2=${myOrderInfoSearchMap.search2}&page=${pageMaker.startPage-1 }"/>'><i
									class="fa fa-chevron-left"></i></a>

							</c:if>
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="pageNum">

								<a
									style="border: none; color: black; margin-right: 0px; margin-left: 0px;"
									href='<c:url value="/mypage/myOrderInfoSearch.do?search1=${myOrderInfoSearchMap.search1}&search2=${myOrderInfoSearchMap.search2}&page=${pageNum }"/>'><i
									class="fa">${pageNum }</i></a>

							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

								<a class="arrow next"
									style="border: none; color: black; margin-right: 0px; margin-left: 0px;"
									href='<c:url value="/mypage/myOrderInfoSearch.do?search1=${myOrderInfoSearchMap.search1}&search2=${myOrderInfoSearchMap.search2}&page=${pageMaker.endPage+1 }"/>'><i
									class="fa fa-chevron-right"></i></a>

							</c:if>

						</div>
					</div>
				</c:when>
				<c:when test="${empty myOrderInfoSearchMap.search1}">

					<div id="MyPage_top">
						<table style="width: 1000px; height: 180px; align: center;">
							<tbody id="MyPage_center2">
								<tr height="30%"
									style="background-color: #212529; color: white;">
									<th
										style="font-size: 15px; text-align: center; border-left: 0;"
										width="100" height="40"
										style="background-color: #212529; color: white;">주문일자</th>
									<th style="font-size: 15px; text-align: center;" width="250"
										style="background-color: #212529; color: white;">상품명</th>
									<th style="font-size: 15px; text-align: center;" width="70"
										style="background-color: #212529; color: white;">수량</th>
									<th style="font-size: 15px; text-align: center;" width="110"
										style="background-color: #212529; color: white;">금액</th>
									<th
										style="font-size: 14px; text-align: center; border-right: 0;"
										width="130">현재상태</th>
								</tr>
								<c:choose>
									<c:when test="${empty myOrderInfoMap.myOrderInfoList}">
										<tr style="backgroundcolor: white; width: 1000px;">
											<td colspan="5">주문/배송조회 내역이 없습니다.</td>
										</tr>
									</c:when>
									<c:when test="${!empty myOrderInfoMap.myOrderInfoList}">
										<c:forEach var="myOrderInfoList" items="${myOrderInfoList}">
											<tr height="70%" style="border-bottom: 1px solid #c6c8ca;">
												<th
													style="text-align: center; font-size: 14px; border-right: 1px solid #c6c8ca;"><fmt:formatDate
														value="${myOrderInfoList.memOrderDate}" /></th>
												<th
													style="padding: 10px; text-align: left; height: 120px; border: 1px solid #c6c8ca;">
													<div>
														<a href="${contextPath}/product/viewProduct.do?productNum=${myOrderInfoList.productNum}">
														<img
															src="${contextPath}/download_product.do?productNum=${myOrderInfoList.productNum}&productImage=${myOrderInfoList.productImage}"
															width="90" height="90" style="float: left;"> </a><a
															style="margin-left: 30px; font-size: 14px;"
															href="${contextPath}/product/viewProduct.do?productNum=${myOrderInfoList.productNum}">${myOrderInfoList.productName}</a>
														<c:if test="${myOrderInfoList.option1value !=null}">
															<p style="margin-left: 121px; font-size: 11px;">${myOrderInfoList.option1Name}
																: ${myOrderInfoList.option1value}</p>
														</c:if>
														<c:if test="${myOrderInfoList.option2value !=null}">
															<p style="margin-left: 121px; font-size: 11px;">${myOrderInfoList.option2Name}
																: ${myOrderInfoList.option2value}</p>
														</c:if>
													</div>

												</th>
												<th
													style="text-align: center; font-size: 14px; border: 1px solid #c6c8ca;">${myOrderInfoList.productCnt}</th>
												<th
													style="text-align: center; font-size: 14px; border: 1px solid #c6c8ca;">${myOrderInfoList.productPrice}</th>
												<th
													style="text-align: center; height: 120px; font-size: 14px;"><ins
														onclick="location='#'" id="now-state"
														style="color: red; font-size: 12px;">
														${myOrderInfoList.deliveryStatus}<br>
													</ins> <c:choose>
														<c:when
															test="${myOrderInfoList.purchaseConfirm =='구매확정(미)'}">

															<form>
																<input type="button" name="purchaseConfirm"
																	style="font-size: 12px; width: 110px; background-color: #212529; border: none; margin-bottom: 5px; color: white;"
																	class="confirmation"
																	onclick="confirmOrderConfirm(this.form)" value="구매확정">
																<input type="hidden" id="memOrderSeqNum"
																	name="memOrderSeqNum"
																	value="${myOrderInfoList.memOrderSeqNum}" />
															</form>
															<c:choose>
																<c:when
																	test="${myOrderInfoList.returnConfirm == '반품신청(미)'}">
																	<input type="button"
																		style="font-size: 12px; width: 110px; background-color: #212529; margin-bottom: 5px; color: white; border: none;"
																		onclick="location.href='${contextPath}/mypage/returnWrite.do?&productNum=${myOrderInfoList.productNum}&memOrderSeqNum=${myOrderInfoList.memOrderSeqNum}'"
																		value="반품신청">
																</c:when>
																<c:when
																	test="${myOrderInfoList.returnConfirm == '반품신청(완)'}">
																	<input type="button"
																		style="font-size: 12px; width: 110px; background-color: #212529; margin-bottom: 5px; color: white; border: none;"
																		onclick="returnConfirmResult()" value="반품신청">
																</c:when>
															</c:choose>
														</c:when>
														<c:when
															test="${myOrderInfoList.purchaseConfirm =='구매확정(완)'}">


															<c:choose>
																<c:when
																	test="${myOrderInfoList.reviewConfirm == '리뷰작성(미)'}">
																	<input type="button" name="reviewConfirm"
																		style="font-size: 12px; width: 110px; background-color: #28a745; margin-bottom: 5px; color: white; border: none;"
																		id="pressbtn1" class="confirmation"
																		onclick="location.href='${contextPath}/mypage/reviewWrite.do?productNum=${myOrderInfoList.productNum}&memOrderSeqNum=${myOrderInfoList.memOrderSeqNum}'"
																		value="리뷰작성">
																</c:when>
																<c:when
																	test="${myOrderInfoList.reviewConfirm == '리뷰작성(완)'}">
																	<input type="button" name="reviewConfirm"
																		style="font-size: 12px; width: 110px; background-color: #28a745; border: none; margin-bottom: 5px; color: white;"
																		id="pressbtn1" class="confirmation"
																		onclick="reviewConfirmResult()" value="리뷰작성">
																</c:when>
															</c:choose>
														</c:when>
													</c:choose>

													<button
														style="font-size: 12px; width: 110px; background-color: #212529; color: white; border-radius: 2px; border: none;"
														onclick="location.href='${contextPath}/mypage/viewMyOrderInfo.do?memOrderNum=${myOrderInfoList.memOrderNum}&memOrderSeqNum=${myOrderInfoList.memOrderSeqNum}'">주문
														상세보기</button></th>
											</tr>
										</c:forEach>
									</c:when>
								</c:choose>
							</tbody>
						</table>
					</div>
					<div class="page_wrap" align="center"
						style="margin-top: 60px; width: 1300px; font-size: 14px;">
						<div class="page_nation">

							<c:if test="${pageMaker.prev}">

								<a class="arrow prev"
									style="border: none; color: black; margin-right: 0px; margin-left: 0px;"
									href='<c:url value="/mypage_04.do?&page=${pageMaker.startPage-1 }"/>'><i
									class="fa fa-chevron-left"></i></a>

							</c:if>
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="pageNum">

								<a
									style="border: none; color: black; margin-right: 0px; margin-left: 0px;"
									href='<c:url value="/mypage_04.do?&page=${pageNum }"/>'><i
									class="fa">${pageNum }</i></a>

							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

								<a class="arrow next"
									style="border: none; color: black; margin-right: 0px; margin-left: 0px;"
									href='<c:url value="/mypage_04.do?&page=${pageMaker.endPage+1 }"/>'><i
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

</body>
</html>