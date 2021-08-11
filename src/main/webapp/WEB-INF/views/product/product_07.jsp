<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<script src="resources/jQuery/jquery-3.4.1.min.js"></script>

<head>
<style type="text/css">
#pdcategory {
	font-size: 17px;
	background-color: #f8f8f8;
	border: 1px solid #e7e7e7;
	border-right: none;
	height: 50px;
	color: #777;
}

#recentlyProduct {
	position: absolute;
	top: 180px;
	right: 50%;
	margin-right: -670px;
}

<!--
상품리뷰 오버랩 디자인------------->textarea {
	width: 439px;
	height: 27px;
	background-color: #efefef;
	border-radius: 6px;
	border: 1px solid #dedede;
	padding: 10px;
	margin-top: 3px;
	font-size: 0.9em;
	color: #3a3a3a;
}

input:focus, textarea:focus {
	border: 1px solid #97d6eb;
}

textarea {
	height: 60px;
	background-color: #efefef;
}

#submit {
	width: 127px;
	height: 48px;
	text-align: center;
	border: none;
	margin-top: 20px;
	cursor: pointer;
}

#submit:hover {
	color: #fff;
	background-color: #216282;
	opacity: 0.9;
}

#cancel {
	width: 127px;
	height: 48px;
	text-align: center;
	border: none;
	margin-top: 20px;
	cursor: pointer;
}

#cancel:hover {
	color: #fff;
	background-color: #216282;
	opacity: 0.9;
}

.review {
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	opacity: 0;
	visibility: hidden;
	transform: scale(1.1);
	transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform
		0.25s;
}

.review-content {
	position: absolute;
	top: 60%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	padding: 1rem 1.5rem;
	width: 850px;
	height: 500px;
	border-radius: 0.5rem;
}

.close-button {
	float: right;
	width: 1.5rem;
	line-height: 1.5rem;
	text-align: center;
	cursor: pointer;
	border-radius: 0.25rem;
	background-color: lightgray;
}

.close-button:hover {
	background-color: darkgray;
}

.show-modal {
	opacity: 1;
	visibility: visible;
	transform: scale(1.0);
	transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s;
}
</style>

</head>
<body>




	<!--Content-->
	<table class="table"
		style="margin-top: 60px; text-align: center; width: 1200px; margin-left: -80px;">

		<tr style="bakground-color: grey; border-bottom: 1px solid grey;">
			<td style="width: 100px; background-color: #212529; color: white;">번호</td>
			<td style="width: 200px; background-color: #212529; color: white;">작성자</td>
			<td style="width: 600px; background-color: #212529; color: white;">내용</td>
			<td style="width: 200px; background-color: #212529; color: white;">작성일자</td>
		</tr>
		<c:set var="num" value="${pageMaker.totalCount - ((pageNum-1) * 10) }" />
		<c:forEach var="productReview" items="${productReviewList}">
			<tr style="border-bottom: 1px solid grey;">
				<td style="width: 100px;" >${num }</td>
				<td style="width: 200px;">${productReview.memName}</td>
				<td style="width: 500px;"><a class="trigger"
					style="color: black; cursor: pointer;">
						${productReview.productReviewTitle}</a> <!-- 팝업 될 레이어 -->
					<div class="review" style="text-align: left;">
						<div class="review-content">
							<span class="close-button" style="margin-bottom: 5px;">&times;</span>
							<table style="width: 800px;">
								<tr style="background-color: #212529;">
									<td>
										<h3 class="title"
											style="font-size: 17px; text-align: center; height: 10px; color: white;">좋아요좋아요좋아요</h3>
									</td>
								</tr>
								<tr>
									<td><p>너무 맘에 들어요 좋네요 ~! 만족합니당. 번창하세요~~!!</p> <img
										src="${contextPath}/resources/images/product/sopia.jpg"
										style="width: 400px; height: 300px;" /></td>
								</tr>
							</table>
						</div>
					</div> <!-- 상품평 오버랩 스크립트 위로 올리면안됨 --> <script type="text/javascript">
						var modal = document.querySelector(".review");
						var trigger = document.querySelector(".trigger");
						var closeButton = document
								.querySelector(".close-button");
						var cancelButton = document.querySelector("#cancel");
						//console.log(modal);
						function toggleModal() {
							modal.classList.toggle("show-modal");
						}
						function windowOnClick(event) {
							if (event.target === modal) {
								toggleModal();
							}
						}
						trigger.addEventListener("click", toggleModal);
						closeButton.addEventListener("click", toggleModal);
						cancel.addEventListener("click", toggleModal);
						window.addEventListener("click", windowOnClick);
					</script> <!-- 상품평 오버랩 스크립트 위로 올리면안됨 끝끝 --></td>


				<td style="width: 200px;">2021-06-12</td>
			</tr>
			<c:set var="num" value="${num-1}"></c:set>
		</c:forEach>
	</table>
	<!-- 페이징 -->
	<div class="page_wrap" style="margin-left: 80px; margin-top: 60px;">
		<div class="page_nation " >

			<c:if test="${pageMaker.prev}">

				<a class="arrow prev"
					href='<c:url value="/product/listProductReview.do.?page=${pageMaker.startPage-1 }"/>'><i
					class="fa fa-chevron-left"></i></a>

			</c:if>
			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="pageNum">

				<a href='<c:url value="/product/listProductReview.do?page=${pageNum }"/>'><i
					class="fa">${pageNum }</i></a>

			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage >0 }">

				<a class="arrow next"
					href='<c:url value="/product/listProductReview.do?page=${pageMaker.endPage+1 }"/>'><i
					class="fa fa-chevron-right"></i></a>

			</c:if>

		</div>

	</div>
	<table class="table"
		style="margin-top: 20px; text-align: center; width: 1000px; margin-left: -80px; margin-bottom: 1px;">
		<tr>
			<td
				style="border: 1px solid grey; padding-top: 30px; padding-left: 0px;"><button
					type="submit" class="btn btn-default"
					style="background-color: #dcdcdc; margin-left: 845px; border-radius: 2px; width: 90px; height: 100px; margin-bottom: 3px;">등록</button>
				<img id="preview" src="#"
				style="background-color: #dcdcdc; margin-left: 630px; margin-top: -134px; width: 100px; height: 98px; margin-bottom: 0px; z-index: 1;" />
				<input type="text" placeholder="후기를 입력해주세요^^베스트 후기를 뽑아서 적립금을 드립니다."
				style="margin-top: -126px; width: 730px; height: 97px; float: left; margin-left: 20px;" />
				<input type="file" name="imageFileName" onchange="readURL(this);"
				style="margin-right: 670px; width: 300px; background-color: white; border: none; padding-top: 0px; padding-bottom: 50px; padding-left: 12px; padding-bottom: 10px;" /></td>
		</tr>
	</table>









</body>
</html>