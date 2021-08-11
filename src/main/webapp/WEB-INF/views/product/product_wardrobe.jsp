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




	<section class="ftco-section" style="padding-top: 30px;">
		<div class="container">

				<img src="${contextPath}/resources/images/product/selina.jpg" width=100%
		height=350px style="margin-bottom:30px;">
			<!-- 최근 본 상품 -->

			<!-- 최근 본 상품 끝 -->

			<ul class="snip1284" style="margin-bottom: 30px; font-weight:bold;">
				<li class="current"><a
					onclick="location.href ='${contextPath}/product/listProduct.do?sort=화장대/옷장/수납&subsort=거실장&filter=x'"
					data-hover="싱글"
					style="font-size: 17px; border: none; color: #5a5a5a; margin-right: 130px; cursor: pointer; background-color: white; padding-bottom: 0px;">거실장</a></li>


				<li><a
					onclick="location.href ='${contextPath}/product/listProduct.do?sort=화장대/옷장/수납&subsort=장식장&filter=x'"
					data-hover="킹"
					style="font-size: 17px; border: none; color: #5a5a5a; margin-right: 130px; cursor: pointer; background-color: white; padding-bottom: 0px;">장식장</a></li>


				<li><a
					onclick="location.href ='${contextPath}/product/listProduct.do?sort=화장대/옷장/수납&subsort=화장대/콘솔&filter=x'"
					data-hover="이층침대"
					style="font-size: 17px; border: none; color: #5a5a5a; margin-right: 150px; cursor: pointer; background-color: white; padding-bottom: 0px;">화장대/콘솔</a></li>


				<li><a
					onclick="location.href ='${contextPath}/product/listProduct.do?sort=화장대/옷장/수납&subsort=옷장&filter=x'"
					data-hover="패밀리"
					style="font-size: 17px; border: none; color: #5a5a5a; background-color: white; cursor: pointer; padding-bottom: 0px; margin-right: 150px;">옷장</a></li>
				<li><a
					onclick="location.href ='${contextPath}/product/listProduct.do?sort=화장대/옷장/수납&subsort=서랍장&filter=x'"
					data-hover="패밀리"
					style="font-size: 17px; border: none; color: #5a5a5a; background-color: white; cursor: pointer; padding-bottom: 0px;">서랍장</a></li>
			</ul>
			<hr style="margin-bottom: 0px;">
			<jsp:include page="/WEB-INF/views/common/productfilter.jsp"
				flush="false" />
			<hr style="margin-top: -15px; margin-bottom: 30px;">





			<div class="row">
				<c:choose>
					<c:when test="${empty productList}">
						<b><span style="color: black;">등록된 상품이 없습니다.</span></b>
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
										<div class="desc pl-2">
											<h3 class="heading">
												<a style="font-size:15px;"
													href="${contextPath}/product/viewProduct.do?productNum=${product.productNum}">${product.productName}</a>
											</h3>
											<hr style="margin-top: 15px; margin-bottom:10px;">
												<h3 class="heading"
													style="float: right; white-space: nowrap; margin-bottom: 10px;">
													<a href="#" style="font-size: 16px;"><fmt:formatNumber
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