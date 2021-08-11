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

.page_wrap {
	text-align: center;
	font-size: 0;
}

.page_nation {
	display: inline-block;
}

.page_nation .none {
	display: none;
}

.page_nation a {
	display: block;
	margin: 0 3px;
	float: left;
	border: 1px solid #e6e6e6;
	width: 28px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	background-color: #fff;
	font-size: 13px;
	color: #999999;
	text-decoration: none;
}

.page_nation .arrow {
	border: 1px solid #ccc;
}

.page_nation .pprev {
	background: #f8f8f8
		url('${contextPath}/resources/images/page_pprev.png') no-repeat center
		center;
	margin-left: 0;
}

.page_nation .prev {
	background: #f8f8f8 url('${contextPath}/resources/images/page_prev.png')
		no-repeat center center;
	margin-right: 7px;
}

.page_nation .next {
	background: #f8f8f8 url('${contextPath}/resources/images/page_next.png')
		no-repeat center center;
	margin-left: 7px;
}

.page_nation .nnext {
	background: #f8f8f8
		url('${contextPath}/resources/images/page_nnext.png') no-repeat center
		center;
	margin-right: 0;
}

.page_nation a.active {
	background-color: #42454c;
	color: #fff;
	border: 1px solid #42454c;
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
		style="padding-top: 100px; margin-bottom: 50px; padding-bottom: 0px; margin-bottom: 200px; margin-top: 30px;">
		<div class="container">
			<ul class="snip1284" style="margin-bottom:30px; padding-left:0px;">
				<li><a
					onclick="location.href='${contextPath}/board/listNotice.do'"
					data-hover="공지사항"
					style="font-size: 19px; border: none; color: #5a5a5a; margin-right: 150px; cursor: pointer; background-color: white; margin-left: 20px; padding-bottom: 0px;">공지사항</a></li>


				<li><a
					onclick="location.href='${contextPath}/board/listQuestion.do'"
					data-hover="자주 묻는 질문"
					style="font-size: 19px; border: none; color: #5a5a5a; margin-right: 150px; cursor: pointer; background-color: white; padding-bottom: 0px;">자주
						묻는 질문</a></li>


				<li><a onclick="InquiryList()" data-hover="1:1문의"
					style="font-size: 19px; border: none; color: #5a5a5a; margin-right: 150px; cursor: pointer; background-color: white; padding-bottom: 0px;">1:1문의</a></li>


				<li class="current"><a
					onclick="location.href='${contextPath}/board/listAsCenter.do'"
					data-hover="A/S센터"
					style="font-size: 19px; border: none; color: #5a5a5a; background-color: white; cursor: pointer; padding-bottom: 0px;">A/S센터</a></li>
			</ul>




			<!-- 타이틀 끝 -->
			<!-- 최근 본 상품 -->
			
			<!-- 최근 본 상품 끝 -->

			<!-- 내용 -->
			<form 
				action="${contextPath}/board/viewAsCenter.do?asCenterNum=${asCenterNum}&page=${pageNum}"
				method="post">
				<div>
					<p style="padding-left: 530px; padding-top: 70px; ">비밀번호를
						입력해주세요^^</p>
					<p style="padding-left: 400px; padding-top: 50px; float: left; margin-top:3px;">PASSWORD</p>
				</div>
				<div style="margin-bottom:100px;">
					<input type=password name="asCenterPwdConfirm"
						style="float: left;  margin-left: 10px; border-radius: 3px; margin-top: 50px;  border: 1px solid #dcdcdc; width: 200px; color:#b3b3b3; height: 36px; font-size:14px;">
					<button type="submit" id="buttonmy" class="btn btn-dark"
						style="float: left; margin-left: 10px; margin-top: 49px; border-radius: 2px; font-size: 14px; padding-top: 4px; background-color: #7e9c8c; height:36px; border:none;">확인</button>
					<button type="button"
						onClick="location.href='${contextPath}/board/listAsCenter.do?page=${pageNum}'"
						id="buttonmy" class="btn btn-dark"
						style="float: left; margin-left: 10px; margin-top: 49px; border-radius: 2px; font-size: 14px; padding-top: 4px; color:black; background-color: white; height:36px; border:1px solid #7e9c8c; ">목록</button>
				</div>
			</form>
		</div>
	</section>
	<!-- 내용 끝 -->
</body>
</html>