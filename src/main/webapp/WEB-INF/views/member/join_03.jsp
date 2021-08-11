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

#RightBox {
	width: 450px;
	border: 1px solid #eeeeee;
}

h3 {
	color: block;
}
</style>
<script type="text/javascript">
var check = 0;
function div_show(selectList) {
    var obj1 = document.getElementById("phone_con"); // 핸드폰

    if( selectList == "0" ) { // 핸드폰
        obj1.style.display = "block";    
    } 
}
	//로그인
	function Check_Join() {
		var form = document.CheckJoin;
		
		
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
		if (form.memAdr2.value == "") {
			alert("상세주소를 입력하지 않았습니다.")
			form.memAdr2.focus();
			return false;
		}

		if (!agree1.checked) {

			alert("이용 약관 동의를 체크하세요.");
			agree1.focus();
			return false;
		}
		if (!agree2.checked) {

			alert("개인정보 수집 및 이용안내 동의를 체크하세요.");
			agree2.focus();
			return false;
		}if(check==0){
            alert("핸드폰인증을 확인해주세요");
            return false;
        }if(confirm("회원가입을 하시겠습니까?")){
       
            form.submit();
        }

	}
	function checkAllCheckbox(obj) {
		$("input[name='agree']").prop('checked', true);
		$("[name=agree]").prop("checked", $(obj).prop("checked"));

	}
	function checkOneCheckbox(obj) {
		var allObj = $("[name=full_agree]");
		var objName = $(obj).attr("name");

		if ($(obj).prop("checked")) {
			checkBoxLength = $("[name=" + objName + "]").length;
			checkedLength = $("[name=" + objName + "]:checked").length;

			if (checkBoxLength == checkedLength) {
				allObj.prop("checked", true);
			} else {
				allObj.prop("checked", false);
			}
		} else {
			allObj.prop("checked", false);
		}
	}

	$(function() {
		$("[name=full_agree]").click(function() {
			checkAllCheckbox(this);
		});
		$("[name=agree]").each(function() {
			$(this).click(function() {
				checkOneCheckbox($(this));
			});
		});
	});
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
</head>
<title>네이버회원가입창</title>
<body>
	<section class="ftco-section testimony-section"
		style="padding-top: 0px;">
		<div class="container" style="height: 650px">
	
			<form name="CheckJoin" action="${contextPath}/addMembers_naver.do"
				method="post">
				<section class="ftco-section testimony-section" id="sect"
					style="paggin-top: 100px; width: 960px; margin-left: 100px;">

					<div class="container" style="width: 400px; padding-right: 0px;">
						<section class="Easy-sgin-in-wrap">
						<h3 style="font-size: 20px; color: #7e9c8c;">네이버 회원가입</h3>
							<div id="MainBox">
								<table style="wdith: 500px; height: 330px; text-align: left; font-size: 14px;">
									<tr>
										<td class="user_name">
											<div align="left" style="width: 80px;">
												<a
													style="color: red; padding-right: 5px; write-space: nowrap; margin-bottom: 10px;"></a>
											</div>
										</td>
										<td colspan="3" class="user_name" style="padding-left: 50px;">
											<input type="hidden" name="memName" readonly size="20" value="${Name}"
											style="margin-bottom: 10px;">
										</td>
									</tr>
									<tr>
										<td colspan="3" class="user_id" style="padding-left: 10px;">
											<input type="hidden" name="memId" size="30" value="${Id}"
											style="margin-bottom: 10px;"> 											
										</td>
									</tr>
									<tr>										
										<td colspan="3" class="user_password1"
											style="padding-left: 10px;"><input type="hidden"
											name="memPwd" size="30" value=""></td>
									</tr>
									<tr>																			
										<td colspan="3" class="user_password2"
											style="padding-left: 10px;"><input type="hidden"
											name="memPwd1" size="30" value=""></td>
									</tr>
									<tr>
										<td class="email">
											<div align="left" align="left">
												<a style="color: red; padding-right: 5px; margin-bottom: 10px;">*</a>이메일
											</div>
										</td>
										<td colspan="3" class="email" style="padding-left: 50px;">
											<input type="text" name="memEmail" placeholder="영문,대소문자,숫자만 입력가능" value="${Email0}" size="13"
											style="margin-bottom: 10px;border: 1px solid #dcdcdc; width: 170px; height: 36px; color: #b3b3b3; font-size: 12px;"> @ <select
											name="memEmail1" id="selcet1" style="border: 1px solid #dcdcdc; width: 134px; height: 36px;">
												<option value="${Email1}">${Email1}</option>
												<option value="naver.com">naver.com</option>
												<option value="gmail.com">gmail.com</option>
												<option value="nate.com">nate.com</option>
												<option value="daum.net">daum.net</option>
												<option value="hanmail.net">hanmail.net</option>
										</select>
										</td>
									</tr>
									<tr>
										<td class="phone">
											<div align="left" style="margin-bottom: 10px;" align="left">
												<a style="color: red; padding-right: 5px;margin-bottom: 10px;">*</a>핸드폰
											</div>
										</td>
										<td colspan="3" class="phone" style="padding-left: 50px;">
										<input type="hidden" id="memPhoneNum4" />
											<select name="memPhoneNum" id="phone1"
											style="height: 34px; margin-bottom: 10px; border: 1px solid #dcdcdc; width: 66px; height: 36px;">
												<option value="${Mobile0}">${Mobile0}</option>
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="019">019</option>
												<option value="010">010</option>
										</select>- <input type="text" name="memPhoneNum1" value="${Mobile1}" size="3" id="phone2"
										style="border: 1px solid #dcdcdc; width: 77px; height: 36px;">-
											<input type="text" name="memPhoneNum2" value="${Mobile2}" size="3" id="phone3"
											style="border: 1px solid #dcdcdc; width: 77px; height: 36px;">
											<button type="button" name="phone_certification" id="BtnPhoneConf" onclick="div_show('0');"
											style="background-color: #c6c6c6; border: none; color: white; height: 36px; margin-left: 4px;">핸드폰인증</button>
										</td>
									</tr>
									<tr>
									    <td>
									    </td>
									    
									    <td>
									   <div id="phone_con" style="display: none;">
									    <input type="text" name="Approval_key" id="Approval_key"
											size="10"  placeholder="인증번호를 입력하세요"
											style="margin-left:49px; margin-bottom: 10px; border: 1px solid #dcdcdc; width: 218px; height: 36px;">
										<button type="button" id="findBtnPhone"
											style="background-color: #c6c6c6; border: none; color: white; height: 36px; margin-left: 4px;">인증번호 확인</button>
										</div>
									    </td>
									    
									</tr>
									<tr>
										<td class="addr1">
											<div align="left" style="margin-bottom: 10px;">
												<a style="color: red; padding-right: 5px;margin-bottom: 10px;">*</a>주소
											</div>
										</td>
										<td colspan="3" class="addr" style="padding-left: 50px;">
											<input type="text" name="memAdr" id="sample6_postcode"
											readonly size="10" style="margin-bottom: 10px; border: 1px solid #dcdcdc; width: 218px; height: 36px;"> 
											<input type="button" onclick="sample6_execDaumPostcode()"
												style="background-color: #c6c6c6; border: none; color: white; height: 36px; margin-left: 4px;"
											value="우편번호 찾기">
										</td>
									</tr>
									<tr>
										<td class="addr2">
											<div align="left"></div>
										</td>
										<td colspan="3" class="addr1" style="padding-left: 50px;">
											<input type="text" style="margin-bottom: 10px; border: 1px solid #dcdcdc; width: 326px; height: 36px;"
											name="memAdr1" id="sample6_address" size="30" value=""><input
											type="text" name="memAdr2" id="sample6_address2" size="30"
											style="border: 1px solid #dcdcdc; width: 326px; height: 36px;"
											value="">
										</td>
									</tr>
								</table>
							</div>
						</section>
					</div>
					<div class="container"
						style="width: 350px; margin-top: 9px; margin-left: 10px;">
						<h3 style="font-size:12px; width:450px; margin-left:290px; color: #7e9c8c;"><span style="color:red;">* </span>표시는 반드시 입력해주세요</h3>
						<div id="RightBox">

							<table style="width: 600px; height: 400px;">
								<tr>
									<td
										style="padding-left: 15px; font-size: 14px; padding-top: 10px;"><input
										type="checkbox" name="full_agree" id="full_agree"
										onclick="checkAllCheckbox()" value="on" > 전체 동의</td>
								</tr>
								<tr>
									<td style="padding-left: 15px; font-size: 14px;"><input
										type="checkbox" name="agree" id="agree1" value="on"><a
										style="color: red; font-size: 14px;">*</a> 이용 약관</td>
								</tr>
								<tr>
									<td style="text-align: left; padding-left: 13px;"><textarea
											rows=4 name="contents" disabled
											style="font-size: 12px; width: 415px;">
     가. 수집하는 개인정보의 항목첫째, 회사는 회원가 입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.
