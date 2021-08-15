<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>

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

#recentlyProduct {
	
}

#buttonmy {
	width: 80px;
	height: 30px;
	float: left;
	border-radius: 2px;
	padding-top: 1.8px;
	font-size: 13px;
}
</style>
<script>
	function removeNotice(obj) {
		if (confirm("삭제하시겠습니까??")) {
			obj.action = "${contextPath}/admin/removeNotice.do?noticeNum=${notice.noticeNum}";
		} else {
			return false;
		}
		obj.submit();
	}
</script>
</head>
<body>
	<!--  타이틀 -->
	<!--  -->
	<section class="ftco-section"
		style="padding-top: 50px; margin-top: 30px; padding-bottom: 130px;">
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
					style="font-size: 20px; margin-top: 15px; float: left; font-weight: bold; color: #7e9c8c;">공지사항</h2>
				<h5
					style="color: #828282; float: left; font-size: 13px; margin-left: 10px; margin-top: 23px;">SIMPLE의
					새로운 소식을 확인해보세요.</h5>
			</div>

			<!-- 타이틀 끝 -->
			<!-- 최근 본 상품 -->

			<!-- 최근 본 상품 끝 -->

			<!-- 내용 -->
			<form name="frmNotice" method="post"
				action="${contextPath}/admin/modNotice.do?noticeNum=${notice.noticeNum}"
				enctype="multipart/form-data">
				<table class="table" style="height: 25px; font-size: 13px;">
					<thead class="table-dark" align=center>
						<tr align="center"
							style="background-color: #fbfbfb; border-top: 1px solid #7e9c8c; border-bottom: 1px solid #eeeeee !important;">
							<td scope="col" colspan="6"><a style="color: black;">${notice.noticeTitle}</a></td>
						</tr>
						<tr
							style="background-color: #fbfbfb; color: black; border-bottom: 1px solid #eeeeee !important;">
							<td scope="col" width="150">작성자</td>
							<td scope="col" width="150"
								style="background-color: white; color: black;"><a>${notice.noticeWriter }</a></td>
							<td scope="col" width="100">작성일</td>
							<td scope="col" width="100"
								style="background-color: white; color: black;"><fmt:formatDate
									value="${notice.noticeDate}" /></td>
							<td scope="col" width="80">조회수</td>
							<td scope="col" width="80"
								style="background-color: white; color: black;">${notice.noticeHit}</td>
						</tr>
						<tr
							style="border-bottom: 1px solid #eeeeee !important; background-color: white; color: black;">
							<td colspan="6" align="center" scope="col" width="500">${notice.noticeContent}<br>
								<c:if
									test="${!empty notice.noticeImg && notice.noticeImg != null}">

									<input type="hidden" name="OrignNoticeImg"
										value="${notice.noticeImg}" />
									<img width="600" height="800"
										src="${contextPath}/download_notice.do?noticeNum=${notice.noticeNum}&noticeImg=${notice.noticeImg}"
										id="preview" />

								</c:if></td>
						</tr>


					</thead>
				</table>
				<c:if test="${AdminisLogOn == true && admin != null}">
					<button type="button" onclick="removeNotice(this.form)"
						id="buttonmy" class="btn btn-dark"
						style="float: right; margin-top: 25px; border-radius: 2px; background-color: white; color: gray; margin-left:4px; border: 1px solid #eeeeee; border-radius: 2px; width: 104px; height: 34px; padding-top: 10px; padding-top: 4px;font-size:13px; ">삭제</button>
					<button type="submit" class="btn btn-dark " id="buttonmy"
						style="float: right; margin-top: 25px; border-radius: 2px; background-color: #5f5f5f; color: white; border: none; border-radius: 2px;width: 104px; height: 34px; padding-top: 10px; padding-top: 4px;font-size:13px;">수정</button>

				</c:if>
				<button type="button"
					onclick="location.href='${contextPath}/board/listNotice.do'"
					id="buttonmy" class="btn btn-dark"
					style="margin-left: 600px; margin-top: 25px; font-size:13px; border-radius: 2px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 104px; height: 34px; padding-top: 10px; padding-top: 4px; float: left;">목록</button>
			</form>

		</div>
		<!-- 내용 끝 -->
	</section>
</body>
</html>