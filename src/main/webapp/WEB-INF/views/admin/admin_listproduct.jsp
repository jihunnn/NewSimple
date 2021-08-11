<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:if test="${!empty productSearchMap.search}">
	<c:set var="productSearchList"
		value="${productSearchMap.productSearchList}" />
</c:if>

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


	<section class="ftco-section testimony-section"
		style="padding-top: 100px;">
		<div class="container">
			<jsp:include page="/WEB-INF/views/common/admin_topmenu.jsp"
				flush="false" />

			<form name="productSearch"
				action="${contextPath}/product/admin_listProduct/productSearch.do"
				method="post">
				<div style="margin-bottom: 10px;">
					<button type="submit" id="buttonmy" class="btn btn-dark"
						style="margin-top: 21px; float: right; padding-top: 4px; height: 34px; font-size: 13px; padding-top: 4px; background-color: #7e9c8c; border: none;">조회</button>
					<input type="text"
						style="margin-top: 21px; float: right; height: 34px; border: 1px solid #dcdcdc; font-size: 13px; margin-right: 5px;"
						name="search"> <select name="searchType"
						style="font-size: 13px; margin-bottom: 10px; margin-right: 5px; float: right; width: 80px; height: 34px; border: 1px solid #dcdcdc; margin-top: 21px;">
						<option value="productName">상품이름</option>
						<option value="productNum">상품번호</option>
						<option value="category">카테고리</option>
						<option value="subcategory">하위카테고리</option>
					</select>
				</div>
			</form>
<div style="font-size:25px; font-weight:bold; margin-left:18px; padding-top:13px;"><a style="color:#7e9c8c;">상품조회</a></div>

			<table class="table" style="font-size: 13px;">
				<thead class="table-dark" align=center>
					<tr
						style="background-color: #fbfbfb; color: black; border-top: 1px solid #7e9c8c; border-bottom: 1px solid #eeeeee; font-size: 14px;">
						<td scope="col" style="width: 120px;">상품번호</td>
						<td scope="col" style="width: 120px;">상품이미지</td>
						<td scope="col" style="width: 200px;">상품이름</td>

						<td scope="col" style="width: 100px;">상품가격</td>
						<td scope="col">카테고리</td>
						<td scope="col" style="width: 150px;">서브카테고리</td>
						<td scope="col">제조사</td>
						<td scope="col" style="width: 100px;">원산지</td>
						<td scope="col">상품등록일</td>
					</tr>
					<c:choose>
						<c:when test="${!empty productSearchMap.search}">
							<c:choose>
								<c:when test="${empty productSearchMap.productSearchList}">
									<tr height="200">
										<td colspan="5"
											style="background-color: white; padding-top: 100px;">
											<p align="center">
												<b><span style="color: black;">등록된 상품이 없습니다.</span></b>
											</p>
										</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="productSearch" items="${productSearchList}"
										varStatus="productNum">
										<tr onclick="location.href='${contextPath}/product/admin_detailproduct.do?productNum=${productSearch.productNum}'"
											style="border-bottom: 1px solid #eeeeee; background-color: white; color: black; height: 100px;">
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">${productSearch.productNum}</td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">
													<img class="block-20" style="width: 90px; height: 90px;"
													src="${contextPath}/download_product.do?productNum=${productSearch.productNum}&productImage=${productSearch.productImage}"
													id="preview" />
											</td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle; text-align: left;"><a
												href="${contextPath}/product/admin_detailproduct.do?productNum=${productSearch.productNum}">${productSearch.productName}</a></td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">${productSearch.productPrice}</td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">${productSearch.category}</td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">${productSearch.subcategory}</td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">${productSearch.productManufacturer}</td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">${productSearch.productOrigin}</td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;"><fmt:formatDate
													value="${productSearch.productDate}" /></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:when test="${empty productSearchMap.search}">
							<c:choose>
								<c:when test="${empty admin_productList}">
									<tr height="200">
										<td colspan="5"
											style="background-color: white; padding-top: 100px;">
											<p align="center">
												<b><span style="color: black;">등록된 상품이 없습니다.</span></b>
											</p>
										</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="product" items="${admin_productList}"
										varStatus="productNum">

										<tr onclick="location.href='${contextPath}/product/admin_detailproduct.do?productNum=${product.productNum}'"
											style="border-bottom: 1px solid #eeeeee; background-color: white; color: black; height: 100px;">
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">${product.productNum}</td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">
													<img class="block-20" style="width: 90px; height: 90px;"
													src="${contextPath}/download_product.do?productNum=${product.productNum}&productImage=${product.productImage}"
													id="preview" />
											</td>

											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle; text-align: left;"><a
												href="${contextPath}/product/admin_detailproduct.do?productNum=${product.productNum}">${product.productName}</a></td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">${product.productPrice}</td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">${product.category}</td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">${product.subcategory}</td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">${product.productManufacturer}</td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;">${product.productOrigin}</td>
											<td scope="col"
												style="height: 70px; display: table-cell; vertical-align: middle;"><fmt:formatDate
													value="${product.productDate}" /></td>
										</tr>

									</c:forEach>

								</c:otherwise>
							</c:choose>
						</c:when>
					</c:choose>

				</thead>
			</table>
		</div>
		<!-- 내용 끝 -->

		<!-- 페이징 글번호 -->
		<div class="page_wrap" style="margin-left: 80px; margin-top: 60px;">
			<div class="page_nation" style="text-align: center;">

				<c:if test="${pageMaker1.prev}">

					<a class="arrow prev" style="border: 1px solid #7e9c8c; color:#7e9c8c; margin-right:0px; margin-left:2px;"
						href='<c:url value="/product/admin_listProduct.do?page=${pageMaker1.startPage-1 }"/>'><i
						class="fa fa-chevron-left"></i></a>

				</c:if>
				<c:forEach begin="${pageMaker1.startPage }"
					end="${pageMaker1.endPage }" var="pageNum">

					<a style="border: 1px solid #7e9c8c; color:#7e9c8c; margin-right:0px; margin-left:2px;"
						href='<c:url value="/product/admin_listProduct.do?page=${pageNum }"/>'><i
						class="fa">${pageNum }</i></a>

				</c:forEach>
				<c:if test="${pageMaker1.next && pageMaker1.endPage >0 }">

					<a class="arrow next" style="border: 1px solid #7e9c8c; color:#7e9c8c; margin-right:0px; margin-left:2px;"
						href='<c:url value="/product/admin_listProduct.do?page=${pageMaker1.endPage+1 }"/>'><i
						class="fa fa-chevron-right"></i></a>

				</c:if>

			</div>
		</div>



	</section>
</body>
</html>