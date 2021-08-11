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
<script>
	function removeInquiryAnswer(obj) {
		if (confirm("삭제하시겠습니까??")) {
			obj.action = "${contextPath}/admin/removeInquiryAnswer.do?inquiryNum=${inquiry.inquiryNum}";
		} else {
			return false;
		}
		obj.submit();
	}

	function modInquiryAnswer() {
		document.getElementById("inquiryAnswer").disabled = false;
		document.getElementById("tr_btn_modify").style.display = "block";
		document.getElementById("inquiryAnswer").style.border = "1px solid #d2d2d2";
		document.getElementById("tr_btn").style.display = "none";

	}

	function modNewInquiryAnswer(obj) {

		obj.action = "${contextPath}/admin/modNewInquiryAnswer.do?inquiryNum=${inquiry.inquiryNum}";
		obj.submit();

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
			<c:choose>
				<c:when test="${AdminisLogOn == true && admin != null}">
					<jsp:include page="/WEB-INF/views/common/admin_topmenu.jsp"
						flush="false" />
				</c:when>
				<c:otherwise>
					<jsp:include page="/WEB-INF/views/common/csMenu.jsp" flush="false" />
				</c:otherwise>
			</c:choose>

			<div>
				<h2 style="font-size: 28px; margin-top: 15px; float: left;">1:1문의</h2>
				<h5
					style="color: #828282; float: left; font-size: 18px; margin-left: 20px; margin-top: 25px;">빠르게
					답변해 드리겠습니다.</h5>
			</div>
			<!-- 타이틀 끝 -->
			<!-- 최근 본 상품 -->

			<!-- 최근 본 상품 끝 -->
			<!-- 내용 -->

			<form name="inquiryAnswer" method="post"
				action="${contextPath}/admin/addNewInquiryAnswer.do?inquiryNum=${inquiry.inquiryNum}">
				<table class="table"
					style="margin-top: 20px; text-align: center; font-size: 14px;">
					<thead class="table-dark" align=center>
						<tr
							style="background-color: #eeeeee; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #c6c8ca; font-size: 15px;">
							<td><a>${inquiry.inquiryTitle}</a></td>
						</tr>


						<c:choose>
							<c:when
								test="${not empty inquiry.inquiryFile && inquiry.inquiryFile != 'null'}">
								<tr
									style="border-bottom: 0.5px solid grey; text-align: left; background-color: white;">
									<td
										style="padding-bottom: 20px; color: black; padding-left: 0px;"><a>${inquiry.inquiryContent}</a><br>
										<br> <input type="hidden" name="OrignInquiryFile"
										value="${inquiry.inquiryFile}" /> <img width="300"
										height="300"
										src="${contextPath}/download.do?inquiryNum=${inquiry.inquiryNum}&inquiryFile=${inquiry.inquiryFile}"
										id="preview" /><br></td>
								</tr>


							</c:when>
							<c:otherwise>
								<tr
									style="border-bottom: 0.5px solid grey; text-align: left; background-color: white;">
									<td style="padding-bottom: 250px; color: black;">${inquiry.inquiryContent}<br>
								</tr>
							</c:otherwise>
						</c:choose>
						<tr
							style="background-color: #eeeeee; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #c6c8ca; font-size: 15px;">
							<td><a>[답변] ${inquiry.inquiryTitle}</a></td>
						</tr>
						<c:choose>
							<c:when
								test="${empty inquiry.inquiryAnswer && inquiry.inquiryAnswer == null}">
								<tr
									style="border-bottom: 0.5px solid grey; text-align: left; background-color: white;">
									<td style="color: black;"><textarea name="inquiryAnswer"
											style="width: 1240px; height: 260px; border: 1px solid #d2d2d2;"></textarea><br>
								</tr>
							</c:when>
							<c:otherwise>
								<tr
									style="border-bottom: 0.5px solid grey; text-align: left; background-color: white;">
									<td style="color: black;"><textarea name="inquiryAnswer"
											id="inquiryAnswer"
											style="width: 1240px; height: 260px; border: none; background: white;"
											disabled>${inquiry.inquiryAnswer}</textarea><br>
								</tr>
							</c:otherwise>
						</c:choose>

					</thead>
				</table>
				<div>
					<c:choose>
						<c:when
							test="${empty inquiry.inquiryAnswer && inquiry.inquiryAnswer == null}">
							<c:if test="${AdminisLogOn == true && admin != null}">
								<button type="submit" class="btn btn-dark" id="buttonmy"
									style="float: left; margin-left: 1100px; font-size: 14px; background-color: #212529; padding-top: 4px;">등록</button>
								<button type="button" class="btn btn-dark" id="buttonmy"
									style="float: left; margin-left: 1190px; margin-top: -30px; font-size: 14px; background-color: #212529; padding-top: 4px;"
									onclick="location.href='${contextPath}/admin/listAllInquiry.do'">목록</button>
							</c:if>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${AdminisLogOn == true && admin != null}">
									<button type="button" class="btn btn-dark" id="tr_btn"
										onclick="modInquiryAnswer()"
										style="float: left; margin-left: 1100px; font-size: 14px; background-color: #212529; padding-top: 4px;">수정</button>
									<button onclick="modNewInquiryAnswer(this.form)" type="button"
										class="btn btn-dark" id="tr_btn_modify"
										style="float: left; margin-left: 1100px; font-size: 14px; background-color: #212529; padding-top: 4px; display: none;">확인</button>
									<button type="button" class="btn btn-dark" id="buttonmy"
										style="float: left; margin-left: 1000px; margin-top: -30px; font-size: 14px; background-color: #212529; padding-top: 4px;"
										onclick="removeInquiryAnswer(this.form)">삭제</button>
									<button type="button" class="btn btn-dark" id="buttonmy"
										style="float: left; margin-left: 1190px; margin-top: -30px; font-size: 14px; background-color: #212529; padding-top: 4px;"
										onclick="location.href='${contextPath}/admin/listAllInquiry.do'">목록</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-dark" id="buttonmy"
										style="float: left; margin-left: 1190px; margin-top: -30px; font-size: 14px; background-color: #212529; padding-top: 4px;"
										onclick="location.href='${contextPath}/board/listInquiry.do'">목록</button>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</div>
			</form>
		</div>
	</section>
	<!-- 내용 끝 -->
</body>
</html>