<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>

<script type="text/javascript">
<!--글쓰기 유효형 검사-->
	function notice_write() {
		var form = document.noticeForm;

		if (form.noticeTitle.value == "") {
			alert("글 제목을 입력해주세요")
			form.noticeTitle.focus();
			return false;
		}

		if (form.noticeContent.value == "") {
			alert("글 내용을 입력해주세요")
			document.form.noticeContent.focus();
			return false;
		}

		form.submit();
	}
	
	function modNotice(obj) {
		var form = document.noticeForm;

		if (form.noticeTitle.value == "") {
			alert("글 제목을 입력해주세요")
			form.noticeTitle.focus();
			return false;
		}

		if (form.noticeContent.value == "") {
			alert("글 내용을 입력해주세요")
			document.form.noticeContent.focus();
			return false;
		}
		obj.action = "${contextPath}/admin/modNewNotice.do?noticeNum=${noticeNum.noticeNum}";
		obj.submit();

	}


	
    function InquiryList() {
        if (${isLogOn != true && member == null}) {
            alert("로그인이 필요합니다.");
            location.href = '${contextPath}/login_01.do';
        } else {
        	location.href='${contextPath}/board/listInquiry.do'
        }
    }
    
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>


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

#buttonmy {
	width: 80px;
	height: 30px;
	float: left;
	border-radius: 2px;
	padding-top: 1.8px;
}
</style>


