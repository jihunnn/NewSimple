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
			<c:if test="${AdminisLogOn == true && admin != null}">
				<jsp:include page="/WEB-INF/views/common/admin_topmenu.jsp"
					flush="false" />
			</c:if>
			<jsp:include page="/WEB-INF/views/common/csMenu.jsp" flush="false" />
			<div>
				<h2 style="font-size: 25px; margin-top: 15px; float: left;">공지사항</h2>
				<h5
					style="color: #828282; float: left; font-size: 15px; margin-left: 20px; margin-top: 25px;">SIMPLE의
					새로운 소식을 확인해보세요.</h5>
			</div>
			<!-- 타이틀 끝 -->
			<!-- 최근 본 상품 -->
			<div id="recentlyProduct"
				style="position: absolute; width: 120px; height: 310px; margin-left: 1370px; border: 1px solid #d2d2d2; margin-top: -100px;">
				<ul
					style="list-style: none; margin-top: 10px; padding-left: 20px; margin-bottom: 10px;">
					<li><a href="#"
						style="padding-left: -10px; padding-bottom: 1px; color: black;">최근본상품</a></li>
				</ul>
				<hr style="margin-top: 0px; margin-bottom: 0px; color: #d2d2d2;">
				<ul style="list-style: none; padding-top: 5px;">
					<li><a href="#"><img
							src="${contextPath}/resources/images/image_1.jpg"
							style="width: 100px; height: 100px; padding-top: 10px; margin-left: -30px;"></a></li>
					<li><a href="#"><img
							src="${contextPath}/resources/images/image_2.jpg"
							style="width: 100px; height: 100px; padding-top: 10px; padding-top: 10px; margin-left: -30px;"></a></li>
				</ul>
				<hr style="margin-top: 0px; margin-bottom: 0px; color: #d2d2d2;">
				<ul
					style="list-style: none; padding-left: 30px; margin-bottom: 10px; margin-top: 8px;">
					<li><a href="#"
						style="color: black; text-align: center; margin-top: 8px; padding-top: 30px;">더보기▼</a></li>
				</ul>
			</div>
			<!-- 최근 본 상품 끝 -->

			<!-- 내용 -->
			<form name="frmNotice" method="post"
				action="${contextPath}/admin/modNotice.do?noticeNum=${notice.noticeNum}"
				enctype="multipart/form-data">
				<table class="table" style="height: 25px; font-size: 13px;">
					<thead class="table-dark" align=center>
						<tr align="center"
							style="background-color: #eeeeee; border-top: 1px solid #7e9c8c; border-bottom: 1px solid #c6c8ca !important;">
							<td scope="col" colspan="6"><a style="color: black;">${notice.noticeTitle}</a></td>
						</tr>
						<tr
							style="background-color: #eeeeee; color: black; border-bottom: 1px solid #c6c8ca !important;">
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
							style="border-bottom: 1px solid #c6c8ca !important; background-color: white; color: black;">
							<td colspan="6" align="left" scope="col" width="500" height="500"><a
								href="#" style="color: black; padding-left: 30px;">${notice.noticeContent }</a><br>
								<c:if
									test="${!empty notice.noticeImg && notice.noticeImg != null}">

									<input type="hidden" name="OrignNoticeImg"
										value="${notice.noticeImg}" />
									<img width="300" height="300"
										src="${contextPath}/download_notice.do?noticeNum=${notice.noticeNum}&noticeImg=${notice.noticeImg}"
										id="preview" />

								</c:if></td>
						</tr>


					</thead>
				</table>
				<c:if test="${AdminisLogOn == true && admin != null}">
					<button type="submit" class="btn btn-dark " id="buttonmy"
						style="float: right; margin-top: 30px; border-radius: 2px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 120px; height: 40px; padding-top: 10px; padding-top: 4px; float: left;">수정</button>
					<button type="button"
						onclick="removeNotice(this.form)"
						id="buttonmy" class="btn btn-dark"
						style="float: right; margin-top: 30px; border-radius: 2px; background-color: white; color: gray; border: 1px solid #7e9c8c; border-radius: 2px; width: 120px; height: 40px; padding-top: 10px; padding-top: 4px; float: left;">삭제</button>
				</c:if>
				<button type="button"
					onclick="location.href='${contextPath}/board/listNotice.do'"
					id="buttonmy" class="btn btn-dark"
					style="margin-left: 600px; margin-top: 30px; border-radius: 2px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 120px; height: 40px; padding-top: 10px; padding-top: 4px; float: left;">목록</button>
			</form>

		</div>
		<!-- 내용 끝 -->
	</section>
</body>
</html>