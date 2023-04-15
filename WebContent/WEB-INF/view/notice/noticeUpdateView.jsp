<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="poly.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//모델에서 받는것은 getAttribute();
	NoticeDTO nDTO = (NoticeDTO) request.getAttribute("nDTO");
	
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/view/cssjs.jsp"%>

</head>
<body>

	<!-- top -->
	<%@ include file="/WEB-INF/view/mainCafeTop.jsp"%>

	<!--  입력창 -->
	<div class="container">

<form action="/notice/noticeUpdateProc.do" method="post">
		
	
	<!--  제목   -->
			<div class="form-group">
				<label class="col-sm-3 control-label">제목</label>
				<div class="col-sm-9">
					<input class="form-control" name="ntTitle" type="text"
						value="<%=nDTO.getNtTitle()%>"  />
				</div>
			</div>
		
		<!-- 작성자 -->
			<div class="form-group">
				<label class="col-sm-3 control-label">작성자</label>
				<div class="col-sm-9">
					<input class="form-control" name="ntWriter" type="text" readonly
					value="<%=nDTO.getNtWriter()%>"  />
				</div>
			</div>
		<!-- 작성일 -->

		<% if(nDTO.getUpdNo()==null){ %>
		
			<div class="form-group">
				<label class="col-sm-3 control-label">작성일</label>
				<div class="col-sm-9">
					<input class="form-control" name="regDate" type="text"
						value="<%=nDTO.getRegDate()%>" readonly>
				</div>
			</div>
		<%} else {%>	
		
					<div class="form-group">
				<label class="col-sm-3 control-label">작성일</label>
				<div class="col-sm-9">
					<input class="form-control" name="regDate" type="text"
						value="<%=nDTO.getUpdDate()%>" readonly>
				</div>
			</div>
		<%} %>

		<!-- 글내용 -->
		<div class="form-group">
			<label class="col-sm-3 control-label">내용</label>
			<div class="col-sm-9">
				<textarea class="form-control" rows="10" name="ntCont"><%=nDTO.getNtCont()%></textarea>
			</div>
		</div>
	
		<div class="form-group">
			<div class="col-sm-12 text-center">
			
			<!-- 물어보기 이전을 누르면 버튼이 나오지않아서 -->
			<a href="/notice/noticeDetail.do?regNo=<%=nDTO.getRegNo()%>&ntNo=<%=nDTO.getNtNo()%>" class="btn btn-danger">돌아가기<i class="fa fa-check spaceLeft"></i></a>
			<input type="submit" value="수정"  class="btn btn-success" />
		<!--  hidden 처리 -->
	 	<!--  nt_no -->
		<input type="hidden" name="ntNo" value="<%=nDTO.getNtNo()%>"/>
			<!--  reg_no -->
		<input type="hidden" name="regNo" value="<%=nDTO.getRegNo() %>"/>
			<!--  upddate -->
		<input type="hidden" name="updDate"/>
			<!--  updno -->
		<input type="hidden" name="updNo"/>
			<!-- qaGroup -->
		<input type="hidden" name="qaGrpNo"/> 
				<!-- nolist.get(0) = user_no   nolist.get(1) = nt_no -->
			</div>
		</div>

		</form>
		
		
		<!-- 중복되는 부분 같으니 나중에 include -->
		


	</div>

</body>
</html> 