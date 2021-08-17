<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="productQuestionList"
	value="${questionMap.productQuestionList}" />

<!DOCTYPE html>
<html lang="en">
<head>
<!-- 날짜위젯 -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script>
		
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
    
    function fn1() {

    	if (confirm("삭제하시겠습니까??") == true) { //확인
    	return true
    	} else { //취소
    		return false;

    	}
        	
      
    }
	function productQuestionSearch() {
		var form = document.questionSearch;

		if (form.search.value == "") {
			alert("검색 단어를 입력해주세요")
			form.search.focus();
			return false;
		}else{
			form.submit();
		}


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

#recentlyProduct {
	
}

#buttonmy {
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

			<jsp:include page="/WEB-INF/views/common/admin_topmenu.jsp"
				flush="false" />

			<!-- 타이틀 끝 -->

			<!-- 최근 본 상품 -->

			<!-- 최근 본 상품 끝 -->
			<!-- 내용 -->

			<form name="questionSearch"
				action="${contextPath}/admin/questionSearch.do"
				method="post">
				<div style="margin-bottom: 10px; font-size: 13px;">
					<button type="button" id="buttonmy" class="btn btn-dark"
						onclick="productQuestionSearch()"
						style="margin-top: 21px; float: right; padding-top: 4px; height: 34px; font-size: 13px; padding-top: 4px; background-color: #7e9c8c; border: none;">조회</button>
					<input type="text"
						style="margin-top: 21px; float: right; height: 34px; border: 1px solid #dcdcdc; font-size: 13px; margin-right: 5px;"
						name="search"> <select name="searchType"
						style="font-size: 13px; margin-bottom: 10px; margin-right: 5px; float: right; width: 80px; height: 34px; border: 1px solid #dcdcdc; margin-top: 21px;">
						<option value="productNum">상품번호</option>
						<option value="memId">아이디</option>
						<option value="memName">이름</option>

					</select>
					<div
						style="font-size: 20px; font-weight: bold; margin-left: 18px; padding-top: 19px; float: left;">
						<a style="color: #7e9c8c;">상품문의</a>
					</div>
				</div>
			</form>
			<table class="table"
				style="height: 30px; height: 25px; font-size: 13px;">
				<thead class="table-dark" align=center>
					<tr align="center"
						style="background-color: #fbfbfb; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #eeeeee;">
						<td scope="col" width="100">글번호</td>
						<td scope="col" width="200">상품번호</td>
						<td scope="col" width="300"><p style="margin-bottom: 0px;">제목</p></td>
						<td scope="col" width="100">작성자</td>
						<td scope="col" width="100">작성일</td>
						<td scope="col" width="100">답변여부</td>
					</tr>
					<c:choose>
						<c:when test="${empty productQuestionList}">
							<tr style="background-color: white;">
								<td colspan="6"
									style="background-color: white; border-bottom: 1px solid #eeeeee; vertical-align: middle; width: 300px; height: 80px; color: #5f5f5f;">글이 없습니다.</td>
							</tr>

						</c:when>
						<c:when test="${!empty productQuestionList}">
							<c:set var="num"
								value="${pageMaker.totalCount - ((pageNum-1) * 10) }" />
							<c:forEach var="question" items="${productQuestionList}" varStatus="status">
								<div id="tallModal2${status.index}" class="modal modal-wide fade">
									<div class="modal-dialog">
										<div class="modal-content"
											style="width: 700px; height: 510px;">
											<div class="modal-header"
												style="text-align: center; border-bottom: none;">
												<h4 class="modal-title"
													style="font-size: 15px; color: #7e9c8c; font-weight: bold;">답변</h4>
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
											</div>
											<form
												action="${contextPath}/admin/addProductQuestion.do?productQuestionNum=${question.productQuestionNum}"
												method="post">
												<div class="modal-body" style="font-size: 13px;">
													<p style="float: left;">작성자 :</p>
													<input type="text" name="memName" value="${admin.memName}"
														disabled
														style="border: 1px solid #dcdcdc; margin-left: 20px;" />
													<hr>
													<p style="float: left;">내 용 :</p>
													<textarea name="productAnswerContent"
														style="border: 1px solid #dcdcdc; margin-left: 30px; width: 585px; height: 300px; background-color: white;"></textarea>


												</div>

												<img src="" />
												<div class="modal-footer"
													style="padding-top: 10px; padding-bottom: 10px;">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true"
														style="width: 56px; height: 33px; border: 1px solid #7e9c8c; font-size: 13px;">취소</button>
													<button type="submit" class="btn btn-primary"
														style="float: right; border-radius: 2px; font-size: 13px;">확인</button>
												</div>
											</form>
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal-dialog -->
								</div>
								<!-- 답변수정하기 -->
								<div id="tallModal1${status.index}" class="modal modal-wide fade">
									<div class="modal-dialog">
										<div class="modal-content"
											style="width: 700px; height: 510px;">
											<div class="modal-header"
												style="text-align: center; border-bottom: none;">
												<h4 class="modal-title"
													style="font-size: 15px; color: #7e9c8c; font-weight: bold;">답변수정하기</h4>
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
											</div>
											<form
												action="${contextPath}/admin/modNewProductAnswer.do?productQuestionNum=${question.productQuestionNum}"
												method="post">
												<div class="modal-body" style="font-size: 13px;">
													<p style="float: left;">작성자 :</p>
													<input type="text" name="memName" value="${admin.memName}"
														disabled
														style="border: 1px solid #dcdcdc; margin-left: 20px;" />
													<hr>
													<p style="float: left;">내 용 :</p>
													<textarea name="productAnswerContent"
														style="border: 1px solid #dcdcdc; margin-left: 30px; width: 585px; height: 300px; background-color: white;">${question.productAnswerContent}</textarea>


												</div>

												<img src="" />
												<div class="modal-footer"
													style="padding-top: 10px; padding-bottom: 10px;">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true"
														style="width: 56px; height: 33px; border: 1px solid #7e9c8c; font-size: 13px;">취소</button>
													<button type="submit" class="btn btn-primary"
														style="float: right; border-radius: 2px; font-size: 13px;">확인</button>
												</div>
											</form>
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal-dialog -->
								</div>
								<tr
									style="border-bottom: 1px solid #eeeeee !important; background-color: white; color: black;">

									<td scope="col" width="50" style="padding-top: 12px;">${num}</td>
									<td scope="col" width="50" style="padding-top: 12px;">${question.productNum}</td>
									<td align="left" scope="col" width="400"
										style="padding-top: 10px; padding-bottom: 0px; padding-top: 0px; vertical-align: middle;">
										<div>
											<div id="section1b" class="label">
												<p
													style="color: black; text-align: left; padding-top: 10px; padding-bottom: 10px; cursor: pointer; margin-bottom: 0px; font-weight: normal;">

													${question.productQuestionTitle }</p>
											</div>
											<div id="section1b" class="elements">
												<hr style="margin-bottom: 10px; margin-top: 0px;">
												<p
													style="color: black; text-align: left; cursor: pointer; margin-bottom: 13px;">
													${question.productQuestionContent}

													<button type="button"
														onclick="javascript:fn1();location.href='${contextPath}/admin/removeProductQuestion.do?productQuestionNum=${question.productQuestionNum}'"
														style="float: right; border-radius: 2px; margin-bottom: 3px; cursor: pointer; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; height: 30px; font-size: 13px; margin-left: 2px;"
														class="btn-secondary btn-xs">삭제</button>
													<c:if test="${question.answerWhether == '미답변'}">
														<a data-toggle="modal" href="#tallModal2${status.index}"
															style="float: right; border-radius: 2px; margin-bottom: 3px; text-align: center; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; height: 30px; font-size: 13px;"
															class="btn-secondary btn-xs">답변</a>
													</c:if>
												</p>
												<c:if test="${!empty question.productAnswerContent}">
													<hr style="margin-bottom: 20px; margin-top: 0px;">

													<p style="text-align: left;">[답변]</p>
													<p style="text-align: left;">

														${question.productAnswerContent}
														<button type="button"
															onclick="javascript:fn1();location.href='${contextPath}/admin/removeProductAnswer.do?productQuestionNum=${question.productQuestionNum}'"
															style="float: right; border-radius: 2px; margin-bottom: 3px; cursor: pointer; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; height: 30px; font-size: 13px; margin-left: 2px;"
															class="btn-secondary btn-xs">삭제</button>
														<a data-toggle="modal" href="#tallModal1${status.index}"
															style="float: right; border-radius: 2px; margin-bottom: 3px; padding-top: 3px; text-align: center; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; height: 30px; font-size: 13px;"
															class="btn-secondary btn-xs">수정</a>
													</p>
												</c:if>
											</div>
										</div>
									</td>
									<td scope="col" width="50" style="padding-top: 12px;">${question.memName}</td>
									<td scope="col" width="50" style="padding-top: 12px;"><fmt:formatDate
											value="${question.productQuestionDate}" /></td>
									<td scope="col" width="50" style="padding-top: 12px;">${question.answerWhether}</td>

								</tr>
								<c:set var="num" value="${num-1}"></c:set>

							</c:forEach>
						</c:when>
					</c:choose>
				</thead>
			</table>
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
			<!-- 내용 끝 -->
			<!-- 페이징 글번호 -->

			<div class="page_wrap"
				style="margin-left: 80px; margin-top: 50px; width: 1300px; font-size: 13px;">
				<div class="page_nation">

					<c:if test="${pageMaker.prev}">

						<a class="arrow prev"
							style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
							href='<c:url value="/admin/listProductQuestion.do?page=${pageMaker.startPage-1 }"/>'><i
							class="fa fa-chevron-left"></i></a>

					</c:if>
					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="pageNum">

						<a
							style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
							href='<c:url value="/admin/listProductQuestion.do?page=${pageNum }"/>'><i
							class="fa">${pageNum }</i></a>

					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

						<a class="arrow next"
							style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
							href='<c:url value="/admin/listProductQuestion.do?page=${pageMaker.endPage+1 }"/>'><i
							class="fa fa-chevron-right"></i></a>

					</c:if>

				</div>
			</div>

		</div>
	</section>
	<br>
	<br>
	<br>
	<br>
</body>
</html>
