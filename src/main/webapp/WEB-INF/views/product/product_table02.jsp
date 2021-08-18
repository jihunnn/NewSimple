<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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

.page_wrap {
	text-align: center;
	font-size: 0;
}

.page_nation {
	display: inline-block;
}

.page_nation .none {
	display: none;
}

.page_nation a {
	display: block;
	margin: 0 3px;
	float: left;
	border: 1px solid #e6e6e6;
	width: 28px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	background-color: #fff;
	font-size: 13px;
	color: #999999;
	text-decoration: none;
}

.page_nation .arrow {
	border: 1px solid #ccc;
}

.page_nation .pprev {
	background: #f8f8f8
		url('${contextPath}/resources/images/page_pprev.png') no-repeat center
		center;
	margin-left: 0;
}

.page_nation .prev {
	background: #f8f8f8 url('${contextPath}/resources/images/page_prev.png')
		no-repeat center center;
	margin-right: 7px;
}

.page_nation .next {
	background: #f8f8f8 url('${contextPath}/resources/images/page_next.png')
		no-repeat center center;
	margin-left: 7px;
}

.page_nation .nnext {
	background: #f8f8f8
		url('${contextPath}/resources/images/page_nnext.png') no-repeat center
		center;
	margin-right: 0;
}

.page_nation a.active {
	background-color: #42454c;
	color: #fff;
	border: 1px solid #42454c;
}
</style>


</head>
<body>




	<section class="ftco-section" style="padding-top: 0px;">


		<div class="container">

			<!-- 최근 본 상품 -->
			<jsp:include page="/WEB-INF/views/common/quick.jsp" flush="false" />
			<!-- 최근 본 상품 끝 -->
			<img src="${contextPath}/resources/images/product/bookcase.jpg"
				width=100% height=350px style="margin-bottom: 50px;">
			<table
				style="width: 100%; height: 60px; border-bottom: 1px solid #7e9c8c; font-size: 13px; margin-bottom: 60px;">
				<tr
					style="font-weight: bold; font-size: 15px; height: 19px; color: black; text-align: center;">
					<td style="vertical-align: middle;"><a
						onclick="location.href ='${contextPath}/product/listProduct.do?sort=테이블/책상/책장&subsort=소파 테이블&filter=x'"
						style="cursor: pointer;">ㆍSOFATABLE<span
							style="font-size: 12px;">(소파테이블)</span></a></td>
					<td style="vertical-align: middle;"><a
						onclick="location.href ='${contextPath}/product/listProduct.do?sort=테이블/책상/책장&subsort=좌식 테이블&filter=x'"
						style="cursor: pointer;">ㆍSEDENTARY<span
							style="font-size: 12px;">(좌식테이블)</span></a></td>
					<td style="vertical-align: middle;"><a
						onclick="location.href ='${contextPath}/product/listProduct.do?sort=테이블/책상/책장&subsort=원목 테이블&filter=x'"
						style="cursor: pointer;">ㆍWOODTABLE<span
							style="font-size: 12px;">(원목테이블)</span></a></td>
					<td style="vertical-align: middle;"><a
						onclick="location.href ='${contextPath}/product/listProduct.do?sort=테이블/책상/책장&subsort=다용도 테이블&filter=x'"
						style="cursor: pointer;">ㆍVERSATILE<span
							style="font-size: 12px;">(다용도테이블)</span></a></td>
					<td style="vertical-align: middle;"><a
						onclick="location.href ='${contextPath}/product/listProduct.do?sort=테이블/책상/책장&subsort=책상/책장&filter=x'"
						style="cursor: pointer;">ㆍDESK/BOOKCASE<span
							style="font-size: 12px;">(책상/책장)</span></a></td>
				</tr>
			</table>

			<jsp:include page="/WEB-INF/views/common/productfilter.jsp"
				flush="false" />
			<hr style="margin-top: -20px; margin-bottom: 30px;">





			<div class="row">
				<c:choose>
					<c:when test="${empty productList}">
						<b style="margin-top: 150px; margin-bottom: 100px;"><span
							style="color: black; margin-left: 550px;">등록된 상품이 없습니다.</span></b>
					</c:when>
					<c:when test="${!empty productList}">
						<c:forEach var="product" items="${productList}"
							varStatus="productNum">
							<div class="col-md-4 ftco-animate">
								<div class="blog-entry">
									<c:choose>
										<c:when
											test="${not empty product.productImage && product.productImage != 'null'}">
											<input type="hidden" name="OrignProductFile"
												value="${product.productImage}" class="block-20" />
											<a
												href="${contextPath}/product/viewProduct.do?productNum=${product.productNum}">
												<img class="block-20" style="width: 400px;"
												src="${contextPath}/download_product.do?productNum=${product.productNum}&productImage=${product.productImage}"
												id="preview" />
											</a>
										</c:when>
									</c:choose>
									<div class="text d-flex py-1">
										<div class="desc">
											<h3 class="heading">
												<a style="font-size: 13px;"
													href="${contextPath}/product/viewProduct.do?productNum=${product.productNum}">${product.productName}</a>
												<a style="fontsize: 10px; margin-top: 7px;"><span
													class="favoriteText"
													style="color: #7e9c8c; margin-top: 5px; font-size: 13px; float: right; margin-right: 1px;">
														${product.favoriteCount}</span><img
													src="${contextPath}/resources/images/heartfull.jpg"
													id="favoritHeart"
													style="width: 13px; height: 13px; margin-top: 9px; margin-bottom: 3px; margin-right: 3px; float: right;" /></a>
											</h3>

											<hr style="margin-top: 10px; margin-bottom: 10px;">
											<h3 class="heading"
												style="float: right; font-size: 13px; white-space: nowrap; margin-bottom: 10px;">
												<a href="#" style="font-size: 14px;"><fmt:formatNumber
														pattern="###,###,###" value="${product.productPrice}" />원</a>
											</h3>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>


			</div>
		</div>


	</section>


</body>
</html>