<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.lang.String.*"%>
<%@ page import="com.project.simple.member.vo.MemberVO"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>


<style>
@import url(https://fonts.googleapis.com/css?family=Raleway:500);

.snip1284 {
	font-family: 'Raleway', Arial, sans-serif;
	text-align: center;
	text-transform: uppercase;
	font-weight: 500;
	letter-spacing: 1px;
}

.snip1284 * {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all 0.35s ease;
	transition: all 0.35s ease;
}

.snip1284 li {
	display: inline-block;
	list-style: outside none none;
	margin: 0.5em 1.2em;
	padding: 0;
}

.snip1284 a {
	padding: 0 0.6em;
	color: rgba(255, 255, 255, 0.5);
	position: relative;
	text-decoration: none;
}

.snip1284 a:before, .snip1284 a:after {
	width: 3px;
	height: 0;
	position: absolute;
	content: '';
	-webkit-transition: all 0.35s ease;
	transition: all 0.35s ease;
	background-color: #7e9c8c;
}

.snip1284 a:before {
	top: 0;
	right: 0;
}

.snip1284 a:after {
	bottom: 0;
	left: 0;
}

.snip1284 a:hover, .snip1284 .current a {
	color: #ffffff;
}

.snip1284 a:hover:before, .snip1284 .current a:before, .snip1284 a:hover:after,
	.snip1284 .current a:after {
	height: 100%;
}

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
	height: 590px;
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
function Check_Join() {
	var form = document.Checkmodify;

	if (form.memName.value == "") {
		alert("이름을 입력하지 않았습니다.")
		form.memName.focus();
		return false;
	}

	if (form.memName.value.length < 2) {
		alert("이름을 2자 이상 입력해주십시오.")
		document.form.memName.focus();
		return false;
	}

	if (form.memEmail.value == "") {
		alert("이메일을 입력하지 않았습니다.")
		form.memEmail.focus();
		return false;
	}
	for (var i = 0; i < form.memEmail.value.length; i++) {
		chm = form.memEmail.value.charAt(i)
		if (!(chm >= '0' && chm <= '9') && !(chm >= 'a' && chm <= 'z')
				&& !(chm >= 'A' && chm <= 'Z')) {
			alert("이메일은 영문 대소문자, 숫자만 입력가능합니다.")
			form.memEmail.focus();
			form.memEmail.select();
			return false;
		}
	}
	
	if (form.memPhoneNum.value == "") {
		alert("핸드폰번호를 입력하지 않았습니다..")
		form.memPhoneNum.focus();
		return false;
	}
	if (form.memPhoneNum1.value == "") {
		alert("핸드폰번호를 입력하지 않았습니다.")
		form.memPhoneNum1.focus();
		return false;
	}

	for (var i = 0; i < form.memPhoneNum1.value.length; i++) {
		ch = form.memPhoneNum1.value.charAt(i)
		if (!(ch >= '0' && ch <= '9')) {
			alert("핸드폰번호는 숫자만 입력가능합니다.")
			form.memPhoneNum1.focus();
			form.memPhoneNum1.select();
			return false;
		}
	}
	if (form.memPhoneNum2.value == "") {
		alert("핸드폰번호를 입력하지 않았습니다.")
		form.memPhoneNum2.focus();
		return false;
	}
	for (var i = 0; i < form.memPhoneNum2.value.length; i++) {
		ch = form.memPhoneNum2.value.charAt(i)
		if (!(ch >= '0' && ch <= '9')) {
			alert("핸드폰번호는 숫자만 입력가능합니다.")
			form.memPhoneNum2.focus();
			form.memPhoneNum2.select();
			return false;
		}
	}
	if (form.memAdr.value == "") {
		alert("주소를 입력하지 않았습니다.")
		form.memAdr.focus();
		return false;
	} 
	if (form.memAdr1.value == "") {
		alert("주소를 입력하지 않았습니다.")
		form.memAdr1.focus();
		return false;
	} if (form.memAdr2.value == "") {
		alert("주소를 입력하지 않았습니다.")
		form.memAdr2.focus();
		return false;
	} 
	 if (confirm("회원정보를 수정하시겠습니까?")){ //확인
    	 form.submit();
    } else { //취소
     	return false;
    }

  
}
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<script>
	//주문자 우편번호
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2').focus();
					}
				}).open();
	}
</script>

