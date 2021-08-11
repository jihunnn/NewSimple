<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<style>
hr {
	-webkit-box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.1);
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.1);
}
</style>
<script type="text/javascript">
	var loopSearch = true; //제시된 키워드를 클릭하면 keywordSearch()함수의 실행을 중지
	function keywordSearch() {
		if (loopSearch == false)
			return;
		var value = document.frmSearch.searchWord.value;
		$.ajax({
			type : "get",
			async : true, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/keywordSearch.do",
			data : {
				keyword : value
			},
			success : function(data, textStatus) {
				var jsonInfo = JSON.parse(data);//전송된 데이터를 json으로 파싱
				displayResult(jsonInfo);//전송된 json데이터를 표시
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다." + data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
			}
		}); //end ajax	
	}
	function displayResult(jsonInfo) {
		var count = jsonInfo.keyword.length; //json 데이터 개수를 구함
		if (count > 0) {
			var html = '';
			for ( var i in jsonInfo.keyword) { //json데이터를 차례대로 <a>태그를 이용해 키워드 목록을 만듬
				html += "<a href=\"javascript:select('" + jsonInfo.keyword[i]
						+ "')\">" + jsonInfo.keyword[i] + "</a><br/>";
			}
			var listView = document.getElementById("suggestList");//<a>태그로 만든 키워드 목록을 <div>태그에 차례대로 표시
			listView.innerHTML = html;
			show('suggest');
		} else {
			hide('suggest');
		}
	}
	function select(selectedKeyword) {
		document.frmSearch.searchWord.value = selectedKeyword;
		loopSearch = false;
		hide('suggest');
	}
	function show(elementId) {
		var element = document.getElementById(elementId);
		if (element) {
			element.style.display = 'block';
		}
	}
	function hide(elementId) {
		var element = document.getElementById(elementId);
		if (element) {
			element.style.display = 'none';
		}
	}
</script>
<script>
	$(document).on('click', '#btnSearch', function(object) {
		object.preventDefault();
		var url = "${contextPath}/product/listProduct.do";
		url = url + "?productType=" + $('#productType').val();
		location.href = url;
		console.log(url);
	});
</script>
<!-------------header------------------------------------------------------------------------------------------------------------------------>

