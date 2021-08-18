<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">
<head>


<style>


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
			<img src="${contextPath}/resources/images/product/bed.jpg" width=100%
				height=350px style="margin-bottom: 50px;">
			<!-- 최근 본 상품 끝 -->
			<table
				style="width: 100%; height: 60px; border-bottom: 1px solid #7e9c8c; font-size: 13px; margin-bottom: 60px;">
				<tr
					style="font-weight: bold; font-size: 15px; height: 19px; color: black; text-align: center;">
					<td style="vertical-align: middle;"><a
						onclick="location.href ='${contextPath}/product/listProduct.do?sort=침대&subsort=싱글&filter=x'"
						style="cursor: pointer;">ㆍSINGLE<span style="font-size: 12px;">(싱글)</span></a></td>
					<td style="vertical-align: middle;"><a
						onclick="location.href ='${contextPath}/product/listProduct.do?sort=침대&subsort=킹&filter=x'"
						style="cursor: pointer;">ㆍKING<span style="font-size: 12px;">(킹)</span></a></td>
					<td style="vertical-align: middle;"><a
						onclick="location.href ='${contextPath}/product/listProduct.do?sort=침대&subsort=이층침대&filter=x'"
						style="cursor: pointer;">ㆍBUNK<span style="font-size: 12px;">(이층침대)</span></a></td>
					<td style="vertical-align: middle;"><a
						onclick="location.href ='${contextPath}/product/listProduct.do?sort=침대&subsort=패밀리&filter=x'"
						style="cursor: pointer;">ㆍFAMILY<span style="font-size: 12px;">(패밀리)</span></a></td>
					<td style="vertical-align: middle;"><a
						onclick="location.href ='${contextPath}/product/listProduct.do?sort=침대&subsort=퀸&filter=x'"
						style="cursor: pointer;">ㆍQUEEN<span style="font-size: 12px;">(퀸)</span></a></td>
				</tr>
			</table>

			<jsp:include page="/WEB-INF/views/common/productfilter.jsp"
				flush="false" />
			<hr style="margin-top: -20px; margin-bottom: 30px;">





			<div class="row">
				<c:choose>
					<c:when test="${empty productList}">
						<b style="margin-top: 150px; margin-bottom: 100px;">
						<span style="color: black; margin-left: 550px;">등록된 상품이 없습니다.</span></b>
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
													style="width: 13px; height: 13px; margin-top: 9px; margin-bottom: 3px; margin-right:3px; float: right;" /></a>
											</h3>

											<hr style="margin-top: 10px; margin-bottom: 10px;">
											<h3 class="heading" 
												style="float: right;font-size:13px; white-space: nowrap; margin-bottom: 10px;">
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