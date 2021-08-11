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
	width: 400px;
	height: 350px;
	float: center;
	border: 1px solid #eeeeee;
	margin: 10 10 10 10;
}

#login_text {
	padding: 20px;
	margin: 10 10 10 10;
	font-size: 20px;
}

.id_find_text {
	padding-top: 25px;
	padding-left: 40px;
	padding-bottom: 20px;
}

#id_find_name {
	padding-bottom: 10px;
}

#id_find_phone {
	padding-bottom: 10px;
}

#btn_find_id {
	padding-left: 40px;
}

#find_id {
	align-items: center;
	width: 270px;
	height: 40px;
}

.Easy-sgin-in-wrap {
	display: flex;
	flex-direction: column; /*column으로 정렬 */
	float: right;
}

.Easy-sgin-in-wrap .sign-button-list {
	list-style: none;
	width: 350px;
	display: flex;
	flex-direction: column;
}

.Easy-sgin-in-wrap .sign-button-list li {
	padding-top: 10px;
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

#RightBox {
	width: 400px;
	height: 350px;
	border: 1px solid #eeeeee;
	margin: 10 10 10 10;
}

#Non_login_text {
	padding: 20px;
	margin-right: 20px;
	font-size: 20px;
}

#pwd_find {
	width: 430px;
	height: 200px;
}

.pwd_find>div {
	float: left;
}

.pwd_find {

	padding-left: 40px;
}

#confirm {
	
}

#phone_confirm {
	width: 130px;
	height: 100px;
	padding-left: 10px;
}

#email_confirm {
	width: 130px;
	height: 100px;
}

h3 {
	color: block;
}

.Easy-sgin-in-wrap1 {
	display: flex;
	flex-direction: column; /*column으로 정렬 */
	align-items: center;
}

.Easy-sgin-in-wrap1 .sign-button-list1 {
	list-style: none;
	width: 600px;
	display: flex;
	flex-direction: column;
}

.Easy-sgin-in-wrap1 .sign-button-list1 li {
	padding-bottom: 10px;
}

.Easy-sgin-in-wrap1 .sign-button-list1 li button {
	width: 500px;
	height: 56px;
	border: 1px solid rgb(0, 0, 0);
	text-align: center;
	background: rgb(255, 255, 255);
}

.Easy-sgin-in-wrap1 .sign-button-list1 li button i {
	font-size: 25px;
}
</style>
<script type="text/javascript">
	//아이디 찾기
	function find_user_id() {

		var form = document.find_user_id_password;

		if (form.memName.value == "") {
			alert("이름을 입력해주세요!");
			form.memName.focus();
			return false;

		}
		if (form.memPhoneNum.value == "") {
			alert("핸드폰번호를 입력해주세요!");
			form.memPhoneNum.focus();
			return false;
		}

		
		form.submit();

	}

	//비밀번호 찾기_핸드폰
	$(function(){
		$("#findBtnPhone").click(function(){
			
			$.ajax({
				url : "${contextPath}/check/sendSMS",
				type : "POST",
				data : {
					memId : $("#memId1").val(),
					memPhoneNum : $("#memPhoneNum").val()
				},
				success : function(result) {
					alert(result);
				
				},
			})
		});
	})
	
	//비밀번호 찾기_이메일_아이디/이메일 보내기
	$(function(){
		$("#findBtn").click(function(){
			
			$.ajax({
				url : "${contextPath}/find_pw.do",
				type : "POST",
				data : {
					memId : $("#memId").val(),
					memEmail : $("#memEmail").val()
				},
				success : function(result) {
					alert(result);
				
				},
			})
		});
	})
	


	function div_show(selectList) {
	    var obj1 = document.getElementById("phone"); // 핸드폰
	    var obj2 = document.getElementById("email"); // 이메일

	    if( selectList == "0" ) { // 핸드폰
	        obj1.style.display = "block";    
	        obj2.style.display = "none";

	 
	    } else if( selectList == "1" ) { // 이메일
	        obj1.style.display = "none";    
	        obj2.style.display = "block";
	 
	    }
	}
	
	//비밀번호 찾기_이메일_인증번호_확인
	function Approval_key_find() {
		var form = document.Approval_key_send;
		if (form.Approval_key.value == "") {
			alert("인증번호를 입력해주세요!");
			form.Approval_key.focus();

		} else {
			form.submit();
		}
	}
	
	//비밀번호 찾기_핸드폰_인증번호_확인
	function Approval_key_find_phone() {
		var form = document.Approval_key_send_phone;
		if (form.Approval_key.value == "") {
			alert("인증번호를 입력해주세요!");
			form.Approval_key.focus();

		} else {
			form.submit();
		}
	}
	 
