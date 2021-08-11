<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="mypageReviewList"
	value="${mypageReviewMap.mypageReviewList}" />
<c:set var="reviewSearchList"
	value="${reviewSearchMap.reviewSearchList}" />
<!DOCTYPE html>
<html lang="en">
<head>
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

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
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

			<div 
				style="padding-top: 30px; margin-top: 20px; margin-left: 50px;">
				<div>
					<table style="width: 1000px; height: 80px; margin-left: 80px;">
						<tbody id="MyPage_center1">
							<tr height="60px;">
								<th
									style="font-size: 17px; background-color: #212529; color: white;"
									colspan="3"><a
									style="font-size: 16px; padding-left: 10px; font-size: 17px;">홍길동</a>
									<a>님 환영합니다.</a></th>
							</tr>
							<tr align="center"
								style="padding-left: 10px; font-size: 17px; height: 60px;"
								height="45%">
								<th width="220" style="text-align: center">주문/배송<a
									href="${contextPath}/mypage_04.do" style="color: red;">${myInfo.order}</a><a>건</a></th>
								<th width="220" style="text-align: center">취소/반품<a
									href="${contextPath}/mypage_07.do" style="color: red;">${myInfo.orderReturn}</a><a>건</a></th>
								<th width="220" style="text-align: center">장바구니<a
									href="${contextPath}/memcart.do" style="color: red;">${myInfo.cart}</a><a>건</a></th>
							</tr>
						</tbody>
					</table>
					<form name="reviewSearch"
						action="${contextPath}/mypage/reviewSearch.do" method="post">
						<table
							style="width: 1000px; height: 80px; align: center; padding-top: 10px;">
							<tbody id="MyPage_center3">
								<tr height="50%">
									<th style="font-size: 20px; font-weight: bold;" colspan="4">상품
										리뷰</th>
								</tr>
								<tr align="center"
									style="padding-top: 10px; padding-left: 10px; font-size: 14px;"
									height="35%">
									<th style="text-align: left;">
										<div style="display: inline !important;">
											<p style="float: left; width: 80px; margin-top: 30px;">작성기간</p>

											<input type="text" id="datepicker1" name="search1"
												autocomplete='off'
												style="width: 120px; margin-right: 50px; margin-top: 30px; height: 30px; flaot: left; border: 1px solid #bebebe; border-radius: 2px; display: inline !important;">

											<span class="glyphicon glyphicon-calendar" aria-hidden="true"
												style="margin-left: -35px;"> </span> ~ <input type="text"
												name="search2" id="datepicker2" autocomplete='off'
												style="width: 120px; margin-right: 50px; height: 30px; flaot: left; border: 1px solid #bebebe; border-radius: 2px; display: inline !important;">

											<span class="glyphicon glyphicon-calendar" aria-hidden="true"
												style="margin-left: -35px;"> </span>

											<button type="submit" class="btn btn-default"
												style="background-color: #dcdcdc; fmargin-left: 380px; margin-top: 0px; width: 80px; height: 28px; display: inline !important; background-color: #212529; color: white; border-radius: 2px; height: 30px; margin-right: 500px;">조회</button>
										</div>
									</th>
								</tr>
							</tbody>
						</table>
					</form>
					<div  style="padding-top: 20px; height: 0px">
					</div>
				</div>
				<c:choose>
					<c:when test="${!empty reviewSearchMap.search1}">
						<div  style="padding-left: 220px;">
							<table border="1" class="table"
								style="width: 980px; height: 300px; align: center;">
								<tbody >
									<c:choose>
										<c:when test="${empty reviewSearchMap.reviewSearchList}">
											<tr style="background-color: white;">
												<td colspan="5" style="color: black; height: 300px;">작성한
													리뷰가 없습니다.</td>
											</tr>
										</c:when>
										<c:when test="${!empty reviewSearchMap.reviewSearchList}">
											<c:forEach var="reviewSearchList" items="${reviewSearchList}">
												<tr
													style="height: 30px; background-color: #212529; color: white;">
													<th colspan="2">
														<div
															style="text-align: center; font-size: 15px; padding: 5px">
															<a>${reviewSearchList.productReviewTitle}</a> <a
																style="float: right"><fmt:formatDate
																	value="${reviewSearchList.reviewDate}" /></a><a
																style="float: right">작성 날짜 :</a>
														</div>
													</th>
												</tr>

												<tr style="height: 120px">
													<th
														style="width: 130px; text-align: left; padding: 10px; flex-direction: row;"
														onClick="location.href='Product-02'"><img src=""
														width="110" height="110"></th>
													<th style="padding: 10px; border-left: hidden;">
														<div>
															<div>
																<a
																	href="${contextPath}/product/viewProduct.do?productNum=${reviewSearchList.productNum}">${reviewSearchList.productName}</a>
															</div>
															<c:if test="${reviewSearchList.option1value !=null}">
																<p style="margin-left: 140px; font-size: 13px;">${reviewSearchList.option1Name}
																	: ${reviewSearchList.option1value}</p>
															</c:if>
															<c:if test="${reviewSearchList.option2value !=null}">
																<p style="margin-left: 140px; font-size: 13px;">${reviewSearchList.option2Name}
																	: ${reviewSearchList.option2value}</p>
															</c:if>
														</div>
													</th>
												</tr>
												<tr style="height: 100px">
													<th colspan="2" style="padding-left: 5px;"><input
														type="text" disabled
														style="width: 970px; margin-top: 10px; height: 80px; cols: 78px; rows: 4px;"
														name="contents" value="${reviewSearchList.productContent}">
													</th>
												</tr>
												<tr style="height: 30px; border-top: hidden;">
													<th style="width: 500px; padding-left: 5px"><a>파일이름:
															${reviewSearchList.reviewFile}</a> <img id="preview"
														src="${contextPath}/download_review.do?reviewNum=${reviewSearchList.reviewNum}&reviewFile=${reviewSearchList.reviewFile}"
														width="50" height="50" /></th>
													<th
														style="text-align: right; padding: 5px; border-left: hidden; margin-top: 15px;">
														<input type="button" name="modify" value="수정 "
														style="margin-top: 15px;"
														onclick="location.href='${contextPath}/mypage/modReview.do?reviewNum=${reviewSearchList.reviewNum}'">
														<input type="reset" name="reset" value="삭제"
														onclick="location.href='${contextPath}/mypage/removeReview.do?reviewNum=${reviewSearchList.reviewNum}&memOrderSeqNum=${reviewSearchList.memOrderSeqNum}'">

													</th>
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
										href='<c:url value="/mypage/reviewSearch.do?search1=${reviewSearchMap.search1}&search2=${reviewSearchMap.search2}&page=${pageMaker.startPage-1 }"/>'><i
										class="fa fa-chevron-left"></i></a>

								</c:if>
								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="pageNum">

									<a
										href='<c:url value="/mypage/reviewSearch.do?search1=${reviewSearchMap.search1}&search2=${reviewSearchMap.search2}&page=${pageNum }"/>'><i
										class="fa">${pageNum }</i></a>

								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

									<a class="arrow next"
										href='<c:url value="/mypage/reviewSearch.do?search1=${reviewSearchMap.search1}&search2=${reviewSearchMap.search2}&page=${pageMaker.endPage+1 }"/>'><i
										class="fa fa-chevron-right"></i></a>

								</c:if>

							</div>
						</div>
					</c:when>

					<c:when test="${empty reviewSearchMap.search1}">
						<div  style="padding-left: 220px;">
							<table border="1" class="table"
								style="width: 980px; height: 300px; align: center;">
								<tbody >
									<c:choose>
										<c:when test="${empty mypageReviewMap.mypageReviewList}">
											<tr style="background-color: white;">
												<td colspan="5" style="color: black; height: 300px;">작성한
													리뷰가 없습니다.</td>
											</tr>
										</c:when>
										<c:when test="${!empty mypageReviewMap.mypageReviewList}">

											<c:forEach var="mypageReviewList" items="${mypageReviewList}">
												<tr
													style="height: 30px; background-color: #212529; color: white;">
													<th colspan="2">
														<div
															style="text-align: center; font-size: 15px; padding: 5px">
															<a>${mypageReviewList.productReviewTitle}</a> <a
																style="float: right"><fmt:formatDate
																	value="${mypageReviewList.reviewDate}" /></a><a
																style="float: right">작성 날짜 :</a>
														</div>
													</th>
												</tr>

												<tr style="height: 120px">
													<th
														style="width: 130px; text-align: left; padding: 10px; flex-direction: row;">
														<a
														href="${contextPath}/product/viewProduct.do?productNum=${mypageReviewList.productNum}"><img
															src="${contextPath}/download_product.do?productNum=${mypageReviewList.productNum}&productImage=${mypageReviewList.productImage}" width="110" height="110"></a>
													</th>
													<th style="padding: 10px; border-left: hidden;">
														<div>
															<div>
																<a
																	href="${contextPath}/product/viewProduct.do?productNum=${mypageReviewList.productNum}">${mypageReviewList.productName}</a>
															</div>
															<c:if test="${mypageReviewList.option1value !=null}">
																<p style="margin-left: 140px; font-size: 13px;">${mypageReviewList.option1Name}
																	: ${mypageReviewList.option1value}</p>
															</c:if>
															<c:if test="${mypageReviewList.option2value !=null}">
																<p style="margin-left: 140px; font-size: 13px;">${mypageReviewList.option2Name}
																	: ${mypageReviewList.option2value}</p>
															</c:if>
														</div>
													</th>
												</tr>
												<tr style="height: 100px">
													<th colspan="2" style="padding-left: 5px;"><input
														type="text" disabled
														style="width: 970px; margin-top: 10px; height: 80px; cols: 78px; rows: 4px;"
														name="contents" value="${mypageReviewList.productContent}">
													</th>
												</tr>
												<tr style="height: 30px; border-top: hidden;">
													<th style="width: 500px; padding-left: 5px"><a>파일이름:
															${mypageReviewList.reviewFile}</a> <img id="preview"
														src="${contextPath}/download_review.do?reviewNum=${mypageReviewList.reviewNum}&reviewFile=${mypageReviewList.reviewFile}"
														width="50" height="50" /></th>
													<th
														style="text-align: right; padding: 5px; border-left: hidden; margin-top: 15px;">
														<input type="button" name="modify" value="수정 "
														style="margin-top: 15px;"
														onclick="location.href='${contextPath}/mypage/modReview.do?reviewNum=${mypageReviewList.reviewNum}'">
														<input type="reset" name="reset" value="삭제"
														onclick="location.href='${contextPath}/mypage/removeReview.do?reviewNum=${mypageReviewList.reviewNum}&memOrderSeqNum=${mypageReviewList.memOrderSeqNum}'">

													</th>
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
										href='<c:url value="/mypage_14.do?search1=${mypageReviewMap.search1}&search2=${mypageReviewMap.search2}&page=${pageMaker.startPage-1 }"/>'><i
										class="fa fa-chevron-left"></i></a>

								</c:if>
								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="pageNum">

									<a
										href='<c:url value="/mypage_14.do?search1=${mypageReviewMap.search1}&search2=${mypageReviewMap.search2}&page=${pageNum }"/>'><i
										class="fa">${pageNum }</i></a>

								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

									<a class="arrow next"
										href='<c:url value="/mypage_14.do?search1=${mypageReviewMap.search1}&search2=${mypageReviewMap.search2}&page=${pageMaker.endPage+1 }"/>'><i
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

</body>
</html>