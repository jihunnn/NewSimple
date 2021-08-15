<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<script>
	function removeAsCenter(obj) {
		if (confirm("삭제하시겠습니까??")) {
			obj.action = "${contextPath}/board/removeAsCenter.do?asCenterNum=${asCenter.asCenterNum}";
		} else {
			return false;
		}
		obj.submit();
	}
	
	function registerConfirm(obj) {
		var asCenterStatus = document.getElementById("asCenterStatus").value;
		if (confirm("접수완료 하시겠습니까??")) {
			if(asCenterStatus == '접수대기'){
			obj.action = "${contextPath}/admin/asCenterConfirm.do?asCenterNum=${asCenter.asCenterNum}";}
			else {
				alert("이미 접수등록 하였습니다. 다시한번 확인해주세요.");
			}
		} else {
			return false;
		}
		obj.submit();
	}
	

</script>
<style>
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
		style="padding-top: 100px; margin-bottom: 50px; padding-bottom: 0px; margin-bottom: 400px; ">
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
					style="font-size: 20px; margin-top: 15px; float: left; font-weight: bold; color: #7e9c8c;">A/S센터</h2>
				<h5
					style="color: #828282; float: left; font-size: 13px; margin-left: 10px; margin-top: 23px;">빠르게
					접수 도와드리겠습니다.</h5>
			</div>
			<!-- 타이틀 끝 -->
			<!-- 최근 본 상품 -->

			<!-- 최근 본 상품 끝 -->

			<!-- 내용 -->
			<form name="frmAsCenter" method="post"
				action="${contextPath}/board/modAsCenter.do?asCenterNum=${asCenter.asCenterNum}"
				enctype="multipart/form-data">
				<input type="hidden" name="asCenterStatus" id="asCenterStatus"
					value="${asCenter.asCenterStatus}" />
				<table class="table" style="font-size: 13px; height: 25px;">
					<thead class="table-dark" align=center>
						<tr align="center" style="background-color: #212529;">
							<td scope="col" colspan="6"
								style="background-color: #fbfbfb; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #eeeeee; ">${asCenter.asCenterTitle}</td>
						</tr>
						<tr>
							<td scope="col" width="150"
								style="background-color: #fbfbfb; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #eeeeee; ">작성자</td>
							<td scope="col" width="150"
								style="background-color: white; border-bottom: 1px solid #eeeeee; color: black;"><a>${asCenter.memName}</a></td>
							<td scope="col" width="100"
								style="background-color: #fbfbfb; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #eeeeee;">작성일</td>
							<td scope="col" width="100"
								style="background-color: white; color: black; border-bottom: 1px solid #eeeeee;"><fmt:formatDate
									value="${asCenter.asCenterDate}" /></td>
						</tr>
						<c:choose>
							<c:when
								test="${not empty asCenter.asCenterFile && asCenter.asCenterFile != 'null'}">
								<tr
									style="border-bottom: 1px solid #eeeeee !important; background-color: white; color: black;">

									<td colspan="6" align="left" scope="col" width="500"
										><a href="#" style="color: black;">${asCenter.asCenterContent}</a><br>
										<input type="hidden" name="OrignAsCenterFile"
										value="${asCenter.asCenterFile}" /> <img width="300"
										height="300"
										src="${contextPath}/download_asCenter.do?asCenterNum=${asCenter.asCenterNum}&asCenterFile=${asCenter.asCenterFile}"
										id="preview" /></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr
									style="border-bottom: 1px solid #eeeeee !important; background-color: white; color: black;">

									<td colspan="6" align="left" scope="col" width="500"
										><a href="#"
										style="color: black; padding-left: 30px;">${asCenter.asCenterContent}</a></td>
								</tr>
							</c:otherwise>
						</c:choose>
					</thead>
				</table>
				<c:choose>
					<c:when test="${AdminisLogOn == true && admin != null}">
						<button type="button"
							onClick="location.href='${contextPath}/board/listAsCenter.do'"
							id="bottonmy" class="btn btn-dark"
							style="float: left; margin-left: 600px; margin-top: 25px; border-radius: 2px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px;  width: 104px; height: 34px; padding-top: 6px;font-size: 13px;">목 록</button>
					</c:when>
					<c:otherwise>
						<button type="button"
							onClick="location.href='${contextPath}/board/listAsCenter.do?page=${pageNum}'"
							id="bottonmy" class="btn btn-dark"
							style="float: left; margin-left: 600px; margin-top: 25px; border-radius: 2px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px;  width: 104px; height: 34px; padding-top: 6px;font-size: 13px;">목 록</button>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${AdminisLogOn == true && admin != null}">
						<button type="button" id="bottonmy" class="btn btn-dark"
							onclick="registerConfirm(this.form)"
							style="float: left; margin-top: 25px; width: 75px; background-color: #5f5f5f; color: white; border: 1px solid white; border-radius: 2px; margin-left: 334px;  width: 104px; height: 34px; font-size: 13px;">접수확인</button>
					</c:when>
					<c:otherwise>
						<button type="submit" id="bottonmy" class="btn btn-dark"
							style="float: left; margin-top: 25px; width: 75px; background-color: #5f5f5f; color: white; border: none; border-radius: 2px; margin-left: 334px;  width: 104px; height: 34px; font-size: 13px;">수 정</button>
					</c:otherwise>
				</c:choose>
				<button type="button" id="bottonmy" class="btn btn-dark"
					onclick="removeAsCenter(this.form)"
					style="float: left; margin-top: 25px; width: 75px; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; margin-left: 20px; width: 104px; height: 34px; font-size: 13px;">삭 제</button>
			</form>
		</div>
	</section>
	<!-- 내용 끝 -->
</body>
</html>