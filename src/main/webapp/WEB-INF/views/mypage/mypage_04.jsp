<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.lang.String.*"%>
<%@ page import="com.project.simple.member.vo.MemberVO"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>

<script type="text/javascript">
var check = 1;
function div_show(selectList) {
    var obj1 = document.getElementById("phone_con"); // 핸드폰

    if( selectList == "0" ) { // 핸드폰
        obj1.style.display = "block";   
        check = 0;
    } 
}
<!--폼 입력 유효성 검사-->
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
			alert("상세주소를 입력하지 않았습니다.")
			form.memAdr1.focus();
			return false;
		}
		if (form.memAdr2.value == "") {
			alert("상세주소를 입력하지 않았습니다.")
			form.memAdr2.focus();
			return false;
		}if(check==0){
            alert("핸드폰인증을 확인해주세요");
            return false;
        }if(confirm("정보를 수정하시겠습니까?")){
       
            form.submit();
        }
	}
	
	//핸드폰 인증 팝업창
	$(function(){
		$("#BtnPhoneConf").click(function(){
			var phone1 = jQuery("#phone1").val();
			var phone2 = jQuery("#phone2").val();
			var phone3 = jQuery("#phone3").val();
			var memPhoneNum4 = "";
			memPhoneNum4 = phone1 +"-"+ phone2 +"-"+ phone3;
			
			$.ajax({
				url : "${contextPath}/join/check/sendSMS",
				type : "POST",
				data : {
					memPhoneNum : memPhoneNum4
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
	//비밀번호 찾기_핸드폰_인증번호_확인	
	$(function(){
		$("#findBtnPhone").click(function(){
			var Approval_key=$("#Approval_key").val();
			$.ajax({
				url : "${contextPath}/phone_confirm.do",
				type : "POST",
				data : {
					Approval_key : Approval_key
				},
				success : function(data,textStatus) {
					 if(data=='false'){
				       	    alert("핸드폰 인증이 완료되었습니다.");
				       	    check = 1;
				       	   
				          }else{
				        	  check = 0;
				        	  alert("인증번호가 일치하지 않습니다.");
				          }
				},
				error:function(data,textStatus){
			          alert("에러가 발생했습니다.");ㅣ
			       },
			       complete:function(data,textStatus){
			         // alert("작업을완료 했습니다");
			       }
		    });  //end ajax	 
		 }
		)}
	)

	
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

<style>
#main_box { /*아이디 선택자*/
	display: flex;
	flex-direction: column;
	align-items: center;
	padding-top: 10px;
}

#Mypage { /*아이디 선택자*/
	display: flex;
	flex-direction: column;
	width: 1300px;
	height: 100px;
	align-items: center;
	padding-top: 10px;
	padding-right: 20px;
	font-size: 10px;
}

.my_row {
	flex-direction: row;
}

.container1 {
	width: 250px;
}

.container2 {
	width: 800px;
}

#sect {
	display: flex;
	flex-direction: row;
	padding-bottom: 10px;
}

.nav_MyPage {
	width: 120px;
	list-style-type: none;
	margin: 0;
	padding: 0;
	font-size: 14px;
}

#MyPage_center1 {
	border: 1px solid rgb(140, 140, 140);
}

.nav_MyPage li a {
	display: block;
	color: #000000;
	padding: 8px;
	text-align: center;
	text-decoration: none;
	font-weight: bold;
}

.nav_MyPage li a.current {
	background-color: rgb(200, 200, 200);
	color: block;
}

.nav_MyPage li a: hover:not(.current) {
	background-color: #CD853F;
	color: white;
}

#MyPage_top {
	padding-top: 50px;
	align-items: center;
	width: 700px;
	height: 100px;
}

#MyPage_top1 {
	padding-top: 50px;
	align-items: center;
	padding-left: 330px;
	width: 700px;
	height: 100px;
}

#MyPage_top2 {
	padding-top: 50px;
	align-items: center;
	padding-left: 200px;
	width: 700px;
	height: 100px;
}

