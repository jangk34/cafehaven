<%@page import="com.mysql.jdbc.PreparedStatement.ParseInfo"%>
<%@page import="poly.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//모델에서 받는것은 getAttribute();
	NoticeDTO nDTO = (NoticeDTO) request.getAttribute("nDTO");
	System.out.println("jsp : " + CmmUtil.nvl(nDTO.getNtNo()));
	//고친부분 리스트 써서 널값은 없앴는데 이렇게 해도되는지
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/view/cssjs.jsp"%>
<script>
//글 삭제  
function noticeDelete(ntNo){
	location.href="/notice/noticeDelete.do?ntNo="+ntNo;
}




// 답글 체크여부
$(function ansChk(){
	$("#ansChk").click(function(){
		
		//ntNo와 qaGrpNo일치 여부확인
		var noticeNo=$('#answerNo').val();
		//regNo
		var regUserNo=$('#regUserNo').val();
		
		
		$.ajax({
			type : 'POST',
			data : {'ntNo':noticeNo}, // parameter
			url  : "/notice/ansChk.do",
			success : function(data){
				if(data>0){
					alert("답글이 존재합니다.");
					//이벤트 제거 만들기
					//넘어가는거없음
				}else{
					location.href="/notice/answerReg.do?regNo="+regUserNo+"&ntNo="+noticeNo+"&qaGrpNo="+noticeNo;
				}
			},
			error:function(error){
				alert("error : "+error)
			}
		});
	});
	
});
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
		<!-- 답글 체크여부를 위한 인풋  이값은 ntNo-->
		<input type="hidden" id="answerNo" value="<%=nDTO.getNtNo()%>"/>
		<input type="hidden" id="regUserNo" value="<%=nDTO.getRegNo()%>"/>	 
		
		<!--  등록일 등록번호 -->
		<!-- <input type="hidden" value="a" name="ntSort"/> -->
		<div class="form-group">
			<div class="col-sm-12 text-center">
			<% if (userNo.equals("1")) {%>
			<button class="btn btn-danger" onclick="noticeDelete('<%=nDTO.getNtNo()%>');">삭제<i class="fa fa-check spaceLeft "></i></button>
			<button class="btn btn-success" onclick="ansChk();" id="ansChk">답글<i class="fa fa-times spaceLeft"></i></button>
		<%-- 	<a href="/notice/noticeUpdateView.do?regNo=<%=nDTO.getRegNo()%>&ntNo=<%=nDTO.getNtNo()%>" class="btn btn-success">
					수정<i class="fa fa-times spaceLeft"></i>
				</a> --%>
			
			<%} %>
			<% if(userNo.equals(nDTO.getRegNo())&&!userNo.equals("1")) { %>
			<button class="btn btn-danger" onclick="noticeDelete('<%=nDTO.getNtNo()%>');">삭제<i class="fa fa-check spaceLeft "></i></button>
			<a href="/notice/noticeUpdateView.do?regNo=<%=nDTO.getRegNo()%>&ntNo=<%=nDTO.getNtNo()%>" class="btn btn-success">
					수정<i class="fa fa-times spaceLeft"></i>
				</a>
			<%} %>
	
		</div>
	</div>
</div>
</body>
</html>