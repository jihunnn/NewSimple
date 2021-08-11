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
	height: 620px;
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
</script>

</head>
<title>상품수정창</title>
<body>

	<section class="ftco-section testimony-section"
		style="padding-top: 100px;">
		<div class="container">

			<hr style="margin-top: -10px;">

			<section class="ftco-section testimony-section"
				style="padding-top: 40px;">
				<form name=ProductUpdate method="post" action="${contextPath}/product/modNewProduct.do" enctype="multipart/form-data">
				<div class="container">
					<section class="Easy-sgin-in-wrap4">
						<div id="LeftBox" style="font-size:14px;">
							<h3 id="login_text" style="color:#7e9c8c; font-weight:bold; padding-left:70px;">상품수정</h3>
					
								<div style="padding-left: 70px;"> 
                                     <label style="margin-right:50px;">상품번호</label>
                                          <input type="text" name="productNum" value="${productNum.productNum}" style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 326px; height: 36px;" readonly>
                               </div>
                               <div style="padding-left: 70px;"> 
                                     <label style="margin-right:50px;">상품이름</label>
                                         <input type="text" name="productName" value="${productNum.productName}" style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 326px; height: 36px;">
                               </div>
                               <div style="padding-left:70px;"> 
                                    <label style="margin-right:50px;">상품가격</label>
                                         <input type="text" name="productPrice" value="${productNum.productPrice}" style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 326px; height: 36px;">
                               </div>
                               <div style="padding-left: 70px;"> 
                                      <label style="margin-right:50px;">카테고리</label>
                                         <input type="text" name="category" value="${productNum.category}" style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 326px; height: 36px;">                   
                               </div> 
                               <div style="padding-left: 70px;"> 
                                      <label style="margin-right:20px;">하위카테고리</label>
                                         <input type="text" name="subcategory" value="${productNum.category}" style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 326px; height: 36px;">                   
                               </div>      
                               <div style="padding-left: 70px; padding-top:10px;"> 
                                   <label style="margin-right:35px;">상품이미지</label>
                                       <input type="hidden" name="OrignProductImage" value="${productNum.productImage}" />
                                       <input type="file" name="productImage"  >
                                       <div style="padding-left: 90px;"> 
                                           <label style="font-size: 10px;">기존파일: ${productNum.productImage}</label>
                                       </div>
                               </div>
                               <div style="padding-left: 70px;"> 
                                   <label style="margin-right:35px;">상품제조사</label>
                                        <input type="text" name="productManufacturer" value="${productNum.productManufacturer}" style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 326px; height: 36px;">
                               </div>
                               <div style="padding-left: 70px;"> 
                                   <label style="margin-right:35px;">상품원산지</label>
                                        <input type="text" name="productOrigin" value="${productNum.productOrigin}" style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 326px; height: 36px;">
                               </div>
                               <div style="padding-left: 70px; padding-top:10px;"> 
                                   <label style="margin-right:7px;">상품상세이미지</label>
                                         <input type="hidden" name="OrignProductContentImage" value="${productNum.productContentImage}" />
                                         <input type="file" name="productContentImage" >
                                          <div style="padding-left: 90px;"> 
                                           <label style="font-size: 10px;">기존파일: ${productNum.productContentImage}</label>
                                       </div>
                               </div>
                               <div style="padding-left: 77px;"> 
                                   <label style="margin-right:45px; ">상품옵션1</label>
                                        <input type="text" name="option1" value="" style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 326px; height: 36px;">
                               </div>
                               <div style="padding-left: 77px;"> 
                                   <label style="margin-right:45px;">상품옵션2</label>
                                        <input type="text" name="option2" value="" style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 326px; height: 36px;">
                               </div>
							
							
							
						</div>
					</section>
				</div>
				</form>
				<div class="container">
					<section class="Easy-sgin-in-wrap4">
						<ul class="sign-button-list4">
							<li style="margin-left:50px;"><button onclick="Product_update()"
									style="background-color: #7e9c8c; font-size:14px; color: white; border: none; border-radius:2px; width:400px; float:left;">
									<i class="sgin-up"></i><span>수정</span>
								</button></li>
							<li style="margin-left:50px;"> <button  onclick="location.href='${contextPath}/product/admin_listProduct.do'"
									style="background-color: white; font-size:14px; color: gray; border: 1px solid #7e9c8c; border-radius:2px; width:400px; float:left;">
									<i class="btn-Non Order Inquiry"></i><span>취소</span>
								</button></li>
							
						</ul>
					</section>
				</div>
			</section>
		</div>
	</section>


</body>
</html>








