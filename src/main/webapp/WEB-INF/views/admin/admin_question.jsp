<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>

<script type="text/javascript">
<!--글쓰기 유효형 검사-->
	function question_write() {
		var form = document.questionForm;

		if (form.questionTitle.value == "") {
			alert("질문을 입력해주세요")
			form.questionTitle.focus();
			return false;
		}

		if (form.questionContent.value == "") {
			alert("답변을 입력해주세요")
			document.form.questionContent.focus();
			return false;
		}

		form.submit();
	}

	function modQuestion(obj) {
		var form = document.questionForm;

		if (form.questionTitle.value == "") {
			alert("질문을 입력해주세요")
			form.questionTitle.focus();
			return false;
		}

		if (form.questionContent.value == "") {
			alert("답변을 입력해주세요")
			document.form.questionContent.focus();
			return false;
		}
		obj.action = "${contextPath}/admin/modNewQuestion.do?questionNum=${questionNum.questionNum}";
		obj.submit();

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
		style="padding-top: 50px; margin-bottom: 50px; margin-top: 30px;">
		<div class="container">
			<jsp:include page="/WEB-INF/views/common/admin_topmenu.jsp"
				flush="false" />
			<div>
				<h2 style="font-size: 25px; margin-top: 15px; float: left;">자주묻는질문</h2>
				<h5
					style="color: #828282; float: left; font-size: 15px; margin-left: 20px; margin-top: 25px;">고객님들께서
					자주 묻는 질문을 모았습니다.</h5>
			</div>
			<!-- 타이틀 끝 -->


			<!-- 최근 본 상품 -->

			<!-- 최근 본 상품 끝 -->

			<!-- 내용 -->

			<form name="questionForm"
				action="${contextPath}/admin/addNewQuestion.do" method="post"
				>
				<table class=table
					style="padding-top: 50px; border-top: #212529; height: 25px; font-size: 14px;">
					<c:choose>
						<c:when test="${!empty questionNum}">
							<tr style="background-color: #212529; margin-top: 20px;"
								align="center">
								<td colspan="6"
									style="background-color: #eeeeee; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #c6c8ca; font-size: 15px;">글수정</td>
							</tr>
							<tr style="border-bottom: 1px solid #dcdcdc;">
								<td
									style="padding-left: 95px; font-weight: bold; padding-top: 17px;">질문</td>
								<td colspan="2"
									style="padding-top: 17px; background-color: white;"><input
									type=text name="questionTitle" size=60 value="${questionNum.questionTitle}"
									style="height: 28px; border: 1px solid #d2d2d2; border-radius: 3px;"></td>
							</tr>
							<tr style="border-bottom: 1px solid #dcdcdc;">
								<td
									style="padding-left: 95px; font-weight: bold; padding-top: 20px;">답변</td>
								<td colspan="2"
									style="padding-top: 17px; background-color: white; height: 300px;"><textarea
										name="questionContent"
										style="width: 725px; height: 300px; padding-top: 17px; border: 1px solid #d2d2d2;">${questionNum.questionContent}</textarea></td>
							</tr>
						</c:when>
						<c:when test="${empty questionNum}">

							<tr style="background-color: #212529; margin-top: 20px;"
								align="center">
								<td colspan="6"
									style="background-color: #eeeeee; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #c6c8ca; font-size: 15px;">글쓰기</td>
							</tr>
							<tr style="border-bottom: 1px solid #dcdcdc;">
								<td
									style="padding-left: 95px; font-weight: bold; padding-top: 17px;">질문</td>
								<td colspan="2"
									style="padding-top: 17px; background-color: white;"><input
									type=text name="questionTitle" size=60 value=""
									style="height: 28px; border: 1px solid #d2d2d2; border-radius: 3px;"></td>
							</tr>
							<tr style="border-bottom: 1px solid #dcdcdc;">
								<td
									style="padding-left: 95px; font-weight: bold; padding-top: 20px;">답변</td>
								<td colspan="2"
									style="padding-top: 17px; background-color: white; height: 300px;"><textarea
										name="questionContent"
										style="width: 725px; height: 300px; padding-top: 17px; border: 1px solid #d2d2d2;"></textarea></td>
							</tr>
						</c:when>
					</c:choose>
				</table>
				<hr style="border-color: #c6c8ca; width: 100%;">
				<c:choose>
					<c:when test="${!empty questionNum}">
						<button type="button" onClick="modQuestion(this.form)"
							class="btn btn-dark " id="buttonmy"
							style="margin-left: 540px; margin-top: 30px; border-radius: 2px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 120px; height: 40px; padding-top: 10px; padding-top: 4px; float: left;">수정하기</button>
						<button type="button"
							onclick="location.href='${contextPath}/board/listQuestion.do'"
							class="btn btn-dark " id="buttonmy"
							style="margin-left: 20px; margin-top: 30px; border-radius: 2px; background-color: white; color: gray; border: 1px solid #7e9c8c; border-radius: 2px; width: 120px; height: 40px; padding-top: 10px; padding-top: 4px; float: left;">목록</button>

					</c:when>
					<c:when test="${empty questionNum}">
						<div>
							<button type="button" onclick="question_write()"
								class="btn btn-dark " id="buttonmy"
								style="margin-left: 540px; margin-top: 30px; border-radius: 2px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 120px; height: 40px; padding-top: 10px; padding-top: 4px; float: left;">등록</button>

							<button type="button"
								onclick="location.href='${contextPath}/board/listQuestion.do'"
								class="btn btn-dark " id="buttonmy"
								style="margin-left: 20px; margin-top: 30px; border-radius: 2px; background-color: white; color: gray; border: 1px solid #7e9c8c; border-radius: 2px; width: 120px; height: 40px; padding-top: 10px; padding-top: 4px; float: left;">목록</button>
						</div>
					</c:when>
				</c:choose>
			</form>
		</div>
	</section>
	<!-- 내용 끝 -->

</body>
</html>