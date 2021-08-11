<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<script>
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	function Review_write() {
		var form = document.asCenterForm;

		if (form.productReviewTitle.value == "") {
			alert("제목을 입력해주세요")
			form.productReviewTitle.focus();
			return false;
		}

		if (form.productContent.value == "") {
			alert("글 내용을 입력해주세요")
			document.form.productContent.focus();
			return false;
		}

		form.submit();

	}

	function Review_modify(obj) {

		obj.action = "${contextPath}/mypage/modNewReview.do?reviewNum=${reviewNum.reviewNum}";
		obj.submit();

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
	align-items: top;
	float: center;
	margin-bottom: 10;
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
<title>상품리뷰</title>
<body>
	<!-- 타이틀 -->
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
			<!-- 타이틀 끝 -->
			<!-- 최근 본 상품 -->
			<jsp:include page="/WEB-INF/views/common/quick.jsp" flush="false" />
			

			<!-- Left Menu -->
			<jsp:include page="/WEB-INF/views/common/mypage_sidemenu.jsp"
				flush="false" />
			<!-- left Menu 끝-->



			<!-- 내용 -->
			<form name="reviewForm"
				action="${contextPath}/mypage/addNewReview.do" method="post"
				enctype="multipart/form-data">
				<div class="container2"
					style="padding-left: 300px; padding-top: 30px;">
					<c:choose>
						<c:when test="${!empty reviewNum}">
							<div id="MyPage_top">
								<table
									style="width: 660px; height: 40px; align: center; padding-top: 10px;">
									<tbody id="MyPage_center3">
										<tr>
											<th
												style="font-size: 18px; font-weight: bold; padding-bottom: 30px;"
												colspan="4">상품리뷰 수정하기</th>
										</tr>
									</tbody>
								</table>
							</div>
							<div id="MyPage_top">
								<table border="1"
									style="width: 980px; height: 180px; align: center;">
									<tbody id="MyPage_center2">
										<tr height="30%"
											style="background-color: #212529; color: white;">
											<th
												style="font-size: 15px; text-align: center; border-left: 0;"
												width="100" height="40"
												style="background-color: #212529; color: white;">주문일자</th>
											<th style="font-size: 15px; text-align: center;" width="250"
												style="background-color: #212529; color: white;">상품명</th>
											<th style="font-size: 15px; text-align: center;" width="70"
												style="background-color: #212529; color: white;">수량</th>
											<th style="font-size: 15px; text-align: center;" width="110"
												style="background-color: #212529; color: white;">금액</th>
										</tr>
										<tr height="80%">
											<th style="text-align: center;"><fmt:formatDate
													value="${reviewNum.memOrderDate}" /></th>
											<th style="padding: 10px; text-align: left;"
												onClick="location.href='Product-02'">
												<div>

													<img
														src="${contextPath}/download_product.do?productNum=${reviewNum.productNum}&productImage=${reviewNum.productImage}"
														width="110" height="110" style="float: left;"> <a
														style="margin-left: 30px;">${reviewNum.productName}</a>
													<c:if test="${reviewNum.option1value !=null}">
														<p style="margin-left: 140px; font-size: 13px;">${reviewNum.option1Name} :
															${reviewNum.option1value}</p>
													</c:if>
													<c:if test="${reviewNum.option2value !=null}">
														<p style="margin-left: 140px; font-size: 13px;">${reviewNum.option2Name} :
															${reviewNum.option2value}</p>
													</c:if>
												</div>

											</th>
											<th style="text-align: center;">${reviewNum.productCnt}</th>
											<th style="text-align: center;">${reviewNum.productPrice}</th>
										</tr>
									</tbody>
								</table>
							</div>
							<br>
							<div id="MyPage_top">
								<table border="1"
									style="width: 980px; height: 200px; align: center;">
									<tbody id="MyPage_center2">
										<tr height="20%">
											<th
												style="font-size: 15px; text-align: center; background-color: #212529; color: white;"
												width="100">작성자</th>
											<th style="padding: 10px"><input type="text"
												value="${reviewNum.memName}" disabled /></th>
										</tr>
										<tr>
											<th
												style="font-size: 15px; text-align: center; background-color: #212529; color: white;"
												width="100">제목</th>
											<th style="padding: 10px"><input type="text"
												value="${reviewNum.productReviewTitle}"
												style="width: 300px;" name="productReviewTitle" /></th>
										</tr>
										<tr height="90%">
											<th
												style="font-size: 15px; background-color: #212529; color: white; text-align: center; height: 300px;"
												width="100">내용</th>
											<th><input type="text" name="productContent"
												value="${reviewNum.productContent}"
												style="padding: 10px; width: 900px; height: 300px; border: none;">
											</th>
										</tr>
										<tr>
											<th
												style="font-size: 15px; background-color: #212529; color: white; text-align: center; height: 300px;"
												width="100">파일첨부</th>
											<td style="background-color: white; height: 50px;"><a
												style="float: left;">기존파일:${reviewNum.reviewFile}</a> <input
												type="hidden" name="OrignReviewFile"
												value="${reviewNum.reviewFile}" /> <br> <input
												type="file" style="float: left;" onchange="readURL(this);"
												name="reviewFile" style="padding-top: 25px; float: left;"><img
												id="preview" style="float: right;"
												src="${contextPath}/download_review.do?reviewNum=${reviewNum.reviewNum}&reviewFile=${reviewNum.reviewFile}"
												width="150" height="150" /></td>

										</tr>

									</tbody>
								</table>

								<div align="center" id="btn_modify_reset"
									style="padding-top: 30px; float: left; width: 900px; padding-left: 90px;">
									<input type="button" value="등록"
										onclick="Review_modify(this.form)"
										style="width: 80px; background-color: #212529; color: white; margin-left: 300px; float: left; margin-right: 10px; cursor: pointer;">
									<input type="button" name="return_MyPage_07" value="취소"
										onclick="location.href='/MyPage-07'"
										style="width: 80px; background-color: #212529; color: white; float: left; cursor: pointer;">
								</div>

							</div>
						</c:when>
						<c:when test="${empty reviewNum}">
							<div id="MyPage_top">
								<table
									style="width: 660px; height: 40px; align: center; padding-top: 10px;">
									<tbody id="MyPage_center3">
										<tr>
											<th
												style="font-size: 18px; font-weight: bold; padding-bottom: 30px;"
												colspan="4">상품리뷰 글쓰기</th>
										</tr>
									</tbody>
								</table>
							</div>
							<div id="MyPage_top">
								<table border="1"
									style="width: 980px; height: 180px; align: center;">
									<tbody id="MyPage_center2">
										<tr height="30%"
											style="background-color: #212529; color: white;">
											<th
												style="font-size: 15px; text-align: center; border-left: 0;"
												width="100" height="40"
												style="background-color: #212529; color: white;">주문일자</th>
											<th style="font-size: 15px; text-align: center;" width="250"
												style="background-color: #212529; color: white;">상품명</th>
											<th style="font-size: 15px; text-align: center;" width="70"
												style="background-color: #212529; color: white;">수량</th>
											<th style="font-size: 15px; text-align: center;" width="110"
												style="background-color: #212529; color: white;">금액</th>
										</tr>
										<tr height="80%">
											<th style="text-align: center;"><fmt:formatDate
													value="${mypageVO.memOrderDate}" /></th>
											<th style="padding: 10px; text-align: left;"
												onClick="location.href='${contextPath}/product/viewProduct.do?productNum=${mypageVO.productNum}'">
												<div>

													<img
														src="${contextPath}/download_product.do?productNum=${mypageVO.productNum}&productImage=${mypageVO.productImage}"
														width="110" height="110" style="float: left;"> <a
														style="margin-left: 30px;">${mypageVO.productName}</a>
													<c:if test="${mypageVO.option1value !=null}">
														<p style="margin-left: 140px; font-size: 13px;">${mypageVO.option1Name} :
															${mypageVO.option1value}</p>
													</c:if>
													<c:if test="${mypageVO.option2value !=null}">
														<p style="margin-left: 140px; font-size: 13px;">${mypageVO.option2Name} :
															${mypageVO.option2value}</p>
													</c:if>
												</div>

											</th>
											<th style="text-align: center;">${mypageVO.productCnt}</th>
											<th style="text-align: center;">${mypageVO.productPrice}</th>
										</tr>
									</tbody>
								</table>
							</div>
							<br>

							<div id="MyPage_top">
								<table border="1"
									style="width: 980px; height: 200px; align: center;">
									<tbody id="MyPage_center2">
										<tr height="20%">
											<th
												style="font-size: 15px; text-align: center; background-color: #212529; color: white;"
												width="100">작성자</th>
											<th style="padding: 10px"><input type="text"
												value="${memName}" disabled /></th>
										</tr>
										<tr>
											<th
												style="font-size: 15px; text-align: center; background-color: #212529; color: white;"
												width="100">제목</th>
											<th style="padding: 10px"><input type="text"
												style="width: 300px;" name="productReviewTitle" /></th>
										</tr>
										<tr height="90%">
											<th
												style="font-size: 15px; background-color: #212529; color: white; text-align: center; height: 300px;"
												width="100">내용</th>
											<th><input type="text" name="productContent"
												style="padding: 10px; width: 900px; height: 300px; border: none;">
											</th>
										</tr>
										<tr>
											<th
												style="font-size: 15px; background-color: #212529; color: white; text-align: center; height: 300px;"
												width="100">파일첨부</th>
											<td style="background-color: white; height: 50px;"><input
												type="file" onchange="readURL(this);" name="reviewFile"
												style="padding-top: 25px; float: left;"><img
												id="preview" style="float: right;"
												src="${contextPath}/resources/images/simpleLogo.jpg"
												width="150" height="150" /></td>

										</tr>

									</tbody>
								</table>

								<div align="center" id="btn_modify_reset"
									style="padding-top: 30px; float: left; width: 900px; padding-left: 90px;">
									<input type="submit" value="등록" onclick="Review_write()"
										style="width: 80px; background-color: #212529; color: white; margin-left: 300px; float: left; margin-right: 10px; cursor: pointer;">
									<input type="button" value="취소"
										onclick="location.href='${contextPath}/mypage_04.do'"
										style="width: 80px; background-color: #212529; color: white; float: left; cursor: pointer;">
								</div>

							</div>
						</c:when>
					</c:choose>
				</div>
			</form>
			<!-- 내용 끝 -->


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

</body>
</html>