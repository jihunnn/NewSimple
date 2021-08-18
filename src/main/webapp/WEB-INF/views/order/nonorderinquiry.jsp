<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<style>
<
style type ="text /css ">.table-light {
	background: #F7F7F7;
}

.table {
	table-border: 2px;
}

h4 {
	margin-top: 60px;
	font-weight: bold;
}
</style>
</head>
<title>비회원 주문상세창</title>
<body>
	<!-- 최근 본 상품 -->
	<jsp:include page="/WEB-INF/views/common/quick.jsp" flush="false" />
	<!-- 최근본상품끝 -->

	<!-- 타이틀 -->
	<section class="ftco-section" style="padding-top: 60px;">
		<div class="container">
			<!-- 타이틀 끝 -->
			<!-- 내용 -->
			<section class="ftco-section testimony-section"
				style="padding-top: 40px;">
				<div class="container">
					<h4 style="font-size: 20px; color: #7e9c8c;">주문하신 내역입니다.</h4>

				</div>

				<div class="order_list text-center">
					<table class="table" style="font-size: 13px">

						<thead class="table-dark">
							<tr
								style="background-color: #fbfbfb; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #eeeeee;">
								<th scope="col" style="">주문번호</th>
								<th scope="col">제품</th>
								<th scope="col">옵션</th>
								<th scope="col">수량</th>
								<th scope="col">가격</th>
								<th scope="col">배송상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${nonOrderLookupList }">
								<tr style="border-bottom: 1px solid #eeeeee;">
									<th scope="col" style="padding-top: 15px; font-weight: normal;">${item.nonMemOrderNum}</th>
									<th scope="col" style="font-weight: normal;"><img
										src="${contextPath}/download_product.do?productNum=${item.productNum}&productImage=${item.productImage}"
										style="width: 90px; height: 90px; margin-right: 20px;">${item.productName}
									</th>
									<th scope="col" style="font-weight: normal;">
										${item.option1name} : ${item.option1value}<br>${item.option2name}
										: ${item.option2value}
									</th>
									<th scope="col" style="padding-top: 15px; font-weight: normal;">${item.productCnt}</th>
									<th scope="col" style="padding-top: 15px; font-weight: normal;"><fmt:formatNumber
											pattern="###,###,###" value="${item.productPrice}" />원</th>
									<th scope="col" style="padding-top: 15px; font-weight: normal;">${item.deliveryStatus}</th>

								</tr>
							</c:forEach>
						</tbody>

					</table>
				</div>


				<a style="font-size: 13px;">주문일자:
					${nonOrderLookupList[0].nonMemOrderDate }</a>

				<h4 style="font-size: 20px; color: #7e9c8c;">수령인정보</h4>
				<div class="order_list">
					<table class="table" style="font-size: 13px;">
						<colgroup>
							<col width="20%" />
						</colgroup>
						<tbody>
							<tr
								style="border-bottom: 1px solid #eeeeee; border-top: 1px solid #eeeeee;">
								<th scope="col"
									style="padding-left: 40px; background-color: #fbfbfb; color: black;"
									class="table-dark">이름</th>
								<th scope="col">${nonOrderLookupList[0].nonMemSpName }</th>
							</tr>
							<tr style="border-bottom: 1px solid #eeeeee;">
								<th scope="col"
									style="padding-left: 40px; background-color: #fbfbfb; color: black;"
									class="table-dark">주소</th>
								<th scope="col">${nonOrderLookupList[0].nonMemSpAdr }</th>
							</tr>
							<tr style="border-bottom: 1px solid #eeeeee;">
								<th scope="col"
									style="padding-left: 40px; background-color: #fbfbfb; color: black;"
									class="table-dark">연락처1</th>
								<th scope="col">${nonOrderLookupList[0].nonMemSpPhoneNum1 }</th>
							</tr>
							<c:choose>
								<c:when test="${nonOrderLookupList[0].nonMemSpPhoneNum2 != '--'}">

									<tr style="border-bottom: 1px solid #eeeeee;">
										<th scope="col"
											style="padding-left: 40px; background-color: #fbfbfb; color: black;">연락처2</th>
										<th scope="col">${nonOrderLookupList[0].nonMemSpPhoneNum2 }</th>
									</tr>
								</c:when>
							</c:choose>
							<tr style="border-bottom: 1px solid #eeeeee;">
								<th scope="col"
									style="padding-left: 40px; padding-bottom: 50px; background-color: #fbfbfb; color: black;"
									class="table-dark"><br>주문메세지<br>(100자내외)</th>
								<th scope="col"><textarea name="textarea" rows="4"
										cols="40" style="border: 1px solid #dcdcdc;" readonly>${nonOrderLookupList[0].nonMemOrderMsg }</textarea></th>
							</tr>

						</tbody>
					</table>
				</div>


				<h4 style="font-size: 20px; color: #7e9c8c;">결제정보</h4>
				<div class="order_list">
					<table class="table" style="font-size: 13px;">
						<colgroup>
							<col width="20%" />
						</colgroup>
						<tbody>
							<tr
								style="border-bottom: 1px solid #eeeeee; border-top: 1px solid #eeeeee;">
								<th scope="col"
									style="padding-left: 40px; background-color: #fbfbfb; color: black;"
									class="table-dark">결제방법</th>
								<th scope="col">${nonOrderLookupList[0].nonMemPaymentMethod }</th>
							</tr>
							<tr style="border-bottom: 1px solid #eeeeee;">
								<th scope="col"
									style="padding-left: 40px; background-color: #fbfbfb; color: black;"
									class="table-dark">무통장 입금자명</th>
								<th scope="col">${nonOrderLookupList[0].nonMemDepositorName }</th>

							</tr>

						</tbody>
					</table>
				</div>

				<br> <br>

				<div class="container">
					<div id="main-back" style="text-align: center;">
						<button onclick="location='${contextPath}/main.do'"
							style="font-size: 13px; width: 130px; height: 45px; background-color: #7e9c8c; border: none; color: white; border-radius: 2px;">확인</button>
					</div>
				</div>
			</section>
		</div>
	</section>
	<!-- 내용 끝 -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>














