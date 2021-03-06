<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:if test="${!empty orderSearchMap.search}">
	<c:set var="orderSearchList" value="${orderSearchMap.orderSearchList}" />
</c:if>
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

#buttonmy {

	height: 30px;
	float: left;
	border-radius: 2px;
	padding-top: 1.8px;
}

</style>
<script> src="http://code.jquery.com/jquery-1.6.4.min.js"</script>
<script type="text/javascript">
    
	function listMemOrderSearch() {
		var form = document.memOrderSearch;

		if (form.search.value == "") {
			alert("검색 단어를 입력해주세요")
			form.search.focus();
			return false;
		}else{
			form.submit();
		}


	}
	$(function(){
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length;
		
		$("input[name='allCheck']").click(function(){
			var chk_listArr = $("input[name='RowCheck']");
			for(var i=0; i<chk_listArr.length; i++){
				chk_listArr[i].checked = this.checked;
			}
		});
		$("input[name='RowCheck']").click(function(){
			if($("input[name='RowCheck']:checked").length==rowCnt){
				$("input[name='allCheck']")[0].checked = true;
			}else{
				$("input[name='allCheck']")[0].checked = false;
			}
		});
	});
	function deleteValue(){
		var valueArr = new Array();
		var list = $("input[name='RowCheck']");
		for(var i = 0; i < list.length; i++){
			if(list[i].checked){//선택되어 있으면 배열에 값을 저장
					valueArr.push(list[i].value);
				}
			}
			if(valueArr.length == 0){
				alert("선택된 주문이 없습니다.");
			}else{
				if(confirm("정말 삭제하시겠습니까?")){
				$.ajax({
					url : "${contextPath}/admin_listorder/admin_selectremoveMemOrder.do", //전송 URL
					type: 'POST',
					traditional : true,
					data : {
						valueArr : valueArr   //보내고자 하는 data 변수 설정
					},
					success: function(jdata){
						if(jdata = 1){
							alert("회원 주문을 삭제하셨습니다.");
							location.href = '${contextPath}/admin_listorder.do'; //admin_listorder로 페이지 새로고침
						}else{
							alert("회원주문삭제에 실패하셨습니다.");
						}	
					}

				});
				}else{
					return false;
				}
			}
	}
	
	
