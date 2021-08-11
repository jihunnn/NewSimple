<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

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