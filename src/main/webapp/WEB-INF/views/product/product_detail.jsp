<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="option1" value="${option.optionList1}" />
<c:set var="option2" value="${option.optionList2}" />

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<style type="text/css">
#pdcategory {
	font-size: 17px;
	background-color: #f8f8f8;
	border: 1px solid #e7e7e7;
	border-right: none;
	height: 50px;
	color: #777;
}

#recentlyProduct {
	position: absolute;
	top: 180px;
	right: 50%;
	margin-right: -670px;
}

<!--
상품리뷰 오버랩 디자인------------->textarea {
	width: 439px;
	height: 27px;
	background-color: #efefef;
	border-radius: 6px;
	border: 1px solid #dedede;
	padding: 10px;
	margin-top: 3px;
	font-size: 0.9em;
	color: #3a3a3a;
}

input:focus, textarea:focus {
	border: 1px solid #97d6eb;
}

textarea {
	height: 60px;
	background-color: #efefef;
}

#submit {
	width: 127px;
	height: 48px;
	text-align: center;
	border: none;
	margin-top: 20px;
	cursor: pointer;
}

#submit:hover {
	color: #fff;
	background-color: #216282;
	opacity: 0.9;
}

#cancel {
	width: 127px;
	height: 48px;
	text-align: center;
	border: none;
	margin-top: 20px;
	cursor: pointer;
}

#cancel:hover {
	color: #fff;
	background-color: #216282;
	opacity: 0.9;
}

.review {
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	opacity: 0;
	visibility: hidden;
	transform: scale(1.1);
	transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform
		0.25s;
}

.review-content {
	position: absolute;
	top: 60%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	padding: 1rem 1.5rem;
	width: 850px;
	height: 500px;
	border-radius: 0.5rem;
}

.close-button {
	float: right;
	width: 1.5rem;
	line-height: 1.5rem;
	text-align: center;
	cursor: pointer;
	border-radius: 0.25rem;
	background-color: lightgray;
}

.close-button:hover {
	background-color: darkgray;
}

.show-modal {
	opacity: 1;
	visibility: visible;
	transform: scale(1.0);
	transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s;
}


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

<script type="text/javascript">


function getSelectValue1(frm)
{
	frm.option1value.value = frm.option1.options[frm.option1.selectedIndex].text;
}

function getSelectValue2(frm)
{
	frm.option2value.value = frm.option2.options[frm.option2.selectedIndex].text;
}


<!-- 옵션선택 유효성 검사 -->

function checkbuy() {
	var form = document.form1;

	if (form.option1.value == "") {
		alert("옵션을 선택해주세요.")
		form.form1.focus();
		return false;
	}
	
	if (form.option2.value == "") {
		alert("옵션을 선택해주세요.")
		form.form1.focus();
		return false;
	}
	if (confirm("선택한 상품을 구매하시겠습니까?")) { //확인
		
	} else { //취소
		return false;
	}
	form.action="${contextPath}/orderNow.do"
	form.submit();

}

function addCartBtn() {
	var form = document.form1;

	if (form.option1.value == "") {
		alert("옵션을 선택해주세요.")
		form.form1.focus();
		return false;
	}
	
	if (form.option2.value == "") {
		alert("옵션을 선택해주세요.")
		form.form1.focus();
		return false;
	}
	
	if (confirm("장바구니에 담으시겠습니까?")){ //확인
		
		
	} else { //취소
		return;
	}
	form.action="${contextPath}/cartall.do"
	form.submit();
}

