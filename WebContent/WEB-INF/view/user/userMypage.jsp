<%@ page import="poly.dto.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserDTO uDTO = (UserDTO)request.getAttribute("uDTO");

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/view/cssjs.jsp"%>
<%@ include file="userListScript.jsp" %>
<title>Insert title here</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
	<%@ include file="/WEB-INF/view/mainCafeTop.jsp"%>
	<div class="container">
		<!-- 상단 -->
		<div class="page-header">
			<h1>
				마이페이지&nbsp;&nbsp;&nbsp;<small>CafeHeaven</small>
			</h1>
		</div>
		
		<div class="info">
			<h1>&nbsp;&nbsp;&nbsp;&nbsp;<%=name %>님 </h1>
		</div>
		
		<div align="center">
		
		<div class="menu" style="float:left">
		<li>
		<a href="/user/userUpdateView.do?userNo=<%=userNo %>">
		<img src="/image/userInfo.jpg" alt="회원정보변경" >
		<h1 class="w3-opacity">MY INFO</h1>
		<b>회원정보변경</b>
		</a>
		</li>
		</div>
		
		<div class="menu" style="float:left">
		<li>
		<a href="/user/userOrderList.do?userNo=<%=userNo%>">
		<img src="/image/order.png" alt="주문내역">
		<h1 class="w3-opacity">ORDER</h1>
		<b>주문내역</b>
		</a>
		</li>
		</div>
		
		<div class="menu" style="float:left">
		<li>
		<a href="/user/userStamp.do?userNo=<%=userNo %>">
		<img src="/image/stamp.png" alt="스탬프내역">
		<h1 class="w3-opacity">STAMP</h1>
		<b>스탬프내역</b>
		</a>
		</li>
		</div>
		
		<div class="menu" style="float:left">
		<li>
		<a href="/user/userWriteList.do?userNo=<%=userNo %>">
		<img src="/image/write.png" alt="내가 쓴 글보기">
		<h1 class="w3-opacity">MY BOARD</h1>
		<b>내가 쓴 글보기</b>
		</a>
		</li>
		</div>
		
		</div>
	</div>

	<%@ include file="/WEB-INF/view/mainCafeBottom.jsp" %>
</body>
</html>