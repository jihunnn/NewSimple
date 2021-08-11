<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 탭메뉴 자바스크립트 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		//When page loads...
		$(".tab_content").hide(); //Hide all content
		$("ul.tabs li:first").addClass("active").show(); //Activate first tab
		$(".tab_content:first").show(); //Show first tab content

		//On Click Event
		$("ul.tabs li").click(function() {

			$("ul.tabs li").removeClass("active"); //Remove any "active" class
			$(this).addClass("active"); //Add "active" class to selected tab
			$(".tab_content").hide(); //Hide all tab content

			var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
			$(activeTab).fadeIn(); //Fade in the active ID content
			return false;
		});

	});
</script>

</head>
<body>



	<section class="ftco-section"
		style="padding-top: 20px; margin-bottom: 50px; padding-bottom: 0px; margin-bottom: 400px;">
		<div class="container">
	<img src="${contextPath}/resources/images/store.jpg" width=100%
		height=350px>


			<!-- 탭메뉴 영역 -->

			<ul class="nav  tabs " style="margin-top: 100px; margin-left: 0px;">
				<li role="presentation" class="active"
					style="width: 500px; margin-lift: 300px;"><a href="#tab1"
					style="text-align: center; font-size: 20px; color: black; padding-left: 300px;">회사소개</a></li>
				<li role="presentation" style="width: 500px;"><a href="#tab2"
					style="text-align: center; font-size: 20px; color: black; padding-left: 300px;">매장안내</a></li>
			</ul>
			<hr>
			<div id="wrapper">
				<div class="tab_container">

					<div id="tab1" class="tab_content"
						style="margin-left: 150px; margin-right: 170px;">
						<!--Content-->
						<img src="${contextPath}/resources/images/storeInfomation-01.jpg"
							style="width: 1000px;">

					</div>
					<div id="tab2" class="tab_content"
						style="margin-left: 170px; margin-right: 170px;">
						<!--Content-->
						<table style="margin-top: 50px; width: 1000px; font-size: 13px;">
							<thead class="table-dark" align=center>
								<tr align="center" style="height: 41px; color:black; background-color: #eeeeee; border-top:1px solid #7e9c8c; border-bottom: 1px solid #c6c8ca;">
									<td scope="col" width="100">대전 본사</td>
									<td scope="col" width="100">천안 칙영</td>

								</tr>
								<tr
									style="border-bottom: 1px solid #c6c8ca; background-color: white; color: black;">
									<td scope="col" width="500" height="150"
										style="border-top: none !important;">주소: 대전 서구 탄방동 83-13<br>전화번호:
										042-527-3038<br> 영업시간: AM9:00 ~ PM07:00<br>매주 <span
										style="color: red;">일요일 휴무</span>,공휴일 정상 영업
									</td>
									<td scope="col" width="50" height="150">주소: 충남 천안시 서북구 쌍용동
										1736<br>전화번호: 041-571-7007<br> 영업시간: AM9:00 ~
										PM07:00<br>매주 <span style="color: red;">일요일 휴무</span>,공휴일
										정상 영업
									</td>
								</tr>
								<tr
									style="border-bottom: 1px solid #c6c8ca; background-color: white; color: black;">

									<td scope="col" width="100" height="400" Style="float: left;">
										<br>
										<br>
										


										<div id="map" style="width: 400px; height: 300px; "></div> 
										<script
											type="text/javascript"
											src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c83ccc3f8927a61c4d4a118cbe7ec75f&libraries=services"></script>

										<script>
											var container = document
													.getElementById('map');
											var options = {
												center : new kakao.maps.LatLng(
														33.450701, 126.570667),
												level : 3
											};

											var map = new kakao.maps.Map(
													container, options);

											// 주소-좌표 변환 객체를 생성합니다
											var geocoder = new kakao.maps.services.Geocoder();

											// 주소로 좌표를 검색합니다
											geocoder
													.addressSearch(
															'대전 탄방동 83-13',
															function(result,
																	status) {

																// 정상적으로 검색이 완료됐으면 
																if (status === kakao.maps.services.Status.OK) {

																	var coords = new kakao.maps.LatLng(
																			result[0].y,
																			result[0].x);

																	// 결과값으로 받은 위치를 마커로 표시합니다
																	var marker = new kakao.maps.Marker(
																			{
																				map : map,
																				position : coords
																			});

																	// 인포윈도우로 장소에 대한 설명을 표시합니다
																	var infowindow = new kakao.maps.InfoWindow(
																			{
																				content : '<div style="width:150px; text-align:center;  background-color:#7e9c8c; padding:6px 0; border:none;"><a href="http://kko.to/TW3gabH4B" style=" color:white;">SIMPLE 대전본사</a></div>'
																			});
																	infowindow
																			.open(
																					map,
																					marker);

																	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
																	map
																			.setCenter(coords);
																}
															});
										</script>
									</td>
									<td scope="col" width="50">
									
									<div id="map1" style="width: 400px; height: 300px; float:right;">
										<script
											type="text/javascript"
											src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c83ccc3f8927a61c4d4a118cbe7ec75f&libraries=services"></script>

										<script>
											var container = document
													.getElementById('map1');
											var options = {
												center : new kakao.maps.LatLng(
														33.450701, 126.570667),
												level : 3
											};

											var map1 = new kakao.maps.Map(
													container, options);

											// 주소-좌표 변환 객체를 생성합니다
											var geocoder = new kakao.maps.services.Geocoder();

											// 주소로 좌표를 검색합니다
											geocoder
													.addressSearch(
															'충남 천안시 서북구 쌍용동 1736',
															function(result,
																	status) {

																// 정상적으로 검색이 완료됐으면 
																if (status === kakao.maps.services.Status.OK) {

																	var coords = new kakao.maps.LatLng(
																			result[0].y,
																			result[0].x);

																	// 결과값으로 받은 위치를 마커로 표시합니다
																	var marker = new kakao.maps.Marker(
																			{
																				map : map1,
																				position : coords
																			});

																	// 인포윈도우로 장소에 대한 설명을 표시합니다
																	var infowindow = new kakao.maps.InfoWindow(
																			{
																				content : '<div style="width:150px; border:none; text-align:center;  background-color:#7e9c8c; padding:6px 0;"><a href="http://kko.to/AcBPrbT4M" style=" color:white;">SIMPLE 천안직영</a></div>'
																			});
																	infowindow
																			.open(
																					map1,
																					marker);

																	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
																	map1
																			.setCenter(coords);
																}
															});
										</script></div>
									</td>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
