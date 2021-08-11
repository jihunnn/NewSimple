<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>

<script type="text/javascript">
<!--글쓰기 유효성 검사-->
	function CS_write() {
		var form = document.asCenterForm;

		if (form.asCenterTitle.value == "") {
			alert("제목을 입력해주세요")
			form.asCenterTitle.focus();
			return false;
		}

		if (form.asCenterContent.value == "") {
			alert("글 내용을 입력해주세요")
			document.form.asCenterContent.focus();
			return false;
		}

		if (form.asCenterPwd.value == "") {
			alert("비밀번호를 입력해주세요")
			form.asCenterPwd.focus();
			return false;
		}

		form.submit();

	}

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	function modAsCenter(obj) {
		var form = document.asCenterForm;

		if (form.asCenterTitle.value == "") {
			alert("제목을 입력해주세요")
			form.asCenterTitle.focus();
			return false;
		}

		if (form.asCenterContent.value == "") {
			alert("글 내용을 입력해주세요")
			document.form.asCenterContent.focus();
			return false;
		}

		if (form.asCenterPwd.value == "") {
			alert("비밀번호를 입력해주세요")
			form.asCenterPwd.focus();
			return false;
		}
		obj.action = "${contextPath}/board/modNewAsCenter.do?asCenterNum=${asCenter.asCenterNum}";
		obj.submit();

	}
	
	function InquiryList() {
	    if (${isLogOn != true && member == null}) {
	        alert("로그인이 필요합니다.");
	        location.href = '${contextPath}/login_01.do';
	    } else {
	    	location.href='${contextPath}/board/listInquiry.do'
	    }
	}
</script>

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


