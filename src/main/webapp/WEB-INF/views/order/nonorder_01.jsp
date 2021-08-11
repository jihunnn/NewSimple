<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>







<style type="text/css">
.table-light {
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
<script type="text/javascript">
	//주문자
	function Check_Order() {
		var form = document.CheckOrder;

		if (form.user_name.value == "") {
			alert("주문자정보의 이름을 입력하지 않았습니다.")
			form.user_name.focus();
			return false;
		}

		if (form.address1.value == "") {
			alert("주문자정보의 주소를 입력하지 않았습니다.")
			form.address1.focus();
			return false;
		}
		if (form.phone1.value == "") {
			alert("주문자정보의 연락처를 입력하지 않았습니다.")
			form.phone1.focus();
			return false;
		}

		if (form.phone2.value == "") {
			alert("주문자정보의 연락처를 입력하지 않았습니다.")
			form.phone2.focus();
			return false;
		}

		for (var i = 0; i < form.phone2.value.length; i++) {
			ch = form.phone2.value.charAt(i)
			if (!(ch >= '0' && ch <= '9')) {
				alert("주문자정보의 연락처는 숫자만 입력가능합니다.")
				form.phone2.focus();
				form.phone2.select();
				return false;
			}
		}
		if (form.phone3.value == "") {
			alert("주문자정보의 연락처를 입력하지 않았습니다.")
			form.phone3.focus();
			return false;
		}
		for (var i = 0; i < form.phone3.value.length; i++) {
			ch = form.phone3.value.charAt(i)
			if (!(ch >= '0' && ch <= '9')) {
				alert("주문자정보의 연락처는 숫자만 입력가능합니다.")
				form.phone3.focus();
				form.phone3.select();
				return false;
			}
		}
		if (form.user_SpName.value == "") {
			alert("배송정보의 이름을 입력하지 않았습니다.")
			form.user_Spname.focus();
			return false;
		}

		if (form.address1_1.value == "") {
			alert("배송정보의 주소를 입력하지 않았습니다.")
			form.addr1.focus();
			return false;
		}
		if (form.phone1_Sp.value == "") {
			alert("배송정보의 연락처1을 입력하지 않았습니다.")
			form.phone1_Sp.focus();
			return false;
		}
		if (form.phone2_Sp.value == "") {
			alert("배송정보의 연락처1을 입력하지 않았습니다.")
			form.phone2_Sp.focus();
			return false;
		}

		for (var i = 0; i < form.phone2_Sp.value.length; i++) {
			ch = form.phone2_Sp.value.charAt(i)
			if (!(ch >= '0' && ch <= '9')) {
				alert("배송정보의 연락처1은 숫자만 입력가능합니다.")
				form.phone2_Sp.focus();
				form.phone2_Sp.select();
				return false;
			}
		}
		if (form.phone3_Sp.value == "") {
			alert("배송정보의 연락처1을 입력하지 않았습니다.")
			form.phone3_Sp.focus();
			return false;
		}
		for (var i = 0; i < form.phone3_Sp.value.length; i++) {
			ch = form.phone3_Sp.value.charAt(i)
			if (!(ch >= '0' && ch <= '9')) {
				alert("배송정보의 연락처1은 숫자만 입력가능합니다.")
				form.phone3_Sp.focus();
				form.phone3_Sp.select();
				return false;
			}
		}

		form.submit();

	}

	function sameInfo(f) {
		f.nonmemSpName.value = f.nonmemName.value;
		f.nonmemSpAdr.value = f.nonmemAdr.value;
		f.nonmemSpAdr1.value = f.nonmemAdr1.value;
		f.nonmemSpAdr2.value = f.nonmemAdr2.value;
		f.nonmemSpPhoneNum1_0.value = f.nonmemPhoneNum.value;
		f.nonmemSpPhoneNum1_1.value = f.nonmemPhoneNum1.value;
		f.nonmemSpPhoneNum1_2.value = f.nonmemPhoneNum2.value;
	}

	$("input[type=radio]").click(function() {
		$(this).prop("checked", true);
		$("form").submit();
	})
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//비회원 주문자 우편번호
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode_nonmember').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address_nonmember').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2_nonmember')
								.focus();
					}
				}).open();
	}

	//배송지 우편번호
	function sample6_execDaumPostcode2() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode1').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address_1').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2_1').focus();
					}
				}).open();
	}
