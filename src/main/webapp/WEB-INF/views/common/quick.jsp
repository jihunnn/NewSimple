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
		<div id="recentlyProduct"
				style="position: absolute; left:80px;width: 120px; height: 310px; margin-left: 1650px; border: 1px solid #d2d2d2; margin-top: 80px;">
				

				<ul
					style="list-style: none; margin-top: 10px; padding-left: 20px; margin-bottom: 10px;">
					<li><a href="#"
						style="padding-left: -10px; padding-bottom: 1px; color: black;">최근본상품</a></li>
				</ul>
				<hr style="margin-top: 0px; margin-bottom: 0px; color: #d2d2d2;">
				<ul style="list-style: none; padding-top: 5px;">
				<c:choose>
				<c:when test="${empty quickList}">
				<ul
					style="list-style: none;padding-top: 80px;padding-right: 0px;padding-left: 0px;">
					<li><a
						style="color: black; text-align: center; margin-top: 8px; padding-top: 30px;">상품</a></li>
						<li><a
						style="color: black; text-align: center; margin-top: 8px; padding-top: 30px;">없음</a></li>
				</ul>
				</c:when>
				<c:otherwise>
				<c:forEach var="item" items="${quickList}" varStatus="itemNum" >
				<li><a href="${contextPath}/product/viewProduct.do?productNum=${item.productNum}">
					<img src="${contextPath}/download_product.do?productNum=${item.productNum}&productImage=${item.productImage}" style="width: 100px; height: 100px; padding-top: 10px; margin-left: -30px;"></a>
				</li>
		
			
				</c:forEach>
				</c:otherwise>
				</c:choose>
				</ul>
				<c:choose>
				<c:when test="${!empty quickList }">
				<hr style="margin-top: 0px; margin-bottom: 0px; color: #d2d2d2;">
				<ul
					style="list-style: none; padding-left: 30px; margin-bottom: 10px; margin-top: 8px;">
					<li><a href="${contextPath}/mypage_09.do"
						style="color: black; text-align: center; margin-top: 8px; padding-top: 30px;">더보기▼</a></li>
				</ul>
				</c:when>
				</c:choose>
				
			</div>
</body>
</html>