회원가입
- 이름, 아이디, 비밀번호, 주소, 연락처(메일주소, 휴대폰 번호), 가입인증정보
만14세 미만 아동 회원가입
- 이름, 생년월일, 성별, 법정대리인 정보, 아이디, 비밀번호, 연락처 (메일주소, 휴대폰 번호 중 선택), 가입인증정보
단체아이디 회원가입
- 단체아이디, 회사명, 대표자명, 대표 전화번호, 대표 이메일 주소, 단체주소, 관리자 아이디, 관리자 연락처, 관리자 부서/직위
- 선택항목 : 대표 홈페이지, 대표 팩스번호
둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록
셋째, 네이버 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 해당 서비스의 이용자에 한해서만 개인정보 추가 수집이 발생할 수 있으며, 이러한 경우 별도의 동의를 받습니다.
넷째, 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다.
- 신용카드 결제시 : 카드사명, 카드번호 등
- 휴대전화 결제시 : 이동전화번호, 통신사, 결제승인번호 등
- 계좌이체시 : 은행명, 계좌번호 등
- 상품권 이용시 : 상품권 번호
  나. 개인정보 수집방법회사는 다음과 같은 방법으로 개인정보를 수집합니다.
- 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 배송요청
- 협력회사로부터의 제공
- 생성정보 수집 툴을 통한 수집
   </textarea></td>

								</tr>
								<tr>
									<td style="padding-left: 10px; font-size: 14px;">
										<div align="left" style="padding-left: 5px;">
											<input type="checkbox" name="agree" id="agree2" value="on"><a
												style="color: red; font-size: 14px;">*</a>개인정보 수집 및 이용안내
										</div>
									</td>

								</tr>
								<tr>
									<td style="padding-left: 15px;"><textarea rows=4
											style="font-size: 12px; width: 415px;" name="contents"
											disabled>본인은 회원가입과 관련하여 개인정보를 제공하며, 다음과 같은 개인정보 수집, 이용 등에 동의합니다.