</script>
</head>
<title>주문결제창</title>
<body>





	<!-- 타이틀 -->

	<section class="ftco-section" style="padding-top: 100px;">

		<div class="container">

			<form name="CheckOrder" action="${contextPath}/addorderlist.do"
				method="post">

				<!-- 타이틀 끝 -->



				<div style="font-size: 25px; font-weight: bold;">
					<a style="color: #7e9c8c;">주문리스트</a>
				</div>

				<!-- 최근 본 상품 -->
				<div id="recentlyProduct"
					style="position: absolute; width: 120px; height: 310px; margin-left: 1370px; border: 1px solid #d2d2d2; margin-top: 0px;">
					<ul
						style="list-style: none; margin-top: 10px; padding-left: 20px; margin-bottom: 10px;">
						<li><a href="#"
							style="padding-left: -10px; padding-bottom: 1px; color: black;">최근본상품</a></li>
					</ul>
					<hr style="margin-top: 0px; margin-bottom: 0px; color: #d2d2d2;">
					<ul style="list-style: none; padding-top: 5px;">
						<li><a href="#"><img
								src="${contextPath}/resources/images/image_1.jpg"
								style="width: 100px; height: 100px; padding-top: 10px; margin-left: -30px;"></a></li>
						<li><a href="#"><img
								src="${contextPath}/resources/images/image_2.jpg"
								style="width: 100px; height: 100px; padding-top: 10px; padding-top: 10px; margin-left: -30px;"></a></li>
					</ul>
					<hr style="margin-top: 0px; margin-bottom: 0px; color: #d2d2d2;">
					<ul
						style="list-style: none; padding-left: 30px; margin-bottom: 10px; margin-top: 8px;">
						<li><a href="#"
							style="color: black; text-align: center; margin-top: 8px; padding-top: 30px;">더보기▼</a></li>
					</ul>
				</div>
				<!-- 최근본상품끝 -->







				<div class="order_list text-center">
					<table class="table" style="font-size: 13px;">


						<thead class="table-dark">
							<tr
								style="background-color: #eeeeee; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #c6c8ca; font-size: 15px;">

								<th scope="col" width="150"></th>
								<th scope="col">상품명</th>
								<th scope="col" width="250">옵션</th>
								<th scope="col" width="100">수량</th>
								<th scope="col" width="80">배송비</th>
								<th scope="col" width="150">가격</th>
							</tr>
						</thead>
						<c:choose>
							<c:when test="${nonMemOrder == null}">
								<c:forEach items="${orderlist}" var="orderlist"
									varStatus="status">
									<tbody>
										<tr class="tr1"
											style="border-bottom: 1px solid rgba(0, 0, 0, 0.1);">
											<th scope="col" style="vertical-align: middle;"><img
												src="${contextPath}/download_product.do?productNum=${orderlist.productNum}&productImage=${orderlist.productImage}"
												width=80 height=80></th>
											<th scope="col" style="vertical-align: middle;">${orderlist.productName}</th>
											<th scope="col"
												style="text-align: left; vertical-align: middle;">${orderlist.option1name}
												: ${orderlist.option1value}<br>${orderlist.option2name}
												: ${orderlist.option2value}
											</th>
											<th scope="col" style="vertical-align: middle;">${orderlist.productCnt}개</th>
											<th scope="col" style="vertical-align: middle;">${orderlist.deliverycharge}</th>
											<th scope="col" style="vertical-align: middle;">${orderlist.productPrice}원</th>
										</tr>
									</tbody>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tbody>
									<tr class="tr1"
										style="border-bottom: 1px solid rgba(0, 0, 0, 0.1);">
										<th scope="col" style="vertical-align: middle;"><img
											src="${contextPath}/download_product.do?productNum=${nonMemOrder.productNum}&productImage=${nonMemOrder.productImage}"
											width=80 height=80></th>
										<th scope="col" style="vertical-align: middle;">${nonMemOrder.productName}</th>
										<th scope="col"
											style="text-align: left; vertical-align: middle;">${nonMemOrder.option1name}
											: ${nonMemOrder.option1value}<br>${nonMemOrder.option2name}
											: ${nonMemOrder.option2value}
										</th>
										<th scope="col" style="vertical-align: middle;">${nonMemOrder.productCnt}개</th>
										<th scope="col" style="vertical-align: middle;">${nonMemOrder.deliverycharge}</th>
										<th scope="col" style="vertical-align: middle;">${nonMemOrder.productPrice}원</th>
									</tr>
								</tbody>
							</c:otherwise>
						</c:choose>
					</table>
					<c:choose>
						<c:when test="${nonMemOrder == null}">
							<div style="font-size: 18px; float: right;">
								<span>총금액ㅤ</span><a style="color: #7e9c8c; font-weight: bold;">${totalPrice}원</a>
												<input type="hidden" name="totalPrice" value="${totalPrice}" />
							</div>
						</c:when>
						<c:otherwise>
							<div style="font-size: 18px; float: right;">
								<span>총금액ㅤ</span><a style="color: #7e9c8c; font-weight: bold;">${nonMemOrder.totalPrice}원</a>
												<input type="hidden" name="totalPrice" value="${nonMemOrder.totalPrice}" />
												
		
							</div>
						</c:otherwise>
					</c:choose>
				</div>



				<div style="font-size: 25px; font-weight: bold; margin-top: 70px;">
					<a style="color: #7e9c8c; margin-top: 40px;">주문자정보</a>
				</div>
				<div class="order_list">
					<table class="table">
						<colgroup>
							<col width="20%" />
						</colgroup>
						<tbody>
							<tr
								style="border-bottom: 1px solid #eeeeee; border-top: 1px solid rgba(0, 0, 0, 0.1);">
								<th scope="col"><a
									style="color: red; padding-right: 5px; write-space: nowrap;">*</a>이름</th>
								<th scope="col"><input type="text" name="nonmemName"
									value=""
									style="font-size: 14px; border: 1px solid #dcdcdc; width: 326px; height: 36px;"></th>
							</tr>
							<tr style="border-bottom: 1px solid #eeeeee;">
								<th scope="col"><a
									style="color: red; padding-right: 5px; write-space: nowrap;">*</a>주소</th>
								<th scope="col"><input type="text" name="nonmemAdr"
									value="" id="sample6_postcode_nonmember"
									style="font-size: 14px; border: 1px solid #dcdcdc; width: 211px; height: 36px;">&nbsp;&nbsp;&nbsp;&nbsp;<input
									type="button" onclick="sample6_execDaumPostcode()"
									value="우편번호 찾기"
									style="font-size: 14px; border: none; background-color: #c6c6c6; color: white; width: 100px; height: 37px;">
									&nbsp;&nbsp;&nbsp;

									<p>
										<br> <input type="text" name="nonmemAdr1" value=""
											id="sample6_address_nonmember"
											style="font-size: 14px; border: 1px solid #dcdcdc; width: 326px; height: 36px;">
									</p>
									<p>
										<input type="text" name="nonmemAdr2"
											id="sample6_address2_nonmember" value=""
											style="font-size: 14px; border: 1px solid #dcdcdc; width: 326px; height: 36px;">
									</p></th>
							</tr>
							<tr style="border-bottom: 1px solid rgba(0, 0, 0, 0.1);">
								<th scope="col"><a
									style="color: red; padding-right: 5px; write-space: nowrap;">*</a>연락처</th>
								<th scope="col"><select name="nonmemPhoneNum"
									style="width: 80px; font-size: 14px; border: 1px solid #dcdcdc; height: 36px;">
										<option value="">선택</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
										<option value="010">010</option>
								</select> - <input type="text" name="nonmemPhoneNum1" value=""
									style="width: 109px; font-size: 14px; border: 1px solid #dcdcdc; height: 36px;">
									- <input type="text" name="nonmemPhoneNum2" value=""
									style="width: 109px; font-size: 14px; border: 1px solid #dcdcdc; height: 36px;"></th>
							</tr>
						</tbody>
					</table>
				</div>
				<div style="font-size: 25px; margin-top: 40px; font-weight: bold;">
					<a style="color: #7e9c8c;">배송정보</a>
				</div>
				<a style="font-size: 14px;">주문자 정보와 동일</a><input type="checkbox"
					name="same" onclick="sameInfo(document.CheckOrder)">
				<div class="order_list">
					<table class="table">
						<colgroup>
							<col width="20%" />
						</colgroup>
						<tbody>
							<tr
								style="border-bottom: 1px solid #eeeeee; border-top: 1px solid rgba(0, 0, 0, 0.1);">
								<th scope="col"><a
									style="color: red; padding-right: 5px; write-space: nowrap;">*</a>이름</th>
								<th scope="col"><input type="text" name="nonmemSpName"
									value=""
									style="font-size: 14px; width: 326px; border: 1px solid #dcdcdc; height: 36px;"></th>
							</tr>
							<tr style="border-bottom: 1px solid #eeeeee;">
								<th scope="col"><a
									style="color: red; padding-right: 5px; write-space: nowrap;">*</a>주소</th>
								<th scope="col"><input type="text" name="nonmemSpAdr"
									value="" id="sample6_postcode1" readonly
									style="font-size: 14px; width: 211px; border: 1px solid #dcdcdc; height: 36px;">&nbsp;&nbsp;&nbsp;
									<input type="button" onclick="sample6_execDaumPostcode2()"
									value="우편번호 찾기"
									style="font-size: 14px; border: none; background-color: #c6c6c6; color: white; width: 100px; height: 37px;">
									<p>
										<br> <input type="text" name="nonmemSpAdr1" value=""
											id="sample6_address_1" readonly
											style="width: 325px; font-size: 14px; border: 1px solid #dcdcdc; height: 36px;">

									</p>
									<p>
										<input type="text" name="nonmemSpAdr2" id="sample6_address2_1"
											value=""
											style="width: 325px; font-size: 14px; border: 1px solid #dcdcdc; height: 36px;">

									</p></th>
							</tr>
							<tr style="border-bottom: 1px solid #eeeeee;">
								<th scope="col"><a
									style="color: red; padding-right: 5px; write-space: nowrap;">*</a>연락처1</th>
								<th scope="col"><select name="nonmemSpPhoneNum1_0"
									style="width: 80px; font-size: 14px; border: 1px solid #dcdcdc; height: 36px;">
										<option value=""></option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
										<option value="010">010</option>
								</select> - <input type="text" name="nonmemSpPhoneNum1_1" value=""
									style="width: 109px; font-size: 14px; border: 1px solid #dcdcdc; height: 36px;">
									- <input type="text" name="nonmemSpPhoneNum1_2" value=""
									style="width: 109px; font-size: 14px; border: 1px solid #dcdcdc; height: 36px;"></th>
							</tr>
							<tr style="border-bottom: 1px solid #eeeeee;">
								<th scope="col" style="padding-left: 23px;">연락처2</th>
								<th scope="col"><select name="nonmemSpPhoneNum2_0"
									style="width: 80px; font-size: 14px; border: 1px solid #dcdcdc; height: 36px;">
										<option value="">선택</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
										<option value="010">010</option>
								</select> - <input type="text" name="nonmemSpPhoneNum2_1"
									style="width: 109px; font-size: 14px; border: 1px solid #dcdcdc; height: 36px;">
									- <input type="text" name="nonmemSpPhoneNum2_2"
									style="width: 109px; font-size: 14px; border: 1px solid #dcdcdc; height: 36px;"></th>
							</tr>
							<tr style="border-bottom: 1px solid #eeeeee;">
								<th scope="col"
									style="padding-bottom: 50px; padding-left: 23px;"><br>주문메세지<br>(100자내외)</th>
								<th scope="col"><input type="text" name="nonmemOrderMsg"
									style="width: 327px; height: 175px; border: 1px solid #dcdcdc;"></th>
							</tr>
							<tr style="border-bottom: 1px solid rgba(0, 0, 0, 0.1);">
								<th scope="col" style="padding-left: 23px;">무통장 입금자명</th>
								<th scope="col"><input name="nonmemDepositorName"
									type="text" value=""
									style="font-size: 14px; border: 1px solid #dcdcdc; height: 36px; width: 326px;"><a
									style="font-size: 14px; color: color:#b3b3b3;">ㅤ(무통장 입금 시
										입력)</a></th>
							</tr>
						</tbody>
					</table>
				</div>

				<div style="font-size: 25px; font-weight: bold;">
					<a style="color: #7e9c8c; margin-top: 40px;">결제정보</a>
				</div>
				<div class="order_list">
					<table class="table" style="font-size: 14px;">
						<colgroup>
							<col width="20%" />
						</colgroup>
						<tbody>
							<tr
								style="border-top: 1px solid rgba(0, 0, 0, 0.1); border-bottom: 1px solid #eeeeee;">
								<th scope="col"><a
									style="color: red; padding-right: 5px; write-space: nowrap;">*</a>결제방법</th>
								<th scope="col"><input type="radio"
									name="nonmemPaymentMethod" value="카드결제">신용/체크카드&nbsp;&nbsp;&nbsp;
									<input type="radio" name="nonmemPaymentMethod" value="무통장입금">무통장입금&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="nonmemPaymentMethod" value="휴대폰결제">휴대폰결제</th>
							</tr>
							<tr style="border-bottom: 1px solid rgba(0, 0, 0, 0.1);">
								<th scope="col" style="padding-left: 23px;">카드선택</th>
								<th scope="col"><select id="month"
									style="width: 326px; font-size: 14px; border: 1px solid #dcdcdc; height: 36px;">
										<option value="현대카드">현대카드</option>
										<option value="국민카드">국민카드</option>
										<option value="농협카드">농협카드</option>
										<option value="비씨카드">BC카드</option>
										<option value="우리카드">우리카드</option>
										<option value="신한카드">신한카드</option>
								</select></th>

							</tr>

						</tbody>
					</table>
				</div>
				<br> <br>

				<div style="text-align: center">
					<button type="submit" class="btn btn-secondary"
						onclick="Check_Order()"
						style="padding-left: 10px; margin-left: 40px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 130px; height: 45px;">결제하기</button>
					&nbsp;&nbsp;
					<button type="button" class="btn btn-secondary"
						onclick="location.href='/cart'"
						style="padding-left: 10px; background-color: white; color: #7e9c8c; border: 1px solid #7e9c8c; border-radius: 2px; width: 130px; height: 45px;">취소하기</button>
				</div>
				<br> <br>
			</form>
		</div>
	</section>

</body>
</html>









