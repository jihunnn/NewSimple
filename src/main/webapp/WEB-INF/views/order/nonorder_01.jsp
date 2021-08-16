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
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script type="text/javascript">
	//유효성검사 후 주문결제진행
	//PG사 연동(결제시스템 IMPORT)
	function iamport() {
		var IMP = window.IMP;
		var form = document.CheckOrder;

		if (form.nonMemName.value == "") {
			alert("주문자정보의 이름을 입력하지 않았습니다.")
			form.nonMemName.focus();
			return false;
		}
		if (form.nonmemAdr.value == "") {
			alert("주문자정보의 주소를 입력하지 않았습니다.")
			form.nonmemAdr.focus();
			return false;
		}
		if (form.nonmemAdr1.value == "") {
			alert("주문자정보의 주소를 입력하지 않았습니다.")
			form.nonmemAdr1.focus();
			return false;
		}
		if (form.nonmemAdr2.value == "") {
			alert("주문자정보의 주소를 입력하지 않았습니다.")
			form.nonmemAdr2.focus();
			return false;
		}
		if (form.nonmemPhoneNum.value == "") {
			alert("주문자정보의 연락처를 입력하지 않았습니다.")
			form.nonmemPhoneNum.focus();
			return false;
		}

		if (form.nonmemPhoneNum1.value == "") {
			alert("주문자정보의 연락처를 입력하지 않았습니다.")
			form.nonmemPhoneNum1.focus();
			return false;
		}
		for (var i = 0; i < form.nonmemPhoneNum1.value.length; i++) {
			ch = form.nonmemPhoneNum1.value.charAt(i)
			if (!(ch >= '0' && ch <= '9')) {
				alert("주문자정보의 연락처는 숫자만 입력가능합니다.")
				form.nonmemPhoneNum1.focus();
				form.nonmemPhoneNum1.select();
				return false;
			}
		}
		if (form.nonmemPhoneNum2.value == "") {
			alert("주문자정보의 연락처를 입력하지 않았습니다.")
			form.nonmemPhoneNum2.focus();
			return false;
		}
		for (var i = 0; i < form.nonmemPhoneNum2.value.length; i++) {
			ch = form.nonmemPhoneNum2.value.charAt(i)
			if (!(ch >= '0' && ch <= '9')) {
				alert("주문자정보의 연락처는 숫자만 입력가능합니다.")
				form.nonmemPhoneNum2.focus();
				form.nonmemPhoneNum2.select();
				return false;
			}
		}
		if (form.nonMemSpName.value == "") {
			alert("배송받는분 이름을 입력하지 않았습니다.")
			form.nonMemSpName.focus();
			return false;
		}
		if (form.nonMemSpAdr.value == "") {
			alert("배송지 주소를 입력하지 않았습니다.")
			form.nonMemSpAdr.focus();
			return false;
		}
		if (form.nonMemSpAdr1.value == "") {
			alert("배송지 주소를 입력하지 않았습니다.")
			form.nonMemSpAdr1.focus();
			return false;
		}
		if (form.nonMemSpAdr2.value == "") {
			alert("배송지 주소를 입력하지 않았습니다.")
			form.nonMemSpAdr2.focus();
			return false;
		}
		if (form.nonMemSpPhoneNum1_0.value == "") {
			alert("배송받는분 연락처를 입력하지 않았습니다.")
			form.nonMemSpPhoneNum1_0.focus();
			return false;
		}

		if (form.nonMemSpPhoneNum1_1.value == "") {
			alert("배송받는분 연락처를 입력하지 않았습니다.")
			form.nonMemSpPhoneNum1_1.focus();
			return false;
		}
		for (var i = 0; i < form.nonMemSpPhoneNum1_1.value.length; i++) {
			ch = form.nonMemSpPhoneNum1_1.value.charAt(i)
			if (!(ch >= '0' && ch <= '9')) {
				alert("배송받는분 연락처는 숫자만 입력가능합니다.")
				form.nonMemSpPhoneNum1_1.focus();
				form.nonMemSpPhoneNum1_1.select();
				return false;
			}
		}
		if (form.nonMemSpPhoneNum1_2.value == "") {
			alert("배송받는분 연락처를 입력하지 않았습니다.")
			form.nonMemSpPhoneNum1_2.focus();
			return false;
		}
		for (var i = 0; i < form.nonMemSpPhoneNum1_2.value.length; i++) {
			ch = form.nonMemSpPhoneNum1_2.value.charAt(i)
			if (!(ch >= '0' && ch <= '9')) {
				alert("배송받는분 연락처는 숫자만 입력가능합니다.")
				form.nonMemSpPhoneNum1_2.focus();
				form.nonMemSpPhoneNum1_2.select();
				return false;
			}
		}

		//가맹점 식별코드
	
		var payType = document.querySelector('input[name="nonMemPaymentMethod"]:checked').value;
		var paymentMethod = $("label[for='"+payType+"']").text();
		//var name :  document.querySelector("input[name=nonMemName]").value;
		//var phone : $('input[name=nonmemPhoneNum]').val();
		//var phone1 : $('input[name=nonmemPhoneNum1]').val();
		//var phone2 : $('input[name=nonmemPhoneNum2]').val();
		//var addr0 : $('input[name=nonmemAdr0]').val();
		//var addr1 : $('input[name=nonmemAdr1]').val();
		//var addr2 : $('input[name=nonmemAdr2]').val();
		
		
		var param = $("form[name=CheckOrder]").serialize();
		var merchant_uid = ${orderNum};		
		
		
		IMP.init('imp44341689');
		IMP.request_pay({
			pg : 'inicis',
			pay_method : payType,
			merchant_uid : merchant_uid,
			name : '(주)SIMPLE', //결제창에서 보여질 이름
			amount : ${totalPrice},
			buyer_email : 'Enter your Email',
			buyer_name : name
		}, function(rsp) {
			if (rsp.success) {		
				console.log(rsp);
				$.ajax({
					url : "verifyIamport.do",
					type : "POST",	
					data : {
						imp_uid : rsp.imp_uid,
						merchant_uid: rsp.merchant_uid
					}
				}).done(function(data){			
					console.log(data);
					if(rsp.paid_amount == data.response.amount) {		
						alert("결제 및 결제검증완료");
						var msg = '결제가 완료되었습니다.';
						msg += '고유ID : ' + rsp.imp_uid;
						msg += '상점 거래ID : ' + rsp.merchant_uid;
						msg += '결제 금액 : ' + rsp.paid_amount;
						msg += '카드 승인번호 : ' + rsp.apply_num;
						alert(msg);
						$.ajax({
							url : "${contextPath}/nonmemaddorderlist.do",
							type : "POST",
							data :	param, paymentMethod,  	
							success: function (data) {				                   
				                    alert("주문내용테이블입력완료");	
				                    location.href="${contextPath}/nonMemberOrderResult.do?Price=${totalPrice}&nonMemOrderNum=${orderNum}&paymentMethod="+paymentMethod;
				                }
						})					
					}else{
						alert("결제 실패")
						//아직제대로 결제가 되지 않았습니다.
						//결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
					}		
				});
				
				
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
	}
	
	function sameInfo(f) {
		f.nonMemSpName.value = f.nonMemName.value;
		f.nonMemSpAdr.value = f.nonmemAdr.value;
		f.nonMemSpAdr1.value = f.nonmemAdr1.value;
		f.nonMemSpAdr2.value = f.nonmemAdr2.value;
		f.nonMemSpPhoneNum1_0.value = f.nonmemPhoneNum.value;
		f.nonMemSpPhoneNum1_1.value = f.nonmemPhoneNum1.value;
		f.nonMemSpPhoneNum1_2.value = f.nonmemPhoneNum2.value;
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

			<form name="CheckOrder" action="" method="post">
				<input type="hidden" name="nonMemOrderNum" value="${orderNum}" />

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
								<th scope="col" width="100">합계</th>
							</tr>
						</thead>

						<c:if test="${orderlist != null && orderNow ==false}">
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
										<th scope="col" style="vertical-align: middle;">${orderlist.totalPrice}원</th>
									</tr>
								</tbody>
							</c:forEach>
						</c:if>
						<c:if test="${nonMemOrder != null && orderNow == true}">
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
									<th scope="col" style="vertical-align: middle;">${nonMemOrder.totalPrice}원</th>
								</tr>
							</tbody>
						</c:if>

					</table>
					<c:choose>
						<c:when test="${orderlist != null && orderNow == false}">
							<div style="font-size: 18px; float: right;">
								<span>총금액ㅤ</span><a style="color: #7e9c8c; font-weight: bold;">${totalPrice}원</a>
								<input type="hidden" name="totalPrice" value="${totalPrice}" />
							</div>
						</c:when>
						<c:otherwise>
							<div style="font-size: 18px; float: right;">
								<span>총금액ㅤ</span><a style="color: #7e9c8c; font-weight: bold;">${nonMemOrder.totalPrice}원</a>
								<input type="hidden" name="totalPrice"
									value="${nonMemOrder.totalPrice}" />


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
								<th scope="col"><input type="text" name="nonMemName"
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
								<th scope="col"><input type="text" name="nonMemSpName"
									value=""
									style="font-size: 14px; width: 326px; border: 1px solid #dcdcdc; height: 36px;"></th>
							</tr>
							<tr style="border-bottom: 1px solid #eeeeee;">
								<th scope="col"><a
									style="color: red; padding-right: 5px; write-space: nowrap;">*</a>주소</th>
								<th scope="col"><input type="text" name="nonMemSpAdr"
									value="" id="sample6_postcode1" readonly
									style="font-size: 14px; width: 211px; border: 1px solid #dcdcdc; height: 36px;">&nbsp;&nbsp;&nbsp;
									<input type="button" onclick="sample6_execDaumPostcode2()"
									value="우편번호 찾기"
									style="font-size: 14px; border: none; background-color: #c6c6c6; color: white; width: 100px; height: 37px;">
									<p>
										<br> <input type="text" name="nonMemSpAdr1" value=""
											id="sample6_address_1" readonly
											style="width: 325px; font-size: 14px; border: 1px solid #dcdcdc; height: 36px;">

									</p>
									<p>
										<input type="text" name="nonMemSpAdr2" id="sample6_address2_1"
											value=""
											style="width: 325px; font-size: 14px; border: 1px solid #dcdcdc; height: 36px;">

									</p></th>
							</tr>
							<tr style="border-bottom: 1px solid #eeeeee;">
								<th scope="col"><a
									style="color: red; padding-right: 5px; write-space: nowrap;">*</a>연락처1</th>
								<th scope="col"><select name="nonMemSpPhoneNum1_0"
									style="width: 80px; font-size: 14px; border: 1px solid #dcdcdc; height: 36px;">
										<option value=""></option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
										<option value="010">010</option>
								</select> - <input type="text" name="nonMemSpPhoneNum1_1" value=""
									style="width: 109px; font-size: 14px; border: 1px solid #dcdcdc; height: 36px;">
									- <input type="text" name="nonMemSpPhoneNum1_2" value=""
									style="width: 109px; font-size: 14px; border: 1px solid #dcdcdc; height: 36px;"></th>
							</tr>
							<tr style="border-bottom: 1px solid #eeeeee;">
								<th scope="col" style="padding-left: 23px;">연락처2</th>
								<th scope="col"><select name="nonMemSpPhoneNum2_0"
									style="width: 80px; font-size: 14px; border: 1px solid #dcdcdc; height: 36px;">
										<option value="">선택</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
										<option value="010">010</option>
								</select> - <input type="text" name="nonMemSpPhoneNum2_1"
									style="width: 109px; font-size: 14px; border: 1px solid #dcdcdc; height: 36px;">
									- <input type="text" name="nonMemSpPhoneNum2_2"
									style="width: 109px; font-size: 14px; border: 1px solid #dcdcdc; height: 36px;"></th>
							</tr>
							<tr style="border-bottom: 1px solid #eeeeee;">
								<th scope="col"
									style="padding-bottom: 50px; padding-left: 23px;"><br>주문메세지<br>(100자내외)</th>
								<th scope="col"><input type="text" name="nonMemOrderMsg"
									style="width: 327px; height: 175px; border: 1px solid #dcdcdc;"></th>
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
								<th scope="col"><input type="radio" checked="checked"
									name="nonMemPaymentMethod" value="card" /><label for="card">신용/체크카드</label>&nbsp;&nbsp;&nbsp;
									<input type="radio" name="nonMemPaymentMethod" value="trans"><label
									for="trans">계좌이체</label>&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="radio" name="nonMemPaymentMethod" value="phone"><label
									for="phone">휴대폰결제</label>&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="radio" name="nonMemPaymentMethod" value="vbank"><label
									for="vbank">가상계좌/무통장입금</label></th>
							</tr>

						</tbody>
					</table>
				</div>
				<br> <br>

				<div style="text-align: center">
					<input type="button" class="btn btn-secondary" onclick="iamport()"
						value="결제하기"
						style="padding-left: 10px; margin-left: 40px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 130px; height: 45px;">
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









