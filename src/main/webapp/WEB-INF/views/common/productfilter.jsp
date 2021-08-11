<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="btn-group" role="group" aria-label="..."
				style="margin-bottom: 25px; margin-top: 10px;">
				<button type="button" class="btn btn-default" onclick='location.href="${contextPath}/product/listProduct.do?sort=${param.sort}&subsort=${param.subsort}&filter=favorite"'
					style="border: 0; outline: 0; border-radius: 1px; background-color: white; font-size: 13px;">인기순</button>
				<button type="button" class="btn btn-default" onclick='location.href="${contextPath}/product/listProduct.do?sort=${param.sort}&subsort=${param.subsort}&filter=lowprice"'
					style="border: 0; outline: 0; background-color: white; font-size: 13px;">낮은가격순</button>
				<button type="button" class="btn btn-default" onclick='location.href="${contextPath}/product/listProduct.do?sort=${param.sort}&subsort=${param.subsort}&filter=highprice"'
					style="border: 0; outline: 0; background-color: white; font-size: 13px;">높은가격순</button>
				<button type="button" class="btn btn-default" onclick='location.href="${contextPath}/product/listProduct.do?sort=${param.sort}&subsort=${param.subsort}&filter=date"'
					style="border: 0; outline: 0; border-radius: 1px; background-color: white; font-size: 13px;">최신등록순</button>
			</div>
</body>
</html>