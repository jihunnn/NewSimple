<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<%
request.setCharacterEncoding("utf-8");
%>
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
</style>


</head>
<body>
	<!-- 타이틀 -->
	<section class="ftco-section"
		style="padding-top: 70px; margin-top: 30px;">
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
				<h2 style="font-size: 25px; margin-top: 15px; float: left;">공지사항</h2>
				<h5
					style="color: #828282; float: left; font-size: 15px; margin-left: 20px; margin-top: 25px;">SIMPLE의
					새로운 소식을 확인해보세요.</h5>
			</div>

			<!-- 타이틀 끝 -->

			<!-- 최근 본 상품 -->
			
			<!-- 최근 본 상품 끝 -->

			<!-- 내용 -->

			<table class="table" style="height: 25px; font-size: 14px;">
				<thead class="table-dark" align=center>
					<tr align="center"
						style="background-color: #eeeeee; border-top: 1px solid #7e9c8c; border-bottom: 1px solid #c6c8ca; font-size: 15px;">
						<td scope="col" width="100"><p
								style="color: black; margin-bottom: 0px;">번호</p></td>
						<td scope="col" width="500"><p
								style="color: black; margin-bottom: 0px;">내용</p></td>
						<td scope="col" width="150"><p
								style="color: black; margin-bottom: 0px;">작성자</p></td>
						<td scope="col" width="150"><p
								style="color: black; margin-bottom: 0px;">작성일</p></td>
						<td scope="col" width="80"><p
								style="color: black; margin-bottom: 0px;">조회수</p></td>
					</tr>
					<c:choose>
						<c:when test="${empty noticeList}">
							<tr height="200">
								<td colspan="5"
									style="background-color: white; padding-top: 100px;">
									<p align="center">
										<b><span style="color: black;">등록된 글이 없습니다.</sapn></b>
									</p>
								</td>
							</tr>
						</c:when>
						<c:when test="${!empty noticeList}">
							<c:forEach var="notice" items="${noticeList}">
								<tr
									style="border-bottom: 1px solid #c6c8ca; background-color: white; color: black;">
									<td scope="col" width="50">${notice.noticeNum}</td>
									<td align="left" scope="col" width="500"><a
										href="${contextPath}/board/viewNotice.do?noticeNum=${notice.noticeNum}"
										style="color: black; padding-left: 30px;">${notice.noticeTitle}</a></td>
									<td scope="col" width="150">${notice.noticeWriter }</td>
									<td scope="col" width="150"><fmt:formatDate
											value="${notice.noticeDate}" /></td>
									<td scope="col" width="80">${notice.noticeHit}</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>

				</thead>
			</table>
			<c:if test="${AdminisLogOn== true &&admin !=null}">
				<a id="buttonmy" class="btn btn-dark"
					onClick="location.href='${contextPath}/admin/noticeForm.do'"
					style="float: right; margin-top: 25px; border-radius: 2px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 120px; height: 40px; padding-top: 10px; font-size: 14px;">글쓰기</a>
			</c:if>
		</div>

		<!-- 내용 끝 -->

		<!-- 페이징 글번호 -->
		<div class="page_wrap" style="margin-left: 80px; margin-top: 50px;">
			<div class="page_nation">

				<c:if test="${pageMaker.prev}">

					<a class="arrow prev"
						style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
						href='<c:url value="/board/listNotice.do?page=${pageMaker.startPage-1 }"/>'><i
						class="fa fa-chevron-left"></i></a>

				</c:if>
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="pageNum">

					<a
						style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
						href='<c:url value="/board/listNotice.do?page=${pageNum }"/>'><i
						class="fa">${pageNum }</i></a>

				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

					<a class="arrow next"
						style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
						href='<c:url value="/board/listNotice.do?page=${pageMaker.endPage+1 }"/>'><i
						class="fa fa-chevron-right"></i></a>

				</c:if>

			</div>
		</div>

	</section>
</body>
</html>