</head>
<body>
	<!-- 타이틀 -->
	<section class="ftco-section"
		style="padding-top: 100px; margin-bottom: 50px; padding-bottom: 0px; margin-bottom: 150px; margin-top: 30px;">
		<div class="container">
			<ul class="snip1284" style="margin-bottom:30px;  padding-left:0px;">
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

			<div>
				<h2 style="font-size: 25px; margin-top: 15px; float: left;">A/S센터</h2>
				<h5
					style="color: #828282; float: left; font-size: 15px; margin-left: 20px; margin-top: 25px;">빠르게
					접수 도와드리겠습니다.</h5>
			</div>
			<!-- 타이틀 끝 -->
			<!-- 최근 본 상품 -->
		
			<!-- 최근 본 상품 끝 -->

			<!-- 내용 -->

			<form name="asCenterForm"
				action="${contextPath}/board/addNewAsCenter.do" method="post"
				enctype="multipart/form-data">
				<table class=table
					style="padding-top: 50px; border-top: #212529; font-size: 14px;">
					<c:choose>
						<c:when test="${!empty asCenterNum}">
							<tr style="background-color: #eeeeee; border-top:1px solid #7e9c8c;color:black; border-bottom: 1px solid #c6c8ca; font-size:15px;"
								align="center">
								<td colspan="6" style="color: black;">글수정하기</td>
							</tr>
							<tr style="border-bottom: 1px solid #dcdcdc;">
								<td
									style="padding-left: 95px; font-weight: bold; padding-right: 100px; padding-top: 15px;">작성자</td>
								<td colspan="2"
									style="padding-top: 15px; background-color: white;"><input
									type=text name="memName" value="${asCenter.memName}" size=60
									disabled
									style="height: 28px; border: 1px solid #d2d2d2; border-radius: 3px; width: 150px;"></td>
							</tr>
							<tr style="border-bottom: 1px solid #dcdcdc;">
								<td
									style="padding-left: 95px; font-weight: bold; padding-top: 17px;">제목</td>
								<td colspan="2"
									style="padding-top: 17px; background-color: white;"><input
									type=text name="asCenterTitle" size=60
									value="${asCenter.asCenterTitle}"
									style="height: 28px; border: 1px solid #d2d2d2; border-radius: 3px; border: 1px solid #d2d2d2;"></td>
							</tr>
							<tr style="border-bottom: 1px solid #dcdcdc;">
								<td
									style="padding-left: 95px; font-weight: bold; padding-top: 20px;">내용</td>
								<td colspan="2"
									style="padding-top: 17px; background-color: white; height: 300px;"><input
									type="text" name="asCenterContent"
									value="${asCenter.asCenterContent}"
									style="width: 725px; height: 300px; padding-top: 17px; border: 1px solid #d2d2d2;"></td>
							</tr>
							<tr style="border-bottom: 1px solid #dcdcdc;">
								<td
									style="padding-left: 95px; font-weight: bold; padding-top: 15px;">비밀번호</td>
								<td colspan="2"
									style="padding-top: 15px; background-color: white;"><input
									type="password" name="asCenterPwd" size=60
									style="height: 28px; border: 1px solid #d2d2d2; border-radius: 3px; width: 150px;"></td>
							</tr>
							<tr>
								<td
									style="padding-left: 95px; font-weight: bold; padding-top: 17px;">파일첨부</td>
								<td style="background-color: white;">기존파일:
									${asCenter.asCenterFile}<input type="hidden"
									name="OrignAsCenterFile" value="${asCenter.asCenterFile}" /><br>
									<input type="file" style="padding-top: 5px; font-size: 14px;"
									name="asCenterFile" onchange="readURL(this);">
								</td>
								<td><img id="preview"
									src="${contextPath}/resources/images/simpleLogo.jpg"
									width="150" height="150" /></td>
							</tr>
						</c:when>
						<c:when test="${empty asCenterNum}">
							<tr style="background-color: #eeeeee; border-top:1px solid #7e9c8c;color:black; border-bottom: 1px solid #c6c8ca; font-size:15px;"
								align="center">
								<td colspan="6" style="color: black;">글쓰기</td>
							</tr>
							<tr style="border-bottom: 1px solid #dcdcdc;">
								<td
									style="padding-left: 95px; font-weight: bold; padding-right: 100px; padding-top: 15px;">작성자</td>
								<td colspan="2"
									style="padding-top: 15px; background-color: white;"><input
									type=text name="memName" value="${memName}" size=60 disabled
									style="height: 28px; border: 1px solid #d2d2d2; border-radius: 3px; width: 150px;"></td>
							</tr>
							<tr style="border-bottom: 1px solid #dcdcdc;">
								<td
									style="padding-left: 95px; font-weight: bold; padding-top: 17px;">제목</td>
								<td colspan="2"
									style="padding-top: 17px; background-color: white;"><input
									type=text name="asCenterTitle" size=60
									style="height: 28px; border: 1px solid #d2d2d2; border-radius: 3px; border: 1px solid #d2d2d2;"></td>
							</tr>
							<tr style="border-bottom: 1px solid #dcdcdc;">
								<td
									style="padding-left: 95px; font-weight: bold; padding-top: 20px;">내용</td>
								<td colspan="2"
									style="padding-top: 17px; background-color: white; height: 300px;"><input
									type="text" name="asCenterContent"
									style="width: 725px; height: 300px; padding-top: 17px; border: 1px solid #d2d2d2;"></td>
							</tr>
							<tr style="border-bottom: 1px solid #dcdcdc;">
								<td
									style="padding-left: 95px; font-weight: bold; padding-top: 15px;">비밀번호</td>
								<td colspan="2"
									style="padding-top: 15px; background-color: white;"><input
									type="password" name="asCenterPwd" size=60
									style="height: 28px; border: 1px solid #d2d2d2; border-radius: 3px; width: 150px;"></td>
							</tr>
							<tr>
								<td
									style="padding-left: 95px; font-weight: bold; padding-top: 17px;">파일첨부</td>
								<td style="background-color: white;"><input type="file"
									style="padding-top: 5px; font-size: 14px;" name="asCenterFile"
									onchange="readURL(this);"></td>
								<td><img id="preview"
									src="${contextPath}/resources/images/simpleLogo.jpg"
									width="150" height="150" /></td>
							</tr>
						</c:when>
					</c:choose>
				</table>
				<hr style="border-color: #212529;; width: 100%;">
				<c:choose>
					<c:when test="${!empty asCenterNum}">
						<div>
							<button type="button" onClick="modAsCenter(this.form)"
								class="btn btn-dark " id="buttonmy"
								style="margin-left: 540px; margin-top: 30px; border-radius: 2px;  background-color: #7e9c8c; color: white; border:none; border-radius: 2px; width: 120px; height: 40px; padding-top:10px; padding-top: 4px; float:left;">수정</button>
							<button type="button" class="btn btn-dark " id="buttonmy"
								onClick="location.href='${contextPath}/board/listAsCenter.do'"
								style="margin-left: 20px;  margin-top:30px; border-radius: 2px;  background-color: white; color: gray;  border:1px solid #eeeeee; border-radius: 2px; width: 120px; height: 40px; padding-top:10px; padding-top: 4px;  float:left;">목록</button>
						</div>
					</c:when>
					<c:when test="${empty asCenterNum}">
						<div>
							<button type="button" onclick="CS_write()" class="btn btn-dark "
								id="buttonmy"
								style="margin-left: 540px; margin-top: 30px; border-radius: 2px;  background-color: #7e9c8c; color: white; border:none; border-radius: 2px; width: 120px; height: 40px; padding-top:10px; padding-top: 4px; float:left;">등록</button>
							<button type="button" class="btn btn-dark " id="buttonmy"
								onClick="location.href='${contextPath}/board/listAsCenter.do'"
								style="margin-left: 20px;  margin-top:30px; border-radius: 2px;  background-color: white; color: gray;  border:1px solid #eeeeee; border-radius: 2px; width: 120px; height: 40px; padding-top:10px; padding-top: 4px;  float:left;">목록</button>
						</div>
					</c:when>
				</c:choose>
			</form>

		</div>
	</section>
	<!-- 내용 끝 -->
</body>
</html>