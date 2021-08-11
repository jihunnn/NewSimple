<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script>
function InquiryList() {
    if (${isLogOn != true && member == null}) {
    	if(${AdminisLogOn == true && admin != null}) {
        	
        	location.href='${contextPath}/admin/listAllInquiry.do';
        } else{
        alert("로그인이 필요합니다.");
        location.href = '${contextPath}/login_01.do';}
    }   else {
    	location.href='${contextPath}/board/listInquiry.do';
    }
}
</script>

<!-------------footer------------------------------------------------------------------------------------------------------------------------>
<footer class="ftco-footer ftco-bg-dark ftco-section"
	style="padding-top: 20px; padding-bottom: 1px; background-color:#222222;">
	<div class="container">
		<div class="row mb-1">
			<div class="col-md">
				<div class="ftco-footer-widget mb-4" style="text-align: left">

					<h2 class="ftco-heading-2"
						style="font-size: 14px; margin-bottom: 0px; width: 90px; font-weight: bold; float: left; padding-top: 1px;">A/S
						접수 센터</h2>
					<button class="butten" onClick="location.href ='${contextPath}/board/listAsCenter.do'" type="button"
						class="btn"
						style="margin-bottom: 0px; cursor: pointer; padding-top: 3px; border-radius: 1px; font-size: 10px; background-color: #7e9c8c; width: 54px; height: 24px;">바로가기</button>

					<div
						style="border-bottom: 4px solid #7e9c8c; width: 40px; margin-top: 10px;"></div>
					<div class="block-23 mb-3">
					
						<p class="atag" style="font-size: 12px; margin-top: 25px; color:#7e9c8c; font-weight:bold;">042-527-3057</p>
						<p class="atag" style="font-size: 12px; margin-top: 25px; color:white;">tkawhchlrh@naver.com</p>
						<p style="font-size: 12px; margin-bottom: 0px; color:white;">MON-FRI
							9:00~18:00</p>

					</div>
				</div>
			</div>
			<hr
				style="width: 0.01px; height: 100px; border-right: 1px solid rgba(0, 0, 0, 0.1); background-color: #3c3c3c; margin-top: 5px; margin-bottom: 0px;">
			<div class="col-md">
				<div class="ftco-footer-widget mb-4" style="text-align: left">
					<h2 class="ftco-heading-2"
						style="font-size: 14px; margin-bottom: 0px; width: 83px; font-weight: bold; float: left; padding-top: 2px;">1:1
						문의하기</h2>
					<button class="butten"  onclick="InquiryList()" type="button"
						class="btn"
						style="margin-bottom: 0px; cursor: pointer; padding-top: 2px; border-radius: 1px; font-size: 10px; background-color: #7e9c8c; width: 54px; height: 24px;">바로가기</button>
					<div class="block-23 mb-3">
						<div
							style="border-bottom: 4px solid #7e9c8c; width: 40px; margin-top: 10px;"></div>
						<p class="atag" style="font-size: 12px; margin-top: 25px; color:white;">빠르고
							정확하게</p>
						<p style="font-size: 12px; margin-bottom: 0px; color:white;">답변해드리겠습니다.</p>
					</div>
				</div>
			</div>
			<hr
				style="width: 0.01px; height: 100px; border-right: 1px solid rgba(0, 0, 0, 0.1); background-color: #3c3c3c; margin-top: 5px; margin-bottom: 0px;">
			<div class="col-md">
				<div class="ftco-footer-widget mb-4" style="text-align: left">
					<h2 class="ftco-heading-2"
						style="font-size: 14px; margin-bottom: 0px; width: 65px; font-weight: bold; float: left; padding-top: 2px;">공지사항</h2>
						<button class="butten" onClick="location.href ='${contextPath}/board/listNotice.do'" type="button"
						class="btn"
						style="margin-bottom: 0px; cursor: pointer; padding-top: 2px; border-radius: 1px; font-size: 10px; background-color: #7e9c8c; width: 54px; height: 24px;">바로가기</button>
					
					<div class="block-23 mb-3">
						<div
							style="border-bottom: 4px solid #7e9c8c; width: 40px; margin-top: 10px;"></div>
						
						<p style="font-size: 12px; margin-bottom: 0px;">ㅤ</p>

					</div>
				</div>
			</div>
		</div>
		<hr
			style="margin-top: 1px; background-color: #3c3c3c; height: 0.005px;">
		<div class="row">
          <div class="col-md-12 text-left" style="font-size: 10px;">
          	<img class="img" src="${contextPath}/resources/images/escro.jpg" style="float:right; padding-bottom:10px; width: 70px; height: 70px;">
          	<img class="img" src="${contextPath}/resources/images/kb.jpg" style="float:right; padding-right: 10px; padding-bottom:10px; width: 70px; height: 70px;">
              <p style="margin-top:1px; margin-bottom:10px;">상호:(주)Simple  /  대표: 강은희</p>
              <p style= "white-space:pre; float:left;">대전 본사: 대전 서구 탄방동 12-34 / tel: 042-527-3038 / fax: 042-527-3099<br>천안 직영: 천안 동구 충남 천안시 서북구 쌍용동 1736 / tel: 041-527-7007 / fax: 041-571-7008<br>사업자등록번호: 123-45-67890 / 통신판매업신고번호: 제2014-서울중랑-0007호 /개인정보관리자 :김삼순<br>Copyrightⓒ 2021 Simple.ALL RIGHTS RESERVED.</p>
            </div>
          </div>
         </div>


</footer>
<!-------------footer 끝------------------------------------------------------------------------------------------------------------------------>
