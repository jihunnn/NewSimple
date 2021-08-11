<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>


<script type="text/javascript">
	//구매확정 이벤트창
	function confirmOrderConfirm(obj) {
		if (confirm("구매확정하시겠습니까??") == true) { //확인
			var memOrderSeqNum = jQuery('#memOrderSeqNum').val();
			obj.action = "${contextPath}/mypage/purchaseConfirm.do?memOrderSeqNum=memOrderSeqNum";
			obj.submit();

		} else { //취소

			return false;

		}

	}
	function reviewConfirmResult() {

		alert("이미 리뷰를 작성하였습니다.")
	}
	function returnConfirmResult() {

		alert("이미 반품을 신청하셨습니다. 반품내역을 확인해주세요.")
	}
</script>

<style>
#main_box { /*아이디 선택자*/
	display: flex;
	flex-direction: column;
	align-items: center;
	padding-top: 10px;
}

#Mypage { /*아이디 선택자*/
	display: flex;
	flex-direction: column;
	width: 1300px;
	height: 100px;
	align-items: center;
	padding-top: 10px;
	padding-right: 20px;
	font-size: 10px;
}

.my_row {
	flex-direction: row;
}

.container1 {
	width: 250px;
}

.container2 {
	width: 800px;
}

#sect {
	display: flex;
	flex-direction: row;
	padding-bottom: 10px;
}

.nav_MyPage {
	width: 120px;
	list-style-type: none;
	margin: 0;
	padding: 0;
	font-size: 14px;
}

#MyPage_center1 {
	border: 1px solid rgb(140, 140, 140);
}

.nav_MyPage li a {
	display: block;
	color: #000000;
	padding: 8px;
	text-align: center;
	text-decoration: none;
	font-weight: bold;
}

.nav_MyPage li a.current {
	background-color: rgb(200, 200, 200);
	color: block;
}

.nav_MyPage li a: hover:not(.current) {
	background-color: #CD853F;
	color: white;
}

#MyPage_top {
	padding-top: 50px;
	align-items: center;
	width: 700px;
	height: 100px;
}

#MyPage_top1 {
	padding-top: 50px;
	align-items: center;
	padding-left: 330px;
	width: 700px;
	height: 100px;
}

#MyPage_top2 {
	padding-top: 50px;
	align-items: center;
	padding-left: 200px;
	width: 700px;
	height: 100px;
}

.PASSWORD_confirm_text {
	position: relative;
	left: 15px;
}

#MyPage_top3 {
	align-items: center;
	padding-left: 300px;
	width: 700px;
	height: 100px;
}

.btn_PASSWORD_confirm {
	position: relative;
	font-size: 15px;
	width: 80px;
}

.btn_main_back {
	position: relative;
	left: 14px;
	font-size: 15px;
	width: 80px;
}

#Mypage_nav {
	width: 400px;
}

#Mypage-center {
	display: flex;
	flex-direction: row;
}

#Mypage_nav {
	display: flex;
	flex-direction: column;
	width: 120px;
}

.Easy-sgin-in-wrap {
	display: flex;
	flex-direction: column; /*column으로 정렬 */
	float: right;
}

.Easy-sgin-in-wrap .sign-button-list {
	list-style: none;
	width: 350px;
	display: flex;
	flex-direction: column;
}

.Easy-sgin-in-wrap .sign-button-list li {
	padding-top: 10px;
}

.Easy-sgin-in-wrap .sign-button-list li button {
	width: 350px;
	height: 40px;
	border: 1px solid rgb(0, 0, 0);
	text-align: center;
	background: rgb(255, 255, 255);
}

