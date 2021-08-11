<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.project.simple.cart.vo.CartVO"%>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">


<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<script>
	function next() {
		if (confirm("선택상품을 주문하시겠습니까?")) {
			location.replace('order_01.jsp');
		} else {

		}
	}

	function nextt() {
		if (confirm("전체상품을 주문하시겠습니까?")) {
			submit.replace('order_01.jsp');
		} else {

		}
	}

	function checkAll() {
		var totalPrice = parseInt($('input[name*="totalPrice"]').val());
		if ($("input:checkbox[name='chk']").is(":checked") == false) {
			//chk 체크박스가 체크되어습니다.
			$("input[name='chk']").prop('checked', true); //전체선택
			
			var list = $("input[name='chk']");
			for (var i = 0; i < list.length; i++) {
				if (list[i].checked) { //선택되어 있으면 배열에 값을 저장한다.
				var item = (document.getElementsByName('cart'))[i]; 
				totalPrice=totalPrice + parseInt(item.sumPrice.value);
				
				}
			}
			document.getElementById('totalPrice').value=totalPrice;
			
		} else {
			//chk 체크박스가 체크되어 있지 않습니다.
			$("input:checkbox[name='chk']").prop("checked", false) //체크해제
			
			document.getElementById('totalPrice').value=0;
		}
	}

	//회원장바구니 선택삭제
	function deleteValue01() {
		var url = "delete.do"
		var valueArr = new Array();
		var list = $("input[name='chk']");
		for (var i = 0; i < list.length; i++) {
			if (list[i].checked) { //선택되어 있으면 배열에 값을 저장한다.
				valueArr.push(list[i].value);
			}
		}
		if (valueArr.length == 0) {
			alert("선택된 상품이 없습니다.");
		} else {
			if (confirm('선택한 상품을 삭제하시겠습니까?')) {
				$.ajax({
					url : url, //전송 URL
					type : 'POST', //POST방식
					traditional : true,
					data : {
						valueArr : valueArr
					//보내고자 하는 data 변수 설정
					},
					success : function(jdata) {
						if (jdata = 1) {
							alert("상품이 삭제 되었습니다.");
							location.replace("memcart.do") //list 로 페이지 새로고침
						} else {
							alert("오류 발생");
						}
					}
				});
			} else {
				return false;
			}
		}
	}

	//비회원 장바구니 선택삭제
	function deleteValue02() {
		var url = "delete.do"
		var valueArr = new Array();
		var list = $("input[name='chk']");
		for (var i = 0; i < list.length; i++) {
			if (list[i].checked) { //선택되어 있으면 배열에 값을 저장한다.
				valueArr.push(list[i].value);
			}
		}
		if (valueArr.length == 0) {
			alert("선택된 상품이 없습니다.");
		} else {
			if (confirm('선택한 상품을 삭제하시겠습니까?')) {
				$.ajax({
					url : url, //전송 URL
					type : 'POST', //POST방식
					traditional : true,
					data : {
						valueArr : valueArr
					//보내고자 하는 data 변수 설정
					},
					success : function(jdata) {
						if (jdata = 1) {
							alert("상품이 삭제 되었습니다.");
							location.replace("nonmemcart.do") //list 로 페이지 새로고침
						} else {
							alert("오류 발생");
						}
					}
				});
			} else {
				return false;
			}
		}
	}

	//회원구매
	function memberbuy() {
		var url = "order.do"
		var totalPrice = $("#totalPrice").val();
		var valueArr = new Array();
		var list = $("input[name='chk']");
		for (var i = 0; i < list.length; i++) {
			if (list[i].checked) { //선택되어 있으면 배열에 값을 저장한다.
				valueArr.push(list[i].value);
			}
		}
		if (valueArr.length == 0) {
			alert("선택된 상품이 없습니다.");
		} else {
			if (confirm('주문 하시겠습니까?')) {
				$.ajax({
					url : url, //전송 URL
					type : 'POST', //POST방식
					traditional : true,
					data : {
						valueArr : valueArr,
						totalPrice : totalPrice
					//보내고자 하는 data 변수 설정
					},
					success : function(jdata) {
						if (jdata = 1) {
							location.replace("order_01.do") //list 로 페이지 새로고침
						} else {
							alert("오류 발생");
						}
					}
				});
			} else {
				return false;
			}
		}
	}

	//비회원구매
	function nonmemberbuy() {
		var url = "order.do"
		var totalPrice = $("#totalPrice").val();
		var valueArr = new Array();
		var list = $("input[name='chk']");
		for (var i = 0; i < list.length; i++) {
			if (list[i].checked) { //선택되어 있으면 배열에 값을 저장한다.
				valueArr.push(list[i].value);
			}
		}
		if (valueArr.length == 0) {
			alert("선택된 상품이 없습니다.");
		} else {
			if (confirm('주문 하시겠습니까?')) {
				$.ajax({
					url : url, //전송 URL
					type : 'POST', //POST방식
					traditional : true,
					data : {
						valueArr : valueArr,
						totalPrice : totalPrice
					//보내고자 하는 data 변수 설정
					},
					success : function(jdata) {
						if (jdata = 1) {
							location.replace("nonorder_01.do") //list 로 페이지 새로고침
						} else {
							alert("오류 발생");
						}
					}

				});
			} else {
				return false;
			}
		}
	}
	<!-- 체크박스 유지 상태에서 수량 변경시 금액 change-->
	function check(chk, idx) {
		var item = (document.getElementsByName('cart'))[idx];//장바구니 목록 index 가져오기
		var totalPrice = parseInt($('#totalPrice').val()); // 총 금액가져오고 int 형으로 변경
		var productPrice = parseInt(item.sumPrice.value);// 상품금액 * 수량가져오기
		if(item.chk.checked == true){
			totalPrice=totalPrice+productPrice;
		} else {
			totalPrice=totalPrice-productPrice;
		}
		
		document.getElementById('totalPrice').value=totalPrice;
	}
	
