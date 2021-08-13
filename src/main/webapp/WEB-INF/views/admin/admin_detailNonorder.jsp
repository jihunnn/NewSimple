<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
<script  type="text/javascript">
//배송상태 수정
function deliveryindex(index){

		var index = document.querySelector('input[name=deliveryModify'+index+']');
		var Index = parseInt(index.getAttribute('class'));
		if(confirm("배송상태를 수정하시겠습니까?")){
		$.ajax({
			url : "${contextPath}/admin_listNoOrder/deliveryModifyNon.do",
			type : "POST",
			data : {
				nonmemOrderSeqNum : $(".nonmemOrderSeqNum"+ Index).val(),
				deliveryStatus : $(".deliveryStatus"+ Index).val()
			},
			success : function(result) {
				alert(result);
				document.location.reload();
			
			},
		});
		}else{
			return false;
		}
	};

</script>
</head>
<title>관리자 비회원 주문 상세창</title>
<body>
	

	<% 
	OrderVO NonOrder = (OrderVO) session.getAttribute("NonOrder");
	
	String FullNonMemSpPhoneNum = NonOrder.getNonMemSpPhoneNum1();
	String FullNonMemSpPhoneNum2 = NonOrder.getNonMemSpPhoneNum2();
	String FullNonMemSpAdr = NonOrder.getNonMemSpAdr();
	
	String q1 = "-";
	String w1 = "-";
	
	String[] nonMemSpPhoneNum = FullNonMemSpPhoneNum.split(q1); 
	String[] nonMemSpPhoneNum2 = FullNonMemSpPhoneNum2.split(q1); 
	String[] nonMemSpAdr = FullNonMemSpAdr.split(w1); 
	
	for (int i = 0; i < nonMemSpPhoneNum.length; i++) {
	}
	for (int i = 0; i < nonMemSpPhoneNum2.length; i++) {
	}
	for (int i = 0; i < nonMemSpAdr.length; i++) {
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
								<th scope="col" width="150">배송상태</th>
								<th scope="col" width="150">배송수정</th>
						</tr>
					</thead>
					
					<c:forEach var="item" items="${NonOrderList}" varStatus="status" >
						<tbody>
						<tr class="tr1"
									style="border-bottom: 1px solid rgba(0, 0, 0, 0.1);">
							<th scope="col" style="vertical-align: middle;"><img src="${contextPath}/download_product.do?productNum=${item.productNum}&productImage=${item.productimage}" width=80 height=80>
							</th>
							<th scope="col" style="vertical-align: middle;">${item.productName}
							<th scope="col" style="text-align: left; vertical-align: middle;">${item.option1name}
							: ${item.option1value}<br>${item.option2name} :
							${item.option2value}</th>
							<th scope="col" style="vertical-align: middle;">${item.productCnt}개</th>
							<th scope="col" style="vertical-align: middle;">무료배송</th>
							<th scope="col" style="vertical-align: middle;">${item.productPrice}원</th>
							<th scope="col" style="vertical-align: middle;">
							<input type="hidden" id="nonmemOrderSeqNum${status.index }" class="nonmemOrderSeqNum${status.index }" value="${item.nonmemOrderSeqNum}" />
							<select name="deliveryStatus" id ="deliveryStatus${status.index }" class="deliveryStatus${status.index }"
									style="width: 110px; font-size: 14px; border: 1px solid #dcdcdc; height: 36px;">
									<c:choose>
									 <c:when test="${item.deliveryStatus=='주문접수' }">
										<option value="주문접수" selected>주문접수</option>
										<option value="결제완료">결제완료</option>
										<option value="상품준비중">상품준비중</option>
										<option value="배송중">배송중</option>
										<option value="배송완료">배송완료</option>
									</c:when>
									 <c:when test="${item.deliveryStatus=='결제완료' }">
										<option value="주문접수" >주문접수</option>
										<option value="결제완료" selected>결제완료</option>
										<option value="상품준비중">상품준비중</option>
										<option value="배송중">배송중</option>
										<option value="배송완료">배송완료</option>
									</c:when>
									 <c:when test="${item.deliveryStatus=='상품준비중' }">
										<option value="주문접수" >주문접수</option>
										<option value="결제완료">결제완료</option>
										<option value="상품준비중" selected>상품준비중</option>
										<option value="배송중">배송중</option>
										<option value="배송완료">배송완료</option>
									</c:when>
									 <c:when test="${item.deliveryStatus=='배송중' }">
										<option value="주문접수" >주문접수</option>
										<option value="결제완료">결제완료</option>
										<option value="상품준비중">상품준비중</option>
										<option value="배송중" selected>배송중</option>
										<option value="배송완료">배송완료</option>
									</c:when>
									 <c:when test="${item.deliveryStatus=='배송완료' }">
										<option value="주문접수" >주문접수</option>
										<option value="결제완료">결제완료</option>
										<option value="상품준비중">상품준비중</option>
										<option value="배송중">배송중</option>
										<option value="배송완료" selected>배송완료</option>
									</c:when>
								</c:choose>
								</select>
								</th>
							
							<th scope="col" style="vertical-align: middle;">
							<input type="hidden" id="index" value="${status.index }"/>
							<input type="button" id="deliveryModify" class="${status.index }"  name="deliveryModify${status.index }"onclick="deliveryindex(${status.index })" value="배송수정"
										style="border-radius: 2px; margin-bottom: 3px; background-color: white; color: gray; border: 1px solid #7e9c8c; border-radius: 2px; width: 90px; height: 30px; font-size: 14px;">
									</th>
						</tr>
						</tbody>
					</c:forEach>
					
				</table>
				
					<div style="font-size: 18px; float: right;">
						<span>총금액ㅤ</span><a style="color: #7e9c8c; font-weight: bold;">${NonOrderList[0].totalPrice}원</a>
					</div>
				
			</div>

          
			<div style="font-size: 25px; font-weight: bold; margin-top: 70px;">
					<a style="color: #7e9c8c; margin-top: 40px;">수령인정보</a>
			</div>
			<a>주문일자: ${NonOrder.nonMemOrderDate }</a>
		    <div class="order_list">
				    <table class="table">
				    	<colgroup>
					    	<col width="20%" />
					    </colgroup>
					    <tbody>
					    	<tr style="border-bottom: 1px solid #eeeeee; border-top: 1px solid rgba(0, 0, 0, 0.1);">
					    		<th scope="col"><a
					    				style="color: red; padding-right: 5px; write-space: nowrap;">*</a>이름</th>
					    		<th scope="col">${NonOrder.nonMemSpName }</th>
					    	</tr>
					    	<tr style="border-bottom: 1px solid #eeeeee;">
					    	<th ><a
					    				style="color: red; padding-right: 5px; write-space: nowrap;">*</a>주소</th>
					    	    <th scope="col"><%=nonMemSpAdr[0]%>
						    			&nbsp;&nbsp;&nbsp;
						    			<p>
						    				<br> <%=nonMemSpAdr[1]%>

						    			</p>
						    			<p>
						    				<%=nonMemSpAdr[2]%>
							    		</p>
							    </th>
						    <tr style="border-bottom: 1px solid #eeeeee;">
					    			<th scope="col"><a
					    				style="color: red; padding-right: 5px; write-space: nowrap;">*</a>연락처1</th>
					    			<th scope="col"><%=nonMemSpPhoneNum[0]%> - <%=nonMemSpPhoneNum[1]%>
					    				- <%=nonMemSpPhoneNum[2]%></th>
					    		</tr>
					    		
					    		<c:choose>
								<c:when test="${NonOrder.nonMemSpPhoneNum2 != '--'}">
				                <tr style="border-bottom: 1px solid #eeeeee;">
							    	<th scope="col" style="padding-left: 23px;">연락처2</th>
					    			<th scope="col"><%=nonMemSpPhoneNum2[0]%> - <%=nonMemSpPhoneNum2[1]%>
					    				- <%=nonMemSpPhoneNum2[2]%></th>
					    	    </tr>
					    	    </c:when>
					    	    </c:choose>
		
						    	<tr style="border-bottom: 1px solid #eeeeee;">
						    		<th scope="col"
								    	style="padding-bottom: 50px; padding-left: 23px;"><br>주문메시지<br>(100자내외)</th>
							    	<th scope="col"><input type="text" name="nonMemOrderMsg" disabled value="${NonOrder.nonMemOrderMsg}"
								    	style="width: 327px; height: 175px; border: 1px solid #dcdcdc;"></th>
							    </tr>
							    <tr style="border-bottom: 1px solid rgba(0, 0, 0, 0.1);">
							    	<th scope="col" style="padding-left: 23px;">무통장 입금자명</th>
							    	<th scope="col">${NonOrder.nonMemDepositorName}</th>
							    </tr>
					
					    </tbody>
				    </table>
			    </div>

			<br> <br>

				<div style="text-align: center">
					<input type="button" class="btn btn-secondary" value="정보수정"
						onclick="location.href='${contextPath}/admin_listNoOrder/admin_ModVeiwNonMemorder.do?nonMemOrderNum=${NonOrder.nonMemOrderNum}'"
						style="padding-left: 10px; margin-left: 40px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 130px; height: 45px;">
					&nbsp;&nbsp;
					<button type="submit" class="btn btn-secondary"
						onclick="location.href='${contextPath}/admin_listNoOrder.do'"
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














