<%@page import="poly.dto.NoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--컨트롤러에서 모델에 저장된 데이터를 받기위해 선언 애트리뷰트안에 있는것이 키값  -->
<% List<NoticeDTO> nList= (List<NoticeDTO>)request.getAttribute("nList"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/view/cssjs.jsp" %>
<%@ include file="userListScript.jsp" %>
<script>
	$(function(){
	 	var select = $('select[name=notice]');
<<<<<<< HEAD
		select.click(function(){
			$.ajax({
				url : '/user/userWriteList.do',
				method : 'get',
				data : {'userNo':userNo},
				success : function(data){
					$('#list').html('');
					var contents='';
					if(select.val()=="Notice"){
						contents += '<table border="1">';
						contents += '<tr>';
						contents += '<td>제목</td>';
						contents += '<td>작성자</td>';
						contents += '<td>작성일</td>';
						contents += '<td>조회수</td>';
						contents += '</tr>';
						.each(data, function(key, value){
							contents += '<tr>';
							contents += '<td> + value.nt_title + </td>';
							contents += '<td> + value.rvwriter + </td>';
							contents += '<td> + value.regdate + </td>';
							contents += '<td> + value.nt_count + </td>';
							contents += '</tr>';
						});
					contents += '</table>';
					console.log(contents);
					$('#list').html(contents);
					};
				},
				error:function(error){
					alert("error");
=======
		select.click(function(){				
			$.ajax({
				url : '/user/userWriteList.do',
				method : 'get',
				data : {'userNo':userNo},
				success : function(data){
					$('#list').html('');
					var contents='';
					if(select.val()=="Notice"){
						contents += '<table border="1">';
						contents += '<tr>';
						contents += '<td>제목</td>';
						contents += '<td>작성자</td>';
						contents += '<td>작성일</td>';
						contents += '<td>조회수</td>';
						contents += '</tr>';
						.each(data, function(key, value){
							contents += '<tr>';
							contents += '<td> + value.nt_title + </td>';
							contents += '<td> + value.rvwriter + </td>';
							contents += '<td> + value.regdate + </td>';
							contents += '<td> + value.nt_count + </td>';
							contents += '</tr>';
						});
					contents += '</table>';
					console.log(contents);
					$('#list').html(contents);
					};
				},
				error:function(error){
					alert(error);
>>>>>>> refs/heads/master
				}
			});
		});
	});
/* 					console.log(data);
						if(select.val()=="Notice"){
							$('#list').html('');
							var contents = '';
							contents+='<table border="1px">';
							contents+='<tr>';
							contents+='<td>제목</td>';
							contents+='<td>작성자</td>';
							contents+='<td>작성일</td>';
							contents+='<td>조회수</td>';
							contents+='</tr>';
							$.each(data, function(key, value){
							contents += '<tr>';
							contents += '<td>' + value.nt_title + '</td>';
							contents += '<td>' + value.rvwriter + '</td>';
							contents += '<td>' + value.regdate + '</td>';
							contents += '<td>' + value.nt_count + '</td>';
							contents += '</tr>';
							});
							contents += '</table>';
							console.log(contents);
							$('#list').html(contents);
						}else if(select.val()=="Review"){
							var contents = '<table border="1px">';
							contents += '<tr>';
							contents += '<td>상품명</td>';
							contents += '<td>별점</td>';
							contents += '<td>리뷰</td>';
							contents += '<td>작성자</td>';
							contents += '</tr>';
							$.each(data, function(key, value){
							var contents = '<table border="1px">';
							contents += '<tr>';
							contents += '<td>' + value.menu_name + '</td>';
							contents += '<td>' + value.cafe_star + '</td>';
							contents += '<td>' + value.cafe_review + '</td>';
							contents += '<td>' + value.rvwriter + '</td>';
							contents += '</tr>';
							});
							contents += '</table>';
							console.log(contents);
							$('#list').html(contents);
						}else{
							var contents = '<table border="1px">';
							contents += '<tr>';
							contents += '<td>상품명</td>';
							contents += '<td>별점</td>';
							contents += '<td>리뷰</td>';
							contents += '<td>작성자</td>';
							contents += '</tr>';
							$.each(data, function(key, value){
							var contents = '<table border="1px">';
							contents += '<tr>';
							contents += '<td>' + value.menu_name + '</td>';
							contents += '<td>' + value.cafe_star + '</td>';
							contents += '<td>' + value.cafe_review + '</td>';
							contents += '<td>' + value.rvwriter + '</td>';
							contents += '</tr>';
						};
						contents += '</table>';
						console.log(contents);
						$('#list').html(contents);
					}, */
</script>

</head>
<body>
<%@ include file="/WEB-INF/view/mainCafeTop.jsp" %>
<div class="container">

		<div class="us-list-top hd-font" id="list">
			<!--  리스트를 꺼내기위한 -->
			
			<table border="1px">
				<tr>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
					<td>조회수</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>

		<div id="myTable">
		<select name="notice">
		<option value="Notice" id="Notice">공지사항</option>
		<option value="QnA" id="QnA">Q&A</option>
		<option value="Review" id="Review">리뷰</option>
		</select>
	<%-- <!-- 반복되게 생성되는곳에서 for문 -->
			<% for (int i=0; i<nList.size(); i++) {%>
				<%if (nList.get(i).getNtSort().equals("nt")){ %>
				<div class="hd-list">
		<!-- <div><p><a href="#"></a></p></div> -->
			
					<div style="height: 50px"><p><a href="/notice/noticeDetail.do?regNo=<%=nList.get(i).getRegNo()%>&ntNo=<%=nList.get(i).getNtNo() %>"><%=nList.get(i).getNtTitle() %></a></p></div>
					<div style="height: 50px"> <%=nList.get(i).getNtWriter() %></div>
					
					<!--  조회수 -->
					<div style="height: 50px"><p><%=nList.get(i).getNtCount() %></p></div><!--  이건 나중에 카운트 해서넣기 -->
				</div>
					<%} %>
				<%} %> --%>
						
		</div>
	</div>
	
	<%@ include file="/WEB-INF/view/mainCafeBottom.jsp" %>
			
</body>
</html>