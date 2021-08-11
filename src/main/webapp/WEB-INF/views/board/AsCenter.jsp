<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:if test="${!empty asCenterSearchMap.search}">
	<c:set var="asCenterSearchList"
		value="${asCenterSearchMap.asCenterSearchList}" />
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
<script>
    function asCenterForm() {
        if (${isLogOn != true && member == null}) {
            alert("로그인이 필요합니다.");
            location.href = '${contextPath}/login_01.do';
        } else {
        	location.href='${contextPath}/board/asCenterWrite.do'
        }
    }0
    
	function asCenter() {
		var form = document.asCenterSearch;

		if (form.search.value == "") {
			alert("검색 단어를 입력해주세요")
			form.search.focus();
			return false;
		}


		form.submit();

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
		style="padding-top: 70px; margin-bottom: 80px; padding-bottom: 0px; margin-top: 30px;">
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
				<h2 style="font-size: 25px; margin-top: 15px; float: left;">A/S센터</h2>
				<h5
					style="color: #828282; float: left; font-size: 15px; margin-left: 20px; margin-top: 25px;">빠르게
					접수 도와드리겠습니다.</h5>
			</div>
			<!-- 타이틀 끝 -->

			<!-- 최근 본 상품 -->

			<!-- 최근 본 상품 -->

			<!-- 내용 -->
			<form name="asCenterSearch"
				action="${contextPath}/board/asCenterSearch.do" method="post">
				<div>

					<button type="button" onclick="asCenter()" id="buttonmy"
						class="btn btn-dark"
						style="margin-top: 21px; float: right; padding-top: 4px; height: 34px; font-size: 14px; padding-top: 4px; background-color: #7e9c8c; border: none;">검색</button>
					<input type="text"
						style="margin-top: 21px; float: right; height: 34px; border: 1px solid #dcdcdc; font-size: 14px; margin-right: 5px;"
						name="search"> <select name="searchType"
						style="font-size: 14px; margin-right: 5px; float: right; width: 80px; height: 34px; border: 1px solid #dcdcdc; margin-top: 21px;">
						<option value="asCenterTitle">제목</option>
						<option value="memName">작성자</option>
						<option value="asCenterContent">내용</option>
					</select>
				</div>
			</form>
			<table class="table"
				style="margin-top: 20px; text-align: center; font-size: 14px;">
				<thead class="table-dark" align=center>
					<tr
						style="background-color: #eeeeee; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #c6c8ca; font-size: 15px;">
						<td style="width: 100px;">번호</td>
						<td style="width: 500px;">제목</td>
						<td style="width: 200px;">작성자</td>
						<td style="width: 200px;">작성일</td>
						<td style="width: 200px;">접수상태</td>
					</tr>
					<c:choose>
						<c:when test="${!empty asCenterSearchMap.search}">

							<c:choose>
								<c:when test="${empty asCenterSearchMap.asCenterSearchList}">
									<tr style="background-color: white;">
										<td colspan="5" style="color: black; height: 300px;">검색된
											글이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:set var="num"
										value="${pageMaker.totalCount - ((pageNum-1) * 10) }" />
									<c:forEach var="asCenterSearch" items="${asCenterSearchList}">
										<tr
											style="border-bottom: 1px solid #c6c8ca; height: 30px; background-color: white;">
											<td style="width: 100px; color: black;">${num}</td>
											<td
												style="width: 500px; color: black; text-align: left; padding-left: 50px;"><a
												style="color: black;"
												href="${contextPath}/board/pwdConfirm.do?asCenterNum=${asCenterSearch.asCenterNum}&page=${pageNum}">${asCenterSearch.asCenterTitle}</a></td>
											<td style="width: 200px; color: black;">${asCenterSearch.memName}</td>
											<td style="width: 200px; color: black;"><fmt:formatDate
													value="${asCenterSearch.asCenterDate}" /></td>
											<td style="width: 200px; color: black;">${asCenterSearch.asCenterStatus}</td>
										</tr>
										<c:set var="num" value="${num-1}"></c:set>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:when test="${empty asCenterSearchMap.search}">
							<c:choose>
								<c:when test="${empty asCenterList}">
									<tr style="background-color: white;">
										<td colspan="5" style="color: black; height: 300px;">등록된
											글이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:set var="num"
										value="${pageMaker.totalCount - ((pageNum-1) * 10) }" />
									<c:forEach var="asCenter" items="${asCenterList}">
										<tr
											style="border-bottom: 1px solid #c6c8ca; height: 30px; background-color: white;">
											<td style="width: 100px; color: black;">${num}</td>
											<td
												style="width: 500px; color: black; text-align: left; padding-left: 50px;"><a
												style="color: black;"
												href="${contextPath}/board/pwdConfirm.do?asCenterNum=${asCenter.asCenterNum}&page=${pageNum}">${asCenter.asCenterTitle}</a></td>
											<td style="width: 200px; color: black;">${asCenter.memName}</td>
											<td style="width: 200px; color: black;"><fmt:formatDate
													value="${asCenter.asCenterDate}" /></td>
											<td style="width: 200px; color: black;">${asCenter.asCenterStatus}</td>

										</tr>
										<c:set var="num" value="${num-1}"></c:set>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</c:when>
					</c:choose>

				</thead>
			</table>
			<a id="buttonmy" class="btn btn-dark" onClick="asCenterForm()"
				style="float: right; margin-top: 25px; border-radius: 2px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 120px; height: 40px; padding-top: 10px; font-size: 14px;">글쓰기</a>
			<!-- 페이징 글번호 -->
			<div class="page_wrap" style="margin-left: 80px; margin-top: 50px;">
				<div class="page_nation">

					<c:if test="${pageMaker.prev}">

						<a class="arrow prev"
							style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
							href='<c:url value="/board/listAsCenter.do?page=${pageMaker.startPage-1 }"/>'><i
							class="fa fa-chevron-left"></i></a>

					</c:if>
					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="pageNum">

						<a
							style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
							href='<c:url value="/board/listAsCenter.do?page=${pageNum}"/>'><i
							class="fa">${pageNum}</i></a>

					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

						<a class="arrow next"
							style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
							href='<c:url value="/board/listAsCenter.do?page=${pageMaker.endPage+1 }"/>'><i
							class="fa fa-chevron-right"></i></a>

					</c:if>

				</div>
			</div>
		</div>
	</section>
	<!-- 내용 끝 -->

</body>
</html>