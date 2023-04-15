<%@page import="com.mysql.jdbc.PreparedStatement.ParseInfo"%>
<%@page import="poly.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//모델에서 받는것은 getAttribute();
	NoticeDTO nDTO = (NoticeDTO) request.getAttribute("nDTO");
	/* System.out.println("jsp : " + CmmUtil.nvl(nDTO.getNtNo()));
	//고친부분 리스트 써서 널값은 없앴는데 이렇게 해도되는지 */
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
						value="<%=CmmUtil.nvl(nDTO.getNtTitle())%>" readonly >
				</div>
			</div>
		
		<!-- 작성자 -->
			<div class="form-group">
				<label class="col-sm-3 control-label">작성자</label>
				<div class="col-sm-9">
					<input class="form-control" name="ntWriter" type="text"
					value="<%=CmmUtil.nvl(nDTO.getNtWriter())%>" readonly >
				</div>
			</div>
		<!-- 작성일 -->


		<% if(CmmUtil.nvl(nDTO.getUpdNo())==""){ %>
		
			<div class="form-group">
				<label class="col-sm-3 control-label">작성일</label>
				<div class="col-sm-9">
					<input class="form-control" name="regDate" type="text"
						value="<%=CmmUtil.nvl(nDTO.getRegDate())%>" readonly>
				</div>
			</div>
		<%} else {%>	
		
					<div class="form-group">
				<label class="col-sm-3 control-label">작성일</label>
				<div class="col-sm-9">
					<input class="form-control" name="regDate" type="text"
						value="<%=CmmUtil.nvl(nDTO.getUpdDate())%>" readonly>
				</div>
			</div>
		<%} %>
		
		
		<!-- 글내용 -->
		<div class="form-group">
			<label class="col-sm-3 control-label">내용</label>
			<div class="col-sm-9">
				<textarea class="form-control" rows="10" name="ntCont"
					readonly="readonly"><%=CmmUtil.nvl(nDTO.getNtCont())%></textarea>
			</div>
		</div>
		<!--  등록일 등록번호 -->
		
		<div class="form-group">
			<div class="col-sm-12 text-center">

				<% if (userNo.equals("1")&&nDTO.getNtSort().equals("nt")) {%>
				<button class="btn btn-danger" onclick="noticeDelete('<%=nDTO.getNtNo()%>');">삭제<i class="fa fa-check spaceLeft "></i></button>
				<a href="/notice/noticeUpdateView.do?regNo=<%=nDTO.getRegNo()%>&ntNo=<%=nDTO.getNtNo()%>" class="btn btn-success">
					수정<i class="fa fa-times spaceLeft"></i>
				</a>
				<%} %>
			<% if(userNo.equals(nDTO.getNtNo())&&!userNo.equals("1")) { %>
			<button class="btn btn-danger" onclick="noticeDelete('<%=nDTO.getNtNo()%>');">삭제<i class="fa fa-check spaceLeft "></i></button>
			<a href="/notice/noticeUpdateView.do?regNo=<%=nDTO.getRegNo()%>&ntNo=<%=nDTO.getNtNo()%>" class="btn btn-success">
					수정<i class="fa fa-times spaceLeft"></i>
				</a>
			<%} %>
			</div>
		</div>
		
	<!--  히든  카운트 찍히나 안찍히나-->

	<input type="hidden" value="<%=CmmUtil.nvl(nDTO.getNtSort()) %>"/>
	<input type="hidden" value="<%=userNo %>" />
	<input type="hidden" value="<%=CmmUtil.nvl(nDTO.getQaGrpNo()) %>" >

	</div>

</body>
</html>