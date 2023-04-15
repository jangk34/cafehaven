 <%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="poly.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//모델에서 받는것은 getAttribute();
	NoticeDTO anDTO = (NoticeDTO) request.getAttribute("anDTO");
	//고친부분 리스트 써서 널값은 없앴는데 이렇게 해도되는지
	List nolist =(List) request.getAttribute("noList");
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/view/cssjs.jsp"%>
<script>
function noticeDelete(ntNo){
	location.href="/notice/noticeDelete.do?ntNo="+ntNo;
}

</script>
</head>
<body>

	<!-- top -->
	<%@ include file="/WEB-INF/view/mainCafeTop.jsp"%>

	<!--  입력창 -->
	<div class="container">

		
		<!--  제목   -->
			<div class="form-group">
				<label class="col-sm-3 control-label">제목</label>
				<div class="col-sm-9">
					<input class="form-control" name="ntTitle" type="text"
						value="<%=anDTO.getNtTitle()%>" readonly >
				</div>
			</div>
		
		<!-- 작성자 -->
			<div class="form-group">
				<label class="col-sm-3 control-label">작성자</label>
				<div class="col-sm-9">
					<input class="form-control" type="text"
					value="관리자" readonly >
				</div>
			</div>
		<!-- 작성일 -->
			<div class="form-group">
				<label class="col-sm-3 control-label">작성일</label>
				<div class="col-sm-9">
					<input class="form-control" name="regDate" type="text"
						value="<%=anDTO.getRegDate()%>" readonly>
				</div>
			</div>
		
		
		<!-- 글내용 -->
		<div class="form-group">
			<label class="col-sm-3 control-label">내용</label>
			<div class="col-sm-9">
				<textarea class="form-control" rows="10" name="ntCont"
					readonly="readonly"><%=anDTO.getNtCont()%></textarea>
			</div>
		</div>
		<!--  등록일 등록번호 -->
		
		<div class="form-group">
			<div class="col-sm-12 text-center">
			<a href="/notice/communityTab.do" class="btn btn-success">
					확인<i class="fa fa-times spaceLeft"></i>
				</a>
			</div>
		</div>
			


	</div>

</body>
</html> 