목적 및 업체 이외로 고객의 개인정보를 이용 또는 제공하지 않습니다.
다만, 법령의 규정에 의거하거나 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우에는 예외로 합니다.
본 동의서 내용은 회사 정책에 따라 변경될 수 있으며, 변경 내용은 회사 홈페이지에 공지하거나 법령에 따라 필요한 절차를 진행할 수 있습니다.</textarea>
									</td>

								</tr>
								<tr>
									<td style="padding-left: 15px; font-size: 14px;">
										<div align="left">
											<input type="checkbox" name="agree" id="agree3" value="on">마켓팅
											수신 동의
										</div>
									</td>

								</tr>
								<tr>
									<td style="padding-left: 15px;"><textarea rows=3
											style="font-size: 12px; width: 415px; height: 101px;"
											name="contents" disabled>쇼핑몰에서는 회원가입시 수집된 개인정보를 이용하여 탈퇴시까지 각종 서비스, 상품에 대하여 홍보 목적으로 본인에게 정보, 전화, SMS, 이메일 등의 방법으로 전달합니다.</textarea>

									</td>

								</tr>

							</table>


						</div>
					</div>
				</section>
				<div style="text-align: center; padding-bottom: 70px; font-size: 14px; margin-top: 20px; margin-left: 20px;">
					<input type="button" name="modify" value="회원가입 "
						style="padding-left: 10px; background-color: #7e9c8c; color: white; border: none; border-radius: 2px; width: 130px; height: 45px;"
						onclick="Check_Join()"> <input type="reset" name="reset"
						value="취    소"
						style="width: 75px; background-color: white; margin-right: 40px; color: gray; border: 1px solid #7e9c8c; border-radius: 2px; margin-left: 20px; width: 130px; height: 45px;"
						onclick="location.href='/Main'">
				</div>
			</form>
		</div>
	</section>
	<!-- 내용 끝 -->
</body>
</html>








