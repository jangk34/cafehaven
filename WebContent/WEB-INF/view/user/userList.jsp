<%@page import="poly.dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--컨트롤러에서 모델에 저장된 데이터를 받기위해 선언 애트리뷰트안에 있는것이 키값  -->
<% List<UserDTO> uList= (List<UserDTO>)request.getAttribute("uList"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/view/cssjs.jsp" %>
<%@ include file="userListScript.jsp" %>

</head>
<body>
<%@ include file="/WEB-INF/view/mainCafeTop.jsp" %>
<div class="container">
	<div class="page-header">
			<h1>
				회원 목록 <small>CAFE HEAVEN</small>
			</h1>
		</div>
		<div class="us-list-top hd-font">
			<!--  리스트를 꺼내기위한 -->
			<div>회원번호</div>
			<div>이름</div>
			<div>이메일</div>
			<div>전화번호</div>
			<div>공란</div>
		</div>
		<div id="myTable">
	<!-- 반복되게 생성되는곳에서 for문 -->
			<%for (int i=0; i<uList.size();i++) {%>
			<div class="us-list hd-font">
			
				
				<div><%=uList.get(i).getUserNo()%></div>
				<div>
					<%=uList.get(i).getName() %>
				</div>
				<div class="ellipsis">
					<a href="/user/userDetail.do?userNo=<%=uList.get(i).getUserNo()%>"><%=uList.get(i).getEmail() %></a>
				</div>
				<div><%=uList.get(i).getUserTel() %></div>
			</div>
			<%} %>
			<div>
				<p>회원정보를 아래 검색창에 입력해주세요.</p>
			</div>
			
			<input class="form-control" id="myInput" type="text"
				placeholder="Search.."> <a href="#" id="load-list"
				style="width: 100%" class="btn btn-primary">더보기</a> <br /> <br />
			

		</div>
	</div>
			
</body>
</html>