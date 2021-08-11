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
				<table class="table">
					<colgroup>
						<col width="20%" />
					</colgroup>
					<tbody>
						<tr style="border-bottom: 1px solid #eeeeee; border-top: 1px solid rgba(0, 0, 0, 0.1);">
							<th scope="col"><a
									style="color: red; padding-right: 5px; write-space: nowrap;">*</a>이름</th>
							<th scope="col">${order.memSpName }</th>
						</tr>
						<tr style="border-bottom: 1px solid #eeeeee;">
						<th ><a
									style="color: red; padding-right: 5px; write-space: nowrap;">*</a>주소</th>
						    <th scope="col"><%=memSpAdr[0]%>
									&nbsp;&nbsp;&nbsp;
									<p>
										<br> <%=memSpAdr[1]%>

									</p>
									<p>
										<%=memSpAdr[2]%>
									</p>
							</th>
						<tr style="border-bottom: 1px solid #eeeeee;">
								<th scope="col"><a
									style="color: red; padding-right: 5px; write-space: nowrap;">*</a>연락처1</th>
								<th scope="col"><%=memSpPhoneNum[0]%> - <%=memSpPhoneNum[1]%>
									- <%=memSpPhoneNum[2]%></th>
							</tr>
			
		
				                <tr style="border-bottom: 1px solid #eeeeee;">
								<th scope="col" style="padding-left: 23px;">연락처2</th>
								<th scope="col"><%=memSpPhoneNum2[0]%> - <%=memSpPhoneNum2[1]%>
									- <%=memSpPhoneNum2[2]%></th>
							   </tr>
		
							<tr style="border-bottom: 1px solid #eeeeee;">
								<th scope="col"
									style="padding-bottom: 50px; padding-left: 23px;"><br>주문메세지<br>(100자내외)</th>
								<th scope="col"><input type="text" name="memOrderMsg" disabled value="${order.memOrderMsg}"
									style="width: 327px; height: 175px; border: 1px solid #dcdcdc;"></th>
							</tr>
							<tr style="border-bottom: 1px solid rgba(0, 0, 0, 0.1);">
								<th scope="col" style="padding-left: 23px;">무통장 입금자명</th>
								<th scope="col">${order.memDepositorName}</th>
							</tr>
					
					</tbody>
				</table>
			</div>
			

			<br> <br>

				<div style="text-align: center">
					<input type="button" class="btn btn-secondary" value="수정하기"
						onclick="location.href='${contextPath}/admin_listorder/admin_ModVeiwMemorder.do?memOrderNum=${order.memOrderNum}'"
						style="padding-left: 10px; margin-left: 40px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 130px; height: 45px;">
					&nbsp;&nbsp;
					<button type="submit" class="btn btn-secondary"
						onclick="location.href='${contextPath}/admin_listorder.do'"
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














