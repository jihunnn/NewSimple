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
		style="padding-top: 100px; margin-bottom: 50px; padding-bottom: 0px;">
		<div class="container">

			<!-- 최근 본 상품 -->
			<jsp:include page="/WEB-INF/views/common/quick.jsp" flush="false" />

			<!-- Left Menu -->
			<jsp:include page="/WEB-INF/views/common/mypage_sidemenu.jsp"
				flush="false" />
			<!-- left Menu 끝-->
			<div
				style="font-size: 15px; font-weight: bold; margin-left: 18px; padding-bottom: 7px; color: #7e9c8c;">주문/배송조회(상세보기)</div>
			<jsp:include page="/WEB-INF/views/common/mypage_topmenu.jsp"
				flush="false" />

			<div class="table_01" style="padding-top: 30px; height: 100px;">


				<!-- 내용 -->

					<div >

						<table
							style="width: 1000px; height: 80px; align: center; border-right: none; border-left: none;">
							<tbody id="MyPage_center3">
								<tr height="50%"
									style="background-color: #fbfbfb; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #eeeeee;">
									<th style="font-size: 13px; text-align: center; height: 40px;"
										width="100">주문일자</th>
									<th style="font-size: 13px; text-align: center;" width="230">상품명</th>
									<th style="font-size: 13px; text-align: center;" width="70">수량</th>
									<th style="font-size: 13px; text-align: center;" width="120">금액</th>
									<th style="font-size: 13px; text-align: center;" width="140">현재상태</th>
								</tr>
								<c:forEach var="memOrderNum" items="${memOrderNum}">
									<tr height="80%">
										<th
											style="text-align: center; font-size: 13px; border: 1px solid #eeeeee; border-bottom: 1px solid #eeeeee; border-left: none !important; font-weight: normal;"><fmt:formatDate
												value="${memOrderNum.memOrderDate}" /></th>
										<th
											style="padding: 10px; text-align: left; height: 120px; border: 1px solid #eeeeee; font-weight: normal;"
											onClick="location.href='Product-02'">
											<div>
												<img src="${contextPath}/download_product.do?productNum=${memOrderNum.productNum}&productImage=${memOrderNum.productImage}"
													width="90" height="90" style="float: left;"> <a
													style="margin-left: 40px; font-size: 13px; font-weight: bold;">${memOrderNum.productName}</a>
												<c:if test="${memOrderNum.option1value !=null}">
													<p
														style="margin-left: 130px; font-size: 11px; width: 200px; margin-bottom: 5px;">${memOrderNum.option1Name}
														: ${memOrderNum.option1value}</p>
												</c:if>
												<c:if test="${memOrderNum.option2value !=null}">
													<p
														style="margin-left: 130px; font-size: 11px; width: 200px; margin-bottom: 5px;">${memOrderNum.option2Name}
														: ${memOrderNum.option2value}</p>
												</c:if>

											</div>
										</th>
										<th
											style="text-align: center; font-size: 13px; border: 1px solid #eeeeee; font-weight: normal;">${memOrderNum.productCnt}</th>
										<th
											style="text-align: center; font-size: 13px; border: 1px solid #eeeeee; font-weight: normal;"><fmt:formatNumber
														pattern="###,###,###" value="${memOrderNum.productPrice}"/>원</th>
										<th
											style="text-align: center; height: 120px; font-size: 12px; border-bottom: 1px solid #eeeeee;"><ins
												onclick="location='#'" id="now-state"
												style="color: red; font-size: 12px;">
												${memOrderNum.deliveryStatus}<br>
											</ins> <c:choose>
												<c:when test="${memOrderNum.purchaseConfirm =='구매확정(미)'}">

													<form>
														<input type="button" name="purchaseConfirm"
															style="font-size: 12px; width: 110px; border: none; cursor: pointer; background-color: #7e9c8c; margin-bottom: 5px; color: white;"
															class="confirmation"
															onclick="confirmOrderConfirm(this.form)" value="구매확정">
														<input type="hidden" id="memOrderSeqNum"
															name="memOrderSeqNum"
															value="${memOrderNum.memOrderSeqNum}" />
													</form>
													<c:choose>
														<c:when test="${memOrderNum.returnConfirm == '반품신청(미)'}">
															<input type="button"
																style="font-size: 12px; width: 110px; background-color: white; border: 1px solid #eeeeee; cursor: pointer; margin-bottom: 5px; color: gray;"
																onclick="location.href='${contextPath}/mypage/returnWrite.do?&productNum=${memOrderNum.productNum}&memOrderSeqNum=${memOrderNum.memOrderSeqNum}'"
																value="반품신청">
														</c:when>
														<c:when test="${memOrderNum.returnConfirm == '반품신청(완)'}">
															<input type="button"
																style="font-size: 12px; width: 110px; background-color: white; border: 1px solid #eeeeee; cursor: pointer; margin-bottom: 5px; color: gray;"
																onclick="returnConfirmResult()" value="반품신청">
														</c:when>
													</c:choose>
												</c:when>
												<c:when test="${memOrderNum.purchaseConfirm =='구매확정(완)'}">


													<c:choose>
														<c:when test="${memOrderNum.reviewConfirm == '리뷰작성(미)'}">
															<input type="button" name="reviewConfirm"
																style="font-size: 12px; width: 110px; border: none; background-color: #7e9c8c; margin-bottom: 5px; cursor: pointer; color: white;"
																id="pressbtn1" class="confirmation"
																onclick="location.href='${contextPath}/mypage/reviewWrite.do?productNum=${memOrderNum.productNum}&memOrderSeqNum=${memOrderNum.memOrderSeqNum}'"
																value="리뷰작성">
														</c:when>
														<c:when test="${memOrderNum.reviewConfirm == '리뷰작성(완)'}">
															<input type="button" name="reviewConfirm"
																style="font-size: 12px; width: 110px; border: none; background-color: #7e9c8c; margin-bottom: 5px; cursor: pointer; color: white;"
																id="pressbtn1" class="confirmation"
																onclick="reviewConfirmResult()" value="리뷰작성">
														</c:when>
													</c:choose>
												</c:when>
											</c:choose>
									</tr>
								</c:forEach>
								<tr height="100" style="border-bottom:1px solid #eeeeee;">
									<th colspan="2"
										style="padding-left: 10px; padding-bottom: 15px;">
										<div style="font-size: 14px;">주문자 정보</div>
										<div style="font-size: 11px;">
											<a>이름 :</a> <a>${memOrderSeqNum.memName}</a>
										</div>
										<div style="font-size: 11px;">
											<a>주소 :</a> <a>${memOrderSeqNum.memAdr}</a>
										</div>
										<div style="font-size: 11px;">
											<a>연락처 :</a> <a>${memOrderSeqNum.memPhoneNum}</a>
										</div>
									</th>
									<th colspan="4" style="padding-left: 10px; border-left:1px solid #eeeeee;">
										<div style="font-size: 14px;">배송 정보</div>
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

									</th>
								</tr>
							</tbody>
						</table>
										<div style=" float: right; font-size: 15px; color:#7e9c8c; font-weight:bold;">
											<a>총결제금액 :</a> <a style="margin-right:5px;"><fmt:formatNumber
														pattern="###,###,###" value="${memOrderSeqNum.totalPrice}" />원</a>
										</div>
						<div align="center" id="btn_modify_reset"
							style="padding-top: 10px">
							<input type="button" value="목 록"
								onclick="location.href='${contextPath}/mypage_04.do'"
								style=" width: 104px; height: 34px;  background-color: #7e9c8c; font-size:13px; border:none; border-redius:2px; color: white; margin-left: 200px; margin-top: 30px;">
						</div>
					</div>
				</div>
				<!-- 내용 -->
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