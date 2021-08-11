<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>


<script type="text/javascript">
	function openDropout(Dropout_no) {
		window.name = "parentForm";
		window.open("OpenDropOut" + Dropout_no, "Dropout",
				"width=570, height=350,resizable=no,scrollbars=no");
	}
	$(document).ready(function() {
		var returnType = jQuery('#returnType').val();
		$('#returnType1').val(returnType).prop("selected", true);
	});

	$(document).on('click', '#returnBtn', function() {
		document.getElementById("returnContent1").disabled = false;
		document.getElementById("returnType1").disabled = false;
		document.getElementById("tr_btn_modify").style.display = "block";
		document.getElementById("tr_btn").style.display = "none";
	});
	
    function returnNewModify(obj){
	    obj.action="${contextPath}/mypage/modNewReturn.do?returnNum=${returnNum.returnNum}";
	    obj.submit();
     }
    
    function returnRemove(){
	    location.href="${contextPath}/mypage/removeReturn.do?returnNum=${returnNum.returnNum}&memOrderSeqNum=${returnNum.memOrderSeqNum}";
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
<title>주문결제창</title>
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
			<div class="container2"
				style="padding-left: 300px; padding-top: 30px;">
				<form name="returnForm"
					action="${contextPath}/mypage/addNewReturn.do" method="post">
					<c:choose>
						<c:when test="${!empty returnNum}">
							<div id="MyPage_top">
								<table
									style="width: 660px; height: 40px; align: center; padding-top: 10px;">
									<tbody id="MyPage_center3">
										<tr>
											<th
												style="font-size: 18px; font-weight: bold; padding-bottom: 30px;"
												colspan="4">취소/반품신청 상세보기</th>
										</tr>
									</tbody>
								</table>
							</div>

							<div id="MyPage_top">
								<table border="1"
									style="width: 980px; height: 200px; align: center;">
									<tbody id="MyPage_center2">
										<tr height="20%">
											<th
												style="font-size: 15px; text-align: center; background-color: #212529; color: white;"
												width="100">사유</th>
											<th style="padding: 10px"><select id="returnType1" name="returnType"
												style="color: black; border: 1px solid black;" disabled>

													<option value="">선택</option>
													<option value="단순변심">단순변심</option>
													<option value="상품파손">상품파손</option>
													<option value="배송지연">배송지연</option>
													<option value="서비스불만족">서비스불만족</option>
													<option value="오배송">오배송</option>
													<option value="기타">기타</option>
											</select><input type="hidden" id="returnType"
												value="${returnNum.returnType}"></th>
										</tr>
										<tr height="90%">
											<th
												style="font-size: 15px; background-color: #212529; color: white; text-align: center; height: 300px;"
												width="100">내용</th>
											<th><input type="text" id="returnContent1" name="returnContent"
												value="${returnNum.returnContent}" disabled
												style="padding: 10px; width: 900px; height: 300px; border: none;">
												<input type="hidden" id="memOrderSeqNum1" name="memOrderSeqNum" value="${returnNum.memOrderSeqNum}"  />
												
											</th>
										</tr>

									</tbody>
								</table>

								<div align="center" id="tr_btn" 
									style="padding-top: 30px; float: left; width: 900px; padding-left: 90px;">
									<input type="button" value="수정"
										onclick="returnModify(this.form)" id="returnBtn"
										style="width: 80px; background-color: #212529; color: white; margin-left: 300px; float: left; margin-right: 10px; cursor: pointer;">
									<input type="button"  value="삭제"
										onclick="returnRemove(this.form)"
										style="width: 80px; background-color: #212529; color: white; float: left; cursor: pointer;">
								</div>
								<div align="center" id="tr_btn_modify"  style="display:none;
									padding-top: 30px; float: left; width: 900px; padding-left: 90px;">
									<input type="button" value="확인"
										onclick="returnNewModify(this.form)" id="returnBtn"
										style="width: 80px; background-color: #212529; color: white; margin-left: 300px; float: left; margin-right: 10px; cursor: pointer;">
									<input type="button"  value="취소"
										onclick="location.href='${contextPath}/mypage_07.do'"
										style="width: 80px; background-color: #212529; color: white; float: left; cursor: pointer;">
								</div>


							</div>
						</c:when>
						<c:when test="${empty returnNum}">
							<div id="MyPage_top">
								<table
									style="width: 660px; height: 40px; align: center; padding-top: 10px;">
									<tbody id="MyPage_center3">
										<tr>
											<th
												style="font-size: 18px; font-weight: bold; padding-bottom: 30px;"
												colspan="4">취소/반품신청</th>
										</tr>
									</tbody>
								</table>
							</div>

							<div id="MyPage_top">
								<table border="1"
									style="width: 980px; height: 200px; align: center;">
									<tbody id="MyPage_center2">
										<tr height="20%">
											<th
												style="font-size: 15px; text-align: center; background-color: #212529; color: white;"
												width="100">사유</th>
											<th style="padding: 10px"><select name="returnType"
												id="selcet1">
													<option value="">선택</option>
													<option value="단순변심">단순변심</option>
													<option value="상품파손">상품파손</option>
													<option value="배송지연">배송지연</option>
													<option value="서비스불만족">서비스불만족</option>
													<option value="오배송">오배송</option>
													<option value="기타">기타</option>
											</select></th>
										</tr>
										<tr height="90%">
											<th
												style="font-size: 15px; background-color: #212529; color: white; text-align: center; height: 300px;"
												width="100">내용</th>
											<th><input type="text" name="returnContent"
												style="padding: 10px; width: 900px; height: 300px; border: none;">
											</th>
										</tr>

									</tbody>
								</table>

								<div align="center" id="btn_modify_reset"
									style="padding-top: 30px; float: left; width: 900px; padding-left: 90px;">
									<input type="submit" value="신청" onclick=""
										style="width: 80px; background-color: #212529; color: white; margin-left: 300px; float: left; margin-right: 10px; cursor: pointer;">
									<input type="button" name="return_MyPage_07" value="취소"
										onclick="location.href='${contextPath}/mypage_07.do'"
										style="width: 80px; background-color: #212529; color: white; float: left; cursor: pointer;">
								</div>

							</div>
						</c:when>
					</c:choose>
				</form>

			</div>
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