</head>
<body>
	<!-- 타이틀 -->
	<section class="ftco-section"
		style="padding-top: 50px; margin-bottom: 50px; margin-top: 30px;">
		<div class="container">
		<jsp:include page="/WEB-INF/views/common/admin_topmenu.jsp"
						flush="false" />
			<div>
				<h2 style="font-size: 20px; margin-top: 15px; float: left; font-weight: bold;color:#7e9c8c;">공지사항</h2>
				<h5
					style="color: #828282; float: left; font-size: 13px; margin-left: 10px; margin-top: 23px;">SIMPLE의
					새로운 소식을 확인해보세요.</h5>
			</div>
			<!-- 타이틀 끝 -->


			<!-- 최근 본 상품 -->

			<!-- 최근 본 상품 끝 -->

			<!-- 내용 -->

			<form name="noticeForm"
				action="${contextPath}/admin/addNewNotice.do" method="post"
				enctype="multipart/form-data">
				<table class=table
					style="padding-top: 50px; border-top: #212529; height: 25px; font-size: 13px;">
					<c:choose>
						<c:when test="${!empty noticeNum}">
							<tr style="background-color: #212529; margin-top: 20px;"
								align="center">
								<td colspan="6" style="background-color: #fbfbfb; border-top:1px solid #eeeeee;color:black; border-bottom: 1px solid #c6c8ca;">글수정하기</td>
							</tr>
							<tr style="border-bottom: 1px solid #eeeeee;">
								<td
									style="padding-left: 95px;  padding-right: 100px;">작성자</td>
								<td colspan="2" style="background-color: white;"><input
									type=text name="noticeWriter" size=60
									value="${admin.memName}"
									style="height: 28px; border: 1px solid #aaaaaa; width:150px; border-radius: 3px; border: 1px solid #d2d2d2;"></td>
							</tr>
							<tr style="border-bottom: 1px solid #eeeeee;">
								<td
									style="padding-left: 95px; padding-top: 17px;">제목</td>
								<td colspan="2"
									style="padding-top: 17px; background-color: white;"><input
									type=text name="noticeTitle" size=60
									value="${noticeNum.noticeTitle}"
									style="height: 28px; border: 1px solid #aaaaaa; border-radius: 3px; border: 1px solid #d2d2d2;"></td>
							</tr>
							<tr style="border-bottom: 1px solid #eeeeee;">
								<td
									style="padding-left: 95px; padding-top: 20px;">내용</td>
								<td colspan="2"
									style="padding-top: 17px; background-color: white; height: 300px;"><input
									type="text" name="noticeContent"
									value="${noticeNum.noticeContent}"
									style="width: 725px; height: 300px; padding-top: 17px; border: 1px solid #d2d2d2;"></td>
							</tr>
							<tr>
								<td
									style="padding-left: 95px; padding-top: 17px;">파일첨부</td>
								<td style="background-color: white;">기존파일:
									${noticeNum.noticeImg}<input type="hidden"
									name="OrignNoticeImg" value="${noticeNum.noticeImg}" /><br>
									<input type="file" style="padding-top: 5px; font-size: 13px;"
									name="noticeImg" onchange="readURL(this);">
								</td>
								<td><img id="preview"
									src="${contextPath}/download_notice.do?noticeNum=${noticeNum.noticeNum}&noticeImg=${noticeNum.noticeImg}"
									width="150" height="150" /></td>
							</tr>
						</c:when>
						<c:when test="${empty noticeNum}">

							<tr style="background-color: #212529; margin-top: 20px;"
								align="center">
								<td colspan="6" style="background-color: #fbfbfb; border-top:1px solid #7e9c8c;color:black; border-bottom: 1px solid #eeeeee; ">글쓰기</td>
							</tr>
							<tr style="border-bottom: 1px solid #eeeeee;">
								<td
									style="padding-left: 95px; font-weight: bold; padding-right: 100px;">작성자</td>
								<td colspan="2" style="background-color: white;"><input
									type=text name="noticeWriter" size=60
									value="${admin.memName}"
									style="height: 28px; border: 1px solid #aaaaaa; width:150px; border-radius: 3px; border: 1px solid #d2d2d2;"></td>
							</tr>
							<tr style="border-bottom: 1px solid #eeeeee;">
								<td
									style="padding-left: 95px; font-weight: bold; padding-top: 17px;">제목</td>
								<td colspan="2"
									style="padding-top: 17px; background-color: white;"><input
									type=text name="noticeTitle" size=60 value=""
									style="height: 28px; border: 1px solid #d2d2d2; border-radius: 3px;"></td>
							</tr>
							<tr style="border-bottom: 1px solid #eeeeee;">
								<td
									style="padding-left: 95px; font-weight: bold; padding-top: 20px;">내용</td>
								<td colspan="2"
									style="padding-top: 17px; background-color: white; height: 300px;"><textarea
									type="text" name="noticeContent" value=""
									style="width: 725px; height: 300px; padding-top: 17px; border: 1px solid #d2d2d2;"></textarea></td>
							</tr>
							<tr >
								<td
									style="padding-left: 95px; font-weight: bold; padding-top: 17px;">파일첨부</td>
								<td style="background-color: white;"><input type="file"
									style="padding-top: 5px; font-size: 13px;" name="noticeImg"
									onchange="readURL(this);"></td>
								<td><img id="preview"
									src="${contextPath}/resources/images/simpleLogo.jpg"
									width="150" height="150" /></td>
							</tr>
						</c:when>
					</c:choose>
				</table>
				<hr style="border-color: #c6c8ca; width: 100%;">
				<c:choose>
					<c:when test="${!empty noticeNum}">
						<button type="button" onClick="modNotice(this.form)"
							class="btn btn-dark " id="buttonmy"
							style="margin-left: 540px; margin-top: 30px; border-radius: 2px;  background-color: #7e9c8c; color: white; border:none; border-radius: 2px; width: 104px; height: 34px; padding-top:10px; padding-top: 4px; float:left; font-size:13px;">수정하기</button>
						<button type="button"
							onclick="location.href='${contextPath}/board/listNotice.do'"
							class="btn btn-dark " id="buttonmy"
							style="margin-left: 20px;  margin-top:30px; border-radius: 2px;  background-color: white; color: gray;  border:1px solid #7e9c8c; border-radius: 2px; width: 104px; height: 34px; padding-top:10px; padding-top: 4px;  float:left; font-size:13px;">목 록</button>

					</c:when>
					<c:when test="${empty noticeNum}">
						<div>
							<button type="button" onclick="notice_write()"
								class="btn btn-dark " id="buttonmy"
								style="margin-left: 540px; margin-top: 30px; border-radius: 2px;  background-color: #7e9c8c; color: white; border:none; border-radius: 2px;width: 104px; height: 34px; padding-top:10px; padding-top: 4px; float:left; font-size:13px;">등 록</button>

							<button type="button"
								onclick="location.href='${contextPath}/board/listNotice.do'"
								class="btn btn-dark " id="buttonmy"
								style="margin-left: 20px;  margin-top:30px; border-radius: 2px;  background-color: white; color: gray;  border:1px solid #eeeeee; border-radius: 2px; width: 104px; height: 34px; padding-top:10px; padding-top: 4px;  float:left; font-size:13px;">목 록</button>
						</div>
					</c:when>
				</c:choose>
			</form>
		</div>
	</section>
	<!-- 내용 끝 -->

</body>
</html>