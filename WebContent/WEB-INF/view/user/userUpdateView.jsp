<%@page import="poly.util.DateUtil"%>
<%@page import="poly.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<% 
UserDTO uDTO=(UserDTO)request.getAttribute("uDTO");

%>
<!-- css js  -->
<%@ include file="/WEB-INF/view/cssjs.jsp" %>
<!-- 유효성검사  -->
<%@ include file="userScript.jsp" %>

<!-- top -->
<%@ include file="/WEB-INF/view/mainCafeTop.jsp" %>
<title>회원정보</title>
<script type="text/javascript">
<!-- 이전-->
<%-- function prev(){
	location.href="redirect:/user/userList.do"//다시하기
}

//추가  예 아니오 한번더 물어보기 추가
function userDelete(userNo){

		alert("<%=uDTO.getName()%>을/를 탈퇴시켰습니다.");
		location.href="/user/userDelete.do?userNo="+userNo;

	
	
} --%>

</script>

<style>
label{
text-align:right;
}
</style>
</head>
<body>

	<!------------------  회원가입 폼  ---------------------->
	<div class="container">
		<div class="col-sm-12">
			<div class="page-header">
				<h1>
					회원정보 <small><br/>CAFE HEAVEN</small>
				</h1>
			</div>
		<form method="post" action="/user/updateUserProc.do"
			class="form-horizontal">
				<div class="form-group">
					<!--   -->
					<label class="col-sm-4 control-label">이메일</label>
					<div class="col-sm-8">
				
							<input type="text" class="form-control" id="email" name="email"
								value="<%=uDTO.getEmail()%>"/>

					</div>
				</div>
				<!-- 이름  -->
				<div class="form-group">
					<label class="col-sm-4 control-label">이름</label>
					<div class="col-sm-8">
						<input class="form-control" id="name" name="name" type="text"
							value="<%=uDTO.getName()%>"/>
					</div>
				</div>
					<!-- 전화번호  -->
				<div class="form-group">
					<label class="col-sm-4 control-label">전화번호</label>
					<div class="col-sm-8">
						<input class="form-control" id="userTel" name="userTel" type="text"
							value="<%=uDTO.getUserTel()%>"/>
					</div>
				</div>

				<!-- 생일 -->
				<div class="form-group">
					<label class="col-sm-4 control-label">생일</label>
					<div class="col-sm-8">
					
							<input type="text" class="form-control" id="birth" name="birth" value="<%=DateUtil.DateFormat(uDTO.getBirth())%>" readonly />
						
					</div>
				</div>
		
				<!--  주소 입력란 -->
				<div class="form-group">
					<label class="col-sm-4 control-label">주소</label>
					<div class="col-sm-8">
					
							<input type="text" class="form-control" id="post_addr"  name="postAddr" value="<%=uDTO.getPostAddr()%>" readonly /> 
							<input type="text" class="form-control" id="addr1" name="addr1"  value="<%=uDTO.getAddr1()%>" readonly />
							<input type="text" class="form-control" id="addr2" name="addr2"  value="<%=uDTO.getAddr2()%>" />
							<span class="input-group-btn">
							<input type="button" class="btn btn-success" onclick="postcode_addr()" value="주소 선택" readonly />
							</span>
						
					</div>
				</div>

				<!--  hidden -->
				<input type="hidden" name="userNo" value="<%=uDTO.getRegNo() %>"/>
				
				
				<!-- 회원정보 수정 취소 버튼 -->
				<div class="form-group">
					<div class="col-sm-12 text-center">
						<button class="btn btn-danger" type="submit" id="userUpdate">
							수정<i class="fa fa-check spaceLeft"  ></i>
						</button>
						<a href="/user/userMypage.do?userNo=<%=userNo %>" class="btn btn-primary" >
							취소<i class="fa fa-times spaceLeft"></i>
						</a>
					</div>
				</div>
			</form>
			
		</div>

	</div>
	

</body>
</html>

