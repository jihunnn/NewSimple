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
	width: 430px;
	height: 450px;
	float: center;
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
	width: 17px;
	height: 17px;
	margin-left: 3px;
}

#id_pwd_save {
	font-size: 15px;
}

.btn_member_id_pwd {
	font-size: 15px;
}

#find_id_pwd {
	padding-left: 20px;
}

.btn_member_block {
	color: rgb(0, 0, 0);
}

#btn_submit_login {
	padding-left: 40px;
	padding-bottom: 10px;
}

#submit_login {
	align-items: center;
	width: 350px;
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
	width: 430px;
	height: 450px;
	border: 1px solid #eeeeee;
	margin: 10 10 10 10;
}

#Non_login_text {
	padding: 20px;
	margin-right: 20px;
	font-size: 20px;
}

#order_input {
	width: 430px;
	height: 200px;
}

.order_input>div {
	float: left;
}

.order_input {
	padding-top: 20px;
	padding-left: 20px;
}

#submit_NonOrderInquiry {
	width: 120px;
	height: 100px;
}

.order_name {
	position: relative;
	left: 20px;
}

.order_pwd {
	position: relative;
	left: 15px;
}

#order_phone {
	position: relative;
	left: 20px;
}

#Non_order_content {
	padding-top: 30px;
	padding-bottom: 100px;
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

.Easy-sgin-in-wrap3 {
	display: flex;
	flex-direction: column; /*column으로 정렬 */
	align-items: center;
	padding: 10px;
}

.Easy-sgin-in-wrap3 .sign-button-list3 {
	list-style: none;
	width: 350px;
	display: flex;
	flex-direction: column;
}

.Easy-sgin-in-wrap3 .sign-button-list3 li {
	padding-bottom: 10px;
	padding-left: -10px;
}

.Easy-sgin-in-wrap3 .sign-button-list3 li button {
	width: 350px;
	height: 40px;
	border: 1px solid rgb(0, 0, 0);
	text-align: center;
	background: rgb(255, 255, 255);
	float: right;
}

.Easy-sgin-in-wrap3 .sign-button-list3 li button i {
	font-size: 25px;
}
</style>

<script type="text/javascript">

