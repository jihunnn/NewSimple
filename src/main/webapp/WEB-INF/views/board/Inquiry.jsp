<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:choose>

	<c:when test="${!empty inquirySearchMap.search1}">
		<c:set var="inquirySearch"
			value="${inquirySearchMap.inquirySearchList}" />
	</c:when>
	<c:when test="${empty inquirySearchMap.search1}">
		<c:set var="inquiryList" value="${inquiryMap.inquiryList}" />
	</c:when>

</c:choose>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 날짜위젯 -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 조회기간 선택 자바스크립트 -->
<script>
	$(function() {
		//input을 datepicker로 선언
		$("#datepicker1, #datepicker2")
				.datepicker(
						{
							dateFormat : 'yy-mm-dd' //달력 날짜 형태
							,
							showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
							,
							showMonthAfterYear : true // 월- 년 순서가아닌 년도 - 월 순서
							,
							changeYear : true //option값 년 선택 가능
							,
							changeMonth : true //option값  월 선택 가능                
							,
							showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
							,
							buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
							,
							buttonImageOnly : true //버튼 이미지만 깔끔하게 보이게함
							,
							buttonText : "선택" //버튼 호버 텍스트              
							,
							yearSuffix : "년" //달력의 년도 부분 뒤 텍스트
							,
							monthNamesShort : [ '1월', '2월', '3월', '4월', '5월',
									'6월', '7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 텍스트
							,
							monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
									'7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip
							,
							dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 텍스트
							,
							dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일',
									'금요일', '토요일' ] //달력의 요일 Tooltip
							,
							minDate : "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
							,
							maxDate : "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
						});

		//초기값을 오늘 날짜로 설정해줘야 합니다.
		$('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
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
    
	function inquiry() {
		var form = document.inquirySearch;

		if (form.search1.value == "") {
			alert("시작날짜를 설정 해주세요")
			form.search1.focus();
			return false;
		}

		if (form.search2.value == "") {
			alert("마지막날짜를 설정 해주세요")
			document.form.search2.focus();
			return false;
		}

		form.submit();

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
		style="padding-top: 50px; margin-top: 50px;">
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
				<h2 style="font-size: 25px; margin-top: 15px; float: left;">1:1문의</h2>
				<h5
					style="color: #828282; float: left; font-size: 15px; margin-left: 20px; margin-top: 25px;">빠르게
					답변해 드리겠습니다.</h5>
			</div>
			<!-- 타이틀 끝 -->

			<!-- 최근 본 상품 -->

			<!-- 최근 본 상품 끝 -->
			<!-- 내용 -->
			<form name="inquirySearch"
				action="${contextPath}/board/inquirySearch.do" method="post">
				<div style="display: inline !important;">
					<p
						style="float: left; width: 70px; margin-top: 25px; margin-left: 529px; font-size: 14px; , margin-bottom: 10px;">작성기간</p>

					<input type="text" id="datepicker1" name="search1"
						autocomplete='off'
						style="width: 120px; margin-right: 50px; margin-top: 25px; height: 30px; border: 1px solid #dcdcdc; flaot: left; border: 1px solid #bebebe; border-radius: 2px; display: inline !important;">

					<span class="glyphicon glyphicon-calendar" aria-hidden="true"
						style="margin-left: -35px;"></span>~ㅤ<input type="text"
						autocomplete='off' name="search2" id="datepicker2"
						style="width: 120px; margin-right: 40px; height: 30px; border: 1px solid #dcdcdc; flaot: left; border: 1px solid #bebebe; border-radius: 2px; display: inline !important;">

					<span class="glyphicon glyphicon-calendar" aria-hidden="true"
						style="margin-left: -35px;"> </span>

					<button type="button" onclick="inquiry()" class="btn btn-default"
						style="background-color: #dcdcdc; font-size: 14px; fmargin-left: 380px; margin-top: 0px; margin-bottom: 3px; width: 80px; height: 34px; font-size: 14px; display: inline !important; background-color: #7e9c8c; border: none; color: white; border-radius: 2px; height: 30px; padding-top: 3px;">조회</button>
				</div>
			</form>
			<table class="table"
				style="height: 30px; height: 25px; font-size: 14px;">
				<thead class="table-dark" align=center>
					<tr align="center"
						style="background-color: #eeeeee; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #c6c8ca; font-size: 15px;">
						<td scope="col" width="100">번호</td>
						<td scope="col" width="150">문의유형</td>
						<td scope="col" width="500"><p style="margin-bottom: 0px;">제목</p></td>
						<td scope="col" width="150">작성일</td>
					</tr>
					<c:choose>
						<c:when test="${!empty inquirySearchMap.search1}">
							<c:choose>
								<c:when test="${empty inquirySearchMap.inquirySearchList}">
									<tr>
										<td style="backgroundcolor: white; width: 300px;" colspan="5">찾으시는
											결과가 없습니다.</td>
									</tr>
								</c:when>
								<c:when test="${!empty inquirySearchMap.inquirySearchList}">
									<c:set var="num"
										value="${pageMaker.totalCount - ((inquirySearchMap.pageNum-1) * 10) }" />
									<c:forEach var="inquirySearch" items="${inquirySearch}"
										varStatus="inquiryNum">
										<tr
											style="border-bottom: 1px solid #c6c8ca; border-top: 1px solid #c6c8ca; background-color: white; color: black;">
											<td scope="col" width="50">${num}</td>
											<td scope="col" width="150">${inquirySearch.inquiryType}</td>
											<td align="left" scope="col" width="500"><a
												href="${contextPath}/board/viewInquiry.do?search1=${inquirySearchMap.search1}&search2=${inquirySearchMap.search2}&inquiryNum=${inquirySearch.inquiryNum}"
												style="color: black; padding-left: 30px; margin-bottom: 0px;">${inquirySearch.inquiryTitle}</a></td>
											<td scope="col" width="150"><fmt:formatDate
													value="${inquirySearch.inquiryDate}" /></td>
										</tr>
										<c:if test="${inquirySearch.inquiryAnswer != null}">
											<tr
												style="border-bottom: 1px solid #c6c8ca; border-top: 1px solid #c6c8ca; background-color: white; color: black;">
												<td scope="col" width="50"></td>
												<td scope="col" width="150"></td>
												<td align="left" scope="col" width="500" style=><a
													href="${contextPath}/admin/viewInquiryAnswer.do?inquiryNum=${inquirySearch.inquiryNum}"
													style="color: black; padding-left: 30px; margin-bottom: 0px;">↳ㅤ[답변]ㅤ${inquirySearch.inquiryAnswer}</a></td>
												<td scope="col" width="150"></td>
											</tr>
										</c:if>
										<c:set var="num" value="${num-1}"></c:set>

									</c:forEach>
								</c:when>
							</c:choose>
						</c:when>
						<c:when test="${empty inquirySearchMap.search1}">
							<c:choose>
								<c:when test="${empty inquiryList}">
									<tr style="background-color: white;">
										<td colspan="5" style="color: black; height: 300px;">등록된
											글이 없습니다.</td>
									</tr>

								</c:when>
								<c:when test="${!empty inquiryList}">
									<c:set var="num"
										value="${pageMaker.totalCount - ((inquiryMap.pageNum-1) * 10) }" />
									<c:forEach var="inquiry" items="${inquiryList}">
										<tr
											style="border-bottom: 1px solid #c6c8ca; border-top: 1px solid #c6c8ca; background-color: white; color: black;">
											<td scope="col" width="50">${num}</td>
											<td scope="col" width="150">${inquiry.inquiryType}</td>
											<td align="left" scope="col" width="500"><a
												href="${contextPath}/board/viewInquiry.do?inquiryNum=${inquiry.inquiryNum}"
												style="color: black; padding-left: 30px; margin-bottom: 0px;">${inquiry.inquiryTitle}</a></td>
											<td scope="col" width="150"><fmt:formatDate
													value="${inquiry.inquiryDate}" /></td>
										</tr>
										<c:if test="${inquiry.inquiryAnswer != null}">
											<tr
												style="border-bottom: 1px solid #c6c8ca; border-top: 1px solid #c6c8ca; background-color: white; color: black;">
												<td scope="col" width="50"></td>
												<td scope="col" width="150"></td>
												<td align="left" scope="col" width="500" style=><a
													href="${contextPath}/admin/viewInquiryAnswer.do?inquiryNum=${inquiry.inquiryNum}"
													style="color: black; padding-left: 30px; margin-bottom: 0px;">↳ㅤ[답변]ㅤ${inquiry.inquiryAnswer}</a></td>
												<td scope="col" width="150"></td>
											</tr>
										</c:if>
										<c:set var="num" value="${num-1}"></c:set>

									</c:forEach>
								</c:when>
							</c:choose>
						</c:when>
					</c:choose>

				</thead>
			</table>
			<c:if test="${isLogOn== true &&member !=null}">
				<a id="buttonmy" class="btn btn-dark"
					href="${contextPath}/board/inquiryForm.do"
					style="float: right; margin-top: 25px; border-radius: 2px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 120px; height: 40px; padding-top: 10px; font-size: 14px;">글쓰기</a>
			</c:if>
			<!-- 내용 끝 -->
			<!-- 페이징 글번호 -->
			<c:choose>

				<c:when test="${!empty inquirySearchMap.search1}">
					<div class="page_wrap"
						style="margin-left: 80px; margin-top: 60px; width: 1300px;">
						<div class="page_nation">

							<c:if test="${pageMaker.prev}">

								<a class="arrow prev"
									style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
									href='<c:url value="/board/inquirySearch.do?search1=${inquirySearchMap.search1}&search2=${inquirySearchMap.search2}&page=${pageMaker.startPage-1 }"/>'><i
									class="fa fa-chevron-left"></i></a>

							</c:if>
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="pageNum">

								<a
									style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
									href='<c:url value="/board/inquirySearch.do?search1=${inquirySearchMap.search1}&search2=${inquirySearchMap.search2}&page=${pageNum }"/>'><i
									class="fa">${pageNum }</i></a>

							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

								<a class="arrow next"
									style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
									href='<c:url value="/board/inquirySearch.do?search1=${inquirySearchMap.search1}&search2=${inquirySearchMap.search2}&page=${pageMaker.endPage+1 }"/>'><i
									class="fa fa-chevron-right"></i></a>

							</c:if>

						</div>
					</div>
				</c:when>
				<c:when test="${empty inquirySearchMap.search1}">
					<c:choose>
						<c:when test="${AdminisLogOn == true && admin != null}">
							<div class="page_wrap"
								style="margin-left: 80px; margin-top: 50px; width: 1300px;">
								<div class="page_nation">

									<c:if test="${pageMaker.prev}">

										<a class="arrow prev"
											style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
											href='<c:url value="/admin/listAllInquiry.do?page=${pageMaker.startPage-1 }"/>'><i
											class="fa fa-chevron-left"></i></a>

									</c:if>
									<c:forEach begin="${pageMaker.startPage }"
										end="${pageMaker.endPage }" var="pageNum">

										<a
											style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
											href='<c:url value="/admin/listAllInquiry.do?page=${pageNum }"/>'><i
											class="fa">${pageNum }</i></a>

									</c:forEach>
									<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

										<a class="arrow next"
											style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
											href='<c:url value="/admin/listAllInquiry.do?page=${pageMaker.endPage+1 }"/>'><i
											class="fa fa-chevron-right"></i></a>

									</c:if>

								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="page_wrap"
								style="margin-left: 80px; margin-top: 50px; width: 1300px;">
								<div class="page_nation">

									<c:if test="${pageMaker.prev}">

										<a class="arrow prev"
											style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
											href='<c:url value="/board/listInquiry.do?page=${pageMaker.startPage-1 }"/>'><i
											class="fa fa-chevron-left"></i></a>

									</c:if>
									<c:forEach begin="${pageMaker.startPage }"
										end="${pageMaker.endPage }" var="pageNum">

										<a
											style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
											href='<c:url value="/board/listInquiry.do?page=${pageNum }"/>'><i
											class="fa">${pageNum }</i></a>

									</c:forEach>
									<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

										<a class="arrow next"
											style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
											href='<c:url value="/board/listInquiry.do?page=${pageMaker.endPage+1 }"/>'><i
											class="fa fa-chevron-right"></i></a>

									</c:if>

								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:when>
			</c:choose>
		</div>
	</section>
	<br>
	<br>
	<br>
	<br>
</body>
</html>
