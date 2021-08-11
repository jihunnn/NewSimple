<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ page import="com.project.simple.member.vo.MemberVO"%>
<%@ page import="com.project.simple.order.vo.OrderVO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style>


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
function Check_order() {
	var form = document.Checkmodify;

	
	 if (confirm("회원정보를 수정하시겠습니까?")){ //확인
    	 form.submit();
    } else { //취소
     	return false;
    }

  
}
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	//회원 주문자 우편번호
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
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2')
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
<title>관리자 회원 주문 상세창</title>
<body>
	
	<%
	MemberVO member = (MemberVO) session.getAttribute("member");
	
	String FullmemPhoneNum = member.getmemPhoneNum();
	String FullmemAdr = member.getmemAdr();

	String a1 = "-";
	String p1 = "-";

	String[] memAdr = FullmemAdr.split(a1);
	String[] memPhoneNum = FullmemPhoneNum.split(p1);
    
	for (int i = 0; i < memAdr.length; i++) {
	}
	for (int i = 0; i < memPhoneNum.length; i++) {
	}
	%>
	<% 
	OrderVO order = (OrderVO) session.getAttribute("order");
	
	String FullmemSpPhoneNum = order.getMemSpPhoneNum1();
	String FullmemSpPhoneNum2 = order.getMemSpPhoneNum2();
	String FullmemSpAdr = order.getMemSpAdr();
	
	String q1 = "-";
	String w1 = "-";
	
	String[] memSpPhoneNum = FullmemSpPhoneNum.split(q1); 
	String[] memSpPhoneNum2 = FullmemSpPhoneNum2.split(q1); 
	String[] memSpAdr = FullmemSpAdr.split(w1); 
	
	for (int i = 0; i < memSpPhoneNum.length; i++) {
	}
	for (int i = 0; i < memSpPhoneNum2.length; i++) {
	}
	for (int i = 0; i < memSpAdr.length; i++) {
	}
	
	%>

	<!-- 타이틀 -->
	<section class="ftco-section" style="padding-top: 100px;">
		<div class="container">
			
			<!-- 타이틀 끝 -->
			<!-- 내용 -->
			
					<div style="font-size: 25px; font-weight: bold;">
					<a style="color: #7e9c8c;">주문리스트</a>
				</div>


			<div class="order_list text-center">
				<table class="table" style="font-size: 13px;">
                  
					<thead class="table-dark">
						<tr style="background-color: #eeeeee; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #c6c8ca; font-size: 15px;">
						        <th scope="col" width="150"></th>
								<th scope="col">상품명</th>
								<th scope="col" width="250">옵션</th>
								<th scope="col" width="100">수량</th>
								<th scope="col" width="80">배송비</th>
								<th scope="col" width="150">가격</th>
						</tr>
					</thead>
					
					<c:forEach var="item" items="${OrderList}">
						<tbody>
						<tr class="tr1"
									style="border-bottom: 1px solid rgba(0, 0, 0, 0.1);">
							<th scope="col" style="vertical-align: middle;"><img src="${contextPath}/download_product.do?productNum=${item.productNum}&productImage=${item.productImage}" width=80 height=80>
							</th>
							<th scope="col" style="vertical-align: middle;">${item.productName}
							<th scope="col" style="text-align: left; vertical-align: middle;">${item.option1name}
							: ${item.option1value}<br>${item.option2name} :
							${item.option2value}</th>
							<th scope="col" style="vertical-align: middle;">${item.productCnt}개</th>
							<th scope="col" style="vertical-align: middle;">무료배송</th>
							<th scope="col" style="vertical-align: middle;">${item.productPrice}원</th>
						</tr>
						</tbody>
					</c:forEach>
					
				</table>
				
					<div style="font-size: 18px; float: right;">
						<span>총금액ㅤ</span><a style="color: #7e9c8c; font-weight: bold;">${OrderList[0].totalPrice}원</a>
					</div>
				
			</div>

          
			<div style="font-size: 25px; font-weight: bold; margin-top: 70px;">
					<a style="color: #7e9c8c; margin-top: 40px;">주문자정보</a>
			</div>
			<a>주문일자: ${order.memOrderDate }</a>
			<div class="order_list">
				<table class="table">
				
					<colgroup>
						<col width="20%" />
					</colgroup>
					<tbody>
						<tr style="border-bottom: 1px solid #eeeeee; border-top: 1px solid rgba(0, 0, 0, 0.1);">
							<th scope="col"><a
									style="color: red; padding-right: 5px; write-space: nowrap;">*</a>이름</th>
							<th scope="col">${member.memName}</th>
						</tr>
						<tr style="border-bottom: 1px solid #eeeeee;">
							<th scope="col"><a
									style="color: red; padding-right: 5px; write-space: nowrap;">*</a>주소</th>
							<th scope="col"><%=memAdr[0]%>
									&nbsp;&nbsp;&nbsp;
									<p>
										<br><%=memAdr[1]%>

									</p>
									<p>
										<%=memAdr[2]%>
									</p>
							</th>
						</tr>
						<tr style="border-bottom: 1px solid rgba(0, 0, 0, 0.1);">
								<th scope="col"><a
									style="color: red; padding-right: 5px; write-space: nowrap;">*</a>연락처</th>
								<th scope="col"><%=memPhoneNum[0]%> - <%=memPhoneNum[1]%>
									- <%=memPhoneNum[2]%></th>
							</tr>
					</tbody>
				</table>
			</div>

			<div style="font-size: 25px; margin-top: 40px; font-weight: bold;">
					<a style="color: #7e9c8c;">수령인정보</a>
				</div>
			<div class="order_list">
			<form name="Checkmodify"  action="${contextPath}/admin_listorder/admin_ModMemorder.do" method="post">
			<input type="hidden" name="memOrderNum" value="${order.memOrderNum}" />
				<table class="table">
					<colgroup>
						<col width="20%" />
					</colgroup>
					<tbody>
						<tr style="border-bottom: 1px solid #eeeeee; border-top: 1px solid rgba(0, 0, 0, 0.1);">
							<th scope="col"><a
									style="color: red; padding-right: 5px; write-space: nowrap;">*</a>이름</th>
							<th scope="col"><input type="text" name="memSpName"
									value="${order.memSpName }" 
									style="font-size: 14px; width: 326px; border: 1px solid #dcdcdc; height: 36px;"></th>
						</tr>
						<tr>
						<th style="border-bottom: 1px solid rgba(0, 0, 0, 0.1);"><a
									style="color: red; padding-right: 5px; write-space: nowrap;">*</a>주소</th>
						    <th scope="col">
							<input type="text" name="memSpAdr"
									value="<%=memSpAdr[0]%>"  id="sample6_postcode1"  readonly
									style="font-size: 14px; border: 1px solid #dcdcdc; width: 211px; height: 36px;">
									&nbsp;&nbsp;&nbsp;
									<input type="button" onclick="sample6_execDaumPostcode2()"
									value="우편번호 찾기"
									style="font-size: 14px; border: none; background-color: #c6c6c6; color: white; width: 100px; height: 37px;">
									<p>
										<br> <input type="text" name="memSpAdr1"
											value="<%=memSpAdr[1]%>" id="sample6_address_1" readonly
											style="font-size: 14px; border: 1px solid #dcdcdc; width: 326px; height: 36px;">

									</p>
									<p>
										<input type="text" name="memSpAdr2"  id="sample6_address2_1"
											value="<%=memSpAdr[2]%>"  
											style="font-size: 14px; border: 1px solid #dcdcdc; width: 326px; height: 36px;">


									</p>
							</th>
						<tr style="border-bottom: 1px solid #eeeeee;">
								<th scope="col"><a
									style="color: red; padding-right: 5px; write-space: nowrap;">*</a>연락처1</th>
								<th scope="col"><select name="memSpPhoneNum1_0" 
									style="width: 80px; font-size: 14px; border: 1px solid #dcdcdc; height: 36px;">
										<option value="<%=memSpPhoneNum[0]%>"><%=memSpPhoneNum[0]%></option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
										<option value="010">010</option>
								</select> - <input  type="text" name="memSpPhoneNum1_1" value="<%=memSpPhoneNum[1]%>"
									style="width: 109px; font-size: 14px; border: 1px solid #dcdcdc; height: 36px;">
									- <input  type="text" name="memSpPhoneNum1_2" value="<%=memSpPhoneNum[2]%>"
									style="width: 109px; font-size: 14px; border: 1px solid #dcdcdc; height: 36px;"></th>
							</tr>
			
		
				                <tr style="border-bottom: 1px solid #eeeeee;">
								<th scope="col" style="padding-left: 23px;">연락처2</th>
								<th scope="col"><select name="memSpPhoneNum2_0" 
									style="width: 80px; font-size: 14px; border: 1px solid #dcdcdc; height: 36px;">
										<option value="<%=memSpPhoneNum2[0]%>"><%=memSpPhoneNum2[0]%></option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
										<option value="010">010</option>
								</select> - <input  type="text" name="memSpPhoneNum2_1" value="<%=memSpPhoneNum2[1]%>"
									style="width: 109px; font-size: 14px; border: 1px solid #dcdcdc; height: 36px;">
									- <input type="text" name="memSpPhoneNum2_2" value="<%=memSpPhoneNum2[2]%>"
									style="width: 109px; font-size: 14px; border: 1px solid #dcdcdc; height: 36px;"></th>
							   </tr>
		
							<tr style="border-bottom: 1px solid #eeeeee;">
								<th scope="col"
									style="padding-bottom: 50px; padding-left: 23px;"><br>주문메세지<br>(100자내외)</th>
								<th scope="col"><input type="text" name="memOrderMsg" value="${order.memOrderMsg}"
									style="width: 327px; height: 175px; border: 1px solid #dcdcdc;"></th>
							</tr>
							<tr style="border-bottom: 1px solid rgba(0, 0, 0, 0.1);">
								<th scope="col" style="padding-left: 23px;">무통장 입금자명</th>
								<th scope="col"><input name="memDepositorName" type="text"  value="${order.memDepositorName}"
									value=""
									style="font-size: 14px; border: 1px solid #dcdcdc; height: 36px; width: 326px;"></th>
							</tr>
					
					</tbody>
				</table>
				</form>
			</div>
			

			<br> <br>

				<div style="text-align: center">
					<input type="button" class="btn btn-secondary" value="수정하기"
						onclick="Check_order()"
						style="padding-left: 10px; margin-left: 40px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 130px; height: 45px;">
					&nbsp;&nbsp;
					<button type="submit" class="btn btn-secondary"
						onclick="history.go(-1);"
						style="padding-left: 10px; background-color: white; color: #7e9c8c; border: 1px solid #7e9c8c; border-radius: 2px; width: 130px; height: 45px;">뒤로가기</button>
				</div>
				<br> <br>
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