$(document).ready(function(){
    var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
    $("input[name='memId']").val(userInputId); 
     
    if($("input[name='memId']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
                                           // 아이디 저장하기 체크되어있을 시,
        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 발생시
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("input[name='memId']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='memId']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name='memId']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
	//로그인
	function Login() {

		var form = document.checkLogin;
		//아이디 검사 ---------------------------------------------------------------------------
		if (form.memId.value == "") {
			alert("아이디를 입력해주세요!");
			form.memId.focus();//포커스를 id박스로 이동.
			return false;

		} else if (form.memPwd.value == "")//패스워드 검사 -------------------------------------------------------------------------
		{
			alert("비밀번호를 입력해주세요!");
			form.memPwd.focus();//포커스를 Password박스로 이동.
			return false;

		} else {

			form.submit();

		}
	}

	//비회원 주문조회
	function Non_order_Inquiry() {

		var form = document.Non_order;
		//주문번호 숫자만 입력
		for (var i = 0; i < form.nonMemOrderNum.value.length; i++) {
			ch = form.nonMemOrderNum.value.charAt(i)
			if (!(ch >= '0' && ch <= '9')) {
				alert("주문번호는 숫자만 입력가능합니다.")
				form.nonMemOrderNum.focus();
				form.nonMemOrderNum.select();
				return false;
			}
		}
	

		if (form.nonMemName.value == "") {
			alert("주문자명을 입력해주세요!");
			form.nonMemName.focus();

		} else if (form.nonMemOrderNum.value == "") {
			alert("주문 번호를 입력해주세요!");
			form.nonMemOrderNum.focus();
		} else {

			form.submit();

		}

	}
</script>
<!-- 카카오 로그인 --> 
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script> 
<script type="text/javascript"> 
//초기화 시키기.

	
	$(document).ready(function(){ 
		Kakao.init('40acc8a0f94fc942b570f1aebb0094de'); 
		Kakao.isInitialized(); 
		});
	function kakaoLogin() { 
		Kakao.Auth.authorize({
			redirectUri: 'http://localhost:8080/simple/kakaoLogin.do' 
			}); 
		}

</script>



</head>
<title>로그인창</title>
<body>





	<div class="container">

		<!-- 최근 본 상품 -->

		<section class="ftco-section testimony-section" id="sect"
			style="padding-top: 30px; margin-top: 70px;">
			<div class="container" style="padding-right: 100px;">
				<section class="Easy-sgin-in-wrap">
					<div id="LeftBox">
						<h3 id="login_text">회원 로그인</h3>



						<form name="checkLogin" action="${contextPath}/login.do"
							method="post">
							<div class="id_pwd_text"
								style="padding-top: 30px; margin-bottom: 5px; padding-left: 35px;">
								<div>
									<img src="${contextPath}/resources/images/login/login-id.jpg"
										width="23"><input
										style="font-size: 14px; border: 1px solid #dcdcdc; width: 326px; height: 36px;" onkeypress="if(event.keyCode == 13){Login(); return; }"
										type="text" name="memId" placeholder="아이디를 입력하세요">
								</div>
								<div>
									<img src="${contextPath}/resources/images/login/login-pwd.jpg"
										width="23"><input
										style="font-size: 14px; margin-top: 10px; border: 1px solid #dcdcdc; width: 326px; height: 36px;" onkeypress="if(event.keyCode == 13){Login(); return; }"
										type="password" name="memPwd" placeholder="비밀번호를 입력하세요">
								</div>
							</div>
						</form>

						<div class="id_save_find" style="float: left; padding-left:37px">
							<input type="checkbox" name="save_id" id="idSaveCheck"
								style="vertical-align: middle; "> <label
								style="font-size: 12px;">아이디 저장</label> <span
								id="find_id_pwd">
								<button onclick="location.href='${contextPath}/login_03.do'"
									style="border: none; font-size: 13px; margin-left: 110px; color: black; margin-right: 1px; height: 30px;"
									class="btn_member_id_pwd">아이디/비밀번호 찾기</button>
							</span>
						</div>
						<span id="btn_submit_login"> <input type="button"
							id="submit_login" value="로그인" onclick="Login()"
							style="background-color: #7e9c8c; font-size:14px; color: white; border: none; border-radius:2px; margin-left: -2px;">

						</span>

						<section class="Easy-sgin-in-wrap3">
							<ul class="sign-button-list3">
								<li><button onclick="location.href='${url}'"
										style="background-color: #eeeeee; color: black; border: none;">
										<img
											src="${contextPath}/resources/images/login/logo-naver.jpg"
											width="22"
											style="margin-right: 5px; margin-bottom: 3px; vertical-align: middle;"><span
											style="font-size: 14px;" class="fas fa-qrcode">네이버로 로그인</span>
									</button></li>
								<li><button onclick="location.href='javascript:kakaoLogin();'"
										style="background-color: #eeeeee; color: black; border: none;">

										<img
											src="${contextPath}/resources/images/login/logo-cacao.jpg"
											width="22"
											style="vertical-align: middle; margin-right: 5px; margin-bottom: 3px;">
										<span class="fab fa-facebook-square"
											style="font-size: 14px; margin-bottom: 3px;"> 카카오로 로그인</span>

									</button></li>
							</ul>
						</section>

					</div>
				</section>

			</div>
			<div class="container" style="padding-left: 100px;">
				<div id="RightBox">
					<h3 id="Non_login_text">비회원 주문조회</h3>
					<form name="Non_order"
						action="${contextPath}/nonmember/order_lookup.do" method="post">
						<div class="order_input">
							<div style=" padding-top: 10px;">
								<p style="margin-bottom:10px;">
									<input type="text" name="nonMemName" class="order_name"
										size="18"
										style="border: 1px solid #dcdcdc; font-size: 14px;  margin-top:1px;  height:36px; width:220px; "
										placeholder="주문자명">
								</p>
								<p style="margin-bottom:10px;">
									<input type="text" name="nonMemOrderNum" class="order_pwd"
										size="18"
										style="border: 1px solid #dcdcdc; margin-left:5px; font-size: 14px;  height:36px; width:220px; "
										placeholder="주문번호">
								</p>
							
							</div>
						</div>
					</form>
					<input type="submit" id="submit_NonOrderInquiry" value="주문조회"
						onclick="Non_order_Inquiry()"
						style="background-color: #7e9c8c; margin-top: 10px; margin-left:20px; color: white; height: 82px; border-radius: 2px; border:none;">
					<div id="Non_order_content" style="font-size:12px;">
						<ul>
							<li>주문자명, 주문 번호가 일치 하지 않을 경우,조회가 불가능합니다.</li>
							<li>비회원으로 로그인 하시는 분께서 주문 번호를 잊으신 경우, 고객센터로 연락주시면 신속하게
								처리해드리겠습니다.</li>
							<li>비회원으로 주문 하실 경우, 회원 혜택을 받지 못합니다.</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
	</div>


	<div class="container">
		<section class="Easy-sgin-in-wrap1" style="margin-bottom: 50px;">
			<ul class="sign-button-list1">
				<li><button onclick="location.href='${contextPath}/join_01.do'"
						style="background-color: #757575; color: white; margin-top: 50px; font-size:14px; border:none;">
						<i class="sgin-up"></i><span>회원가입</span>
					</button></li>
				<li><button onclick="location.href='main.jsp'"
						style="background-color: white; color: gray;  font-size:14px; border:1px solid #7e9c8c;">
						<i class="return-main"></i><span>돌아가기</span>
					</button></li>
			</ul>
		</section>

	</div>

</body>
</html>
