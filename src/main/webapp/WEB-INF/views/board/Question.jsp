<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:if test="${questionSearchMap !=null}">
	<c:set var="questionList"
		value="${questionSearchMap.questionSearchList}" />
</c:if>
<!DOCTYPE html>
<html lang="en">

<head>
<script>
$(document).on('click', '#btnSearch', function(object) {

	object.preventDefault();
	var url = "${contextPath}/board/questionSearch.do";
	url = url + "?search=" + $('#search').val();
	location.href = url;

});

	
    function InquiryList() {
        if (${isLogOn != true && member == null}) {
        	if(${AdminisLogOn == true && admin != null}) {
            	
            	location.href='${contextPath}/admin/listAllInquiry.do';
            } else{
            alert("로그인이 필요합니다.");
            location.href = '${contextPath}/login_01.do';}
        }   else {
        	location.href='${contextPath}/board/listInquiry.do';
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

#recentlyProduct {
	
}

<
style
>
@import url(https://fonts.googleapis.com/css?family=Raleway:400,500,800)
	;

.snip1226 {
	font-family: 'Raleway', Arial, sans-serif;
	text-align: center;
	text-transform: uppercase;
	font-weight: 500;
}

.snip1226 * {
	box-sizing: border-box;
	-webkit-transition: all 0.35s ease;
	transition: all 0.35s ease;
}

.snip1226 li {
	display: inline-block;
	list-style: outside none none;
	margin: 0 1.5em;
	overflow: hidden;
}

.snip1226 a {
	padding: 0.3em 0;
	color: red;
	position: relative;
	display: inline-block;
	letter-spacing: 1px;
	margin: 0;
	text-decoration: none;
}

.snip1226 a:before, .snip1226 a:after {
	position: absolute;
	-webkit-transition: all 0.35s ease;
	transition: all 0.35s ease;
}

.snip1226 a:before {
	bottom: 100%;
	display: block;
	height: 2px;
	width: 100%;
	content: "";
	background-color: #ffcdcd;
}

.snip1226 a:after {
	padding: 0.3em 0;
	position: absolute;
	bottom: 100%;
	left: 0;
	content: attr(data-hover);
	color: black;
	white-space: nowrap;
}

.snip1226 li:hover a, .snip1226 .current a {
	transform: translateY(100%);
}
</style>



</head>
<body>
	<!-- 타이틀 -->
	<!--  -->
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
				<h2 style="font-size: 25px; margin-top: 15px; float: left;">자주묻는질문</h2>
				<h5
					style="color: #828282; float: left; font-size: 15px; margin-left: 20px; margin-top: 25px;">고객님들께서
					자주 묻는 질문을 모았습니다.</h5>
			</div>

			<!-- 타이틀 끝 -->


			<!-- 내용 -->
			<button type="button" class="btn btn-dark" id="btnSearch"
				style="margin-top: 21px; float: right; padding-top: 4px; height: 34px; font-size: 14px; padding-top: 4px; background-color: #7e9c8c; border: none; border-radius: 2px;">검색</button>
			<input type="text" class="form-control" class="btn btn-dark"
				style="margin-top: 21px; float: right; height: 34px; border: 1px solid #dcdcdc; font-size: 14px; margin-right: 5px; width: 159px;"
				name="search" id="search">





			<div>

				<table class="table"
					style="margin-bottom: 50px; width: 1275px; height: 25px; font-size: 14px;">
					<thead class="table-dark" align=center>
						<tr align="center"
							style="background-color: #eeeeee; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #c6c8ca; font-size: 15px;">
							<td scope="col" width="100">번호</td>
							<td scope="col" width="500">내용</td>

						</tr>
						<c:set var="num"
							value="${pageMaker.totalCount - ((pageNum-1) * 10) }" />
						<c:forEach var="question" items="${questionList}"
							varStatus="questionNum">
							<tr
								style="border-bottom: 1px solid #c6c8ca !important; background-color: white; color: black;">

								<td scope="col" width="50" style="padding-top: 12px;">${num}</td>
								<td align="left" scope="col" width="500"
									style="padding-top: 15px; padding-bottom: 0px;">
									<div>
										<div id="section1b" class="label">
											<p
												style="color: black; text-align: left; cursor: pointer; font-weight: normal;">
												<span style="color: red">Q</span>. ${question.questionTitle }
											</p>
										</div>
										<div id="section1b" class="elements">
											<hr style="margin-bottom: 20px; margin-top: 0px;">
											<p style="color: black; text-align: left; cursor: pointer;">
												<span style="color: green;">A</span>.
												${question.questionContent }
												<c:if test="${AdminisLogOn== true &&admin !=null}">
													<button type="button"
														onclick="javascript:location.href='${contextPath}/admin/removeQuestion.do?questionNum=${question.questionNum}'"
														style="float: right; border-radius: 2px; margin-bottom: 3px; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; height: 30px; font-size: 14px;"
														class="btn-secondary btn-xs">삭제</button>
													<a
														onclick="location.href='${contextPath}/admin/modQuestion.do?questionNum=${question.questionNum}'"
														style="float: right; border-radius: 2px; margin-bottom: 3px; text-align: center; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; height: 30px; font-size: 14px;"
														class="btn-secondary btn-xs">수정</a>
												</c:if>
											</p>

										</div>
									</div>
								</td>
							</tr>
							<c:set var="num" value="${num-1}"></c:set>
						</c:forEach>
					</thead>
				</table>
				<!-- -아코디언메뉴 -->
				<script type="text/javascript">
				var elements = document.getElementsByTagName("div");

				// 모든 영역 접기
				for (var i = 0; i < elements.length; i++) {
					if (elements[i].className == "elements") {
						elements[i].style.display = "none";
					} else if (elements[i].className == "label") {
						elements[i].onclick = switchDisplay;
					}
				}

				// 상태에 따라 접거나 펼치기
				function switchDisplay() {

					var parent = this.parentNode;
					var target = parent.getElementsByTagName("div")[1];

					if (target.style.display == "none") {
						target.style.display = "block";
					} else {
						target.style.display = "none";
					}
					return false;
				}
			</script>
				<c:if test="${AdminisLogOn== true &&admin !=null}">
					<a id="buttonmy" class="btn btn-dark"
						onClick="location.href='${contextPath}/admin/questionForm.do'"
						style="float: right; margin-top: 25px; border-radius: 2px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 120px; height: 40px; padding-top: 10px; font-size: 14px;">글쓰기</a>
				</c:if>
			</div>
			<!-- 내용 끝 -->
			<!-- 페이징 글번호 -->
			<c:choose>
				<c:when test="${questionSearchMap ==null}">
					<div class="page_wrap" style="margin-left: 80px; margin-top: 60px;">
						<div class="page_nation">

							<c:if test="${pageMaker.prev}">

								<a class="arrow prev"
									style="border: none; color: black; margin-right: 0px; margin-left: 0px;"
									href='<c:url value="/board/listQuestion?page=${pageMaker.startPage-1 }"/>'><i
									class="fa fa-chevron-left"></i></a>

							</c:if>
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="pageNum">

								<a
									style="border: none; color: black; margin-right: 0px; margin-left: 0px;"
									href='<c:url value="/board/listQuestion.do?page=${pageNum }"/>'><i
									class="fa">${pageNum }</i></a>

							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

								<a class="arrow next"
									style="border: none; color: black; margin-right: 0px; margin-left: 0px;"
									href='<c:url value="/board/listQuestion?page=${pageMaker.endPage+1 }"/>'><i
									class="fa fa-chevron-right"></i></a>

							</c:if>

						</div>
					</div>
				</c:when>
				<c:when test="${questionSearchMap !=null}">
					<div class="page_wrap" style="margin-left: 80px; margin-top: 50px;">
						<div class="page_nation">

							<c:if test="${pageMaker.prev}">

								<a class="arrow prev"
									href='<c:url value="/board/questionSearch.do?search=${questionSearchMap.search}&page=${pageMaker.startPage-1 }"/>'><i
									class="fa fa-chevron-left"></i></a>

							</c:if>
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="pageNum">

								<a
									href='<c:url value="/board/questionSearch.do?search=${questionSearchMap.search}&page=${pageNum }"/>'><i
									class="fa">${pageNum }</i></a>

							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

								<a class="arrow next"
									href='<c:url value="/board/questionSearch.do?search=${questionSearchMap.search}&page=${pageMaker.endPage+1 }"/>'><i
									class="fa fa-chevron-right"></i></a>

							</c:if>

						</div>
					</div>
				</c:when>
			</c:choose>
		</div>
	</section>
</body>
</html>

