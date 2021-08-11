<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script>
	
</script>
</head>
<body>
	<div id="MyPage_top">
		<table style="width: 1000px; height: 80px; margin-left: 80px;">
			<tbody id="MyPage_center1">
				<tr height="45px;" style="border: 1px solid #e3e3e3;">
					<th
						style="font-size: 14px; background-color: #eeeeee; color: black;"
						colspan="3"><a style="font-size: 16px; padding-left: 10px;">${member.memName}</a>
						<a>님 환영합니다.</a></th>
				</tr>
				<tr align="center"
					style="padding-left: 10px; font-size: 14px; height: 60px; border: 1px solid #e3e3e3;"
					height="45%">
					<th width="220" style="text-align: center; color: gray;">주문/배송<a
						href="${contextPath}/mypage_04.do" style="color: red;">${myInfo.order}</a><a>건</a></th>
					<th width="220" style="text-align: center; center; color: gray;">취소/반품<a
						href="${contextPath}/mypage_07.do" style="color: red;">${myInfo.orderReturn}</a><a>건</a></th>
					<th width="220" style="text-align: center; center; color: gray;">장바구니<a
						href="${contextPath}/memcart.do" style="color: red;">${myInfo.cart}</a><a>건</a></th>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>