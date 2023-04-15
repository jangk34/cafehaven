<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.OrderItemDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<OrderItemDTO> otList = (List<OrderItemDTO>)request.getAttribute("otList");
	String ordNo = CmmUtil.nvl((String)request.getAttribute("ordNo"));
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<%@ include file="/WEB-INF/view/cssjs.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script>
$(function(){
	$("#bcTarget").barcode('<%=ordNo%>', "code128", {barWidth:2, barHeight:60});
})
</script>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/view/mainCafeTop.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container-fluid">
		<div class="row bottom-padding-20">
			<div align=center>
				<div id="bcTarget"></div>
				<div class="col-xs-12">
					<br> 
						<%
							if(otList.size()>=2){%>
						<span class="loginSpan1"><%=CmmUtil.nvl(otList.get(0).getMenuName())%> 외 <%=otList.size()-1%>건</span>
							<%
							}else{
							%>	
						<span class="loginSpan1"><%=CmmUtil.nvl(otList.get(0).getMenuName())%></span>
							<%
							}
							%>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="panel panel-default text-center">
				<div class="panel-body orderSuccessSpan">
					주문이 완료 되었습니다. <br>MENU - 주문내역에서 확인 하실 수 있습니다.
				</div>
			</div>
		</div>
		<div class="col-xs-12">
			<a href="userMenuList.do"><button class="goMainP">메인화면으로 가기</button></a>
		</div>
		<div class="col-xs-12">
			<a href="userOrderList.do?uNum=<%=userNo%>"><button class="detailSubmit">주문내역으로 가기</button></a>
		</div>
	</div>
	<br>
		<div align="center">
	</div>
</body>
</html>