<!--장바구니 수량체크에 따른 상품금액 계산-->	
	let basket = {
	

		changePNum : function(change_type, idx) {

			
			var item = (document.getElementsByName('cart'))[idx]; //장바구니 목록 index 가져오기
			var p_num = parseInt(item.productCnt.value); //수량 가져오기
			var totalPrice = parseInt($('#totalPrice').val()); // 총금액 가져오기

			var newval = event.target.classList.contains('up') ? p_num + 1
					: event.target.classList.contains('down') ? p_num - 1
							: event.target.value;

			if (parseInt(newval) < 1 || parseInt(newval) > 99) {
				return false;
			}

			item.productCnt.setAttribute('value', newval);
			item.productCnt.value = newval;

			var price = parseInt(item.p_price.value);
		
			
			productPrice = (newval * price);
	
			item.sumPrice.value = productPrice;
			
			if(item.chk.checked == true){
				if(event.target.classList.contains('up')){
					totalPrice = price+totalPrice;
				} else if(event.target.classList.contains('down')){
					totalPrice = totalPrice-price;
				}

				document.getElementById('totalPrice').value=totalPrice;
			} 


		
		}
	
	}


	
	
</script>

<style>
.basketdiv {
	width: 100%;
	border-top: 1px solid #e0e0e0;
	float: left;
	font-size: 0.9375em;
	margin-bottom: 20px;
}

.basketdiv .row.head {
	border-bottom: 2px solid #888;
	box-sizing: border-box;
	background-color: #f4f4f4;
	font-weight: 500;
}

.basketdiv .data {
	border-bottom: 1px dashed #888;
	box-sizing: border-box;
	cursor: pointer;
	float: left;
	width: 100%;
}

.basketdiv .data .empty {
	text-align: center;
	padding: 12px 0;
}

.basketdiv .row.head .subdiv {
	background-color: #f4f4f4;
}

.basketdiv .row>.subdiv {
	display: block;
	float: left;
}

.basketdiv .row>.subdiv:nth-child(1) {
	width: 50%;
}

.basketdiv .row>.subdiv:nth-child(2) {
	width: 40%;
}

.basketdiv .row>.subdiv:nth-child(3) {
	width: 10%;
}

.basketdiv2 .row>.subdiv:nth-child(1) {
	width: 60%;
}

.basketdiv2 .row>.subdiv:nth-child(2) {
	width: 40%;
}

.basketdiv .row>div>div {
	display: block;
	float: left;
	text-align: center;
	margin: 0;
	padding: 12px 0;
}

.basketdiv .row.data>div>div {
	height: 60px;
	line-height: 60px;
}

