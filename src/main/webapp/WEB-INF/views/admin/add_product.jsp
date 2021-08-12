<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>


<style>
#main_box { /*아이디 선택자*/
	display: flex;
	flex-direction: column;
	align-items: center;
	padding-top: 10px;
}

#login { /*아이디 선택자*/
	display: flex;
	flex-direction: column;
	width: 1300px;
	height: 100px;
	align-items: center;
	padding-top: 10px;
	font-size: 20px;
}

#LeftBox {
	width: 600px;
	height: 600px;
	border: 1px solid #eeeeee;
	margin: 10 10 10 10;
}

#login_text {
	padding: 20px;
	margin: 10 10 10 10;
	font-size: 20px;
}

.id_pwd_text {
	padding-top: 60px;
	padding-left: 55px;
	padding-bottom: 10px;
}

.id_save_find {
	padding-left: 35px;
	padding-bottom: 10px;
}

#chk_save_id {
	padding-bottom: 10px;
	width: 20px;
	height: 20px;
}

#id_pwd_save {
	font-size: 15px;
}

#find_id_pwd {
	padding-left: 23px;
}

.btn_member_id_pwd {
	font-size: 15px;
}

#btn_submit_login {
	padding-left: 40px;
}

#submit_login {
	align-items: center;
	width: 350px;
	height: 40px;
	padding-bottom: 10px;
}

.Easy-sgin-in-wrap {
	display: flex;
	flex-direction: column; /*column으로 정렬 */
}

.Easy-sgin-in-wrap .sign-button-list {
	list-style: none;
	width: 350px;
	display: flex;
	flex-direction: column;
	padding-top: 10px;
}

