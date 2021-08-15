<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
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
</style>
<script>
    function InquiryList() {
        if (${isLogOn != true && member == null}) {
        	if(${AdminisLogOn == true && admin != null}) {
            	
            	location.href='${contextPath}/admin/listAllInquiry.do';
            } else{
            alert("로그인이 필요합니다.");
            location.href = '${contextPath}/login_01.do';}
        }   else {
        	location.href='${contextPath}/board/listInquiry.do';
        }
    }
</script>
</head>
<body>
	<table
		style="width: 100%; height: 60px; border-bottom: 1px solid #e9e9e9; font-size: 13px; margin-bottom: 60px; ">
		<tr
			style="font-weight: bold; font-size: 15px; height: 19px; color: black; text-align:center; ">
			<td style="vertical-align: middle;"><a
			onclick="location.href='${contextPath}/board/listNotice.do'" style="cursor: pointer;">ㆍNOTICE<span style="font-size:12px;">(공지사항)</span></a></td>
			<td style=" vertical-align: middle;"><a
			onclick="location.href='${contextPath}/board/listQuestion.do'" style="cursor: pointer;">ㆍQUSTION<span style="font-size:12px;">(자주묻는질문)</span></a></td>
			<td style=" vertical-align: middle;"><a
			onclick="InquiryList()" style="cursor: pointer;">ㆍINQUIRY<span style="font-size:12px;">(1:1문의)</span></a></td>
			<td style=" vertical-align: middle;"><a
			onclick="location.href='${contextPath}/board/listAsCenter.do'" style="cursor: pointer;">ㆍASCENTER<span style="font-size:12px;">(A/S센터)</span></a></td>
		</tr>
	</table>



</body>
</html>