.PASSWORD_confirm_text {
	position: relative;
	left: 15px;
}

#MyPage_top3 {
	align-items: center;
	padding-left: 300px;
	width: 700px;
	height: 100px;
}

.btn_PASSWORD_confirm {
	position: relative;
	font-size: 15px;
	width: 80px;
}

.btn_main_back {
	position: relative;
	left: 14px;
	font-size: 15px;
	width: 80px;
}

#Mypage_nav {
	width: 400px;
}

#Mypage-center {
	display: flex;
	flex-direction: row;
}

#Mypage_nav {
	display: flex;
	flex-direction: column;
	width: 120px;
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

#buttonmy {
	width: 80px;
	height: 30px;
	float: left;
	border-radius: 2px;
	padding-top: 1.8px;
	background-color: #212529;
	border-radius: 2px;
	color: white;
}
</style>

</head>
<title>회원정보수정창</title>
<body>


	<%
	MemberVO member = (MemberVO) session.getAttribute("member");
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



	<!-- 마이페이지 상단메뉴 -->
	<section class="ftco-section"
		style="padding-top: 100px; margin-bottom: 50px; padding-bottom: 0px; height: 700px;">
		<div class="container">

			<!-- 마이페이지 상단메뉴 끝 -->
			<!-- 최근 본 상품 -->
			<jsp:include page="/WEB-INF/views/common/quick.jsp" flush="false" />
			<!-- 최근 본 상품 끝 -->


			<!-- Left Menu -->
			<jsp:include page="/WEB-INF/views/common/mypage_sidemenu.jsp"
				flush="false" />
			<!-- left Menu 끝-->
			<!-- 내용 -->
			<div class="container02"
				style="padding-left: 200px;margin-bottom: .30px;">
				<h5 style="font-size: 20px; color:#7e9c8c; font-weight:bold;">회원정보 수정</h5>
				<form name="Checkmodify" action="${contextPath}/modMember.do"
					method="post">
					
					
					<input type="hidden" name="memId" readonly size="25" style="border:1px solid #dcdcdc; height:37px;"
								value="${member.memId}">



					<table
						style="width: 1000px; height: 400px; font-size:13px; border: 1px solid #eeeeee;">
						<tr>
							<td
								style="background-color: #fbfbfb; border-bottom: 1px solid #eeeeee; padding-left:100px; height:53px;"
								class="user_name" width="250">
								<div align="left" style="color: black;">
									<a style="color: red; padding-right: 5px;">*</a>이름
								</div>
							</td>
							<td colspan="3" class="user_name" style="padding-left: 10px; border:1px solid #eeeeee;">
								<input type="text" name="memName" readonly size="25" style="border:1px solid #dcdcdc; height:31px; "
								value="${member.memName}">
							</td>
						</tr>
						
						<tr>
							<td
								style="background-color: #fbfbfb; border-bottom: 1px solid #eeeeee; padding-left:100px;  height:53px;"
								class="email">
								<div align="left" style="color: black;">
									<a style="color: red; padding-right: 5px;">*</a>이메일
								</div>
							</td>
							<td colspan="3" class="email" style="padding-left: 10px; border:1px solid #eeeeee;">
							<input type="text" name="memEmail" placeholder=""
								value=<%=memEmail[0]%> size="20" style="border:1px solid #dcdcdc;  height:37px;"> @ <select
								name="memEmail1" id="selcet1"
								style="height: 35px; width: 135px; border:1px solid #dcdcdc;">
									<option value=<%=memEmail[1]%>><%=memEmail[1]%></option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="nate.com">nate.com</option>
									<option value="daum.net">daum.net</option>
									<option value="hanmail.net">hanmail.net</option>
							</select></td>
						</tr>
						<tr>
							<td
								style="background-color: #fbfbfb;border:1px solid #eeeeee; padding-left:100px;  height:53px;"
								class="phone">
								<div align="left" style="color: black;">
									<a style="color: red; padding-right: 5px;">*</a>핸드폰
								</div>
							</td>
							<td colspan="3" class="phone" style="padding-left: 10px;  border-bottom: 1px solid #eeeeee;">
							<input type="hidden" id="memPhoneNum4"  style="border:1px solid #dcdcdc; height:37px"/>
							<select name="memPhoneNum" id="phone1"
								style="height: 35px; width: 80px; border:1px solid #dcdcdc; height:37px;">
									<option value=<%=memPhoneNum[0]%>><%=memPhoneNum[0]%></option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="019">019</option>
									<option value="010">010</option>
							</select>- <input type="text" name="memPhoneNum1" id="phone2"
								value=<%=memPhoneNum[1]%> size="5" style="border:1px solid #dcdcdc;  height:37px;">- <input type="text" id="phone3"
								name="memPhoneNum2" value=<%=memPhoneNum[2]%> size="5" style="border:1px solid #dcdcdc;  height:37px; width:67px;">
								<button type="button" name="phone_certification" id="BtnPhoneConf" onclick="div_show('0');"
											style="background-color: #c6c6c6; border: none; color: white; height: 36px; margin-left: 4px; margin-top: 5px;">핸드폰인증</button>
								<div id="phone_con" style="display: none;">
									    <input type="text" name="Approval_key" id="Approval_key"
											size="10"  placeholder="인증번호를 입력하세요"
											style="margin-top: 5px; margin-bottom: 10px; border: 1px solid #dcdcdc; height:31px; width: 218px;">
										<button type="button" id="findBtnPhone"
											style="background-color: #c6c6c6; border: none;  color: white; height: 36px; margin-left: 4px;">인증번호 확인</button>
										</div>			
								
							</td>
						</tr>
						<tr>
							<td
								style="background-color: #fbfbfb; border-bottom: 1px solid #eeeeee; padding-left:100px;  height:53px;"
								class="addr1">
								<div align="left" style="color: black;">
									<a style="color: red; padding-right: 5px;">*</a>주소
								</div>
							</td>
							<td colspan="3" class="addr" style="padding-left: 10px; border:1px solid #eeeeee;"><input
								type="text" value="<%=memAdr[0]%>" name="memAdr" style="border:1px solid #dcdcdc; width:199px; height:37px;"
								id="sample6_postcode" readonly size="15">
								<input type="button" onclick="sample6_execDaumPostcode()"
									style="background-color: #c6c6c6; border: none; color: white;  height:37px; margin-left: 4px;"
								value="우편번호 찾기">
							</td>
						</tr>
						<tr>
							<td
								style="background-color: #fbfbfb; border:1px solid #eeeeee; padding-left:100px;"
								class="addr2" height=100px;>
								<div align="left" style="color: black;">
								<a style="color: red; padding-right: 5px; ">*</a>상세주소</div>
							</td>
							<td colspan="3" class="addr1" style="padding-left: 10px;"><input
								type="text" name="memAdr1" id="sample6_address" size="40" style="border:1px solid #dcdcdc; width:300px; height:37px;"
								value="<%=memAdr[1]%>">
								<div style="padding-top: 10px;">
									<input type="text" id="sample6_address2" name="memAdr2"
										size="40" value="<%=memAdr[2]%>" style="border:1px solid #dcdcdc;  width:300px;   height:37px;">
								</div></td>

						</tr>

					</table>


				

				<div align="center" id="btn_modify_reset"
					style="margin-top: 30px; margin-left: 500px; font-size:13px;">
					<input type="button" name="modify" value="수 정 " id="buttonmy"
						onclick="Check_Join()"
						style="margin-right: 20px; color:white; background-color:#7e9c8c; cursor: pointer; border:none; width: 104px; height: 34px;"> <input
						type="button" value="취   소" id="buttonmy"
						onclick="location.href='/mypage_01'" style="cursor: pointer; color:gray; background-color:white;  border:1px solid #eeeeee; width: 104px; height: 34px;">
				</div>
				</form>
			</div>

			<!-- 내용 -->

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
</body>
</html>