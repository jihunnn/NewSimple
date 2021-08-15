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

#RightBox {
	width: 600px;
	height: 430px;
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

#sect {
	display: flex;
	flex-direction: row;
	padding-bottom: 10px;
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

button {
	font-size: 13px !important;
}
</style>
<script type="text/javascript">
	//상품수정
   function Product_update(){
	   var form = document.ProductUpdate;
	   
	   if(form.productName.value==""){
		   alert("상품이름을 입력하지 않았습니다.")
		   form.productName.focus();
		   return false;
	   }
	   if(form.productPrice.value==""){
		   alert("상품가격을 입력하지 않았습니다.")
		   form.productPrice.focus();
		   return false;
	   }
	 
	   if(form.category.value==""){
		   alert("상품카테고리를 입력하지 않았습니다.")
		   form.category.focus();
		   return false;
	   }
	   if(form.subcategory.value==""){
		   alert("상품하위카테고리를 입력하지 않았습니다.")
		   form.subcategory.focus();
		   return false;
	   }

	   if(form.productManufacturer.value==""){
		   alert("상품제조사를 입력하지 않았습니다.")
		   form.productManufacturer.focus();
		   return false;
	   }
	   if(form.productOrigin.value==""){
		   alert("상품원산지를 입력하지 않았습니다.")
		   form.productOrigin.focus();
		   return false;
	   }
	   /*if(form.productContentImage.value==""){
		   alert("상품상세이미지를 입력하지 않았습니다.")
		   form.productContentImage.focus();
		   return false;
	   }*/
	   if (confirm("상품을 수정하시겠습니까?")){ //확인
	    	 form.submit();
	    } else { //취소
	     	return false;
	    }

	  
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
							"<option style='font-size:13px;' value='"+ item+"'>" + item + "</option>");

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
							"<option style='font-size:13px;' value='"+ item+"'>" + item + "</option>");

				});

			}

		});

	}

	function optionNameDiect(obj) { //옵션 이름 직접입력 버튼 클릭시 input box change
		$("#option" + obj + "Name")
				.replaceWith(
						"<input type = 'text' id='option"+obj+"Name' name='option"+obj+"Name' placeholder='직접입력' style='font-size: 13px; margin-top: 10px; border: 1px solid #dcdcdc; width: 250px; height: 36px; margin-left:4px;'>"); //selectbox 태그를 input 태그로 변경
	if(obj ==1){
		document.getElementById("option1NameSelect").setAttribute("onClick", "directOptionNameChange("+obj+");")	
		} else{
			document.getElementById("option2NameSelect").setAttribute("onClick", "directOptionNameChange("+obj+");")
		}
	}
	
	<!--옵션이름 다시  select box로 change-->
	function directOptionNameChange(obj) { //옵션 이름 직접입력 버튼 클릭시 input box change
		
	      $.ajax({
	             
	            type : "GET",
	            url : "${contextPath}/product/optionNameList.do",

	            error : function(data){
	            	alert("에러가 발생했습니다."+data);
	            },
	            success : function(data){
	            	$("#option" + obj + "Name")
					.replaceWith("<select onchange='option1Select(this.value)' name='option"+obj+"Name' id='option"+obj+"Name' style='font-size: 13px; margin-top: 10px; border: 1px solid #dcdcdc; width: 250px; height: 36px; margin-left: 3px;'><option disabled selected='selected'>선택</option></select>"); //input 태그를  select 태그로 변경
					let option = document.querySelector("#option" + obj + "Name");
					values = data.optionNameList ;
					
	            	$.each(values, function( index, value ) {
	            		$(option).append("<option value='"+value+"'>"+value+"</option>");
	            		
	                    });
					
	            }
	             
	        });
		
		if(obj ==1){
			document.getElementById("option1NameSelect").setAttribute("onClick", "optionNameDiect("+obj+");")	
			} else{
				document.getElementById("option2NameSelect").setAttribute("onClick", "optionNameDiect("+obj+");")
			}
	}
	
	<!--옵션값 다시  select box로 change-->
	function directOptionValueChange(obj) { //옵션 이름 직접입력 버튼 클릭시 input box change		

			var optionName = $("#option"+obj+"Name option:selected").text();			
	
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
						let optionvalue = document.querySelector("#option"+obj+"value");
						$(optionvalue).append(
								"<option style='font-size:13px;' value='"+ item+"'>" + item + "</option>");

					});

				}

			});
    	$("#option" + obj + "value")
		.replaceWith("<select name='option"+obj+"value' id='option"+obj+"value' style='margin-top: 10px; border: 1px solid #dcdcdc; width: 250px; height: 36px; margin-left: 2px;'><option disabled selected='selected'>옵션"+obj+"이름을 먼저 선택해주세요</option></select>"); //input 태그를  select 태그로 변경		
		if(obj ==1){
			document.getElementById("option1ValueSelect").setAttribute("onClick", "optionValueDiect("+obj+");")	
			} else{
				document.getElementById("option2ValueSelect").setAttribute("onClick", "optionValueDiect("+obj+");")
			}
	}

	function optionValueDiect(obj) { //옵션 값 직접입력 버튼 클릭시 input box change
		
		var optionName = $("#option"+obj+"Name option:selected").text();
	
		if(optionName =='선택'){
			alert("옵션이름을 먼저 선택해주세요");
			return false;
		}
		
		$("#option" + obj + "value")
				.replaceWith(
						"<input type = 'text' id='option"+obj+"value' name='option"+obj+"value' placeholder='직접입력' style='font-size: 13px; margin-top: 10px; border: 1px solid #dcdcdc; width: 250px; height: 36px; margin-left:2px;'>"); //selectbox 태그를 input 태그로 변경
		if(obj ==1){
			document.getElementById("option1ValueSelect").setAttribute("onClick", "directOptionValueChange("+obj+");")	
			} else{
				document.getElementById("option2ValueSelect").setAttribute("onClick", "directOptionValueChange("+obj+");")
			}
	}
	
	<!--옵션 삭제-->
	function removeOption(idx) {
		$( 'tr' ).remove( '.optionsList' ); //tr 리스트 비우기
		var item = document.querySelector('input[name=optionNum'+idx+']');
        var number = parseInt(item.getAttribute('value'));
		var productNum = $('#productNum').val();
 		$('#inputOptionNum').children('input').remove();
	      $.ajax({
	             
	            type : "GET",
	            url : "${contextPath}/product/removeSelectOption.do",
	            data: {
	            	optionNum : number,
	            	productNum : productNum
	            	},
	            error : function(data){
	            	alert("에러가 발생했습니다."+data);
	            },
	            success : function(data){
	            	 values = data.optionList ; 
	            	 
	            		if(values==""){
	            			$(optionList).append("<tr class='optionsList'><td colspan='7' style='text-align:center;'>옵션을 등록해주세요</td></tr>");	
	            		}
		            	$.each(values, function( index, value ) {
		            		$(inputOptionNum).append("<input type='hidden' style='width:30px;' id='optionNum' name='optionNum"+index+"' value='"+value.optionNum+"'/>");
		            		$(optionList).append("<tr style='text-align:center; border-bottom:1px solid #eeeeee;' class='optionsList'><td>"+value.option1Name+"</td><td>"+value.option1value+"</td><td>"+value.option1price+"</td><td>"+value.option2Name+"</td><td>"+value.option2value+"</td><td>"+value.option2price+"</td><td><button type='button' style='border:none; background-color:white; color:#7e9c8c; cursor:pointer;' onclick='removeOption("+index+")'>삭제</button></td></tr>");
		            		 
		                    });
	
	            	
	            }
	             
	        });
       
       
		
	}
	
	<!--옵션 추가-->
	function addOption(){
		//옵션1과 옵션2의 이름이 같을 때
		var option1Name = $("#option1Name option:selected").val();
		var option2Name = $("#option2Name option:selected").val();
		var productNum = $('#productNum').val();
		
		if(productNum == ""){
			alert("상품번호를 입력해주세요");
			return false;
		}
		
		if(option1Name == '선택' || option2Name=='선택') {
			alert("옵션이름이선택되지 않았어요");
			return false;
		}	
		
		if(option1Name == option2Name) {
			alert("옵션1과 옵션2의 이름이 같습니다. 다시 설정해주세요~!");
			return false;
		}
				
		var param = $("form[name=addOptionValue]").serialize();
		$( 'tr' ).remove( '.optionsList' ); //tr 리스트 비우기
		$('#inputOptionNum').children('input').remove(); //옵션number 리스트 비우기
		let optionList = document.querySelector("#optionList");
		let inputOptionNum = document.querySelector("#inputOptionNum");


	      $.ajax({
	             
	            type : "GET",
	            url : "${contextPath}/product/addNewOption.do",
	            data:param,	
	            error : function(data){
	            	alert("에러가 발생했습니다."+data);
	            },
	            success : function(data){
						
	            	 values = data.optionList ; 
	            	 
	            		if(values == ""){
	            			$(optionList).append("<tr class='optionsList'><td colspan='6' style='text-align:center;'>옵션을 등록해주세요</td></tr>");	
	            		}
	            		
		            	$.each(values, function( index, value ) {
		            		$(inputOptionNum).append("<input type='hidden' style='width:30px;' id='optionNum' name='optionNum"+index+"' value='"+value.optionNum+"'/>");
		            		$(optionList).append("<tr style='text-align:center; border-bottom:1px solid #eeeeee;' class='optionsList'><td>"+value.option1Name+"</td><td>"+value.option1value+"</td><td>"+value.option1price+"</td><td>"+value.option2Name+"</td><td>"+value.option2value+"</td><td>"+value.option2price+"</td><td><button type='button' style='border:none; background-color:white; color:#7e9c8c; cursor:pointer;' onclick='removeOption("+index+")'>삭제</button></td></tr>");
		            		 
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
						
						//상품 수정시 등록했던 카테고리 선택하게하기		
						/*var selectCategory = jQuery('#selectCategory').val();
						$('#category').val(selectCategory).prop("selected", true);*/

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
					
					//옵션 리스트 불러오기
					$(document)
					.ready(
							function() {
								
								var productNum = $('#productNum').val();
								
				      $.ajax({
				             
				            type : "GET",
				            url : "${contextPath}/product/optionList.do",
				            data: {
				            	productNum : productNum
				            	},
				            error : function(data){
				            	alert("에러가 발생했습니다."+data);
				            },
				            success : function(data){
				            	 values = data.optionList ; 
				            	 
				            		if(values==""){
				            			$(optionList).append("<tr class='optionsList'><td colspan='7' style='text-align:center;'>옵션을 등록해주세요</td></tr>");	
				            		}
					            	$.each(values, function( index, value ) {
					            		$(inputOptionNum).append("<input type='hidden' style='width:30px;' id='optionNum' name='optionNum"+index+"' value='"+value.optionNum+"'/>");
					            		$(optionList).append("<tr style='text-align:center; border-bottom:1px solid #eeeeee;' class='optionsList'><td>"+value.option1Name+"</td><td>"+value.option1value+"</td><td>"+value.option1price+"</td><td>"+value.option2Name+"</td><td>"+value.option2value+"</td><td>"+value.option2price+"</td><td><button type='button' style='border:none; background-color:white; color:#7e9c8c; cursor:pointer;' onclick='removeOption("+index+")'>삭제</button></td></tr>");
					            		 
					                    });
				
				            	
				            }
				             
				        });
				      
							});
					
</script>

</head>
<title>상품수정창</title>
<body>

	<section class="ftco-section testimony-section" id="sect"
		style="padding-top: 30px; margin-top: 70px;">
		<div class="container">
			<div id="LeftBox" style="font-size: 13px; margin-left: 300px;">
				<h3 id="login_text"
					style="color: #7e9c8c; font-weight: bold; padding-left: 70px;">상품수정</h3>
				<form name=ProductUpdate method="post"
					action="${contextPath}/product/modNewProduct.do"
					enctype="multipart/form-data">
					<div style="padding-left: 70px;">
						<label style="margin-right: 50px;"><a
							style="color: red; padding-right: 5px; write-space: nowrap;">*</a>상품번호</label>
						<input type="text" name="productNum"
							value="${productNum.productNum}"
							style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 326px; height: 36px;">
					</div>
					<div style="padding-left: 70px;">
						<label style="margin-right: 50px;"><a
							style="color: red; padding-right: 5px; write-space: nowrap;">*</a>상품이름</label>
						<input type="text" name="productName"
							value="${productNum.productName}"
							style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 326px; height: 36px;">
					</div>
					<div style="padding-left: 70px;">
						<label style="margin-right: 50px;"><a
							style="color: red; padding-right: 5px; write-space: nowrap;">*</a>상품가격</label>
						<input type="text" name="productPrice"
							value="${productNum.productPrice}"
							style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 326px; height: 36px;">
					</div>
					<div style="padding-left: 70px;">
						<div style="padding-left: 116px;">
							<select name="category" id="category"
								style="font-size: 13px; margin-top: 10px; border: 1px solid #dcdcdc; width: 326px; height: 36px;"></select>
							<select name="subcategory" id="subcategory"
								style="font-size: 13px; margin-top: 10px; border: 1px solid #dcdcdc; width: 326px; height: 36px;"></select>
							<input type="hidden" id="selectCategory"
								value="${productNum.category}" /> <input type="hidden"
								id="selectSubCategory" value="${productNum.subcategory}" />
						</div>
					</div>
					<div style="padding-left: 70px; padding-top: 10px;">
						<label style="margin-right: 35px;"><a
							style="color: red; padding-right: 5px; write-space: nowrap;">*</a>상품이미지</label>
						<input type="hidden" name="OrignProductImage"
							value="${productNum.productImage}" /> <input type="file"
							name="productImage" size=40 value=""
							style="font-size: 13px; padding-left: 2px;">
						<div style="padding-left: 117px;">
							<label style="font-size: 10px;">기존파일:
								${productNum.productImage}</label>
						</div>
					</div>
					<div style="padding-left: 70px;">
						<label style="margin-right: 35px;"><a
							style="color: red; padding-right: 5px; write-space: nowrap;">*</a>상품제조사</label>
						<input type="text" name="productManufacturer"
							value="${productNum.productManufacturer}"
							style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; margin-left: 2px; width: 326px; height: 36px;">
					</div>
					<div style="padding-left: 70px;">
						<label style="margin-right: 35px;"><a
							style="color: red; padding-right: 5px; write-space: nowrap;">*</a>상품원산지</label>
						<input type="text" name="productOrigin"
							value="${productNum.productOrigin}"
							style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; margin-left: 2px; width: 326px; height: 36px;">
					</div>
					<div
						style="padding-left: 70px; padding-top: 10px; padding-right: 2px;">
						<label style="margin-right: 7px; font-size: 13px;"><a
							style="color: red; padding-right: 5px; write-space: nowrap;">*</a>상품상세이미지</label>
						<input type="hidden" name="OrignProductContentImage"
							value="${productNum.productContentImage}" /> <input type="file"
							name="productContentImage" value="" style="padding-left: 4px;">
						<div style="padding-left: 117px;">
							<label style="font-size: 10px;">기존파일:
								${productNum.productContentImage}</label>
						</div>
					</div>
				</form>

			</div>
		</div>

		<div class="container">
			<div id="RightBox" style="font-size: 13px;">
				<h3 id="login_text"
					style="color: #7e9c8c; font-weight: bold; padding-left: 70px;">옵션추가</h3>
				<form name="addOptionValue" action="" method="post">
					<div style="padding-left: 77px;">
						<label style="margin-right: 57px;">상품번호</label> <input type="text"
							name="productNum" id="productNum"
							value="${productNum.productNum}"
							style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 250px; height: 36px;" />
						<br> <label style="margin-right: 43px;">옵션1 이름</label> <select
							onchange="option1Select(this.value)" name="option1Name"
							class="option1Name" id="option1Name"
							style="font-size: 13px; margin-top: 10px; border: 1px solid #dcdcdc; width: 250px; height: 36px; margin-left: 3px;">
							<option disabled selected="selected">선택</option>
							<c:forEach var="optionName" items="${optionName}">
								<option>${optionName}</option>
							</c:forEach>
						</select> <input type="hidden" value="" />
						<button type="button" onclick="optionNameDiect(1)"
							id="option1NameSelect"
							style="margin-top: 10px; height: 37px; border-radius: 2px; margin-bottom: 3px; background-color: #5f5f5f; color: white; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; font-size: 14px;"
							class="btn-secondary btn-xs">직접입력</button>
					</div>
					<div style="padding-left: 77px;">
						<label style="margin-right: 57px;">옵션1 값</label> <select
							name="option1value" id="option1value" class="option1Value"
							style="font-size: 13px; margin-top: 10px; border: 1px solid #dcdcdc; width: 250px; height: 36px; margin-left: 2px;">
							<option disabled selected="selected" style="font-size: 13px;">옵션1이름을
								먼저 선택해주세요</option>
						</select>
						<button type="button" onclick="optionValueDiect(1)"
							id="option1ValueSelect"
							style="margin-top: 10px; height: 37px; border-radius: 2px; margin-bottom: 3px; background-color: #5f5f5f; color: white; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; font-size: 14px;"
							class="btn-secondary btn-xs">직접입력</button>
					</div>
					<div style="padding-left: 77px;">
						<label style="margin-right: 15px;">옵션1 금액추가</label> <input
							name="option1price" id="option1price"
							style="font-size: 13px; margin-top: 10px; margin-bottom: none !important; border: 1px solid #dcdcdc; margin-left: 5px; width: 250px; height: 36px;" /><span
							style="font-size: 10px; margin-top: 20px; margin-right: 55px; color: gray; float: right;">숫자만
							입력해주세요</span>

					</div>

					<div style="padding-left: 77px;">
						<label style="margin-right: 43px;">옵션2 이름</label><select
							name="option2Name" id="option2Name"
							onchange="option2Select(this.value)" class="option2Name"
							style="font-size: 13px; margin-top: 10px; margin-left: 6px; border: 1px solid #dcdcdc; width: 250px; height: 36px;">
							<option disabled selected="selected">선택</option>
							<c:forEach var="optionName" items="${optionName}">
								<option>${optionName}</option>
							</c:forEach>
						</select>
						<button type="button" onclick="optionNameDiect(2)"
							id="option2NameSelect"
							style="margin-top: 10px; height: 37px; border-radius: 2px; margin-bottom: 3px; background-color: #5f5f5f; color: white; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; font-size: 14px;"
							class="btn-secondary btn-xs">직접입력</button>
					</div>
					<div style="padding-left: 77px;">
						<label style="margin-right: 57px;">옵션2 값</label> <select
							name="option2value" id="option2value" class="option2Value"
							style="margin-top: 10px; border: 1px solid #dcdcdc; width: 250px; height: 36px; margin-left: 2px;">
							<option disabled selected="selected" style="font-size: 13px;">옵션2이름을
								먼저 선택해주세요</option>
						</select>
						<button type="button" onclick="optionValueDiect(2)"
							id="option2ValueSelect"
							style="margin-top: 10px; height: 37px; border-radius: 2px; margin-bottom: 3px; background-color: #5f5f5f; color: white; border: 1px solid #eeeeee; border-radius: 2px; width: 70px; font-size: 14px;"
							class="btn-secondary btn-xs">직접입력</button>
					</div>
					<div style="padding-left: 77px;">
						<label style="margin-right: 15px;">옵션2 금액추가</label> <input
							name="option2price" id="option2price"
							style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 250px; height: 36px; margin-left: 5px;" /><span
							style="font-size: 10px; margin-top: 20px; margin-right: 55px; color: gray; float: right;">숫자만
							입력해주세요</span>
					</div>

				</form>
			</div>
			<div class="container" style="padding-right: 0px; padding-left: 0px;">
				<button type="button" onclick="addOption()"
					style="border: none; cursor: pointer; background-color: white; color: #7e9c8c; text-align: left; height: 30px; width: 100px;">추가버튼+</button>
				<table name="optionList" id="optionList"
					style="width: 65%; font-size: 13px;">
					<tr
						style="background-color: #fbfbfb; color: black; border-top: 1px solid #7e9c8c; border-bottom: 1px solid #eeeeee; font-size: 13px; text-align: center;">
						<td>옵션1이름</td>
						<td>옵션1값</td>
						<td>옵션1가격</td>
						<td>옵션2이름</td>
						<td>옵션2값</td>
						<td>옵션3가격</td>
						<td style="width: 50px;"></td>
					</tr>
					<tr class="optionsList">

					</tr>

				</table>
				<div name="inputOptionNum" id="inputOptionNum"></div>
			</div>
		</div>
	</section>

	<div class="container">
		<section class="Easy-sgin-in-wrap4">
			<ul class="sign-button-list4">
				<li style="margin-left: 50px;"><button
						onclick="Product_update()"
						style="background-color: #7e9c8c; font-size: 14px; color: white; border: none; border-radius: 2px; width: 400px; float: left;">
						<i class="sgin-up"></i><span>수 정</span>
					</button></li>
				<li style="margin-left: 50px;">
					<button
						onclick="location.href='${contextPath}/product/admin_listProduct.do'"
						style="background-color: white; font-size: 14px; color: gray; border: 1px solid #7e9c8c; border-radius: 2px; width: 400px; float: left;">
						<i class="btn-Non Order Inquiry"></i><span>취 소</span>
					</button>
				</li>

			</ul>
		</section>
	</div>



</body>
</html>