.basketdiv .data .num .updown {
	color: #0075ff;
	font-size: 2em;
	letter-spacing: -5px;
}

.basketdiv .check {
	width: 10%;
}

.basketdiv .check input[type=checkbox] {
	transform: scale(1.5);
}

.basketdiv .img {
	width: 20%;
}

.basketdiv .pname {
	width: 70%;
}

.basketdiv2 .pname {
	width: 80%;
}

.basketdiv .basketprice {
	width: 33%;
}

.basketdiv .num {
	width: 33%;
	min-width: 105px;
}

.basketdiv .sum {
	width: 34%;
	max-width: 80px;
	color: #0000aa;
}

.basketdiv .point {
	width: 50%;
}

.basketdiv2 .basketprice {
	width: 25%;
}

.basketdiv2 .num {
	width: 25%;
}

.basketdiv2 .sum {
	width: 25%;
	color: #0000aa;
}

.basketdiv2 .point {
	width: 25%;
}

.basketdiv .basketcmd {
	width: 100%;
}

.basketdiv .data .pname {
	text-align: left !important;
	line-height: 1.2 !important;
}

.basketdiv .data .price, .basketdiv .data .sum, .basketdiv .data .point
	{
	text-align: right;
}

.baseform>tbody>tr>td:first-child {
	width: 100px;
}

.buttongroup {
	padding: 11px 0;
	margin: 50px 0;
}

.narrowbuttongroup {
	margin: 15px 0;
}

.buttongroup.center {
	text-align: center;
}

.buttongroup input[type=text], .buttongroup input[type=password] {
	height: 30px;
}

.buttongroup button, .buttongroup a {
	margin-right: 5px;
}

.buttongroup button:last-child, .buttongroup a:last-child {
	margin-right: 0;
}

.abutton, .abutton:link, .abutton:visited, .abutton:active, input[type=button]
	{
	background-color: #383838;
	border: 1px solid #888888;
	color: #ffffff;
	cursor: pointer;
	letter-spacing: -1px;
	padding: 3px 5px;
	margin: 2px 3px;
	width: auto;
	word-break: keep-all;
	border-radius: 5px;
	text-decoration: none;
	font-size: 0.9375em;
}

.abutton-alt {
	background-color: #d3e2c6;
}

.red {
	color: #b00;
}

.blue {
	color: #0075ff;
}

.basketrowcmd, .sumcount, .summoney {
	text-align: right;
	margin-bottom: 10px;
}

.sumcount, .summoney {
	font-size: 1.25em;
	font-weight: bold;
}

.buttongroup {
	text-align: center;
}

.buttongroup a {
	text-decoration: none;
}

.cmd a, .cmd span {
	padding: 12px 30px;
	box-sizing: border-box;
	margin-top: 10px;
	font-size: 1.2em;
	color: #000;
	background-color: #f4f4f4;
	border: 1px solid #e0e0e0;
	text-align: center;
}

.cmd.small a, .cmd.small span {
	padding: 6px 20px;
	font-size: 0.8125em;
}

.orderform .p_num {
	text-align: right;
	width: 40px;
	font-size: 1em;
}
</style>

