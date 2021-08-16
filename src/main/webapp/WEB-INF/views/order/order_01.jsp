<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.project.simple.member.vo.MemberVO"%>
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
	
	
	
	function sameInfo(f) {
		f.memSpName.value = f.memName.value;
		f.memSpAdr.value = f.memAdr.value;
		f.memSpAdr1.value = f.memAdr1.value;
		f.memSpAdr2.value = f.memAdr2.value;
		f.memSpPhoneNum1_0.value = f.memPhoneNum.value;
		f.memSpPhoneNum1_1.value = f.memPhoneNum1.value;
		f.memSpPhoneNum1_2.value = f.memPhoneNum2.value;
	}
	$("input[type=radio]").click(function() {
		$(this).prop("checked", true);
		$("form").submit();
	})
</script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
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



	<%
	MemberVO member = (MemberVO) session.getAttribute("member");
	String FullmemPhoneNum = member.getmemPhoneNum();
	String FullmemEmail = member.getmemEmail();
	String FullmemAdr = member.getmemAdr();
	String a1 = "-";
	String e1 = "@";
	String p1 = "-";
	String[] memAdr = FullmemAdr.split(a1);
	String[] memEmail = FullmemEmail.split(e1);
	String[] memPhoneNum = FullmemPhoneNum.split(p1);
	for (int i = 0; i < memAdr.length; i++) {
	}
	for (int i = 0; i < memEmail.length; i++) {
	}
	for (int i = 0; i < memPhoneNum.length; i++) {
	}
	%>


	<script>
	//유효성검사 후 주문결제진행
	//PG사 연동(결제시스템 IMPORT)
	function iamport() {
		var IMP = window.IMP;
		var form = document.CheckOrder;
		
		if (form.memSpName.value == "") {
			alert("주문자정보의 이름을 입력하지 않았습니다.")
			form.user_name.focus();
			return false;
		}
		if (form.memSpAdr.value == "") {
			alert("주문자정보의 주소를 입력하지 않았습니다.")
			form.memSpAdr.focus();
			return false;
		}
		if (form.memSpAdr1.value == "") {
			alert("주문자정보의 주소를 입력하지 않았습니다.")
			form.memSpAdr1.focus();
			return false;
		}
		if (form.memSpAdr2.value == "") {
			alert("주문자정보의 주소를 입력하지 않았습니다.")
			form.memSpAdr2.focus();
			return false;
		}
		if (form.memSpPhoneNum1_0.value == "") {
			alert("주문자정보의 연락처를 입력하지 않았습니다.")
			form.memSpPhoneNum1_0.focus();
			return false;
		}
		for (var i = 0; i < form.memSpPhoneNum1_0.value.length; i++) {
			ch = form.memSpPhoneNum1_0.value.charAt(i)
			if (!(ch >= '0' && ch <= '9')) {
				alert("주문자정보의 연락처는 숫자만 입력가능합니다.")
				form.memSpPhoneNum1_0.focus();
				form.memSpPhoneNum1_0.select();
				return false;
			}
		}
		if (form.memSpPhoneNum1_1.value == "") {
			alert("주문자정보의 연락처를 입력하지 않았습니다.")
			form.memSpPhoneNum1_1.focus();
			return false;
		}
		for (var i = 0; i < form.memSpPhoneNum1_1.value.length; i++) {
			ch = form.memSpPhoneNum1_1.value.charAt(i)
			if (!(ch >= '0' && ch <= '9')) {
				alert("주문자정보의 연락처는 숫자만 입력가능합니다.")
				form.memSpPhoneNum1_1.focus();
				form.memSpPhoneNum1_1.select();
				return false;
			}
		}
		if (form.memSpPhoneNum1_2.value == "") {
			alert("주문자정보의 연락처를 입력하지 않았습니다.")
			form.memSpPhoneNum1_2.focus();
			return false;
		}
		for (var i = 0; i < form.memSpPhoneNum1_2.value.length; i++) {
			ch = form.memSpPhoneNum1_2.value.charAt(i)
			if (!(ch >= '0' && ch <= '9')) {
				alert("주문자정보의 연락처는 숫자만 입력가능합니다.")
				form.memSpPhoneNum1_2.focus();
				form.memSpPhoneNum1_2.select();
				return false;
			}
		}
		
		
		//가맹점 식별코드
		var payType = document.querySelector('input[name="memPaymentMethod"]:checked').value;
		
		var paymentMethod = $("label[for='"+payType+"']").text();

		var param = $("form[name=CheckOrder]").serialize();
		var merchant_uid = ${orderNum};
		IMP.init('imp44341689');
		IMP.request_pay({
			pg : 'inicis',
			pay_method : payType,
			merchant_uid : merchant_uid,
			name : '(주)SIMPLE', //결제창에서 보여질 이름
			amount : ${totalPrice}, //실제 결제되는 가격
			buyer_email : '<%=memEmail[0]%>@<%=memEmail[1]%>',
			buyer_name : '${member.memName}',
			buyer_tel : '<%=memPhoneNum[0]%>-<%=memPhoneNum[1]%>-<%=memPhoneNum[2]%>',
			buyer_addr : '<%=memAdr[1]%> <%=memAdr[2]%>	',
			buyer_postcode : '<%=memAdr[0]%>'
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
							url : "${contextPath}/memaddorderlist.do",
							type : "POST",
							data :	param, paymentMethod,  	
							success: function (data) {				                   
				                    alert("주문내용테이블입력완료");	
				                    location.href="${contextPath}/memberOrderResult.do?Price=${totalPrice}&memOrderNum=${orderNum}&paymentMethod="+paymentMethod;
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
</script>
	<!-- 타이틀 -->




	<section class="ftco-section" style="padding-top: 100px;">

		<div class="container">
			<form name="CheckOrder" action="" method="post">
				<input type="hidden" name="memOrderNum" value="${orderNum}" />

				<!-- 타이틀 끝 -->



				<div style="font-size: 20px; font-weight: bold;">
					<a style="color: #7e9c8c;">주문리스트</a>
				</div>



				<!-- 최근 본 상품 -->
				<jsp:include page="/WEB-INF/views/common/quick.jsp" flush="false" />
				<!-- 최근본상품끝 -->

				<div class="order_list text-center">
					<table class="table" style="font-size: 13px;">


						<thead class="table-dark">
							<tr
								style="background-color: #fbfbfb; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #eeeeee;">

								<th scope="col" width="150"></th>
								<th scope="col">상품명</th>
								<th scope="col" width="250">옵션</th>
								<th scope="col" width="100">수량</th>
								<th scope="col" width="80">배송비</th>
								<th scope="col" width="150">가격</th>
								<th scope="col" width="100">합계</th>
							</tr>
						</thead>
						<c:choose>
							<c:when test="${orderCart == true}">
								<c:forEach items="${orderlist}" var="orderlist"
									varStatus="status">
									<tbody>
										<tr class="tr1"
											style="border-bottom: 1px solid rgba(0, 0, 0, 0.1);">
											<th scope="col"
												style="vertical-align: middle; font-weight: normal;"><img
												src="${contextPath}/download_product.do?productNum=${orderlist.productNum}&productImage=${orderlist.productImage}"
												width=80 height=80></th>
											<th scope="col"
												style="vertical-align: middle; font-weight: normal;">${orderlist.productName}</th>
											<th scope="col"
												style="text-align: left; vertical-align: middle; font-weight: normal;">${orderlist.option1name}
												: ${orderlist.option1value}<br>${orderlist.option2name}
												: ${orderlist.option2value}
											</th>
											<th scope="col"
												style="vertical-align: middle; font-weight: normal;">${orderlist.productCnt}개</th>
											<th scope="col"
												style="vertical-align: middle; font-weight: normal;">${orderlist.deliverycharge}</th>
											<th scope="col"
												style="vertical-align: middle; font-weight: normal;">${orderlist.productPrice}원</th>
											<th scope="col"
												style="vertical-align: middle; font-weight: normal;">${orderlist.totalPrice}원</th>
										</tr>
									</tbody>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tbody>
									<tr class="tr1"
										style="border-bottom: 1px solid rgba(0, 0, 0, 0.1);">
										<th scope="col"
											style="vertical-align: middle; font-weight: normal;"><img
											src="${contextPath}/download_product.do?productNum=${memOrder.productNum}&productImage=${memOrder.productImage}"
											width=80 height=80></th>
										<th scope="col"
											style="vertical-align: middle; font-weight: normal;">${memOrder.productName}</th>
										<th scope="col"
											style="text-align: left; vertical-align: middle; font-weight: normal;">${memOrder.option1name}
											: ${memOrder.option1value}<br>${memOrder.option2name} :
											${memOrder.option2value}
										</th>
										<th scope="col"
											style="vertical-align: middle; font-weight: normal;">${memOrder.productCnt}개</th>
										<th scope="col"
											style="vertical-align: middle; font-weight: normal;">${memOrder.deliverycharge}</th>
										<th scope="col"
											style="vertical-align: middle; font-weight: normal;">${memOrder.productPrice}원</th>
										<th scope="col"
											style="vertical-align: middle; font-weight: normal;">${memOrder.totalPrice}원</th>
									</tr>
								</tbody>
							</c:otherwise>

						</c:choose>
					</table>
					<c:choose>
						<c:when test="${memOrder == null}">
							<div
								style="border: 1px solid #e9e9e9; height: 80px; margin-top: 20px;">
								<div style="display: flow-root; padding-top: 5px;">
									<h6
										style="float: right; margin-top: 11px; font-size: 14px; margin-right: 15px;">
										총 합계</h6>
									<h6
										style="float: right; font-size: 14px; margin-top: 12px; margin-right: 70px;">배송비</h6>
									<h6
										style="float: right; font-size: 14px; margin-top: 12px; margin-right: 73px;">상품금액</h6>

								</div>
								<div style="display: block; margin-right: 15px;">
									<span style="float: right; font-size: 13px; margin-top: 2px;">원</span><input
										type="text" id="totalPrice" name="totalPrice" value="${totalPrice}"
										style="border: none; width: 75px; float: right; text-align: right; font-size: 15px; color: #7e9c8c; font-weight: bold;" />
								</div>
								<img src="${contextPath}/resources/images/equls.jpg"
									style="width: 15px; float: right; height: 15px; margin-top: 5px;" />
								<span
									style="float: right; font-size: 13px; margin-top: 2px; margin-right: 13px;">원</span>
								<input type="text" id="" name="" value="0"
									style="border: none; width: 20px; float: right; text-align: right; font-size: 15px; color: #7e9c8c; font-weight: bold;" />
								<img src="${contextPath}/resources/images/plus.jpg"
									style="width: 15px; float: right; height: 15px; margin-top: 5px; margin-right: 28px;" />
								<span
									style="float: right; font-size: 13px; margin-top: 2px; margin-right: 38px;">원</span><input
									type="text" id="price1" name="price1" value="${totalPrice}"
									style="border: none; width: 100px; float: right; text-align: right; font-size: 15px; color: #7e9c8c; font-weight: bold;" />
							</div>
						</c:when>
						<c:otherwise>
							<div
								style="border: 1px solid #e9e9e9; height: 80px; margin-top: 20px;">
								<div style="display: flow-root; padding-top: 5px;">
									<h6
										style="float: right; margin-top: 11px; font-size: 14px; margin-right: 15px;">
										총 합계</h6>
									<h6
										style="float: right; font-size: 14px; margin-top: 12px; margin-right: 70px;">배송비</h6>
									<h6
										style="float: right; font-size: 14px; margin-top: 12px; margin-right: 73px;">상품금액</h6>

								</div>
								<div style="display: block; margin-right: 15px;">
									<span style="float: right; font-size: 13px; margin-top: 2px;">원</span><input
										type="text" id="totalPrice" name="totalPrice" value="${memOrder.totalPrice}"
										style="border: none; width: 75px; float: right; text-align: right; font-size: 15px; color: #7e9c8c; font-weight: bold;" />
								</div>
								<img src="${contextPath}/resources/images/equls.jpg"
									style="width: 15px; float: right; height: 15px; margin-top: 5px;" />
								<span
									style="float: right; font-size: 13px; margin-top: 2px; margin-right: 13px;">원</span>
								<input type="text" id="" name="" 
									style="border: none; width: 20px; float: right; text-align: right; font-size: 15px; color: #7e9c8c; font-weight: bold;" />
								<img src="${contextPath}/resources/images/plus.jpg"
									style="width: 15px; float: right; height: 15px; margin-top: 5px; margin-right: 28px; " />
								<span
									style="float: right; font-size: 13px; margin-top: 2px; margin-right: 38px;">원</span><input
									type="text" id="price1" name="price1" value="${memOrder.totalPrice}"
									style="border: none; width: 100px; float: right; text-align: right; font-size: 15px; color: #7e9c8c; font-weight: bold;" />
									<input type="hidden"
									name="productNum" value="${memOrder.productNum}" />
							</div>
						</c:otherwise>
					</c:choose>
				</div>



				<div style="font-size: 20px; font-weight: bold; margin-top: 70px;">
					<a style="color: #7e9c8c; margin-top: 40px;">주문자정보</a>
				</div>



				<input type="hidden" name="memId" value="${member.memId}" />


				<div class="order_list">
					<table class="table" style="font-size: 13px;">
						<colgroup>
							<col width="20%" />
						</colgroup>
						<tbody>
							<tr
								style="border-bottom: 1px solid #eeeeee; border-top: 1px solid rgba(0, 0, 0, 0.1);">
								<th scope="col"><a
									style="color: red; padding-right: 5px; write-space: nowrap;">*</a>이름</th>
								<th scope="col"><input type="text" name="memName"
									value="${member.memName}" readonly
									style="font-size: 13px; border: 1px solid #dcdcdc; width: 326px; height: 36px;"></th>
							</tr>
							<tr style="border-bottom: 1px solid #eeeeee;">
								<th scope="col"><a
									style="color: red; padding-right: 5px; write-space: nowrap;">*</a>주소</th>
								<th scope="col"><input type="text" name="memAdr"
									value="<%=memAdr[0]%>" disabled id="sample6_postcode" readonly
									style="font-size: 13px; border: 1px solid #dcdcdc; width: 211px; height: 36px;">
									&nbsp;&nbsp;&nbsp;

									<p>
										<br> <input type="text" name="memAdr1"
											value="<%=memAdr[1]%>" disabled id="sample6_address" readonly
											style="font-size: 13px; border: 1px solid #dcdcdc; width: 326px; height: 36px;">

									</p>
									<p>
										<input type="text" name="memAdr2" id="sample6_address2"
											value="<%=memAdr[2]%>" readonly disabled
											style="font-size: 13px; border: 1px solid #dcdcdc; width: 326px; height: 36px;">


									</p></th>
							</tr>
							<tr style="border-bottom: 1px solid rgba(0, 0, 0, 0.1);">
								<th scope="col"><a
									style="color: red; padding-right: 5px; write-space: nowrap;">*</a>연락처</th>
								<th scope="col"><select name="memPhoneNum" disabled
									style="width: 80px; font-size: 13px; border: 1px solid #dcdcdc; height: 36px;">
										<option value="<%=memPhoneNum[0]%>"><%=memPhoneNum[0]%></option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
										<option value="010">010</option>
								</select> - <input type="text" name="memPhoneNum1"
									value="<%=memPhoneNum[1]%>" readonly disabled
									style="width: 109px; font-size: 13px; border: 1px solid #dcdcdc; height: 36px;">
									- <input type="text" name="memPhoneNum2"
									value="<%=memPhoneNum[2]%>" readonly disabled
									style="width: 109px; font-size: 13px; border: 1px solid #dcdcdc; height: 36px;"></th>
							</tr>
						</tbody>
					</table>
				</div>

				<div style="font-size: 20px; margin-top: 40px; font-weight: bold;">
					<a style="color: #7e9c8c;">배송정보</a>
				</div>
				<a style="font-size: 13px;">주문자 정보와 동일</a><input type="checkbox"
					name="same" onclick="sameInfo(document.CheckOrder)">
				<div class="order_list">
					<table class="table" style="font-size: 13px;">
						<colgroup>
							<col width="20%" />
						</colgroup>
						<tbody>
							<tr
								style="border-bottom: 1px solid #eeeeee; border-top: 1px solid rgba(0, 0, 0, 0.1);">
								<th scope="col"><a
									style="color: red; padding-right: 5px; write-space: nowrap;">*</a>이름</th>
								<th scope="col"><input type="text" name="memSpName"
									value=""
									style="font-size: 13px; width: 326px; border: 1px solid #dcdcdc; height: 36px;"></th>
							</tr>
							<tr style="border-bottom: 1px solid #eeeeee;">
								<th scope="col"><a
									style="color: red; padding-right: 5px; write-space: nowrap;">*</a>주소</th>
								<th scope="col"><input type="text" name="memSpAdr" value=""
									id="sample6_postcode1" readonly
									style="font-size: 13px; width: 211px; border: 1px solid #dcdcdc; height: 36px;">&nbsp;&nbsp;&nbsp;
									<input type="button" onclick="sample6_execDaumPostcode2()"
									value="우편번호 찾기"
									style="font-size: 13px; border: none; background-color: #c6c6c6; color: white; width: 100px; height: 37px;">
									<p>
										<br> <input type="text" name="memSpAdr1" value=""
											id="sample6_address_1" readonly
											style="width: 325px; font-size: 13px; border: 1px solid #dcdcdc; height: 36px;">

									</p>
									<p>
										<input type="text" name="memSpAdr2" id="sample6_address2_1"
											value=""
											style="width: 325px; font-size: 13px; border: 1px solid #dcdcdc; height: 36px;">

									</p></th>
							</tr>
							<tr style="border-bottom: 1px solid #eeeeee;">
								<th scope="col"><a
									style="color: red; padding-right: 5px; write-space: nowrap;">*</a>연락처1</th>
								<th scope="col"><select name="memSpPhoneNum1_0"
									style="width: 80px; font-size: 13px; border: 1px solid #dcdcdc; height: 36px;">
										<option value=""></option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
										<option value="010">010</option>
								</select> - <input type="text" name="memSpPhoneNum1_1" value=""
									style="width: 109px; font-size: 13px; border: 1px solid #dcdcdc; height: 36px;">
									- <input type="text" name="memSpPhoneNum1_2" value=""
									style="width: 109px; font-size: 13px; border: 1px solid #dcdcdc; height: 36px;"></th>
							</tr>
							<tr style="border-bottom: 1px solid #eeeeee;">
								<th scope="col" style="padding-left: 23px;">연락처2</th>
								<th scope="col"><select name="memSpPhoneNum2_0"
									style="width: 80px; font-size: 13px; border: 1px solid #dcdcdc; height: 36px;">
										<option value="">선택</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
										<option value="010">010</option>
								</select> - <input type="text" name="memSpPhoneNum2_1"
									style="width: 109px; font-size: 13px; border: 1px solid #dcdcdc; height: 36px;">
									- <input type="text" name="memSpPhoneNum2_2"
									style="width: 109px; font-size: 13px; border: 1px solid #dcdcdc; height: 36px;"></th>
							</tr>
							<tr style="border-bottom: 1px solid #eeeeee;">
								<th scope="col"
									style="padding-bottom: 50px; padding-left: 23px;"><br>주문메세지<br>(100자내외)</th>
								<th scope="col"><input type="text" name="memOrderMsg"
									style="width: 327px; height: 175px; border: 1px solid #dcdcdc;"></th>
							</tr>

						</tbody>
					</table>
				</div>

				<div style="font-size: 20px; font-weight: bold;">
					<a style="color: #7e9c8c; margin-top: 40px;">결제정보</a>
				</div>
				<div class="order_list">
					<table class="table" style="font-size: 13px;">
						<colgroup>
							<col width="20%" />
						</colgroup>
						<tbody>
							<tr
								style="border-top: 1px solid rgba(0, 0, 0, 0.1); border-bottom: 1px solid #eeeeee;">
								<th scope="col"><a
									style="color: red; padding-right: 5px; write-space: nowrap;">*</a>결제방법</th>
								<th scope="col"><input type="radio" checked="checked"
									name="memPaymentMethod" value="card" /><label for="card">신용/체크카드</label>&nbsp;&nbsp;&nbsp;
									<input type="radio" name="memPaymentMethod" value="trans"><label
									for="trans">계좌이체</label>&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="radio" name="memPaymentMethod" value="phone"><label
									for="phone">휴대폰결제</label>&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="radio" name="memPaymentMethod" value="vbank"><label
									for="vbank">가상계좌/무통장입금</label></th>
							</tr>

						</tbody>
					</table>
				</div>
				<br> <br>

				<div style="text-align: center">
					<input type="button" class="btn btn-secondary" value="결제하기"
						onclick="iamport();"
						style="padding-left: 10px; font-size: 13px; margin-left: 40px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 130px; height: 45px;">
					&nbsp;&nbsp;
					<button type="submit" class="btn btn-secondary"
						onclick="location.href='/cart'"
						style="padding-left: 10px; background-color: white; font-size: 13px; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 130px; height: 45px;">취소하기</button>
				</div>
				<br> <br>
			</form>
		</div>
	</section>

	<%
	session.removeAttribute("orderNow");
	session.removeAttribute("orderCart");
	%>
</body>
</html>









