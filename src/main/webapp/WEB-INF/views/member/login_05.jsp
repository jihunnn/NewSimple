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
		style="padding-top: 200px;">
		<div class="container">

			<!-- 최근 본 상품 -->
<jsp:include page="/WEB-INF/views/common/quick.jsp" flush="false" />

			<section class="ftco-section testimony-section" id="sect"
				style="padding-top: 50px;">
				<div class="container" style="text-align: center;">
					<div>
						<h4 style="margin-bottom: 40px; font-size: 20px; color:#7e9c8c; font-weight:bold;">새로운 비밀번호를
							입력해주세요.</h4>
					</div>
					<div class="pass_input_confirm">
						<form name="NewPassWord" action="${contextPath}/newPassWord.do" method="post">
							<div id="user_password1" style="padding-bottom: 10px; ">
								<input type="password" name="memPwd" size="37" value="" style="border:1px solid #dcdcdc; font-size:13px; width: 325px;"
									placeholder="비밀번호를 입력해주세요">
							</div>
							<div id="user_password2" style="padding-bottom: 20px"> 
								<input type="password" name="memPwd1" size="37" value="" style="border:1px solid #dcdcdc; font-size:13px; width: 325px;"
									placeholder="비밀번호 확인">
							</div>
						</form>
						
						<div>
								<button onclick="new_password()"
									style="width: 325px; background-color: #7e9c8c; color: white; border:none;cursor:pointer; height:40px; font-size:13px;">
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