.Easy-sgin-in-wrap .sign-button-list li button i {
	font-size: 10px;
}
</style>
</head>
<title>주문결제창</title>
<body>

	<section class="ftco-section"
		style="padding-top: 50px; margin-bottom: 50px; padding-bottom: 0px;">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3"
				style="background-color: #f5f5f5; border: 1px solid #e7e7e7; margin-top: 50px;">
				<div class="col-md-20 heading-section ftco-animate"
					style="height: 60px;">
					<h2 class="mb-4" style="font-size: 35px; margin-top: 15px;">마이페이지</h2>
				</div>
			</div>

			<!-- 최근 본 상품 -->
            <jsp:include page="/WEB-INF/views/common/quick.jsp" flush="false" />

			<!-- Left Menu -->
			<jsp:include page="/WEB-INF/views/common/mypage_sidemenu.jsp"
				flush="false" />
			<!-- left Menu 끝-->

			<div class="table_01"
				style="padding-top: 30px; margin-top: 20px; margin-left: 50px;">
				<div>
					<table style="width: 1000px; height: 80px; margin-left: 80px;">
						<tbody id="MyPage_center1">
							<tr height="60px;">
								<th
									style="font-size: 16px; background-color: #212529; color: white;"
									colspan="3"><a
									style="font-size: 16px; padding-left: 10px; font-size: 17px;">홍길동</a>
									<a>님 환영합니다.</a></th>
							</tr>
							<tr align="center"
								style="padding-left: 10px; font-size: 16px; height: 60px;"
								height="45%">
								<th width="220" style="text-align: center">주문/배송<a
									href="/MyPage-04" style="color: red;">4</a><a>건</a></th>
								<th width="220" style="text-align: center">취소/반품<a
									href="/MyPage-06" style="color: red;">2</a><a>건</a></th>
								<th width="220" style="text-align: center">장바구니<a
									href="/Cart" style="color: red;">1</a><a>건</a></th>
							</tr>
						</tbody>
					</table>
				</div>

				<!-- 내용 -->

				<div class="container2"
					style="padding-left: 220px; padding-top: 0px;">

					<div style="width: 20px;">
						<table
							style="wdith: 800px; height: 40px; align: center; padding-top: 10px;">
							<tbody id="MyPage_center3">
								<tr>
									<th
										style="font-size: 18px; font-weight: bold; padding-top: 30px; white-space: nowrap;"
										colspan="4">주문/배송조회(최근 1개월)</th>
								</tr>
							</tbody>
						</table>
					</div>

					<div id="MyPage_top" style="padding-top: 20px; width: 600px;">

						<table border="1"
							style="width: 980px; height: 180px; align: center;">
							<tbody id="MyPage_center2">
								<tr height="50%"
									style="background-color: #212529; color: white;">
									<th style="font-size: 15px; text-align: center; height: 40px;"
										width="100">주문일자</th>
									<th style="font-size: 12px; text-align: center;" width="230">상품명</th>
									<th style="font-size: 12px; text-align: center;" width="70">수량</th>
									<th style="font-size: 12px; text-align: center;" width="120">금액</th>
									<th style="font-size: 12px; text-align: center;" width="140">현재상태</th>
								</tr>
								<c:forEach var="memOrderNum" items="${memOrderNum}">
									<tr height="80%">
										<th style="text-align: center;"><fmt:formatDate
												value="${memOrderNum.memOrderDate}" /></th>
										<th style="padding: 10px; text-align: center;"
											onClick="location.href='Product-02'">
											<div>
												<img src="${contextPath}/resources/images/image_1.jpg"
													width="110" height="110" style="float: left;"> <a
													style="margin-left: 0px;">${memOrderNum.productName}</a>
												<c:if test="${memOrderNum.option1value !=null}">
													<p
														style="margin-left: 130px; font-size: 13px; width: 100px;">${memOrderNum.option1Name}
														: ${memOrderNum.option1value}</p>
												</c:if>
												<c:if test="${memOrderNum.option2value !=null}">
													<p
														style="margin-left: 130px; font-size: 13px; width: 100px;">${memOrderNum.option2Name}
														: ${memOrderNum.option2value}</p>
												</c:if>

											</div>
										</th>
										<th style="text-align: center;">${memOrderNum.productCnt}</th>
										<th style="text-align: center;">${memOrderNum.productPrice}</th>
										<th style="text-align: center;"><ins
												onclick="location='#'" id="now-state"
												style="color: red; font-size: 14px;">
												${memOrderNum.deliveryStatus}<br>
											</ins> <c:choose>
												<c:when test="${memOrderNum.purchaseConfirm =='구매확정(미)'}">

													<form>
														<input type="button" name="purchaseConfirm"
															style="font-size: 14px; width: 110px; background-color: #212529; margin-bottom: 5px; color: white;"
															class="confirmation"
															onclick="confirmOrderConfirm(this.form)" value="구매확정">
														<input type="hidden" id="memOrderSeqNum"
															name="memOrderSeqNum"
															value="${memOrderNum.memOrderSeqNum}" />
													</form>
													<c:choose>
														<c:when test="${memOrderNum.returnConfirm == '반품신청(미)'}">
															<input type="button"
																style="font-size: 14px; width: 110px; background-color: #212529; margin-bottom: 5px; color: white;"
																onclick="location.href='${contextPath}/mypage/returnWrite.do?&productNum=${memOrderNum.productNum}&memOrderSeqNum=${memOrderNum.memOrderSeqNum}'"
																value="반품신청">
														</c:when>
														<c:when test="${memOrderNum.returnConfirm == '반품신청(완)'}">
															<input type="button"
																style="font-size: 14px; width: 110px; background-color: #212529; margin-bottom: 5px; color: white;"
																onclick="returnConfirmResult()" value="반품신청">
														</c:when>
													</c:choose>
												</c:when>
												<c:when test="${memOrderNum.purchaseConfirm =='구매확정(완)'}">


													<c:choose>
														<c:when test="${memOrderNum.reviewConfirm == '리뷰작성(미)'}">
															<input type="button" name="reviewConfirm"
																style="font-size: 14px; width: 110px; background-color: #212529; margin-bottom: 5px; color: white;"
																id="pressbtn1" class="confirmation"
																onclick="location.href='${contextPath}/mypage/reviewWrite.do?productNum=${memOrderNum.productNum}&memOrderSeqNum=${memOrderNum.memOrderSeqNum}'"
																value="리뷰작성">
														</c:when>
														<c:when test="${memOrderNum.reviewConfirm == '리뷰작성(완)'}">
															<input type="button" name="reviewConfirm"
																style="font-size: 14px; width: 110px; background-color: #212529; margin-bottom: 5px; color: white;"
																id="pressbtn1" class="confirmation"
																onclick="reviewConfirmResult()" value="리뷰작성">
														</c:when>
													</c:choose>
												</c:when>
											</c:choose>
									</tr>
								</c:forEach>
								<tr height="100">
									<th colspan="2"
										style="padding-left: 10px; padding-bottom: 15px;">
										<div style="font-size: 12px;">주문자 정보</div>
										<div style="font-size: 10px;">
											<a>이름 :</a> <a>${memOrderSeqNum.memName}</a>
										</div>
										<div style="font-size: 11px;">
											<a>주소 :</a> <a>${memOrderSeqNum.memAdr}</a>
										</div>
										<div style="font-size: 11px;">
											<a>연락처 :</a> <a>${memOrderSeqNum.memPhoneNum}</a>
										</div>
									</th>
									<th colspan="4" style="padding-left: 10px;">
										<div style="font-size: 15px;">배송 정보</div>
										<div style="font-size: 11px;">
											<a>수령인 :</a> <a>${memOrderSeqNum.memSpName}</a>
										</div>

										<div style="font-size: 11px;">
											<a>연락처 :</a> <a>${memOrderSeqNum.memSpPhoneNum1}</a>
											<c:if test="${memOrderSeqNum.memSpPhoneNum2 !='--'}">
												<a>/ ${memOrderSeqNum.memSpPhoneNum2}</a>
											</c:if>
										</div>
										<div style="font-size: 11px;">
											<a>배송지 :</a> <a>${memOrderSeqNum.memSpAdr}</a>
										</div>
										<div style="font-size: 11px;">
											<a>주문메시지 :</a> <a>${memOrderSeqNum.memOrderMsg}</a>
										</div>
										<div style="font-size: 11px;">
											<a>결제방법 :</a> <a>${memOrderSeqNum.memPaymentMethod}</a>
										</div>
										<div style="font-size: 11px; float: right; font-size: 20px;">
											<a>총결제금액 :</a> <a>${memOrderSeqNum.totalPrice}원</a>
										</div>
									</th>
								</tr>
							</tbody>
						</table>

						<div align="center" id="btn_modify_reset"
							style="padding-top: 10px">
							<input type="button" value="목 록"
								onclick="location.href='${contextPath}/mypage_04.do'"
								style="width: 80px; background-color: #212529; color: white; margin-left: 400px; margin-top: 30px;">
						</div>
					</div>
				</div>
				<!-- 내용 -->
			</div>
		</div>
	</section>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
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