<nav
	class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
	id="ftco-navbar" style="padding-bottom: 0px; ">
	<div class="container" style="height: 150px;">
		<a class="navbar-brand" href="${contextPath}/main.do">SIMPLE</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#ftco-nav" aria-controls="ftco-nav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> Menu
		</button>
		<div class="collapse navbar-collapse" id="ftco-nav">

			<ul class="navbar-nav ml-auto">

				<c:choose>
					<c:when
						test="${isLogOn == true && member != null || AdminisLogOn == true && admin != null}">
						<c:choose>
							<c:when test="${isLogOn == true && member != null}">
								<h6 style="font-size: 12px; margin-top: 18px;">
									<span
										style="text-decoration: underline; text-underline-position: under;">${member.memName}님!
									</span>환영합니다.
								</h6>
							</c:when>
							<c:otherwise>
								<h6 style="font-size: 12px; margin-top: 18px;">
									<span
										style="text-decoration: underline; text-underline-position: under;">${admin.memName}님!
									</span>환영합니다.
								</h6>
							</c:otherwise>
						</c:choose>
						<li class="nav-item active"><a
							href="${contextPath}/logout.do" class="nav-link"
							style="margin-bottom: 100px; padding-right: 10px; font-size: 12px;">LOGOUT</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item active"><a
							href="${contextPath}/login_01.do" class="nav-link"
							style="margin-bottom: 100px; padding-right: 10px; font-size: 12px;">LOGIN</a></li>
					</c:otherwise>
				</c:choose>
				<li class="nav-item"><a href="${contextPath}/join_01.do"
					class="nav-link" style="padding-right: 10px; font-size: 12px;">JOIN</a></li>
				<c:choose>
				<c:when test="${isLogOn==null}">
				<li class="nav-item"><a href="${contextPath}/nonmemcart.do" class="nav-link"
					style="padding-right: 10px; font-size: 12px;">CART</a></li>
				</c:when>
				<c:otherwise>
				<li class="nav-item"><a href="${contextPath}/memcart.do" class="nav-link"
					style="padding-right: 10px; font-size: 12px;">CART</a></li>
				</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${isLogOn == true && member != null}">
						<li class="nav-item"><a href="${contextPath}/mypage_01.do"
							style="padding-right: 10px; font-size: 12px;" class="nav-link">MYPAGE</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a href="${contextPath}/login_01.do"
							class="nav-link" style="padding-right: 10px; font-size: 12px;">MYPAGE</a></li>
					</c:otherwise>
				</c:choose>
				<li class="nav-item"><a
					href="${contextPath}/storeinfomation.do" class="nav-link"
					style="padding-right: 10px; font-size: 12px;">매장안내</a></li>
				<li class="nav-item"><a
					href="${contextPath}/board/listNotice.do" class="nav-link"
					style="font-size: 12px; padding-right:0px;">고객센터</a></li>
				<c:if test="${AdminisLogOn ==true}">
					<li class="nav-item active" style="height: 50px;"><a
						href="${contextPath}/product/admin_listProduct.do" class="nav-link"
						style="padding-left: 30px; font-size: 12px; padding-right: 0px;">관리자</a></li>
				</c:if>

			</ul>

			<div class="dropdown">
				<button type="button" id="dropdownMenu1"
					onclick="location.href = '${contextPath}/product/listProduct.do?sort=침대&subsort=x&filter=x'"
					data-toggle="dropdown" class="category"
					style="margin-left: -950px; margin-bottom: 0px; font-size: 16px; cursor: pointer; margin-top: 40px; background-color:transparent; ">침대
				</button>
				<ul class="dropdown-menu" role="menu"
					aria-labelledby="dropdownMenu1"
					style="margin-left: -1010px; text-align: center;">
					<li role="presentation" style="margin-top: 11px;"><a
						role="menuitem" tabindex="-1" href="" id="categorydetile"
						style="color: #000000; font-size: 15px;">싱글</a></li>
					<li role="presentation" style="margin-top: 11px;"><a
						role="menuitem" tabindex="-1" href="" id="categorydetile"
						style="color: #000000; font-size: 15px;">킹</a></li>
					<li role="presentation" style="margin-top: 11px;"><a
						role="menuitem" tabindex="-1" href="" id="categorydetile"
						style="color: #000000; font-size: 15px;">이층침대</a></li>
					<li role="presentation" style="margin-top: 11px;"><a
						role="menuitem" tabindex="-1" href="" id="categorydetile"
						style="color: #000000; font-size: 15px;">패밀리</a></li>
					<li role="presentation" style="margin-top: 11px;"><a
						role="menuitem" tabindex="-1" href="" id="categorydetile"
						style="color: #000000; font-size: 15px;">퀸</a></li>
				</ul>
			</div>



			<div class="dropdown">
				<button type="button" id="dropdownMenu1"
					onclick="location.href = '${contextPath}/product/listProduct.do?sort=소파&subsort=x&filter=x'"
					data-toggle="dropdown" aria-expanded="true" class="category"
					style="margin-left: -850px; cursor: pointer; font-size: 16px; margin-top: 40px; background-color:transparent;">
					소파</button>
				<ul class="dropdown-menu" role="menu"
					aria-labelledby="dropdownMenu1"
					style="margin-left: -910px; text-align: center;">
					<li role="presentation" style="margin-top: 11px;"><a
						role="menuitem" tabindex="-1" href="" id="categorydetile"
						style="color: #000000; font-size: 15px;">코너형</a></li>
					<li role="presentation" style="margin-top: 11px;"><a
						role="menuitem" tabindex="-1" href="" id="categorydetile"
						style="color: #000000; font-size: 15px;">1인/웜체어</a></li>
					<li role="presentation" style="margin-top: 11px;"><a
						role="menuitem" tabindex="-1" href="" id="categorydetile"
						style="color: #000000; font-size: 15px;">패브릭</a></li>
					<li role="presentation" style="margin-top: 11px;"><a
						role="menuitem" tabindex="-1" href="" id="categorydetile"
						style="color: #000000; font-size: 15px;">리클라이너</a></li>
					<li role="presentation" style="margin-top: 11px;"><a
						role="menuitem" tabindex="-1" href="" id="categorydetile"
						style="color: #000000; font-size: 15px;">4/6인 일자형</a></li>
				</ul>
			</div>

			<div class="dropdown">
				<button type="button" id="dropdownMenu1"
					onclick="location.href = '${contextPath}/product/listProduct.do?sort=화장대/옷장/수납&subsort=x&filter=x'"
					data-toggle="dropdown" aria-expanded="true" class="category"
					style="margin-left: -760px; cursor: pointer; font-size: 16px; margin-top: 40px; background-color:transparent;">
					화장대/옷장/수납</button>
				<ul class="dropdown-menu" role="menu"
					aria-labelledby="dropdownMenu1"
					style="margin-left: -770px; text-align: center;">
					<li role="presentation" style="margin-top: 11px;"><a
						role="menuitem" tabindex="-1" href="" id="categorydetile"
						style="color: #000000; font-size: 15px;">거실장</a></li>
					<li role="presentation" style="margin-top: 11px;"><a
						role="menuitem" tabindex="-1" href="" id="categorydetile"
						style="color: #000000; font-size: 15px;">장식장</a></li>
					<li role="presentation" style="margin-top: 11px;"><a
						role="menuitem" tabindex="-1" href="" id="categorydetile"
						style="color: #000000; font-size: 15px;">화장대/콘솔</a></li>
					<li role="presentation" style="margin-top: 11px;"><a
						role="menuitem" tabindex="-1" href="" id="categorydetile"
						style="color: #000000; font-size: 15px;">옷장</a></li>
					<li role="presentation" style="margin-top: 11px;"><a
						role="menuitem" tabindex="-1" href="" id="categorydetile"
						style="color: #000000; font-size: 15px;">서랍장</a></li>
				</ul>
			</div>
			<div class="dropdown">
				<button type="button" id="dropdownMenu1"
					onclick="location.href = '${contextPath}/product/listProduct.do?sort=식탁/의자&subsort=x&filter=x'"
					data-toggle="dropdown" aria-expanded="true" class="category"
					style="margin-left: -570px; cursor: pointer; font-size: 16px; margin-top: 40px; background-color:transparent;">
					식탁/의자</button>
				<ul class="dropdown-menu" role="menu"
					aria-labelledby="dropdownMenu1"
					style="margin-left: -610px; text-align: center;">
					<li role="presentation" style="margin-top: 11px;"><a
						role="menuitem" tabindex="-1" href="" id="categorydetile"
						style="color: #000000; font-size: 15px;">2인 이상</a></li>
					<li role="presentation" style="margin-top: 11px;"><a
						role="menuitem" tabindex="-1" href="" id="categorydetile"
						style="color: #000000; font-size: 15px;">4인 이상</a></li>
					<li role="presentation" style="margin-top: 11px;"><a
						role="menuitem" tabindex="-1" href="" id="categorydetile"
						style="color: #000000; font-size: 15px;">8인 이상</a></li>
					<li role="presentation" style="margin-top: 11px;"><a
						role="menuitem" tabindex="-1" href="" id="categorydetile"
						style="color: #000000; font-size: 15px;">식탁 의자</a></li>
					<li role="presentation" style="margin-top: 11px;"><a
						role="menuitem" tabindex="-1" href="" id="categorydetile"
						style="color: #000000; font-size: 15px;">테이블의자</a></li>
				</ul>
			</div>

			<div class="dropdown">
				<button type="button" id="dropdownMenu1"
					onclick="location.href = '${contextPath}/product/listProduct.do?sort=테이블/책상/책장&subsort=x&filter=x'"
					data-toggle="dropdown" aria-expanded="true" class="category"
					style="margin-left: -435px; cursor: pointer; font-size: 16px; margin-top: 40px; background-color:transparent;">
					테이블/책상/책장</button>
				<ul class="dropdown-menu" role="menu"
					aria-labelledby="dropdownMenu1"
					style="margin-left: -445px; text-align: center;">
					<li role="presentation" style="margin-top: 11px;"><a
						role="menuitem" tabindex="-1" href="" id="categorydetile"
						style="color: #000000; font-size: 15px;">소파 테이블</a></li>
					<li role="presentation" style="margin-top: 11px;"><a
						role="menuitem" tabindex="-1" href="" id="categorydetile"
						style="color: #000000; font-size: 15px;">좌식 테이블</a></li>
					<li role="presentation" style="margin-top: 11px;"><a
						role="menuitem" tabindex="-1" href="" id="categorydetile"
						style="color: #000000; font-size: 15px;">원목 테이블</a></li>
					<li role="presentation" style="margin-top: 11px;"><a
						role="menuitem" tabindex="-1" href="" id="categorydetile"
						style="color: #000000; font-size: 15px;">다용도 테이블</a></li>
					<li role="presentation" style="margin-top: 11px;"><a
						role="menuitem" tabindex="-1" href="" id="categorydetile"
						style="color: #000000; font-size: 15px;">책상/책장</a></li>
				</ul>

			</div>


			<form name="frmSearch" action="${contextPath}/searchProduct.do">
				<input type="text" onKeyUp="keywordSearch()" name="searchWord"
					class="main_input"
					style="margin-top: 55px; position: relative; margin-left: -230px; border-radius: 5px; background-color: #EEEEEE; border: none; width: 170px; margin-bottom: 15px;">
				<button type="submit" name="search" class="btn1"
					style="background-image:url(${contextPath}/resources/images/header-01.png); left:1490px; cusor:pointer; position:absolute ;  background-size:20px; width:35px; height:40px; border:1px solid #828282; background-color: transparent !important; background-repeat:no-repeat; border:none; margin-top:50px; margin-left:1px; background-position:center;color:white; cursor:pointer;"></button>


			</form>




			<div class="dropdown" style="width: 0px;">
				<button id="dropdownMenu1" data-toggle="dropdown"
					aria-expanded="true" class="category"
					style="right:55px; position: relative;  cursor: pointer; font-size: 17px; margin-top:47px;
					background-image:url(${contextPath}/resources/images/header-02.png); cusor:pointer;  border:none; background-size:38px 40px; width:45px; height:38px; background-repeat:no-repeat; margin-left:20px; border-radius:2px; background-position:center; background-color: transparent !important; cursor:pointer;"></button>


				<!-- 사이트맵 -->
				<ul class="dropdown-menu submenu" role="menu"
					aria-labelledby="dropdownMenu1"
					style="margin-left: -1200px; padding-left: 1300px; margin-bottom: 600px;">

					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -1200px; font-weight: bold; border-bottom: 1px solid #7e9c8c; width: 180px; margin-top: 20px; color: #7e9c8c;">침대</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -980px; font-weight: bold; border-bottom: 1px solid #7e9c8c; width: 180px; margin-top: 20px; color: #7e9c8c;">소파</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -755px; font-weight: bold; border-bottom: 1px solid #7e9c8c; width: 180px; margin-top: 20px; color: #7e9c8c;">화장대/옷장/수납</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -530px; font-weight: bold; border-bottom: 1px solid #7e9c8c; width: 180px; margin-top: 20px; color: #7e9c8c;">식탁/의자</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -300px; font-weight: bold; border-bottom: 1px solid #7e9c8c; width: 180px; margin-top: 20px; color: #7e9c8c;">테이블/책상/책장</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="" id="categorydetile"
						style="float: left; margin-left: -1200px; width: 180px; text-align: center; padding-top: 60px; color: #000000;">싱글</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -980px; width: 180px; text-align: center; padding-top: 60px; color: #000000;">코너형</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -755px; width: 180px; text-align: center; padding-top: 60px; color: #000000;">거실장</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -530px; width: 180px; text-align: center; padding-top: 60px; color: #000000;">2인이상</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -300px; width: 180px; text-align: center; padding-top: 60px; color: #000000;">소파
							테이블</a></li>

					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="" id="categorydetile"
						style="float: left; margin-left: -1200px; width: 180px; text-align: center; color: #000000; padding-top: 95px;">킹</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -980px; width: 180px; text-align: center; color: #000000; padding-top: 95px;">1인/웜체어</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -755px; width: 180px; text-align: center; color: #000000; padding-top: 95px;">장식장</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -530px; width: 180px; text-align: center; color: #000000; padding-top: 95px;">4인
							이상</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -300px; width: 180px; text-align: center; color: #000000; padding-top: 95px;">좌식
							테이블</a></li>

					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="" id="categorydetile"
						style="float: left; margin-left: -1200px; width: 180px; text-align: center; color: #000000; padding-top: 125px;">이층
							침대</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -980px; width: 180px; text-align: center; padding-top: 125px; color: #000000;">패브릭</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -755px; width: 180px; text-align: center; color: #000000; padding-top: 125px;">화장대/콘솔</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -530px; width: 180px; text-align: center; color: #000000; padding-top: 125px;">원목테이블</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -300px; width: 180px; text-align: center; color: #000000; padding-top: 125px;">책상/책장</a></li>

					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="" id="categorydetile"
						style="float: left; margin-left: -1200px; width: 180px; text-align: center; color: #000000; padding-top: 155px;">패밀리</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -980px; width: 180px; text-align: center; color: #000000; padding-top: 155px;">리클라이너</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -755px; width: 180px; text-align: center; color: #000000; padding-top: 155px;">옷장</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -530px; width: 180px; text-align: center; color: #000000; padding-top: 155px;">식탁
							의자</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -300px; width: 180px; text-align: center; color: #000000; padding-top: 155px;">다용도
							테이블</a></li>

					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="" id="categorydetile"
						style="float: left; margin-left: -1200px; width: 180px; text-align: center; color: #000000; padding-top: 185px; color: #000000;">퀸</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -980px; width: 180px; text-align: center; padding-top: 185px; color: #000000;">4/6인
							일자형</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -755px; width: 180px; text-align: center; padding-top: 185px; color: #000000;">서랍장</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -530px; width: 180px; text-align: center; padding-top: 185px; color: #000000;">테이블의자</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -300px; width: 180px; text-align: center; padding-top: 185px; color: #000000;">책상/책장</a></li>

					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -1200px; font-weight: bold; border-bottom: 1px solid #7e9c8c; width: 180px; margin-top: 20px; margin-top: 230px; color: #7e9c8c;">매장
							안내</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -980px; font-weight: bold; border-bottom: 1px solid #7e9c8c; width: 180px; margin-top: 20px; margin-top: 230px; color: #7e9c8c;">마이
							페이지</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -755px; font-weight: bold; border-bottom: 1px solid #7e9c8c; width: 180px; margin-top: 20px; margin-top: 230px; color: #7e9c8c;">고객센터</a></li>


					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="" id="categorydetile"
						style="float: left; margin-left: -1200px; width: 180px; text-align: center; padding-top: 270px; color: #000000;">회사
							소개</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -980px; width: 180px; text-align: center; padding-top: 270px; color: #000000;">주문/배송조회</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -755px; width: 180px; text-align: center; padding-top: 270px; color: #000000;">공지사항</a></li>

					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="" id="categorydetile"
						style="float: left; margin-left: -1200px; width: 180px; text-align: center; color: #000000; padding-top: 300px;">매장안내</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -980px; width: 180px; text-align: center; color: #000000; padding-top: 300px;">취소/반품내역</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -755px; width: 180px; text-align: center; color: #000000; padding-top: 300px;">자주
							묻는 질문</a></li>

					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="" id="categorydetile"
						style="float: left; margin-left: -1200px; width: 180px; text-align: center; color: #000000; padding-top: 330px;">ㅤ</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -980px; width: 180px; text-align: center; color: #000000; padding-top: 330px;">장바구니</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -755px; width: 180px; text-align: center; color: #000000; padding-top: 330px;">1:1
							문의</a></li>

					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="" id="categorydetile"
						style="float: left; margin-left: -1200px; width: 180px; text-align: center; color: #000000; padding-top: 360px;">ㅤ</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -980px; width: 180px; text-align: center; color: #000000; padding-top: 360px;">관심상품</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -755px; width: 180px; text-align: center; color: #000000; padding-top: 360px;">A/S
							접수 센터</a></li>

					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="" id="categorydetile"
						style="float: left; margin-left: -1200px; width: 180px; text-align: center; color: #000000; padding-top: 390px;">ㅤ</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -980px; width: 180px; text-align: center; color: #000000; padding-top: 390px;">적립금</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -755px; width: 180px; text-align: center; color: #000000; padding-top: 390px;">ㅤ</a></li>

					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="" id="categorydetile"
						style="float: left; margin-left: -1200px; width: 180px; text-align: center; color: #000000; padding-top: 420px;">ㅤ</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -980px; width: 180px; text-align: center; color: #000000; padding-top: 420px;">쿠폰</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -755px; width: 180px; text-align: center; color: #000000; padding-top: 420px;">ㅤ</a></li>

					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="" id="categorydetile"
						style="float: left; margin-left: -1200px; width: 180px; text-align: center; color: #000000; padding-top: 450px;">ㅤ</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -980px; width: 180px; text-align: center; color: #000000; padding-top: 450px;">회원
							등급 안내</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -755px; width: 180px; text-align: center; color: #000000; padding-top: 450px;">ㅤ</a></li>

					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="" id="categorydetile"
						style="float: left; margin-left: -1200px; width: 180px; text-align: center; color: #000000; padding-top: 480px;">ㅤ</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -980px; width: 180px; text-align: center; color: #000000; padding-top: 480px;">상품
							리뷰</a></li>
					<li id=sitemap role="presentation"><a role="menuitem"
						tabindex="-1" href="" id="categorydetile"
						style="float: left; margin-left: -755px; width: 180px; text-align: center; color: #000000; padding-top: 480px;">ㅤ</a></li>



				</ul>
			</div>
		</div>
	</div>

</nav>
<hr
	style="margin-top: -100px; color: red; margin-bottom: 100px; width: 49%; margin-left: 655px;" />
<hr class="awake"
	style="margin-bottom: 0px; box-shadow: 0 0 10px 0 rgb(0 0 0/ 10%) !important; -webkit-box-shadow: 0 0 10px 0 rgb(0 0 0/ 10%) !important;" />

<!-------------header 끝------------------------------------------------------------------------------------------------------------------------>