function add_favorite(productNum) {

		if(${isLogOn != true}){
		      alert("로그인이 필요합니다.");
		}else{
    	    $.ajax({
	        	type : "post",
	        	async : false, //false인 경우 동기식으로 처리한다.
	        	url : "${contextPath}/addProductInFavorite.do",
	        	data : {
	        		productNum:productNum
			
    	    	},
    	    	success : function(data, textStatus) {
	        		//alert(data);
	            	//	$('#message').append(data);
	        		if(data.trim()=='add_success'){
	        			
	        			$("#favoriteHeart").attr("src", "${contextPath}/resources/images/heartfull.jpg");

	        			
	        		}else if(data.trim()=='already_existed'){
		    	    	
		    	    	$("#favoriteHeart").attr("src", "${contextPath}/resources/images/heart.jpg");
		        	}
	     		
	        	},
	        	error : function(data, textStatus) {
	        		alert("에러가 발생했습니다."+data);
    	    	},
    	    	complete : function(data, textStatus) {
    	     		//alert("작업을완료 했습니다");
    	    	}
        	}); //end ajax	
		}
	
	
}


$(document).ready(function(){ 
	
	var productNum = document.getElementById('productNum').value;

	
	if(${isLogOn != true}){
		
		document.getElementById('favoriteHeart').style.display = 'inline';
		
	}else{
		
	      $.ajax({
	             
	            type : "GET",
	            url : "${contextPath}/favoriteInquiry.do",
	            data:{
	            	productNum:productNum
	            },	
	            dataType : "text",
	            error : function(data){
	            	alert("에러가 발생했습니다."+data);
	            },
	            success : function(data){
	            	if(data.trim()=='already_existed'){
	            	document.getElementById('favoriteHeart').style.display = 'inline';
	            	$("#favoriteHeart").attr("src", "${contextPath}/resources/images/heartfull.jpg");	}
	            	else{
	            		document.getElementById('favoriteHeart').style.display = 'inline';}
	            }
	             
	        });

		}

		});


function questionWrite() {
    if (${isLogOn != true && member == null}) {
        alert("로그인이 필요합니다.");
        location.href = '${contextPath}/login_01.do';
    } else{
    	return false;
    }
    	
    	
    
}

function fn1() {

	if (confirm("삭제하시겠습니까??") == true) { //확인
	return true
	} else { //취소
		return false;

	}
    	
  
}

<!--옵션 수량에 따른 가격-->
let basket = {
		

		changePNum : function(idx, change_type) {
			var item = document.querySelector('input[name=productCnt]');
			var p_num = parseInt(document.getElementById('productCnt').value);
			var price = parseInt(document.getElementById('totalPrice').value);
			var price1 = parseInt(document.getElementById('productPrice').value);
			
			var newval = event.target.classList.contains('up') ? p_num + 1
					: event.target.classList.contains('down') ? p_num - 1
							: event.target.value;

			if (parseInt(newval) < 1 || parseInt(newval) > 99) {
				return false;
			}

			item.setAttribute('value', newval);
			item.value = newval;
			
			
			
			productPrice = (newval * price1);
			

			document.getElementById('totalPrice').value = productPrice;
			


			
			
	}
	
	}

<!--옵션 선택에 따른 상품 금액-->
function optionSelect(option) {
	if($('#selectTable tr').length>0){
		$('#selectTable tr').remove();
	
	}
	var i = $('#selectTable>tr').length +1;
	 var table = document.getElementById("selectTable");

	 var productName = document.getElementById('productName').value

	 var row = table.insertRow(0); //새로운 행추가
	 var option1Name = document.getElementById('option1name').value

	 var option2Name = document.getElementById('option2name').value
	 
	 var option1ValueName = $("#option1 option:selected").text(); // 선택된 옵션  select text 가져오기
	 var option2ValueName = $("#option2 option:selected").text();
	 
	 var option1value = parseInt($("#option1 option:selected").val()); // 선택된 옵션  select value 가져오기
	 var option2value = parseInt($("#option2 option:selected").val());
	 var price = parseInt(document.getElementById('price').value);

	 document.getElementById('totalPrice').value = price+option1value+option2value;
	 document.getElementById('productPrice').value = price+option1value+option2value;
	 var productPrice =  document.getElementById('productPrice').value
	
	 //행추가내용
	 row.innerHTML = "<td style='width:100px; '><div class='updown'><span onclick='javascript:basket.changePNum(1,i);'><i class='fas fa-arrow-alt-circle-up up'></i></span> <input type='text' name='productCnt' id='productCnt' size='2' maxlength='4' class='p_num' value='1' onkeyup='javascript:basket.changePNum(1,i);''><span onclick='javascript:basket.changePNum(1,i);''><i class='fas fa-arrow-alt-circle-down down'></i></span></div></td><td style='width:200px;'>"+productName+"</td><td style='width:200px; '>"+option1Name+":"+option1ValueName+"<br>"+option2Name+":"+option2ValueName+"</td><td>"+productPrice+"</td>";



}

