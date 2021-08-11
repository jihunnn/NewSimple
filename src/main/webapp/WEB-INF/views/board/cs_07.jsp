<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<style>
@import url(https://fonts.googleapis.com/css?family=Raleway:500);

.snip1284 {
	font-family: 'Raleway', Arial, sans-serif;
	text-align: center;
	text-transform: uppercase;
	font-weight: 500;
	letter-spacing: 1px;
}

.snip1284 * {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all 0.35s ease;
	transition: all 0.35s ease;
}

.snip1284 li {
	display: inline-block;
	list-style: outside none none;
	margin: 0.5em 1.2em;
	padding: 0;
}

.snip1284 a {
	padding: 0 0.6em;
	color: rgba(255, 255, 255, 0.5);
	position: relative;
	text-decoration: none;
}

.snip1284 a:before, .snip1284 a:after {
	width: 3px;
	height: 0;
	position: absolute;
	content: '';
	-webkit-transition: all 0.35s ease;
	transition: all 0.35s ease;
	background-color: #7e9c8c;
}

.snip1284 a:before {
	top: 0;
	right: 0;
}

.snip1284 a:after {
	bottom: 0;
	left: 0;
}

.snip1284 a:hover, .snip1284 .current a {
	color: #ffffff;
}

.snip1284 a:hover:before, .snip1284 .current a:before, .snip1284 a:hover:after,
	.snip1284 .current a:after {
	height: 100%;
}
#buttonmy {
	width: 80px;
	height: 30px;
	float: left;
	border-radius: 2px;
	padding-top: 1.8px;
}
</style>
<script>
function InquiryList() {
    if (${isLogOn != true && member == null}) {
        alert("로그인이 필요합니다.");
        location.href = '${contextPath}/login_01.do';
    } else {
    	location.href='${contextPath}/board/listInquiry.do'
    }
}
</script>

</head>
<body>
	<!-- 타이틀 -->
	<section class="ftco-section"
		style="padding-top: 50px; margin-bottom: 50px; margin-top:30px;">
		<div class="container">
			<ul class="snip1284">
				<li><a
					onclick="location.href='${contextPath}/board/listNotice.do'"
					data-hover="공지사항"
					style="font-size: 20px; border: none; color: #5a5a5a; margin-right: 150px; cursor: pointer; background-color: white; margin-left: 20px; padding-bottom: 0px;">공지사항</a></li>


				<li ><a
					onclick="location.href='${contextPath}/board/listQuestion.do'"
					data-hover="자주 묻는 질문"
					style="font-size: 20px; border: none; color: #5a5a5a; margin-right: 150px; cursor: pointer; background-color: white; padding-bottom: 0px;">자주
						묻는 질문</a></li>


				<li><a onclick="InquiryList()" data-hover="1:1문의"
					style="font-size: 20px; border: none; color: #5a5a5a; margin-right: 150px; cursor: pointer; background-color: white; padding-bottom: 0px;">1:1문의</a></li>


				<li class="current"><a
					onclick="location.href='${contextPath}/board/listAsCenter.do'"
					data-hover="A/S센터"
					style="font-size: 20px; border: none; color: #5a5a5a; background-color: white; cursor: pointer; padding-bottom: 0px;">A/S센터</a></li>
			</ul>

			<div>
				<h2 style="font-size: 28px; margin-top: 15px; float: left;">1:1문의</h2>
				<h5
					style="color: #828282; float: left; font-size: 18px; margin-left: 20px; margin-top: 25px;">빠르게 답변해 드리겠습니다.</h5>
			</div>
			<!-- 타이틀 끝 -->
			<!-- 최근 본 상품 -->
			
			<!-- 최근 본 상품 끝 -->
			<jsp:include page="/WEB-INF/views/common/csMenu.jsp" flush="false" />			
			<!-- 내용 -->

			<table class="table" style="margin-top: 20px; text-align: center; font-size: 14px;">

				<thead class="table-dark" align=center>
					<tr style="border-bottom: 1px solid grey; height: 30px; background-color: #212529;">
						<td>배송 언제 되나요</td>

					</tr>
					<tr
						style="height: 200px; text-align: left; background-color: white;">
						<td style="padding-bottom: 150px; color: black;">5월 말에 주문 했는데
							배송은 언제 되나요?</td>
					</tr>
					<tr style="height: 30px;">
						<td>[답변]배송 언제 되나요</td>

					</tr>
					<tr
						style="border-bottom: 0.5px solid grey; height: 200px; text-align: left; background-color: white;">
						<td style="padding-bottom: 150px; color: black;">홍길동 고객님
							안녕하세요. 주문하신 상품은 6/4일 오늘 출고 예정입니다.조금만 기다려주세요^^</td>
					</tr>
				</thead>
			</table>
			<button id="buttonmy" type="submit" class="btn btn-dark"
				style="float: left; margin-left: 590px; margin-top: 30px;">목록</button>
			<button id="buttonmy" type="submit" class="btn btn-dark"
				style="float: left; margin-left: 1100px; margin-top: -30px;">수정</button>
			<button id="buttonmy" type="submit" class="btn btn-dark"
				style="float: left; margin-left: 1190px; margin-top: -30px;">삭제</button>
		</div>
	</section>
	<!-- 내용 끝 -->
</body>
</html>