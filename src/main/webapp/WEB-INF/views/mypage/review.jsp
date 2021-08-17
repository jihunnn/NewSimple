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
		style="padding-top: 100px; margin-bottom: 50px; padding-bottom: 0px;">
		<div class="container">
			<!-- 타이틀 끝 -->
			<!-- 최근 본 상품 -->
			<jsp:include page="/WEB-INF/views/common/quick.jsp" flush="false" />


			<!-- Left Menu -->
			<jsp:include page="/WEB-INF/views/common/mypage_sidemenu.jsp"
				flush="false" />

			<div
				style="font-size: 15px; font-weight: bold; margin-left: 18px; padding-bottom: 7px; color: #7e9c8c;">상품리뷰</div>
			<jsp:include page="/WEB-INF/views/common/mypage_topmenu.jsp"
				flush="false" />
			<!-- left Menu -->

			<div style="padding-top: 30px;">
				<div>
					<form name="reviewSearch"
						action="${contextPath}/mypage/reviewSearch.do" method="post">
						<table
							style="width: 1000px; height: 80px; align: center; border-right: none; border-left: none;">
							<tbody id="MyPage_center3">


								<tr align="center"
									style="padding-top: 10px; padding-left: 10px; font-size: 13px;"
									height="35%">
									<th style="text-align: left;">

										<div style="display: inline !important;">
											<p
												style="float: left; width: 60px; margin-top: 13px; margin-bottom: 5px; font-weight: normal;">작성기간</p>

											<input type="text" id="datepicker1" name="search1"
												autocomplete='off'
												style="margin-right: 35px; width: 90px; margin-top: 10px; height: 30px; flaot: left; border: 1px solid #dcdcdc; border-radius: 2px; display: inline !important;">

											<span class="glyphicon glyphicon-calendar" aria-hidden="true"
												style="margin-left: -35px;"> </span> ~ㅤ<input type="text"
												autocomplete='off' name="search2" id="datepicker2"
												style="width: 90px; margin-right: 35px; height: 30px; flaot: left; border: 1px solid #dcdcdc; border-radius: 2px; display: inline !important;">

											<span class="glyphicon glyphicon-calendar" aria-hidden="true"
												style="margin-left: -35px;"> </span>

											<button type="submit" class="btn btn-default"
												style="background-color: #7e9c8c; fmargin-left: 380px; margin-top: 0px; height: 28px; display: inline !important; color: white; border-radius: 2px; height: 30px; margin-right: 500px; padding-top: 4px; font-size: 13px; margin-bottom: 2px;">조회</button>
										</div>

									</th>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<c:choose>
					<c:when test="${!empty reviewSearchMap.search1}">
						<div style="padding-left: 262px;">
							<table
								style="width: 1000px; height: 80px; align: center; border-right: none; border-left: none;">
								<tbody>
									<c:choose>
										<c:when test="${empty reviewSearchMap.reviewSearchList}">
											<tr style="background-color: white;">
												<td colspan="5"
													style="background-color: white; border-bottom:1px solid #eeeeee; vertical-align:middle; height:80px; color:#5f5f5f; font-size:13px; text-align:center;">해당기간
													조회된 리뷰가 없습니다.</td>
											</tr>
										</c:when>
										<c:when test="${!empty reviewSearchMap.reviewSearchList}">
											<c:forEach var="reviewSearchList" items="${reviewSearchList}">
												<tr
													style="background-color: #fbfbfb; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #eeeeee; border-left:none;">
													<th colspan="3"
														style="padding-top: 5px; padding-bottom: 5px;">
														<div
															style="text-align: center; font-size: 13px; padding: 5px">
															<a>${reviewSearchList.productReviewTitle}</a> <a
																style="float: right; font-weight: normal; font-size: 13px;"><fmt:formatDate
																	value="${reviewSearchList.reviewDate}" /></a><a
																style="float: right; font-weight: normal; font-size: 13px;">작성
																날짜 :</a>
														</div>
													</th>
												</tr>

												<tr style="height: 120px; background-color: white;">
													<th
														style="width: 130px; text-align: left; padding: 10px; flex-direction: row;">
														<a
														href="${contextPath}/product/viewProduct.do?productNum=${reviewSearchList.productNum}"><img
															src="${contextPath}/download_product.do?productNum=${reviewSearchList.productNum}&productImage=${reviewSearchList.productImage}"
															width="90" height="90"></a>
													</th>
													<th style="padding: 10px; border-left: hidden; height:233px; ">

														<div style="width: 300px; margin-top:10px; ">
															<div>
																<a
																	href="${contextPath}/product/viewProduct.do?productNum=${reviewSearchList.productNum}">${reviewSearchList.productName}</a>
															</div>
															<c:if test="${reviewSearchList.option1value !=null}">
																<p
																	style="font-size: 11px; margin-bottom: 5px; font-weight: normal;">${reviewSearchList.option1Name}
																	: ${reviewSearchList.option1value}</p>
															</c:if>
															<c:if test="${reviewSearchList.option2value !=null}">
																<p
																	style="font-size: 11px; margin-bottom: 5px; font-weight: normal;">${reviewSearchList.option2Name}
																	: ${reviewSearchList.option2value}</p>
															</c:if>
														</div>
													</th>

													<th colspan="2"
														style="padding-left: 5px; float: right; padding-right: 0px; border-right:none;">
														<div
															style="border: 1px solid #eeeeee;  margin-top:5px; margin-bottom:5px; padding-left: 10px; background-color: #white; padding-top: 10px; padding-bottom: 10px; width: 600px;  font-weight:normal;">${reviewSearchList.productContent}<br>
															<img id="preview"
																src="${contextPath}/download_review.do?reviewNum=${reviewSearchList.reviewNum}&reviewFile=${reviewSearchList.reviewFile}"
																width="120" height="120" /> <br> <input
																type="button" name="modify" value="수정 "
																style="margin-top: 15px; margin-left: 435px; cursor: pointer; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; height: 30px; font-size: 13px;"
																onclick="location.href='${contextPath}/mypage/modReview.do?reviewNum=${reviewSearchList.reviewNum}'">
															<input type="reset" name="reset" value="삭제"
																style="background-color: white; color: gray; cursor: pointer; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; height: 30px; font-size: 13px;"
																onclick="location.href='${contextPath}/mypage/removeReview.do?reviewNum=${reviewSearchList.reviewNum}&memOrderSeqNum=${reviewSearchList.memOrderSeqNum}'">
														</div>
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
										style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px; padding-left: 4px; padding-right: 5px;"
										href='<c:url value="/mypage/reviewSearch.do?search1=${reviewSearchMap.search1}&search2=${reviewSearchMap.search2}&page=${pageMaker.startPage-1 }"/>'><i
										class="fa fa-chevron-left"></i></a>

								</c:if>
								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="pageNum">

									<a
										style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px; padding-left: 4px; padding-right: 5px;"
										href='<c:url value="/mypage/reviewSearch.do?search1=${reviewSearchMap.search1}&search2=${reviewSearchMap.search2}&page=${pageNum }"/>'><i
										class="fa">${pageNum }</i></a>

								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

									<a class="arrow next"
										style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px; padding-left: 4px; padding-right: 5px;"
										href='<c:url value="/mypage/reviewSearch.do?search1=${reviewSearchMap.search1}&search2=${reviewSearchMap.search2}&page=${pageMaker.endPage+1 }"/>'><i
										class="fa fa-chevron-right"></i></a>

								</c:if>

							</div>
						</div>
					</c:when>

					<c:when test="${empty reviewSearchMap.search1}">
						<div style="padding-left: 262px;">
							<table style="width: 1000px; height: 80px; align: center; border-right: none; border-left: none;">
								<tbody>
									<c:choose>
										<c:when test="${empty mypageReviewMap.mypageReviewList}">
											<tr style="background-color: white;">
												<td colspan="5"
													style="background-color: white; border-bottom:1px solid #eeeeee; vertical-align:middle; height:80px; color:#5f5f5f; font-size:13px; text-align:center;">작성한
													리뷰가 없습니다.</td>
											</tr>
										</c:when>
										<c:when test="${!empty mypageReviewMap.mypageReviewList}">

											<c:forEach var="mypageReviewList" items="${mypageReviewList}">
												<tr
													style="background-color: #fbfbfb; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #eeeeee;">
													<th colspan="3"
														style="padding-top: 5px; padding-bottom: 5px;">
														<div
															style="text-align: center; font-size: 13px; padding: 5px">
															<a>${mypageReviewList.productReviewTitle}</a> <a
																style="float: right; font-size: 13px; font-weight: normal;"><fmt:formatDate
																	value="${mypageReviewList.reviewDate}" /></a><a
																style="float: right; font-size: 13px; font-weight: normal;">작성
																날짜 :</a>
														</div>
													</th>
												</tr>

												<tr style="height: 120px; background-color: white;">
													<th
														style="text-align: left; padding: 10px; flex-direction: row;">
														<a
														href="${contextPath}/product/viewProduct.do?productNum=${mypageReviewList.productNum}"><img
															src="${contextPath}/download_product.do?productNum=${mypageReviewList.productNum}&productImage=${mypageReviewList.productImage}"
															width="90" height="90"></a>
													</th>
													<th style="padding: 10px; border-left: hidden;">
														<div>
															<div>
																<a style="font-size:13px;"
																	href="${contextPath}/product/viewProduct.do?productNum=${mypageReviewList.productNum}">${mypageReviewList.productName}</a>
															</div>
															<c:if test="${mypageReviewList.option1value !=null}">
																<p
																	style="font-size: 11px; margin-bottom: 5px; font-weight: normal;">${mypageReviewList.option1Name}
																	: ${mypageReviewList.option1value}</p>
															</c:if>
															<c:if test="${mypageReviewList.option2value !=null}">
																<p
																	style="font-size: 11px; margin-bottom: 5px; font-weight: normal;">${mypageReviewList.option2Name}
																	: ${mypageReviewList.option2value}</p>
															</c:if>
														</div>
													</th>

													<th colspan="2"
														style="padding-left: 5px; float: right; padding-right: 0px;">
														<div 
															style="border: 1px solid #eeeeee; margin-top:5px; margin-bottom:5px; padding-left: 10px; font-size:13px;background-color: #white; padding-top: 10px; padding-bottom: 10px; width: 600px; font-weight:normal;">${mypageReviewList.productContent}<br>

															<img id="preview"
																src="${contextPath}/download_review.do?reviewNum=${mypageReviewList.reviewNum}&reviewFile=${mypageReviewList.reviewFile}"
																height="120" /> <br> <input
																type="button" name="modify" value="수정 "
																style="margin-top: 15px; margin-left: 435px; cursor: pointer; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; height: 30px; font-size: 12px;"
																onclick="location.href='${contextPath}/mypage/modReview.do?reviewNum=${mypageReviewList.reviewNum}'">
															<input type="reset" name="reset" value="삭제"
																style="background-color: white; color: gray; cursor: pointer; border: 1px solid #eeeeee; border-radius: 2px;margin-right: 5px; width: 70px; height: 30px; font-size: 12px;"
																onclick="location.href='${contextPath}/mypage/removeReview.do?reviewNum=${mypageReviewList.reviewNum}&memOrderSeqNum=${mypageReviewList.memOrderSeqNum}'">
														</div>
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
										style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px; padding-left: 4px; padding-right: 5px;"
										href='<c:url value="/mypage_14.do?search1=${mypageReviewMap.search1}&search2=${mypageReviewMap.search2}&page=${pageMaker.startPage-1 }"/>'><i
										class="fa fa-chevron-left"></i></a>

								</c:if>
								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="pageNum">

									<a
										style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px; padding-left: 4px; padding-right: 5px;"
										href='<c:url value="/mypage_14.do?search1=${mypageReviewMap.search1}&search2=${mypageReviewMap.search2}&page=${pageNum }"/>'><i
										class="fa">${pageNum }</i></a>

								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

									<a class="arrow next"
										style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px; padding-left: 4px; padding-right: 5px;"
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