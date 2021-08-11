<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
</head>
<body>
			<table
				style="width: 100%; height: 220px; border: 1px solid #e9e9e9; font-size: 13px; margin-bottom:30px;">
				<tr style="font-weight: bold; font-size: 15px; height:19px; color:black;">
					<td style="padding-left:40px; vertical-align: bottom;">상품</td>
					<td style="padding-left:40px; vertical-align: bottom;">회원</td>
					<td style="padding-left:40px; vertical-align: bottom;">주문</td>
					<td  style="padding-left:40px; vertical-align: bottom;">게시판</td>
					<td  style="padding-left:40px; vertical-align: bottom;">기타</td>
				</tr>
				<tr style="font-weight: bold; font-size: 15px; height:5px;">
					<td style=" padding-left:30px;"><hr style="width:200px;float:left; margin-top:5px; margin-bottom:5px; "></td>
					<td style="padding-left:30px;"><hr style="width:200px;float:left; margin-top:5px; margin-bottom:5px;"></td>
					<td style="padding-left:30px;"><hr style="width:200px;float:left; margin-top:5px; margin-bottom:5px;"></td>
					<td style="padding-left:30px;"><hr style="width:200px;float:left; margin-top:5px; margin-bottom:5px;"></td>
					<td style="padding-left:30px;"><hr style="width:200px;float:left; margin-top:5px; margin-bottom:5px;"></td>
				</tr>
				<tr style="height: 25px; cursor:pointer;">
					<td style="padding-left:30px; "><a onclick="location.href='${contextPath}/product/admin_listProduct.do'">ㆍ상품조회</a></td>
					<td style="padding-left:30px;"><a onclick="location.href='${contextPath}/admin_listmember.do'">ㆍ회원조회</a></td>
					<td style="padding-left:30px;"><a onclick="location.href='${contextPath}/admin_listorder.do'">ㆍ주문조회</a></td>
					<td style="padding-left:30px;"><a onclick="location.href='${contextPath}/board/listNotice.do'">ㆍ공지사항</a></td>
					<td style="padding-left:30px;"><a onclick="location.href='${contextPath}/board/listNotice.do'">ㆍ매장안내</a></td>
				</tr>
				<tr style="height: 25px;  cursor:pointer;">
					<td style="padding-left:30px;"><a onclick="location.href='${contextPath}/product/add_product.do'">ㆍ상품등록</a></td>
					<td style="padding-left:30px;"></td>
					<td style="padding-left:30px;"></td>
					<td style="padding-left:30px;"><a onclick="location.href='${contextPath}/board/listQuestion.do'">ㆍ자주묻는질문</a></td>
					<td style="padding-left:30px;"></td>
				</tr>
				<tr style="height: 25px;  cursor:pointer;">
					<td style="padding-left:30px;"></td>
					<td style="padding-left:30px;"></td>
					<td style="padding-left:30px;"></td>
					<td style="padding-left:30px;"><a onclick="location.href='${contextPath}/admin/listAllInquiry.do'">ㆍ1:1문의</a></td>
					<td style="padding-left:30px;"></td>
				</tr>
				<tr style="height: 25px;  cursor:pointer;">
					<td style="padding-left:30px;"></td>
					<td style="padding-left:30px;"></td>
					<td style="padding-left:30px;"></td>
					<td style="padding-left:30px;"><a onclick="location.href='${contextPath}/board/listAsCenter.do'">ㆍA/S센터</a></td>
					<td style="padding-left:30px;"></td>
				</tr>
			</table>
</body>
</html>