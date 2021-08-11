<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>Klift - Free Bootstrap 4 Template by Colorlib</title>
<!-- 날짜조회위젯 -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 조회기간 선택 자바스크립트 -->
<script>
	//회원탈퇴경고창
	function drop_out() {
		if (confirm("회원탈퇴를 진행하시겠습니까?")) {
			location.href = "${contextPath}/deletemember.do";
		} else {
			return false;
		}

		form.submit();
	}
	
	//1:1문의내역 바로가기
    function InquiryList() {
        if (${isLogOn != true && member == null}) {
        	location.href='${contextPath}/board/listInquiry.do'}
        	 else{
            alert("로그인이 필요합니다.");
            location.href = '${contextPath}/login_01.do';}
        }  

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
<!-- 날짜조회 위젯끝 -->

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
<title>마이페이지메인창</title>
<body>

	<!-- 마이페이지 타이틀 -->
	<section class="ftco-section"
		style="padding-top: 50px; margin-bottom: 50px; padding-bottom: 0px; height: 700px; margin-top: 30px;">
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
				style="font-size: 20px; font-weight: bold; margin-left: 18px; padding-bottom: 7px;">마이페이지</div>
			<jsp:include page="/WEB-INF/views/common/mypage_topmenu.jsp"
				flush="false" />

			<!-- 마이페이지 상단 공통 ui 끝-->
			<div class="table_01">
				<div id="MyPage_top" style="width: 1100px; margin-left: 170px;">
					<table style="width: 1000px; height: 120px; align: center;">
						<tbody id="MyPage_center2">
							<tr height="30%">
								<th
									style="font-size: 20px!importent; font-weight: bold; margin-left: 18px; padding-top: 20px;"
									colspan="4">주문/배송조회(최근 1개월)</th>
								<th width="80"
									style="text-align: right; font-size: 11px; padding-top: 40px;"><a
									href="${contextPath}/mypage_04.do"
									style="color: gray; cursor: pointer;">더보기 ></a></th>
							</tr>
							<tr align="center"
								style="padding-left: 10px; font-size: 14px; background-color: #c6c6c6; color: white;"
								height="35%">
								<th width="132" style="text-align: center;">주문접수</th>
								<th width="132" style="text-align: center;">결제완료</th>
								<th width="132" style="text-align: center;">상품준비중</th>
								<th width="132" style="text-align: center;">배송중</th>
								<th width="132" style="text-align: center;">배송완료</th>
							</tr>
							<tr align="center"
								style="padding-left: 10px; font-size: 16px; background-color: #c6c6c6;"
								height="35%">
								<th width="132" style="text-align: center;"><a
									style="color: #7e9c8c;">${myInfo.order_rc}</a><a
									style="font-size: 14px; color: gray;">건</a></th>
								<th width="132" style="text-align: center;"><a
									style="color: #7e9c8c">${myInfo.payment_cp}</a><a
									style="font-size: 14px; color: gray;">건</a></th>
								<th width="132" style="text-align: center;"><a
									style="color: #7e9c8c;">${myInfo.product_pp}</a><a
									style="font-size: 14px; color: gray;">건</a></th>
								<th width="132" style="text-align: center;"><a
									style="color: #7e9c8c;">${myInfo.delivery}</a><a
									style="font-size: 14px; color: gray;">건</a></th>
								<th width="132" style="text-align: center;"><a
									style="color: #7e9c8c;">${myInfo.deliver_cp}</a><a
									style="font-size: 14px; color: gray;">건</a></th>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="MyPage_top" style="width: 1000px; margin-left: 265px;">
					<table style="width: 1000px; height: 80px;">
						<tr height="55%">
							<th colspan="2"
								style="font-size: 20px!importent; font-weight: bold; margin-left: 18px; padding-top: 40px;"
								colspan="4"><a style="padding-bottom: 10px;">1:1문의내역</a></th>
							<th width="80"
								style="text-align: right; font-size: 11px; padding-top: 40px;"><a
								onclick="InquiryList()" style="color: gray; cursor: pointer;">더보기
									></a></th>

						</tr>
						<tr align="center"
							style="background-color: #eeeeee; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #c6c8ca; font-size: 15px;">
							<th>문의유형</th>
							<th>제목</th>
							<th>작성일</th>
						</tr>
						<c:choose>
							<c:when test="${empty myInfo.listInquiry}">
								<tr>
									<td colspan="3">등록된 글이 없습니다.</td>
								</tr>
							</c:when>
							<c:when test="${!empty myInfo.listInquiry}">
								<c:forEach var="inquiry" items="${myInfo.listInquiry}">

									<tr align="left"
										style="font-size: 14px; border: 1px solid #e3e3e3; text-align: center;"
										height="50%">
										<th>${inquiry.inquiryType}</th>
										<th><a
											href="${contextPath}/board/viewInquiry.do?inquiryNum=${inquiry.inquiryNum}"
											style="color: gray; padding-left: 10px; text-align: center;">${inquiry.inquiryTitle}</a></th>
										<th><fmt:formatDate value="${inquiry.inquiryDate}" /></th>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</table>
				</div>
				<div id="MyPage_top1" style="padding-bottom: 50px;">
					<table style="width: 1000px; height: 80px; align: center;">
						<tr height="60%">
							<th colspan="2"
								style="font-size: 20px!importent; font-weight: bold; margin-left: 18px; padding-top: 20px;"
								colspan="4"><a>A/S 접수</a></th>
							<th width="80"
								style="text-align: right; font-size: 11px; padding-top: 30px;"><a
								href="${contextPath}/board/listAsCenter.do" style="color: gray; cursor: pointer;">더보기 ></a></th>
						</tr>
						<tr align="center"
							style="background-color: #eeeeee; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #c6c8ca; font-size: 15px;">
							<th>접수상태</th>
							<th>제목</th>
							<th>작성일</th>
						</tr>
						<c:choose>
							<c:when test="${empty myInfo.listAsCenter}">
								<tr>
									<td colspan="3">등록된 글이 없습니다.</td>
								</tr>
							</c:when>
							<c:when test="${!empty myInfo.listAsCenter}">
								<c:forEach var="asCenter" items="${myInfo.listAsCenter}">
									<tr align="left"
										style="font-size: 14px; border: 1px solid #e3e3e3; text-align: center;"
										height="50%">
										<th>${asCenter.asCenterStatus}</th>
										<th width="660" height="40px;"><a href="/CS-07"
											style="padding-left: 10px; color: gray;">${asCenter.asCenterTitle}</a></th>
										<th><fmt:formatDate value="${asCenter.asCenterDate}" /></th>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</table>
				</div>
				<button type="button" onclick="drop_out()" id="btn-remove-mypage"
					style="float: right; color: gary; font-size: 11px; padding-right: 5px; border: none; background-color: white; cursor: pointer;">회원탈퇴</button>
			</div>
		</div>
	</section>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>