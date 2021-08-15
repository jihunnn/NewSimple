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
#buttonmy {
	width: 80px;
	height: 30px;
	float: left;
	border-radius: 2px;
	padding-top: 1.8px;
	font-size: 13px;
}
</style>
</head>
<body>
	<!-- 타이틀 -->
	<section class="ftco-section"
		style="padding-top: 50px; margin-bottom: 50px; margin-top: 50px;">
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
				<h2
					style="font-size: 20px; margin-top: 15px; float: left; font-weight: bold; color: #7e9c8c;">1:1문의</h2>
				<h5
					style="color: #828282; float: left; font-size: 13px; margin-left: 10px; margin-top: 23px;">빠르게
					답변해 드리겠습니다.</h5>
			</div>
			<!-- 타이틀 끝 -->
			<!-- 최근 본 상품 -->

			<!-- 최근 본 상품 끝 -->
			<!-- 내용 -->

			<form name="inquiryAnswer" method="post"
				action="${contextPath}/admin/addNewInquiryAnswer.do?inquiryNum=${inquiry.inquiryNum}">
				<table class="table"
					style="margin-top: 20px; text-align: center; font-size: 13px;">
					<thead class="table-dark" align=center>
						<tr
							style="background-color: #fbfbfb; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #eeeeee;">
							<td><a>${inquiry.inquiryTitle}</a></td>
						</tr>


						<c:choose>
							<c:when
								test="${not empty inquiry.inquiryFile && inquiry.inquiryFile != 'null'}">
								<tr
									style="border-bottom: 0.5px solid #7e9c8c; text-align: left; background-color: white;">
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
									style="border-bottom: 0.5px solid #eeeeee; text-align: left; background-color: white;">
									<td style="padding-bottom: 250px; color: black;">${inquiry.inquiryContent}<br>
								</tr>
							</c:otherwise>
						</c:choose>
						<tr
							style="background-color: #fbfbfb; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #eeeeee;">
							<td><a>[답변] ${inquiry.inquiryTitle}</a></td>
						</tr>
						<c:choose>
							<c:when
								test="${empty inquiry.inquiryAnswer && inquiry.inquiryAnswer == null}">
								<tr
									style="border-bottom: 0.5px solid grey; text-align: left; background-color: white;">
									<td style="color: black;"><textarea name="inquiryAnswer"
											style="width: 1240px; height: 150px; border: 1px solid #d2d2d2;"></textarea><br>
								</tr>
							</c:when>
							<c:otherwise>
								<tr
									style="border-bottom: 0.5px solid #eeeeee; text-align: left; background-color: white;">
									<td style="color: black;"><textarea name="inquiryAnswer"
											id="inquiryAnswer"
											style="width: 1240px; height: 150px; border: none; background: white;"
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
								<button type="button" class="btn btn-dark" id="buttonmy"
									style="float: right; padding-bottom: 0px; background-color: white; color: gray; margin-top: 25px; border: 1px solid #eeeeee; border-radius: 2px;  width: 104px; height: 34px; font-size: 13px; margin-right:500px;"
									onclick="location.href='${contextPath}/admin/listAllInquiry.do'">목록</button>
								<button type="submit" class="btn btn-dark" id="buttonmy"
									style="float: right; padding-bottom: 0px; background-color: #5f5f5f; color: white; margin-top: 25px; border: none; border-radius: 2px; width: 104px; height: 34px; font-size: 13px; margin-right: 20px;">등록</button>

							</c:if>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${AdminisLogOn == true && admin != null}">
									<button type="button" class="btn btn-dark" id="buttonmy"
										style="float: left; margin-left: 600px; margin-top: 25px; border-radius: 2px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 104px; height: 34px; padding-top: 8px; font-size: 13px;"
										onclick="location.href='${contextPath}/admin/listAllInquiry.do'">목록</button>
									<button type="button" class="btn btn-dark" id="tr_btn"
										onclick="modInquiryAnswer()"
										style="float: left; padding-bottom: 0px; background-color: #5f5f5f; color: white; margin-top: 25px; border: none; border-radius: 2px; margin-left: 338px; width: 104px; height: 34px; font-size: 13px;">수정</button>
									<button onclick="modNewInquiryAnswer(this.form)" type="button"
										class="btn btn-dark" id="tr_btn_modify"
										style="float: left; padding-bottom: 0px; background-color: #5f5f5f; color: white; margin-top: 25px; border: none; border-radius: 2px; margin-left: 338px; width: 104px; height: 34px; font-size: 13px; display: none;">확인</button>
									<button type="button" class="btn btn-dark" id="buttonmy"
										style="float: left; padding-bottom: 0px; background-color: white; color: gray; margin-top: 25px; border: 1px solid #eeeeee; border-radius: 2px; margin-left: 20px; width: 104px; height: 34px; font-size: 13px;"
										onclick="removeInquiryAnswer(this.form)">삭제</button>

								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-dark" id="buttonmy"
										style="float: left; margin-left: 1167px; padding-bottom: 0px; background-color: #7e9c8c; color: white; margin-top: 25px; width: 104px; height: 34px; border: none; border-radius: 2px; font-size: 13px;"
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