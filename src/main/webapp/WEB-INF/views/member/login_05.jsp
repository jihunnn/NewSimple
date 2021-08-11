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
</style>
<script type="text/javascript">
	//로그인
	function new_password() {
		var form = document.NewPassWord;
		//비밀번호 입력여부 체크
		//비밀번호 입력여부 체크
		if (form.memPwd.value == "") {
			alert("비밀번호를 입력하지 않았습니다.")
			form.memPwd.focus();
			return false;

		}
	
		//비밀번호 길이 체크(10자이상 허용)
		if (form.memPwd.value.length < 10) {
			alert("비밀번호를 10자이상 입력해주세요.")
			form.memPwd.focus();
			form.memPwd.select();
			return false;
		}
		if (form.memPwd1.value == "") {
			alert("비밀번호를 입력하지 않았습니다.")
			form.memPwd1.focus();
			return false;

		}
		//비밀번호 유효성 검사 (영문소문자, 숫자만 허용)
		for (var i = 0; i < form.memPwd.value.length; i++) {
			ch = form.memPwd.value.charAt(i)
			if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')
					&& !(ch >= 'A' && ch <= 'Z')) {
				alert("비밀번호는 영문 대소문자, 숫자만 입력가능합니다.")
				form.memPwd.focus();
				form.memPwd.select();
				return false;
			}
		}
		//비밀번호와 비밀번호 확인 일치여부 체크
		if (form.memPwd.value != form.memPwd1.value) {
			alert("비밀번호가 일치하지 않습니다")
			form.memPwd1.value = ""
			form.memPwd1.focus();
			return false;
		}
	

		form.submit();

	}
</script>
</head>
<title>새비밀번호등록창</title>
<body>

	<section class="ftco-section testimony-section"
		style="padding-top: 50px;">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3"
				style="background-color: #f5f5f5; border: 1px solid #e7e7e7; margin-top: 50px;">
				<div class="col-md-20 heading-section ftco-animate"
					style="height: 60px;">
					<h2 class="mb-4" style="font-size: 35px; margin-top: 15px;">로그인</h2>
				</div>
			</div>
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
				style="padding-top: 50px;">
				<div class="container" style="text-align: center;">
					<div>
						<h4 style="margin-bottom: 40px; font-size: 22px;">새로운 비밀번호를
							입력해주세요.</h4>
					</div>
					<div class="pass_input_confirm">
						<form name="NewPassWord" action="${contextPath}/newPassWord.do" method="post">
							<div id="user_password1" style="padding-bottom: 10px">
								<input type="password" name="memPwd" size="37" value=""
									placeholder="비밀번호를 입력해주세요">
							</div>
							<div id="user_password2" style="padding-bottom: 20px">
								<input type="password" name="memPwd1" size="37" value=""
									placeholder="비밀번호 확인">
							</div>
						</form>
						
						<div>
								<button onclick="new_password()"
									style="width: 310px; background-color: #212529; color: white;">
									<i class="go_login-06"></i><span>확인</span>
								</button>
						</div>
						

					</div>

				</div>
			</section>
		</div>
	</section>

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