</head>
<title>회원수정창</title>
<body>
<%
	MemberVO member = (MemberVO) session.getAttribute("admin_member");
	String FullmemPhoneNum = member.getmemPhoneNum();
	String FullmemEmail = member.getmemEmail();
	String FullmemAdr = member.getmemAdr();

	String a1 = "-";
	String e1 = "@";
	String p1 = "-";

	String[] memAdr = FullmemAdr.split(a1);
	String[] memEmail = FullmemEmail.split(e1);
	String[] memPhoneNum = FullmemPhoneNum.split(p1);

	for (int i = 0; i < memAdr.length; i++) {
	}
	for (int i = 0; i < memEmail.length; i++) {
	}
	for (int i = 0; i < memPhoneNum.length; i++) {
	}
	%>
	<section class="ftco-section testimony-section"
		style="padding-top: 100px;">
		<div class="container">

			<ul class="snip1284" style="padding-left: 0px; margin-bottom: 30px;">
				<li><a
					onclick="location.href='${contextPath}/product/admin_listProduct.do'"
					data-hover="상품관리"
					style="font-size: 20px; border: none; color: #5a5a5a; margin-right: 100px; cursor: pointer; background-color: white; margin-left: 20px; padding-bottom: 0px;">상품관리</a></li>


				<li ><a
					onclick="location.href='${contextPath}/product/add_product.do'"
					data-hover="상품등록"
					style="font-size: 20px; border: none; color: #5a5a5a; margin-right: 100px; cursor: pointer; background-color: white; padding-bottom: 0px;">상품등록</a></li>


				<li class="current"><a
					onclick="location.href='${contextPath}/admin_listmember.do'"
					data-hover="회원관리"
					style="font-size: 20px; border: none; color: #5a5a5a; margin-right: 100px; cursor: pointer; background-color: white; padding-bottom: 0px;">회원관리</a></li>


				<li><a
					onclick="location.href='${contextPath}/board/listNotice.do'"
					data-hover="게시판관리"
					style="font-size: 20px; border: none; color: #5a5a5a; margin-right: 100px; background-color: white; cursor: pointer; padding-bottom: 0px;">게시판관리</a></li>
				<li><a
					onclick="location.href='${contextPath}/admin_listorder.do'"
					data-hover="주문관리"
					style="font-size: 20px; border: none; color: #5a5a5a; background-color: white; cursor: pointer; padding-bottom: 0px;">주문관리</a></li>
			</ul>

			<hr style="margin-top: -10px;">
           
			<section class="ftco-section testimony-section"
				style="padding-top: 100px;">
				
				<div class="container">
				
					<section class="Easy-sgin-in-wrap4">
						<div id="LeftBox" style="font-size: 14px;">
							<form name="Checkmodify" action="${contextPath}/admin/modMember.do" method="post">
								<table style="margin-top:30px; margin-left:35px;">
									<tr style="border-top: 1px solid #7e9c8c;  height:60px; border-bottom: 1px solid #c6c8ca; font-size: 15px;">
										<td style="width: 200px; text-align:center; background-color:#7e9c8c; color:white;">아이디</td>
										<td><input type="text" name="memId"
											value="${member.memId}"
											style="font-size: 14px; margin-left:10px; border: 1px solid #dcdcdc; width: 316px; height: 36px; color: #b3b3b3;" readonly>
									</tr>
									<tr style="border-bottom: 1px solid #eeeeee; ">
										<td style=" height:60px; text-align:center; background-color:#7e9c8c; color:white;">이름</td>
										<td><input type="text" name="memName"
											value="${member.memName}"
											style="font-size: 14px; margin-left: 10px; border: 1px solid #dcdcdc; width: 316px; height: 36px;">
									</tr>
									<tr style="border-bottom: 1px solid #eeeeee; ">
										<td style=" height:60px; width: 200px; text-align:center; background-color:#7e9c8c; color:white;">이메일</td>
										<td><input type="text" name="memEmail" placeholder=""
								             value=<%=memEmail[0]%> size="20" style="font-size: 14px; margin-left: 10px; border: 1px solid #dcdcdc; width: 130px; height: 36px; margin-right: 5px;"> @ 
								             <select name="memEmail1" id="selcet1"
								             style="font-size: 14px; margin-left: 10px; border: 1px solid #dcdcdc; width: 130px; height: 36px; margin-right: 5px;">
									              <option value=<%=memEmail[1]%>><%=memEmail[1]%></option>
							                 	  <option value="naver.com">naver.com</option>
									              <option value="gmail.com">gmail.com</option>
									              <option value="nate.com">nate.com</option>
								                  <option value="daum.net">daum.net</option>
								              	  <option value="hanmail.net">hanmail.net</option>
							               </select>
							            </td>
									</tr>
									<tr style="border-bottom: 1px solid #eeeeee; ">
										<td style="height:60px;  width: 200px; text-align:center; background-color:#7e9c8c; color:white;">핸드폰</td>
										<td><select name="memPhoneNum"
											style="font-size: 14px; margin-left: 10px; border: 1px solid #dcdcdc; width: 80px; height: 36px; margin-right: 5px;">
											<option value=<%=memPhoneNum[0]%>><%=memPhoneNum[0]%></option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="019">019</option>
									<option value="010">010</option>
							</select>- <input type="text" name="memPhoneNum1" id="phone2"
								value=<%=memPhoneNum[1]%> size="5" style="font-size: 14px;margin-right: 5px; margin-left: 5px; border: 1px solid #dcdcdc; width: 80px; height: 36px;">
								- <input type="text" id="phone3" style="font-size: 14px;margin-right: 5px; margin-left: 5px; border: 1px solid #dcdcdc; width: 80px; height: 36px;"
								name="memPhoneNum2" value=<%=memPhoneNum[2]%> size="5">
									</tr>
									<tr  style="border-bottom: 1px solid #eeeeee;">
										<td style="height:60px; width: 200px; text-align:center; background-color:#7e9c8c; color:white;">주소</td>
										<td colspan="3" class="addr" style="padding-left: 10px;">
										<input type="text" value="<%=memAdr[0]%>" name="memAdr" id="sample6_postcode" readonly size="15"
										style="font-size: 14px;margin-right: 5px; border: 1px solid #dcdcdc; width: 150px; height: 36px;">
								<input type="button" onclick="sample6_execDaumPostcode()"
									style="background-color: #c6c6c6; border: none; color: white; height: 36px; margin-left: 4px;"
								value="우편번호 찾기">
							</td>
									</tr>
							<tr style="border-bottom: 1px solid #eeeeee; ">
							<td style="height:60px; width: 200px; text-align:center; background-color:#7e9c8c; color:white;">
								<div align="center" style="color: white;">상세주소</div>
							</td>
							<td colspan="3" class="addr1" style="padding-left: 10px;">
							<input type="text" name="memAdr1" id="sample6_address" size="40"
								value="<%=memAdr[1]%>"
								style="font-size: 14px; margin-top:10px; border: 1px solid #dcdcdc; width: 316px; height: 36px;" >
								<div style="padding-top: 10px;">
									<input type="text" id="sample6_address2" name="memAdr2"
										size="40" value="<%=memAdr[2]%>"
										style="font-size: 14px;margin-right: 5px; margin-bottom:10px; border: 1px solid #dcdcdc; width: 316px; height: 36px;">
								</div></td>

						</tr>
									<tr  style="border-bottom: 1px solid #eeeeee; ">
										<td style="height:60px; width: 200px; text-align:center; background-color:#7e9c8c; color:white;">회원유형</td>
										<td><input type="text" name="logintype"
											value="${member.logintype}"
											style="font-size: 14px; margin-left: 10px; border: 1px solid #dcdcdc; width: 316px; height: 36px;">
									</tr>
									<tr  style="border-bottom: 1px solid #7e9c8c; ">
										<td style="height:60px; width: 200px; text-align:center; background-color:#7e9c8c; color:white;">가입일</td>
										<td><input type="text" name="memRegdate"
											value="${member.memRegdate}"
											style="font-size: 14px; margin-left: 10px; border: 1px solid #dcdcdc; width: 316px; height: 36px; color: #b3b3b3;" readonly >
									</tr>
								</table>

							
	                       </form>

						</div>
					</section>
				</div>
				<div class="container">
					<section class="Easy-sgin-in-wrap4">
						<ul class="sign-button-list4">
							<li style="margin-left: 50px;">
							<button  onclick="Check_Join()"
									style="background-color: white; font-size:14px; color: gray; border: 1px solid #7e9c8c; border-radius:2px; width:400px; float:left;">
									<i class="btn-Non Order Inquiry"></i><span>수정</span>
								</button>
									
							</li>
					
							<li style="margin-left: 50px;">
								<button  onclick="location.href='${contextPath}/admin_listmember.do'"
									style="background-color: white; font-size:14px; color: gray; border: 1px solid #7e9c8c; border-radius:2px; width:400px; float:left;">
									<i class="btn-Non Order Inquiry"></i><span>취소</span>
								</button>
							</li>

						</ul>
					</section>
				</div>
			
			</section>
			
		</div>
	</section>


</body>
</html>








