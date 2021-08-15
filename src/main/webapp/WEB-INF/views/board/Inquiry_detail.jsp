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
	function removeInquiry(obj) {
		if (confirm("삭제하시겠습니까??")) {
			obj.action = "${contextPath}/board/removeInquiry.do?inquiryNum=${inquiry.inquiryNum}";
		} else {
			return false;
		}
		obj.submit();
	}
	
	function answer(obj) {
		
	obj.action = "${contextPath}/admin/inquiryAnswerForm.do?inquiryNum=${inquiry.inquiryNum}";
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
#buttonmy {
	width: 80px;
	height: 30px;
	float: left;
	font-size: 13px;
	border-radius: 2px;
	padding-top: 1.8px;
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

			<form name="frmInquiry" method="post"
				action="${contextPath}/board/modInquiry.do?inquiryNum=${inquiry.inquiryNum}"
				enctype="multipart/form-data">
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
									style="border-bottom: 0.5px solid #eeeeee; text-align: left; background-color: white;">
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


					</thead>
				</table>
				<c:choose>
					<c:when test="${AdminisLogOn == true && admin != null}">
						<button type="button" class="btn btn-dark" id="buttonmy"
							style="float: left; margin-left: 600px; margin-top: 25px; border-radius: 2px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 104px; height: 34px; padding-top: 8px; font-size: 13px;"
							onclick="location.href='${contextPath}/admin/listAllInquiry.do'">목
							록</button>
						<button type="button" class="btn btn-dark" id="buttonmy"
							onclick="answer(this.form)"
							style="float: left; padding-bottom: 0px; background-color: #5f5f5f; color: white; margin-top: 25px; border: none; border-radius: 2px; margin-left: 338px; width: 104px; height: 34px; font-size: 13px;">답 변</button>
						<button type="button" class="btn btn-dark" id="buttonmy"
							style="float: left; padding-bottom: 0px; background-color: white; color: gray; margin-top: 25px; border: 1px solid #eeeeee; border-radius: 2px; margin-left: 20px; width: 104px; height: 34px; font-size: 13px;"
							onclick="removeInquiry(this.form)">삭제</button>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${!empty search1}">
								<button type="button" class="btn btn-dark" id="buttonmy"
									style="float: left; margin-left: 600px; margin-top: 25px; border-radius: 2px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 104px; height: 34px; padding-top: 8px; font-size: 13px;"
									onclick="location.href='${contextPath}/board/inquirySearch.do?search1=${search1}&search2=${search2}&page=${pageNum}'">목
									록</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-dark" id="buttonmy"
									style="float: left; margin-left: 600px; margin-top: 25px; border-radius: 2px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 104px; height: 34px; padding-top: 8px; font-size: 13px;"
									onclick="location.href='${contextPath}/board/listInquiry.do'">목
									록</button>
							</c:otherwise>
						</c:choose>
						<button type="submit" class="btn btn-dark" id="buttonmy"
							style="float: left; padding-bottom: 0px; background-color: #5f5f5f; color: white; margin-top: 25px; border: none; border-radius: 2px; margin-left: 338px; width: 104px; height: 34px; font-size: 13px;">수
							정</button>
						<button type="button" class="btn btn-dark" id="buttonmy"
							style="float: left; padding-bottom: 0px; background-color: white; color: gray; margin-top: 25px; border: 1px solid #eeeeee; border-radius: 2px; margin-left: 20px; width: 104px; height: 34px; font-size: 13px;"
							onclick="removeInquiry(this.form)">삭 제</button>
					</c:otherwise>
				</c:choose>

			</form>
		</div>
	</section>
	<!-- 내용 끝 -->
</body>
</html>