</script>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<title>아이디/비밀번호 찾기창</title>
<body>

	<!-- 타이틀 -->
	<section class="ftco-section testimony-section"
		style="padding-top: 50px; margin-top:50px; ">
		<div class="container">

			<!-- 타이틀 끝 -->
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

			<section class="ftco-section testimony-section" id="sect"
				style="padding-top: 40px;">
				<div class="container">
					<section class="Easy-sgin-in-wrap">
						<div id="LeftBox" style="margin-right: 100px;">
							<h3 id="login_text">아이디 찾기</h3>
							<div class="id_find_text">
								<form name="find_user_id_password" action="${contextPath}/findId.do"
									method="post">
									<div id="id_find_name">
										<input type="text" name="memName" size="37"
											placeholder="이름을 입력하세요" style="font-size: 14px;  border: 1px solid #dcdcdc; width: 326px; height: 36px;">
									</div>
									<div id="id_find_phone">
										<input type="text" name="memPhoneNum" size="37"style="font-size: 14px;  border: 1px solid #dcdcdc; width: 326px; height: 36px;"
											placeholder="핸드폰번호를 입력하세요 ex) 000-0000-0000">
									</div>
								</form>
							</div>

							<div id="btn_find_id">
								<input type="submit" id="find_id" value="아이디찾기"
									onclick="find_user_id()"
									style="width: 325px; background-color: #7e9c8c; color:white; height:45px; border:none; border-radius: 2px; ">
							</div>

						</div>
					</section>

				</div>
				<div class="container">
					<div id="RightBox" style="margin-left: 100px;">
						<h3 id="Non_login_text"  style="padding-bottom: 15px;">비밀번호 찾기</h3>

						<div class="pwd_find">
						 <input type="radio" name="test" id="phone_con"  onclick="div_show('0');"><label >핸드폰 인증</label>
                         <input type="radio" name="test" id="email_con"onclick="div_show('1');"><label>이메일 인증</label>
                         
                         <div id="phone" style="display:none">
                             <form name="find_user_pwd_phone" method="post" style="margin-bottom: 15px;">
								<input type="text" id="memId1" name="memId" style="margin-bottom: 10px; font-size: 14px;  border: 1px solid #dcdcdc; width: 326px; height: 36px; "
									size="37" placeholder="아이디를 입력하세요">
								<input type="text" name="memPhoneNum" id="memPhoneNum" style="margin-bottom: 10px; font-size: 14px;  border: 1px solid #dcdcdc; width: 326px; height: 36px;"
									size="37" placeholder="핸드폰번호를 입력하세요 ex) 000-0000-0000">
							</form>
						<button type="button" id="findBtnPhone" 
									style="width: 325px; background-color: #7e9c8c; color:white; height:45px; border:none; border-radius: 2px; margin-bottom: 10px;">핸드폰 인증</button>
									
							<form name="Approval_key_send_phone" method="post" style="margin-bottom: 15px;" action="${contextPath}/email_confirm.do">
							<input type="text" name="Approval_key" id="Approval_key" style="margin-bottom: 10px; font-size: 14px;  border: 1px solid #dcdcdc; width: 163px; height: 36px;"
									size="37" placeholder="인증번호를 입력하세요">
									<button type="button" onclick="Approval_key_find_phone()"
									style="width: 160px; background-color: #7e9c8c; color:white; height:36px; border:none; border-radius: 2px;">인증번호 확인</button>
							</form>
						 </div> 
						 
						 
						 <div id="email" style="display:none">
							<form name="find_user_password" id="divEmail" method="post" style="margin-bottom: 15px;">
								<input type="text" id="memId"  style="margin-bottom: 10px; font-size: 14px;  border: 1px solid #dcdcdc; width: 326px; height: 36px; "
									size="37" placeholder="아이디를 입력하세요">
								<input type="text" id="memEmail" style="margin-bottom: 10px; font-size: 14px;  border: 1px solid #dcdcdc; width: 326px; height: 36px;"
									size="37" placeholder="이메일을 입력하세요">
								
							</form>
							<button type="button" id="findBtn" 
									style="width: 325px; background-color: #7e9c8c; color:white; height:45px; border:none; border-radius: 2px; margin-bottom: 10px;">이메일 인증</button>
							<form name="Approval_key_send" method="post" style="margin-bottom: 15px;" action="${contextPath}/email_confirm.do">
							<input type="text" name="Approval_key" id="Approval_key" style="margin-bottom: 10px; font-size: 14px;  border: 1px solid #dcdcdc; width: 163px; height: 36px;"
									size="37" placeholder="인증번호를 입력하세요">
									<button type="button"  onclick="Approval_key_find()"
									style="width: 160px; background-color: #7e9c8c; color:white; height:36px; border:none; border-radius: 2px;">인증번호 확인</button>
							</form>
							
						</div>
							
						</div>


					</div>


					</div>
				
			</section>
		</div>
	</section>

	<div class="container">
		<section class="Easy-sgin-in-wrap1">
			<ul class="sign-button-list1">
				<li><button onclick="location.href='${contextPath}/login_01.do'"
						style="background-color: #5f5f5f; color: white; border-radius: 2px; border:none;">
						<i class="return-login"></i><span>로그인으로 돌아가기</span>
					</button></li>
			</ul>
		</section>

	</div>

	<br>
	<br>
	<br>
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