.Easy-sgin-in-wrap .sign-button-list li {
	padding-bottom: 10px;
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

.Easy-sgin-in-wrap4 {
	display: flex;
	flex-direction: column; /*column으로 정렬 */
	align-items: center;
}

.Easy-sgin-in-wrap4 .sign-button-list4 {
	padding-top: 50px;
	list-style: none;
	width: 600px;
	display: flex;
	flex-direction: column;
}

.Easy-sgin-in-wrap4 .sign-button-list4 li {
	padding-bottom: 10px;
	padding-left: 10px;
}

.Easy-sgin-in-wrap4 .sign-button-list4 li button {
	width: 500px;
	height: 56px;
	border: 1px solid rgb(0, 0, 0);
	text-align: center;
	background: rgb(255, 255, 255);
}

.Easy-sgin-in-wrap4 .sign-button-list4 li button i {
	font-size: 25px;
}
</style>
<script type="text/javascript">
	//상품등록
	function new_Product() {
		var form = document.newProduct;

		if (form.productNum.value == "") {
			alert("상품번호을 입력하지 않았습니다.")
			form.productNum.focus();
			return false;
		}

		if (form.productName.value == "") {
			alert("상품이름을 입력하지 않았습니다.")
			form.productName.focus();
			return false;
		}
		if (form.productPrice.value == "") {
			alert("상품가격을 입력하지 않았습니다.")
			form.productPrice.focus();
			return false;
		}

		if (form.category.value == "") {
			alert("상품카테고리를 입력하지 않았습니다.")
			form.category.focus();
			return false;
		}
		if (form.subcategory.value == "") {
			alert("상품하위카테고리를 입력하지 않았습니다.")
			form.subcategory.focus();
			return false;
		}
		if (form.productImage.value == "") {
			alert("상품이미지를 입력하지 않았습니다.")
			form.productImage.focus();
			return false;
		}
		if (form.productManufacturer.value == "") {
			alert("상품제조사를 입력하지 않았습니다.")
			form.productManufacturer.focus();
			return false;
		}
		if (form.productOrigin.value == "") {
			alert("상품원산지를 입력하지 않았습니다.")
			form.productOrigin.focus();
			return false;
		}

		if (confirm("상품을 등록하시겠습니까?")) { //확인

		} else { //취소
			return false;
		}

		form.submit();
	}
	
	
	<!-- option1 선택값 가져오기-->
	function option1Select(optionName) {

		$('#option1value').children('option').remove(); //기존 option value 삭제
		$.ajax({

			type : "GET",
			url : "${contextPath}/product/optionValue.do",
			data : {
				optionName : optionName
			},
			dataType : "json",
			error : function(data) {
				alert("에러가 발생했습니다." + data);
			},
			success : function(data) {

				$.each(data, function(index, item) { // key=index,  value=item  
					let option1value = document.querySelector("#option1value");
					$(option1value).append(
							"<option value='"+ item+"'>" + item + "</option>");

				});

			}

		});

	}
	
	<!-- option2 선택값 가져오기-->
	function option2Select(optionName) {
		
		$('#option2value').children('option').remove(); //기존 option value 삭제
		$.ajax({

			type : "GET",
			url : "${contextPath}/product/optionValue.do",
			data : {
				optionName : optionName
			},
			dataType : "json",
			error : function(data) {
				alert("에러가 발생했습니다." + data);
			},
			success : function(data) {

				$.each(data, function(index, item) { // key=index,  value=item  
					let option1value = document.querySelector("#option2value");
					$(option2value).append(
							"<option value='"+ item+"'>" + item + "</option>");

				});

			}

		});

	}

	function optionNameDiect(obj) { //옵션 이름 직접입력 버튼 클릭시 input box change
		$("#option" + obj + "Name")
				.replaceWith(
						"<input type = 'text' id='option"+obj+"Name' name='option"+obj+"Name' placeholder='직접입력' style='font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 250px; height: 36px;'>"); //selectbox 태그를 input 태그로 변경
	}

	function optionValueDiect(obj) { //옵션 값 직접입력 버튼 클릭시 input box change
		$("#option" + obj + "value")
				.replaceWith(
						"<input type = 'text' id='option"+obj+"value' name='option"+obj+"value' placeholder='직접입력' style='font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 250px; height: 36px;'>"); //selectbox 태그를 input 태그로 변경
	}
	
	function removeOption() {
	var optionNum = $('#optionNum').val();
	alert(optionNum);
		
	}

	function addOption(){
		var param = $("form[name=addOptionValue]").serialize();
		$('#optionList').children('tr').remove(); 
		let optionList = document.querySelector("#optionList");
		$(optionList).append("<tr><td>옵션1이름</td><td>옵션1값</td><td>옵션1가격</td><td>옵션2이름</td><td>옵션2값</td><td>옵션2가격</td></tr>")
	      $.ajax({
	             
	            type : "GET",
	            url : "${contextPath}/product/addNewOption.do",
	            data:param,	
	            error : function(data){
	            	alert("에러가 발생했습니다."+data);
	            },
	            success : function(data){

	            	 values = data.optionList ; 
		            	$.each(values, function( index, value ) {
							
		            		$(optionList).append("<tr><td>"+value.option1Name+"</td><td>"+value.option1value+"</td><td>"+value.option1price+"</td><td>"+value.option2Name+"</td><td>"+value.option2value+"</td><td>"+value.option2price+"</td><td><button type='button' onclick='location.href='>삭제</button></td></tr><input type='hidden' id='optionNum' value='"+value.optionNum+"'/>");
		            		 
		                    });
	
	            	
	            }
	             
	        });


		};

</script>
<script type="text/javascript">
	$('document')
			.ready(
					function() {
						var area0 = [ "카테고리 선택", "침대", "소파", "화장대/옷장/수납",
								"식탁/의자", "테이블/책상/책장" ];
						var area1 = [ "싱글", "킹", "이층침대", "패밀리", "퀸" ];
						var area2 = [ "코너형", "1인/웜체어", "패브릭", "리클라이너",
								"4/6인 일자형" ];
						var area3 = [ "거실장", "장식장", "화장대/콘솔", "옷장", "서랍장" ];
						var area4 = [ "2인 이상", "4인 이상", "8인 이상", "식탁의자",
								"테이블의자" ];
						var area5 = [ "소파 테이블", "좌식 테이블", "원목 테이블", "다용도 테이블",
								"책상/책장" ];
						// 카테고리 선택 박스 초기화
						//하위카테고리 선택 박스 초기화

						$("select[name^=category]")
								.each(
										function() {
											$selcategory = $(this);
											$
													.each(
															eval(area0),
															function() {
																$selcategory
																		.append("<option value='"+this+"'>"
																				+ this
																				+ "</option>");
															});
											$selcategory
													.next()
													.append(
															"<option value=''>하위 카테고리 선택</option>");
										});

						// 카테고리 선택시 하위카테고리 설정

						$("select[name^=category]")
								.change(
										function() {
											var area = "area"
													+ $("option", $(this))
															.index(
																	$(
																			"option:selected",
																			$(this))); // 선택지역의 Array
											var $subcategory = $(this).next(); // 선택영역 객체
											$("option", $subcategory).remove(); // 하위카테고리 초기화

											if (area == "area0")
												$subcategory
														.append("<option value=''>하위 카테고리 선택</option>");
											else {
												$
														.each(
																eval(area),
																function() {
																	$subcategory
																			.append("<option value='"+this+"'>"
																					+ this
																					+ "</option>");
																});
											}
										});

					});

	$(document)
			.ready(
					function() {
						$('.btnAdd')
								.click(
										function() {

											$('.buttons')
													.append(

															'<div style="margin-left: 35px; margin-top: 5px;"><input type="text" name="option1" size=10>&nbsp;<input type="text" name="option2" size=10></div><input style="margin-left: 35px;width: 225px;margin-top: 5px;" type="button" class="btnRemove" value="삭제"><br>'

													); // end append   

											$('.btnRemove')
													.on(
															'click',
															function() {
																$(this)
																		.prev()
																		.remove(); // remove the textbox

																$(this)
																		.next()
																		.remove(); // remove the <br>

																$(this)
																		.remove(); // remove the button

															});

										}); // end click                                            

					}); // end ready
</script>

</head>
<title>상품등록창</title>
<body>

	<section class="ftco-section testimony-section"
		style="padding-top: 100px;">
		<div class="container">
			<div id="LeftBox" style="font-size: 14px;">
				<h3 id="login_text"
					style="color: #7e9c8c; font-weight: bold; padding-left: 70px;">상품등록</h3>
				<form name="newProduct"
					action="${contextPath}/product/addProduct.do?productNum=${product.productNum}"
					method="post" enctype="multipart/form-data">
					<div style="padding-left: 70px;">
						<label style="margin-right: 50px;"><a
							style="color: red; padding-right: 5px; write-space: nowrap;">*</a>상품번호</label>
						<input type="text" name="productNum" value=""
							style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 326px; height: 36px;">
					</div>
					<div style="padding-left: 70px;">
						<label style="margin-right: 50px;"><a
							style="color: red; padding-right: 5px; write-space: nowrap;">*</a>상품이름</label>
						<input type="text" name="productName" value=""
							style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 326px; height: 36px;">
					</div>
					<div style="padding-left: 70px;">
						<label style="margin-right: 50px;"><a
							style="color: red; padding-right: 5px; write-space: nowrap;">*</a>상품가격</label>
						<input type="text" name="productPrice" value=""
							style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 326px; height: 36px;">
					</div>
					<div style="padding-left: 70px;">
						<div style="padding-left: 120px;">
							<select name="category" id="category"
								style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 326px; height: 36px;"></select>
							<select name="subcategory" id="subcategory"
								style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 326px; height: 36px;"></select>
						</div>
					</div>
					<div style="padding-left: 70px; padding-top: 10px;">
						<label style="margin-right: 35px;"><a
							style="color: red; padding-right: 5px; write-space: nowrap;">*</a>상품이미지</label>
						<input type="file" name="productImage" size=40 value="">
					</div>
					<div style="padding-left: 70px;">
						<label style="margin-right: 35px;"><a
							style="color: red; padding-right: 5px; write-space: nowrap;">*</a>상품제조사</label>
						<input type="text" name="productManufacturer" value=""
							style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 326px; height: 36px;">
					</div>
					<div style="padding-left: 70px;">
						<label style="margin-right: 35px;"><a
							style="color: red; padding-right: 5px; write-space: nowrap;">*</a>상품원산지</label>
						<input type="text" name="productOrigin" value=""
							style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 326px; height: 36px;">
					</div>
					<div style="padding-left: 70px; padding-top: 10px;">
						<label style="margin-right: 7px;"><a
							style="color: red; padding-right: 5px; write-space: nowrap;">*</a>상품상세이미지</label>
						<input type="file" name="productContentImage" value="">
					</div>
				</form>

			</div>
		</div>
		<div class="container">
			<div id="LeftBox" style="font-size: 14px; ">
				<h3 id="login_text"
					style="color: #7e9c8c; font-weight: bold; padding-left: 70px;">옵션추가</h3>
				<form name="addOptionValue" action="" method="post">
					<div style="padding-left: 77px;">
						<label style="margin-right: 57px;">상품번호</label>
						<input type="text" name="productNum" style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 250px; height: 36px;"/> <br>
						<label
							style="margin-right: 43px;">옵션1 이름</label> <select
							onchange="option1Select(this.value)" name="option1Name"
							id="option1Name"
							style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 250px; height: 36px;">
							<option disabled selected="selected">선택</option>
							<c:forEach var="optionName" items="${optionName}">
								<option>${optionName}</option>
							</c:forEach>
						</select>
						<button type="button" onclick="optionNameDiect(1)"
							style="margin-top: 10px; height: 38px; border-radius: 2px; margin-bottom: 3px; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; font-size: 14px;"
							class="btn-secondary btn-xs">직접입력</button>
					</div>
					<div style="padding-left: 77px;">
						<label style="margin-right: 57px;">옵션1 값</label> <select
							name="option1value" id="option1value"
							style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 250px; height: 36px;">

						</select>
						<button type="button" onclick="optionValueDiect(1)"
							style="margin-top: 10px; height: 38px; border-radius: 2px; margin-bottom: 3px; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; font-size: 14px;"
							class="btn-secondary btn-xs">직접입력</button>
					</div>
					<div style="padding-left: 77px;">
						<label style="margin-right: 15px;">옵션1 금액추가</label> <input
							name="option1price" id="option1price"
							style="font-size: 14px; margin-top: 10px; margin-bottom: none !important; border: 1px solid #dcdcdc; width: 250px; height: 36px;" /><span
							style="font-size: 10px; margin-top: 20px; margin-right: 55px; color: gray; float: right;">숫자만
							입력해주세요</span>

					</div>

					<div style="padding-left: 77px;">
						<label style="margin-right: 43px;">옵션2 이름</label><select
							name="option2Name" id="option2Name"
							onchange="option2Select(this.value)"
							style="font-size: 14px; margin-top: 10px; margin-left: 3px; border: 1px solid #dcdcdc; width: 250px; height: 36px;">
							<option disabled selected="selected">선택</option>
							<c:forEach var="optionName" items="${optionName}">
								<option>${optionName}</option>
							</c:forEach>
						</select>
						<button type="button" onclick="optionNameDiect(2)"
							style="margin-top: 10px; height: 38px; border-radius: 2px; margin-bottom: 3px; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; font-size: 14px;"
							class="btn-secondary btn-xs">직접입력</button>
					</div>
					<div style="padding-left: 77px;">
						<label style="margin-right: 57px;">옵션2 값</label> <select
							name="option2value" id="option2value"
							style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 250px; height: 36px;">
						</select>
						<button type="button" onclick="optionValueDiect(2)"
							style="margin-top: 10px; height: 38px; border-radius: 2px; margin-bottom: 3px; background-color: white; color: gray; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; font-size: 14px;"
							class="btn-secondary btn-xs">직접입력</button>
					</div>
					<div style="padding-left: 77px;">
						<label style="margin-right: 15px;">옵션2 금액추가</label> <input
							name="option2price" id="option2price"
							style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 250px; height: 36px;" /><span
							style="font-size: 10px; margin-top: 20px; margin-right: 55px; color: gray; float: right;">숫자만
							입력해주세요</span>

					</div>
					<button type="button" onclick="addOption()">추가</button>
					<table name="optionList" id="optionList" style="width:100%;">

					</table>
				</form>


			</div>
		</div>
	</section>

	<div class="container">
		<section class="Easy-sgin-in-wrap4">
			<ul class="sign-button-list4">
				<li style="margin-left: 50px;"><button onclick="new_Product()"
						style="background-color: #7e9c8c; font-size: 14px; color: white; border: none; border-radius: 2px; width: 400px; float: left;">
						<i class="sgin-up"></i><span>등록</span>
					</button></li>
				<li style="margin-left: 50px;">
					<button
						onclick="location.href='${contextPath}/product/admin_listProduct.do'"
						style="background-color: white; font-size: 14px; color: gray; border: 1px solid #7e9c8c; border-radius: 2px; width: 400px; float: left;">
						<i class="btn-Non Order Inquiry"></i><span>취소</span>
					</button>
				</li>

			</ul>
		</section>
	</div>



</body>
</html>