</script>
</head>
<title>관리자 회원 주문조회창</title>
<body>

	<section class="ftco-section testimony-section"
		style="padding-top: 100px;">

		<div class="container">
			<jsp:include page="/WEB-INF/views/common/admin_topmenu.jsp"
				flush="false" />
			<form name="memOrderSearch"
				action="${contextPath}/admin_listorder/orderSearch.do" method="post">
				<div style="margin-bottom: 10px;">
					<button type="button" id="buttonmy" class="btn btn-dark" onclick="listMemOrderSearch()"
						style="margin-top: 21px; float: right; padding-top: 4px; height: 34px; font-size: 13px; padding-top: 4px; background-color: #7e9c8c; border: none;">조회</button>
					<input type="text"
						style="margin-top: 21px; float: right; height: 34px; width:145px; border: 1px solid #dcdcdc; font-size: 14px; margin-right: 5px;"
						name="search"> <select name="searchType"
						style="font-size: 13px; margin-bottom: 10px; margin-right: 5px; float: right; width: 90px; height: 34px; border: 1px solid #dcdcdc; margin-top: 21px;">
						<option value="memOrderNum">주문번호</option>
						<option value="memId">아이디</option>
						<option value="memSpAdr">주소</option>
						<option value="memSpPhoneNum1">연락처1</option>
						<option value="memSpPhoneNum2">연락처2</option>
					</select>
					<div
						style="font-size: 20px; font-weight: bold; margin-left: 18px; padding-top: 19px; float: left;">
						<a style="color: #7e9c8c;">주문조회</a>
					</div>
					<button type="button" onclick="location.href='${contextPath}/admin_listorder.do'"
						style="float: left; border-radius: 2px; margin-bottom: 3px; margin-right:5px; margin-left:5px; margin-top: 23px; background-color: white; color: gray; border: 1px solid #7e9c8c; border-radius: 2px; width: 70px; height: 29px; font-size: 13px;"
						class="btn-secondary btn-xs">회원</button>
					<button type="button" onclick="location.href='${contextPath}/admin_listNoOrder.do'"
						style="float: left; border-radius: 2px; margin-bottom: 3px; margin-top: 22px; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; height: 30px; font-size: 13px;"
						class="btn-secondary btn-xs">비회원</button>

				</div>
			</form>


			<table class="table" style="font-size: 13px;">
				<thead class="table-dark" align=center>
					<tr align="center"
						style="background-color: #fbfbfb; color: black; border-top: 1px solid #7e9c8c; border-bottom: 1px solid #eeeeee;">
						<td scope="col" style="width: 50px;">선택</td>
						<td scope="col" style="width: 60px;">주문번호</td>
						<td scope="col" style="width: 60px;">아이디</td>
						<td scope="col" style="width: 1px;">가격</td>
						<td scope="col" style="width: 230px;">배송지정보</td>
						<td scope="col" style="width: 80px;">주문날짜</td>
						<td scope="col" style="width: 80px;">보기</td>
					</tr>
					<c:choose>
						<c:when test="${!empty orderSearchMap.search}">
							<c:choose>
								<c:when test="${empty orderSearchMap.orderSearchList}">
									<tr height="200">
										<td colspan="10"
											style="background-color: white; padding-top: 100px;">
											<p align="center">
												<b><span style="color: black;">조회된 주문내역이 없습니다.</span></b>
											</p>
										</td>
									</tr>
								</c:when>
								<c:otherwise>

									<c:forEach var="orderSearch" items="${orderSearchList}">
										<tr
											style="border-bottom: 1px solid #eeeeee; background-color: white; color: black; ">
											<th scope="col" style="vertical-align: middle;"><input
												type="checkbox" name="chk" value=""></th>
											<th scope="col" style="vertical-align: middle; font-weight: normal;">${orderSearch.memOrderNum}</th>
											<th scope="col" style="vertical-align: middle; font-weight: normal;">${orderSearch.memId}</th>
											<th scope="col" style="vertical-align: middle; font-weight: normal;">${orderSearch.totalPrice}원</th>
											<th scope="col" style="vertical-align: middle; font-weight: normal;">
												수령인 : ${orderSearch.memSpName} <br>
												주소 : ${orderSearch.memSpAdr} <br>
												연락처1 : ${orderSearch.memSpPhoneNum1}
												<c:choose>
								                <c:when test="${orderSearch.memSpPhoneNum2 != '--'}">
								                연락처2 : ${orderSearch.memSpPhoneNum2}
								                </c:when>
								                </c:choose></th>
											<th scope="col" style="vertical-align: middle; font-weight: normal;">${orderSearch.memOrderDate}</th>
											<th scope="col" style="vertical-align: middle;"><input
												type="hidden" value="${orderSearch.memId}" name="memId" />
												<button type="button" class="btn btn-dark" onclick="location.href='${contextPath}/admin_listorder/detailorder.do?memOrderNum=${orderSearch.memOrderNum}'"
														style="border-radius: 2px; margin-bottom: 3px; background-color: white; color: gray; border: 1px solid #7e9c8c; border-radius: 2px; width: 70px; height: 30px; font-size: 13px;">상세보기</button>
												<br>
												
											</th>
											</tr>
											
											
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:when test="${empty orderSearchMap.search}">
							<c:choose>
								<c:when test="${empty ordersList}">
									<tr height="200">
										<td colspan="10"
											style="background-color: white; padding-top: 100px;">
											<p align="center">
												<b><span style="color: black;">조회된 주문내역이 없습니다.</span></b>
											</p>
										</td>
									</tr>
								</c:when>
								<c:otherwise>
										<c:forEach var="orders" items="${ordersList}">

											<tr 
												style="border-bottom: 1px solid #c6c8ca; background-color: white; color: black;">
												<th scope="col" style="vertical-align: middle;"><input
													type="checkbox" name="RowCheck" id="memOrderNum" value="${orders.memOrderNum}"></th>
												<th scope="col" style="vertical-align: middle; font-weight: normal;">${orders.memOrderNum}</th>
												<th scope="col" style="vertical-align: middle; font-weight: normal;">${orders.memId}</th>
												<th scope="col" style="vertical-align: middle; font-weight: normal;">${orders.totalPrice}원</th>
												<th scope="col" style="vertical-align: middle; font-weight: normal; text-align:left; padding-left:50px;">
												수령인 : ${orders.memSpName} <br>
												주소 : ${orders.memSpAdr} <br>
												연락처1 : ${orders.memSpPhoneNum1}
												<c:choose>
								                <c:when test="${orders.memSpPhoneNum2 != '--'}">
								                연락처2 : ${orders.memSpPhoneNum2}
								                </c:when>
								                </c:choose></th>
												<th scope="col" style="vertical-align: middle; font-weight: normal;">${orders.memOrderDate}</th>
												<th scope="col" style="vertical-align: middle; font-weight: normal;">
													<button type="button" class="btn btn-dark" onclick="location.href='${contextPath}/admin_listorder/detailorder.do?memOrderNum=${orders.memOrderNum}'"
														style="padding-left:6px; border-radius: 2px; margin-bottom: 3px; background-color: white; color: gray; border: 1px solid #7e9c8c; border-radius: 2px; width: 70px; height: 30px; font-size: 13px;">상세보기</button>
													<br>
												</th>
											</tr>

										</c:forEach>
								</c:otherwise>
							</c:choose>
						</c:when>
					</c:choose>

				</thead>
			</table>
			<button type="button" onclick="deleteValue();"
				style="float: right; border-radius: 2px; margin-bottom: 3px; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; height: 30px; font-size: 13px;"
				class="btn-secondary btn-xs">선택삭제</button>
		</div>
		<!-- 내용 끝 -->

		<!-- 페이징 글번호 -->
		<div class="page_wrap" style="margin-left: 80px; margin-top: 60px;">
			<div class="page_nation" style="text-align: center;">

				<c:if test="${pageMaker.prev}">

					<a class="arrow prev"
						style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
						href='<c:url value="/admin_listorder.do?page=${pageMaker.startPage-1 }"/>'><i
						class="fa fa-chevron-left"></i></a>

				</c:if>
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="pageNum">

					<a
						style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
						href='<c:url value="/admin_listorder.do?page=${pageNum }"/>'><i
						class="fa">${pageNum }</i></a>

				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

					<a class="arrow next"
						style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px;"
						href='<c:url value="/admin_listorder.do?page=${pageMaker.endPage+1 }"/>'><i
						class="fa fa-chevron-right"></i></a>

				</c:if>

			</div>
		</div>



	</section>


</body>
</html>