</head>
<title>주문결제창</title>
<body>





	<!-- 장바구니 타이틀 -->
	<section class="ftco-section" style="padding-top: 100px;">
		<div class="container">

			<c:choose>
				<c:when test="${isLogOn == true && member != null}">
					<div
						style="font-size: 25px; font-weight: bold; margin-bottom: 20px;">
						<a style="color: #7e9c8c;">장바구니</a>
						<button type="button" onclick="deleteValue01();"
							style="float: right; border-radius: 2px; margin-bottom: 3px; margin-top: 15px; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; height: 30px; font-size: 14px;"
							class="btn-secondary btn-xs">선택삭제</button>
						<button type="button" onclick="checkAll()"
							class="btn-secondary btn-xs"
							style="float: right; border-radius: 2px; margin-bottom: 3px; margin-top: 15px; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; height: 30px; font-size: 14px;">전체선택</button>

					</div>
				</c:when>
				<c:otherwise>
					<div
						style="font-size: 25px; font-weight: bold; margin-bottom: 20px;">
						<a style="color: #7e9c8c;">장바구니</a>
						<button type="button" onclick="deleteValue02();"
							style="float: right; border-radius: 2px; margin-bottom: 3px; margin-top: 15px; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; height: 30px; font-size: 14px;"
							class="btn-secondary btn-xs">선택삭제</button>
						<button type="button" onclick="checkAll();"
							class="btn-secondary btn-xs"
							style="float: right; border-radius: 2px; margin-bottom: 3px; margin-top: 15px; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; height: 30px; font-size: 14px;">전체선택</button>

					</div>

				</c:otherwise>
			</c:choose>



			<!-- 장바구니타이틀끝 -->

			<!-- 최근 본 상품 -->
			<div id="recentlyProduct"
				style="position: absolute; width: 120px; height: 310px; margin-left: 1370px; border: 1px solid #d2d2d2; margin-top: -100px;">
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



			<!-- 내용 -->
			<div class="order_list">


				<c:choose>
					<c:when test="${isLogOn == true && member != null}">
						<table class="table"
							style="margin-top: 0px; font-size: 14px; vertical-align: middle;">
							<thead class="table-dark" align=center>
								<tr align="center"
									style="background-color: #eeeeee; border-top: 1px solid #7e9c8c; border-bottom: 1px solid #c6c8ca; font-size: 15px; color: black;">
									<td scope="col" width="100">선택</td>
									<td scope="col" width="150"></td>
									<td scope="col" width="400" align=left>상품명</td>
									<td scope="col" width="80">수량</td>
									<td scope="col" width="80">배송비</td>
									<td scope="col" width="80">가격</td>
									<td scope="col" width="100">합계</td>
								</tr>
							</thead>

							<c:forEach items="${cartlist}" var="cartlist" varStatus="status">
								<form name="cart">
									<tbody>
										<tr class="tr1" align="center"
											style="border-bottom: 1px solid rgba(0, 0, 0, 0.1);">
											<th scope="col"
												style="vertical-align: middle; align: center;"><input
												type="checkbox" name="chk" value="${cartlist.memCartId}"
												onclick="check(this,${status.index})"></th>
											<td scope="col"><img
												src="${contextPath}/download_product.do?productNum=${cartlist.productNum}&productImage=${cartlist.productImage}"
												width=80 height=80></td>
											<td scope="col" align=left style="padding-top: 25px;">${cartlist.productName}<br>${cartlist.option1name}
												: ${cartlist.option1value} <br>${cartlist.option2name}
												: ${cartlist.option2value}
											</td>
											<td scope="col" align=center style="vertical-align: middle;">

												<div class="num">
													<div class="updown">
														<span
															onclick="javascript:basket.changePNum(1,'${status.index}');"><i
															class="fas fa-arrow-alt-circle-up up"></i></span> <input
															type="text" name="productCnt" id="productCnt" size="2"
															maxlength="4" class="p_num"
															value="${cartlist.productCnt}"
															onkeyup="javascript:basket.changePNum(1,'${status.index}');">
														<span
															onclick="javascript:basket.changePNum(1,'${status.index}');"><i
															class="fas fa-arrow-alt-circle-down down"></i></span>
													</div>
												</div>
											</td>
											<td scope="col" align=center style="vertical-align: middle;">${cartlist.deliverycharge}</td>
											<td scope="col" align=center style="vertical-align: middle;">
												<input type="hidden" name="p_price" id="p_price2"
												class="p_price" value="${cartlist.productPrice}">${cartlist.productPrice}
											</td>
											<td scope="col" align=center style="vertical-align: middle;"><input
												name="sumPrice" id="sumPrice"
												style="border: none; color: #666666; background-color: transparent; font-weight: lighter; width: 80px;"
												value="${cartlist.totalPrice}" disabled /></td>
										</tr>

									</tbody>
								</form>
							</c:forEach>
							<tfoot>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td colspan="4" align=right
										style="font-size: 18px; color: #7e9c8c; font-weight: bold;">총
										합계<input type="text" id="totalPrice" name="totalPrice"
										value="0"
										style="border: none; width: 100px; text-align: right; font-size: 18px; color: #7e9c8c; font-weight: bold;" />원
									</td>
								</tr>
							</tfoot>
						</table>
						<div></div>
						<br>
						<br>
						<br>
						<div class="container" style="padding-left: 450px;">
							<button type="button" onclick="memberbuy()" class="btn btn-dark "
								id="buttonmy"
								style="padding-left: 10px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 130px; height: 45px; font-size: 14px; margin-left: 40px;">선택상품주문</button>
							&nbsp;&nbsp;&nbsp;
							<button type="button" onclick="buyall()" id="buttonmy"
								class="btn btn-dark"
								style="width: 75px; background-color: white; color: gray; border: 1px solid #7e9c8c; border-radius: 2px; margin-left: 20px; width: 130px; height: 45px; font-size: 14px;">전체상품주문</button>
						</div>
					</c:when>



					<c:otherwise>

						<table class="table">
							<thead class="table-dark" align=center>
								<tr align="center"
									style="background-color: #eeeeee; border-top: 1px solid #7e9c8c; color: black; border-bottom: 1px solid #c6c8ca; font-size: 15px;">
									<td scope="col" width="100">선택</td>
									<td scope="col" width="150"></td>
									<td scope="col" width="400" align=left>상품명</td>
									<td scope="col" width="80">수량</td>
									<td scope="col" width="80">배송비</td>
									<td scope="col" width="80">가격</td>
									<td scope="col" width="100">합계</td>
								</tr>
							</thead>
							<c:forEach items="${cartlist}" var="cartlist" varStatus="status">
								<form name="cart">
									<tbody>
										<tr style="font-size: 14px; border-bottom: 1px solid #c6c8ca;">
											<td scope="col" height="100" align=center><br> <br>
												<input type="checkbox" name="chk" value="${status.index}"
												onclick="check(this,${status.index})"></td>
											<td scope="col"><img
												src="${contextPath}/download_product.do?productNum=${cartlist.productNum}&productImage=${cartlist.productImage}"
												width=80 height=80></td>
											<td scope="col" align=left style="padding-top: 25px;">${cartlist.productName}<br>${cartlist.option1name}
												: ${cartlist.option1value} <br>${cartlist.option2name}
												: ${cartlist.option2value}
											</td>
											<td scope="col" align=center><br> <br>

												<div class="num">
													<div class="updown">
														<span
															onclick="javascript:basket.changePNum(1,'${status.index}');"><i
															class="fas fa-arrow-alt-circle-up up"></i></span> <input
															type="text" name="productCnt" id="productCnt" size="2"
															maxlength="4" class="p_num"
															value="${cartlist.productCnt}"
															onkeyup="javascript:basket.changePNum(1,'${status.index}');">
														<span
															onclick="javascript:basket.changePNum(1,'${status.index}');"><i
															class="fas fa-arrow-alt-circle-down down"></i></span>
													</div>
												</div></td>
											<td scope="col" align=center><br> <br>${cartlist.deliverycharge}</td>
											<td scope="col" align=center><br> <input
												type="hidden" name="p_price" id="p_price2" class="p_price"
												value="${cartlist.productPrice}"> <br>${cartlist.productPrice}
											</td>
											<td scope="col" align=center><br> <br> <input
												name="sumPrice" id="sumPrice"
												style="border: none; color: #666666; background-color: transparent; font-weight: lighter; width: 80px;"
												value="${cartlist.totalPrice}" disabled /></td>
										</tr>
									</tbody>
								</form>
							</c:forEach>
							<tfoot>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td colspan="4" align=right
										style="font-size: 18px; color: #7e9c8c; font-weight: bold;">총
										합계<input type="text" id="totalPrice" name="totalPrice"
										value="0"
										style="border: none; width: 100px; text-align: right; font-size: 18px; color: #7e9c8c; font-weight: bold;" />원
									</td>
								</tr>
							</tfoot>
						</table>





						<br>
						<br>
						<br>
						<div class="container" style="padding-left: 450px;">
							<button type="button" onclick="nonmemberbuy()"
								class="btn btn-dark " id="buttonmy"
								style="padding-left: 10px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 130px; height: 45px; font-size: 14px; margin-left: 40px;">선택상품주문</button>
							&nbsp;&nbsp;&nbsp;
							<button type="button" onclick="nextt()" id="buttonmy"
								class="btn btn-dark"
								style="width: 75px; background-color: white; color: gray; border: 1px solid #7e9c8c; border-radius: 2px; margin-left: 20px; width: 130px; height: 45px; font-size: 14px;">전체상품주문</button>
						</div>
					</c:otherwise>
				</c:choose>



			</div>
		</div>
	</section>
</body>
</html>














