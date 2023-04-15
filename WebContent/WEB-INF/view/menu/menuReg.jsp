<%@page import="poly.util.DateUtil"%>
<%@page import="poly.dto.CafeAttachDTO"%>
<%@page import="poly.dto.MenuDTO"%>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<MenuDTO> mList = (List<MenuDTO>)request.getAttribute("mList"); %>
<% List<CafeAttachDTO> caList =(List<CafeAttachDTO>)request.getAttribute("caList"); %>    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/view/cssjs.jsp" %>
<!--메뉴  테이블 리스트  -->
   <script>
   $(document).ready( function () {
	    $('#myTable').DataTable();
	} );
   
   <!--삭제-->
   
	function deleteMenu(menuNo){
		
		alert("메뉴를 삭제했습니다.");
		alert(menuNo)
		location.href="/menu/menuDeleteProc.do?menuNo="+menuNo;
		}
   
   
   </script>
 <!--  메뉴 테이블 리스트 -->
 <!--  css 글자중앙 -->
 <style>
 .talign {
 text-align: center;
 }
 </style>
 

</head>
<body>
<%@ include file="/WEB-INF/view/mainCafeTop.jsp" %>
<!-- --------------------메뉴 ------------------------------------------------------------------------- -->

<!-- 조건선택란 -->
	<div class="container">
		<div class="page-header">
			<h1>
				메뉴 <small>CAFE HEAVEN</small>
			</h1>
		</div>
		<!--  메뉴리스트 본문 -->
		<table id="myTable">
			<thead>
				<tr>
					<th>번호</th>
					<th>메뉴이름</th>
					<th>가격</th>
				<!-- 	<th>메뉴종류</th> -->
					<th>등록일</th>
					<th>삭제</th>
				</tr>
			</thead>
			<!--  for문으로 메뉴 리스트 -->
			<tbody>
			<% for (int i = 0 ; i < mList.size(); i++) {%>
				<tr>
					<td class="talign">
					<%=i+1%>
					</td>
					<td class="talign">
					<!-- data-toggle="modal" -->
						<a href="#" data-toggle="modal" data-target="#menu-upd" onclick="menuUpdateList('<%=mList.get(i).getMenuNo()%>')"><%=mList.get(i).getMenuName()%></a>
						
					</td>
					<td class="talign">
					<%=mList.get(i).getMenuPrice()%>
					</td>
				<%-- 	<td class="talign">
					<%=mList.get(i).getMenuCgNo() %>
					</td> --%>
					<!--  수정일 포함 해서 if 문 나중에 게시판에서 가져오면됨 -->
					<td class="talign">
					<%=DateUtil.DateFormat(mList.get(i).getRegDate()) %>
					</td>
					<td class="talign">
						<a href="#" class="btn btn-danger" onclick="deleteMenu('<%=mList.get(i).getMenuNo()%>')">삭제</a>
					</td>
				</tr>
			<%} %>
		
			</tbody>
		</table>
		<%-- 	<% for(int i = 0 ; i < mList.size(); i++){ %>
			<input type="hidden" id="menuNo" value="<%=mList.get(i).getMenuNo()%>"/>
			<%} %> --%>
		<div class="row">
		<a href="" data-target="#menu-rg"  data-toggle="modal"><input type="button" class="btn btn-primary"  value="메뉴등록"></a>
		</div>
	</div>
	
<!-- 메뉴등록모달 -->
<%@ include file="menuRegProc.jsp" %>
<!--  메뉴 업데이트 모달 -->
<%@ include file="menuUpdate.jsp" %>
</body></html>