//number 콤마

	
</script>


</head>
<body>
	<!-- 최근 본 상품 -->

	<!-- 최근 본 상품 끝 -->


	<section class="ftco-section"
		style="padding-top: 20px; margin-bottom: 200px; margin-top: 80px;">
		<div class="container">
			<form name="form1" method="post" id="addCartForm">
				<input type="hidden" name="productNum" value="${product.productNum}"
					id="productNum" /> <input type="hidden" name="productName" id="productName"
					value="${product.productName}" /> <input type="hidden"
					name="option1name" id="option1name" value="${option1[1].option1Name}" /> <input
					type="hidden" name="option2name" id="option2name" value="${option2[1].option2Name}" />
				<input type="hidden" name="deliverycharge" value="무료배송" />





				<!-- 내용 -->
				<div class="row">
					<section>
						<div class="col-md-4 ftco-animate">
							<div class="blog-entry">
								<a><img
									src="${contextPath}/download_product.do?productNum=${product.productNum}&productImage=${product.productImage}"
									style="border: 1px solid gray; width: 600px; height: 409.68px; margin-left: -15px; float: left;">
								</a> <br>
							</div>
						</div>
					</section>
					<input type="hidden" name="productImage"
						value="${product.productImage}" />

					<div style="width: 685px; height: 480px;">

						<h1
							style="font-weight: bold; font-size: 20px; color: #7e9c8c; float: left; margin-left: 50px; margin-top: 5px;">${product.productName}</h1>
						<a href="javascript:add_favorite('${product.productNum }')"
							style="all: none; font-size: 15px; color: #7e9c8c; float: right; margin-top: 10px; margin-right: 50px;">
							<img src="${contextPath}/resources/images/heart.jpg"
							id="favoriteHeart"
							style="width: 17px; height: 17px; display: none; margin-bottom: 3px;" /><span
							style="padding-top: 7px;">관심상품</span>
						</a>
						<hr style="width: 600px; margin-top: 45px;">
						<h3 class="heading">
							<a
								style="position: absolute; white-space: nowrap; margin-top: 5px; margin-left: 50px; float: left; font-size: 14px; color: #5f5f5f;">판매가ㅤㅤ
								ㅤ</a><a
								style="position: absolute; white-space: nowrap; margin-top: 5px; margin-left: 180px; font-size: 14px; color: #5f5f5f;"><fmt:formatNumber
														pattern="###,###,###" value="${product.productPrice}" />원</a><input
								type="hidden" name="price" id="price" value="${product.productPrice}" >
						</h3>

						<h3 class="heading">
							<a
								style="position: absolute; white-space: nowrap; margin-top: 50px; margin-left: 51px; float: left; font-size: 14px; color: #5f5f5f;">제조사ㅤㅤ
								ㅤ</a><a
								style="position: absolute; white-space: nowrap; margin-top: 50px; margin-left: 180px; font-size: 14px; color: #5f5f5f;">${product.productManufacturer}</a>
						</h3>
						<br> <br>
						<h3 class="heading">
							<a
								style="position: absolute; white-space: nowrap; margin-top: 50px; margin-left: 51px; float: left; font-size: 14px; color: #5f5f5f;">원산지ㅤㅤ
								ㅤ</a>
						</h3>
						<h3 class="heading">
							<a
								style="position: absolute; white-space: nowrap; margin-top: 40px; margin-left: 180px; font-size: 14px; color: #5f5f5f;">${product.productOrigin}</a>
						</h3>
						<br>



						<h3 class="heading">
							<c:forEach items="${option1}" var="name1" begin="0" end="0">
								<a
									style="position: absolute; white-space: nowrap; margin-top: 82px; margin-left: 51px; float: left; font-size: 14px; color: #5f5f5f; font-weight: normal;">${name1.option1Name}ㅤㅤ
									ㅤ</a>
							</c:forEach>
						</h3>
						<select id="option1" name="option1"
							onchange="getSelectValue1(this.form);"
							style="margin-left: 180px; margin-top: 70px; left: 675px; font-size: 14px; border: 1px solid #dcdcdc; width: 326px; height: 32px;">
							<option value="">옵션 선택</option>
							<c:forEach items="${option1}" var="option1">
								<option value="${option1.option1price}">${option1.option1value}
									+ (${option1.option1price}원)</option>
							</c:forEach>
						</select> <input type="hidden" name="option1value"> <br>
						<h3 class="heading">
							<c:forEach items="${option2}" var="name2" begin="0" end="0">
								<a
									style="position: absolute; white-space: nowrap; margin-top: 35px; margin-left: 51px; float: left; font-size: 14px; color: #5f5f5f; font-weight: normal;">${name2.option2Name}
									ㅤ</a>
							</c:forEach>

						</h3>
						<select name="option2" id="option2"
							onchange="getSelectValue2(this.form); optionSelect(this);"
							style="margin-left: 180px; margin-top: 20px; float: left !important; font-size: 14px; border: 1px solid #dcdcdc; width: 326px; height: 32px;">
							<option value="">옵션 선택</option>
							<c:forEach items="${option2}" var="option2">
								<option value="${option2.option2price}">${option2.option2value}
									+ (${option2.option2price}원)</option>
							</c:forEach>
						</select> <br> <input type="hidden" name="option2value">
						<button type="button" class="btn btn-default" onclick="checkbuy()"
							style="background-color: #7e9c8c; float: left; margin-left: 50px; margin-top: 37px; width: 280px; height: 50px; border-radius: 2px; font-size: 14px; color: white;">바로구매</button>
						<button type="button" class="btn btn-default"
							onclick="addCartBtn()"
							style="background-color: #eeeeee; float: left; margin-left: 350px; margin-top: -50px; width: 280px; height: 50px; border-radius: 2px; font-size: 14px;">장바구니</button>
						
						<table id="selectTable" style="font-size:14px; margin-top:10px; margin-left:40px; display:inline-table;">
						
						</table>
						<hr style=" width:600px; display:inline-table; margin-left:40px; margin-bottom:0px;">
						<input type="hidden" value="0" name="productPrice" id="productPrice"/>
						<h2
							style="font-size: 18px; test-align: right; width: 400px; margin-left: 380px;">
							총 상품 금액ㅤ<input type="text" name="totalPrice" id="totalPrice" value="0"
								style="border: none; text-align: right; font-size: 20px; width: 98px; margin-left: 18px;"
								readonly />원
						</h2>
					
					</div>

				</div>

			</form>

			<!-- 탭메뉴 자바스크립트 -->
			<c:choose>
				<c:when test="${pageNum != 1}">
					<script type="text/javascript"
						src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
					<script type="text/javascript">
						$(document).ready(function() {
							//When page loads...
							$(".tab_content").hide(); //Hide all content
							$("ul.tabs li:nth(1)").addClass("active").show(); //Activate first tab
							$(".tab_content:nth(1)").show(); //Show first tab content
							//On Click Event
							$("ul.tabs li").click(function() {
								$("ul.tabs li").removeClass("active"); //Remove any "active" class
								$(this).addClass("active"); //Add "active" class to selected tab
								$(".tab_content").hide(); //Hide all tab content
								var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
								$(activeTab).fadeIn(); //Fade in the active ID content
								return false;

							});

							window.scrollBy(200, 600);

						});
					</script>
				</c:when>
				<c:when test="${pageNum2 != 1}">
					<script type="text/javascript"
						src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
					<script type="text/javascript">
						$(document).ready(function() {
							//When page loads...
							$(".tab_content").hide(); //Hide all content
							$("ul.tabs li:nth(3)").addClass("active").show(); //Activate first tab
							$(".tab_content:nth(3)").show(); //Show first tab content
							//On Click Event
							$("ul.tabs li").click(function() {
								$("ul.tabs li").removeClass("active"); //Remove any "active" class
								$(this).addClass("active"); //Add "active" class to selected tab
								$(".tab_content").hide(); //Hide all tab content
								var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
								$(activeTab).fadeIn(); //Fade in the active ID content
								return false;

							});

							window.scrollBy(200, 600);

						});
					</script>
				</c:when>
				<c:otherwise>
					<script type="text/javascript"
						src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
					<script type="text/javascript">
						$(document).ready(function() {
							//When page loads...
							$(".tab_content").hide(); //Hide all content
							$("ul.tabs li:first").addClass("active").show(); //Activate first tab
							$(".tab_content:first").show(); //Show first tab content
							//On Click Event
							$("ul.tabs li").click(function() {
								$("ul.tabs li").removeClass("active"); //Remove any "active" class
								$(this).addClass("active"); //Add "active" class to selected tab
								$(".tab_content").hide(); //Hide all tab content
								var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
								$(activeTab).fadeIn(); //Fade in the active ID content
								return false;
							});
						});
					</script>
				</c:otherwise>
			</c:choose>
			<!-- 탭메뉴 영역 -->
			<!-- 레이어 팝업창 -->



			<ul class="nav  tabs" style="margin-top: 100px;">
				<li role="presentation" class="active"
					style="width: 290px; margin-left: 30px; text-align: center;"><a
					href="#tab1" style="font-size: 17px; color: black;">상품상세정보</a></li>
				<li role="presentation" style="width: 290px; text-align: center;"><a
					href="#tab2" style="font-size: 17px; color: black;" id="tab2Review">고객후기<span
						style="color: #7e9c8c; font-weight: bold;">
							(${pageMaker.totalCount})</span></a></li>
				<li role="presentation" style="width: 290px; text-align: center;"><a
					href="#tab3" style="font-size: 17px; color: black;">AS/배송/반품안내</a></li>
				<li role="presentation" style="width: 290px; text-align: center;"><a
					href="#tab4"
					style="font-size: 17px; margin-left: 50px; color: black;">상품문의</a></li>

			</ul>
			<hr style="margin-right: 30px;">
			<div id="wrapper">
				<div class="tab_container">

					<div id="tab1" class="tab_content"
						style="margin-left: 190px; margin-right: 170px;">
						<!--Content-->
						<img style="width: 1200px; margin-left: -180px;"
							src="${contextPath}/download_product1.do?productNum=${product.productNum}&productContentImage=${product.productContentImage}">
					</div>
					<div id="tab2" class="tab_content">
						<!--Content-->
						<table class="table"
							style="margin-top: 60px; text-align: center; width: 1200px; margin-left: 20px; font-size: 14px;">

							<tr
								style="background-color: #eeeeee; border-top: 1px solid #7e9c8c; border-bottom: 1px solid #c6c8ca;">
								<td>번호</td>
								<td>작성자</td>
								<td>내용</td>
								<td>작성일자</td>
							</tr>
							<c:set var="num"
								value="${pageMaker.totalCount - ((pageNum-1) * 10) }" />
							<c:choose>
								<c:when test="${empty productReviewList}">
									<tr style="backgroundcolor: white; width: 1000px;">

										<td colspan="4" style="padding-top: 100px;">등록 된 리뷰가
											없습니다.</td>
									</tr>
								</c:when>

								<c:when test="${!empty productReviewList}">
									<c:forEach var="productReview" items="${productReviewList}">
										<div id="tallModal" class="modal modal-wide fade">
											<div class="modal-dialog">
												<div class="modal-content"
													style="width: 600px; height: 500px;">
													<div class="modal-header" style="text-align: center;">
														<h4 class="modal-title" style="font-size: 17px;">${productReview.productReviewTitle}</h4>
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">&times;</button>
													</div>
													<div class="modal-body">
														<p>${productReview.productContent}</p>
														<img style="width: 300px; height: 300px;"
															src="${contextPath}/download_review.do?reviewNum=${productReview.reviewNum}&reviewFile=${productReview.reviewFile}">
													</div>

													<img src="" />
													<div class="modal-footer">
														<button type="button" class="btn btn-primary"
															data-dismiss="modal"
															style="float: right; border-radius: 2px;">Close</button>
													</div>
												</div>
												<!-- /.modal-content -->
											</div>
											<!-- /.modal-dialog -->
										</div>


										<!-- /.modal -->
										<tr style="border-bottom: 1px solid #c6c8ca;">
											<td style="width: 100px;">${num}</td>
											<td style="width: 200px;">${productReview.memName }</td>
											<td style="width: 500px; text-align: left;"><a
												style="color: black; cursor: pointer;" data-toggle="modal"
												href="#tallModal"> ${productReview.productReviewTitle}</a> <!-- 팝업시킬 태그 -->
											</td>
											<td style="width: 200px;">2021-06-12</td>
										</tr>
										<c:set var="num" value="${num-1}"></c:set>
									</c:forEach>
								</c:when>
							</c:choose>
						</table>

						<div class="page_wrap"
							style="margin-top: 50px; margin-left: -80px;" align="center">
							<div class="page_nation">
								<c:if test="${pageMaker.prev}">

									<a class="arrow prev"
										style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px; padding-left: 6px; padding-right: 7px;"
										href='<c:url value="/product/viewProduct.do?productNum=${product.productNum}&page=${pageMaker.startPage-1 }"/>'><i
										class="fa fa-chevron-left"></i></a>

								</c:if>
								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="pageNum">

									<a
										style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px; padding-left: 6px; padding-right: 7px;"
										href='<c:url value="/product/viewProduct.do?productNum=${product.productNum}&page=${pageNum }"/>'><i
										class="fa">${pageNum }</i></a>

								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

									<a class="arrow next"
										style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px; padding-left: 6px; padding-right: 7px;"
										href='<c:url value="/product/viewProduct.do?productNum=${product.productNum}&page=${pageMaker.endPage+1 }"/>'><i
										class="fa fa-chevron-right"></i></a>

								</c:if>
							</div>
						</div>



					</div>
					<div id="tab3" class="tab_content"
						style="margin-left: 0px; margin-right: 170px;">
						<!--Content-->
						<img src="${contextPath}/resources/images/delivery.png"
							style="width: 1000px; margin-left: 20px; margin-top: 50px;">

					</div>

					<div id="tab4" class="tab_content"
						style="margin-left: 0px; margin-right: 170px;">
						<!--Content-->
						<c:choose>
							<c:when test="${isLogOn == true && member != null}">
								<a id="buttonmy" class="btn btn-dark" data-toggle="modal"
									href="#tallModal1"
									style="float: right; margin-top: 25px; border-radius: 2px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 120px; height: 40px; padding-top: 10px; font-size: 14px; margin-bottom: 5px;">상품문의하기</a>
							</c:when>
							<c:when test="${isLogOn != true && member == null}">
								<a onclick="questionWrite()" id="buttonmy" class="btn btn-dark"
									data-toggle="modal"
									style="float: right; margin-top: 25px; border-radius: 2px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 120px; height: 40px; padding-top: 10px; font-size: 14px; margin-bottom: 5px;">상품문의하기</a>
							</c:when>
						</c:choose>

						<table class="table"
							style="margin-top: 60px; text-align: center; width: 1200px;">

							<tr
								style="background-color: #eeeeee; border-top: 1px solid #7e9c8c; border-bottom: 1px solid #c6c8ca;">
								<td style="width: 100px;">번호</td>
								<td style="width: 200px;">작성자</td>
								<td style="width: 500px;">내용</td>
								<td style="width: 200px;">작성일자</td>
								<td style="width: 200px;">답변</td>
							</tr>
							<c:choose>
								<c:when test="${empty productQuestionList}">
									<tr style="backgroundcolor: white; width: 1000px;">

										<td colspan="4" style="padding-top: 100px;">등록 된 상품 문의가
											없습니다.</td>
									</tr>
								</c:when>
								<c:when test="${!empty productQuestionList}">
									<c:forEach var="questionList" items="${productQuestionList}">
										<div id="tallModal1" class="modal modal-wide fade">
											<div class="modal-dialog">
												<div class="modal-content"
													style="width: 700px; height: 600px;">
													<div class="modal-header" style="text-align: center;">
														<h4 class="modal-title" style="font-size: 17px;">글쓰기</h4>
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">&times;</button>
													</div>
													<form
														action="${contextPath}/addNewQuestion.do?productNum=${product.productNum}"
														method="post">
														<div class="modal-body">
															<p style="float: left;">작성자 :</p>
															<input type="text" name="memName"
																value="${member.memName}" disabled
																style="border: 1px solid #dcdcdc;" />
															<hr>
															<p style="float: left;">제 목 :</p>
															<input type="text" name="productQuestionTitle"
																style="border: 1px solid #dcdcdc;" />
															<hr>
															<p style="float: left;">내 용 :</p>
															<textarea name="productQuestionContent"
																style="border: 1px solid #dcdcdc; width: 585px; height: 300px; background-color: white;"></textarea>


														</div>

														<img src="" />
														<div class="modal-footer">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true"
																style="width: 56px; height: 38px; border: 1px solid #7e9c8c; font-size: 14px;">취소</button>
															<button type="submit" class="btn btn-primary"
																style="float: right; border-radius: 2px;">등록</button>
														</div>
													</form>
												</div>
												<!-- /.modal-content -->
											</div>
											<!-- /.modal-dialog -->
										</div>

										<!-- 상품문의 수정하기 -->
										<div id="tallModal2" class="modal modal-wide fade">
											<div class="modal-dialog">
												<div class="modal-content"
													style="width: 700px; height: 600px;">
													<div class="modal-header" style="text-align: center;">
														<h4 class="modal-title" style="font-size: 17px;">글수정하기</h4>
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">&times;</button>
													</div>
													<form
														action="${contextPath}/modNewQuestion.do?productNum=${product.productNum}&productQuestionNum=${questionList.productQuestionNum}"
														method="post">
														<div class="modal-body">
															<p style="float: left;">작성자 :</p>
															<input type="text" name="memName"
																value="${member.memName}" disabled
																style="border: 1px solid #dcdcdc;" />
															<hr>
															<p style="float: left;">제 목 :</p>
															<input type="text" name="productQuestionTitle"
																style="border: 1px solid #dcdcdc;"
																value="${questionList.productQuestionTitle}" />
															<hr>
															<p style="float: left;">내 용 :</p>
															<textarea name="productQuestionContent"
																style="border: 1px solid #dcdcdc; width: 585px; height: 300px; background-color: white;">${questionList.productQuestionContent}</textarea>


														</div>

														<img src="" />
														<div class="modal-footer">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true"
																style="width: 56px; height: 38px; border: 1px solid #7e9c8c; font-size: 14px;">취소</button>
															<button type="submit" class="btn btn-primary"
																style="float: right; border-radius: 2px;">수정</button>
														</div>
													</form>
												</div>
												<!-- /.modal-content -->
											</div>
											<!-- /.modal-dialog -->
										</div>

										<tr style="border-bottom: 1px solid grey;">

											<td style="width: 100px;">${questionList.productQuestionNum}</td>
											<td style="width: 200px;">${questionList.memName}</td>
											<td style="width: 500px;"><input type="hidden"
												name="productQuestionNum" id="productQuestionNum"
												value="${questionList.productQuestionNum}" />
												<div>
													<div id="section1b" class="label">
														<p
															style="text-align: left; cursor: pointer; font-weight: normal; margin-bottom: 0px;">

															${questionList.productQuestionTitle}</p>
													</div>
													<div id="section1b" class="elements">
														<hr style="margin-bottom: 20px; margin-top: 0px;">
														<p style="text-align: left; margin-bottom: 0px;">
															${questionList.productQuestionContent}
															<c:if test="${questionList.memId == member.memId}">
																<button type="button"
																	onclick="javascript:fn1();location.href='${contextPath}/removeQuestion.do?productNum=${product.productNum}&productQuestionNum=${questionList.productQuestionNum}'"
																	style="float: right; border-radius: 2px; margin-bottom: 3px; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; height: 30px; font-size: 14px;"
																	class="btn-secondary btn-xs">삭제</button>
																<a data-toggle="modal" href="#tallModal2"
																	style="float: right; border-radius: 2px; margin-bottom: 3px; text-align: center; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; height: 30px; font-size: 14px;"
																	class="btn-secondary btn-xs">수정</a>


															</c:if>
														</p>

														<c:if test="${!empty questionList.productAnswerContent}">
															<hr style="margin-bottom: 20px; margin-top: 0px;">

															<p style="text-align: left;">[답변]</p>
															<p style="text-align: left;">

																${questionList.productAnswerContent}</p>
														</c:if>
													</div>
												</div></td>

											<td style="width: 200px;"><fmt:formatDate
													value="${questionList.productQuestionDate}" /></td>
											<td style="width: 200px;">${questionList.answerWhether}</td>
										</tr>

									</c:forEach>
								</c:when>
							</c:choose>
						</table>
						<div class="page_wrap"
							style="margin-top: 50px; margin-left: -80px;" align="center">
							<div class="page_nation">
								<c:if test="${pageMaker2.prev2}">

									<a class="arrow prev"
										style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px; padding-left: 6px; padding-right: 7px;"
										href='<c:url value="/product/viewProduct.do?productNum=${product.productNum}&&page2=${pageMaker2.startPage2-1 }"/>'><i
										class="fa fa-chevron-left"></i></a>

								</c:if>
								<c:forEach begin="${pageMaker2.startPage2 }"
									end="${pageMaker2.endPage }" var="pageNum2">

									<a
										style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px; padding-left: 6px; padding-right: 7px;"
										href='<c:url value="/product/viewProduct.do?productNum=${product.productNum}&page2=${pageNum2}"/>'><i
										class="fa">${pageNum2}</i></a>

								</c:forEach>
								<c:if test="${pageMaker2.next2 && pageMaker2.endPage2 >0 }">

									<a class="arrow next"
										style="border: 1px solid #7e9c8c; color: #7e9c8c; margin-right: 0px; margin-left: 2px; padding-left: 6px; padding-right: 7px;"
										href='<c:url value="/product/viewProduct.do?productNum=${product.productNum}&page2=${pageMaker2.endPage2+1 }"/>'><i
										class="fa fa-chevron-right"></i></a>

								</c:if>
							</div>
						</div>
						<!-- -아코디언메뉴 -->
						<script type="text/javascript">
				var elements = document.getElementsByTagName("div");

				// 모든 영역 접기
				for (var i = 0; i < elements.length; i++) {
					if (elements[i].className == "elements") {
						elements[i].style.display = "none";
					} else if (elements[i].className == "label") {
						elements[i].onclick = switchDisplay;
					}
				}

				// 상태에 따라 접거나 펼치기
				function switchDisplay() {

					var parent = this.parentNode;
					var target = parent.getElementsByTagName("div")[1];

					if (target.style.display == "none") {
						target.style.display = "block";
					} else {
						target.style.display = "none";
					}
					return false;
				}
			</script>
					</div>
				</div>

			</div>
		</div>


	</section>


</body>
</html>