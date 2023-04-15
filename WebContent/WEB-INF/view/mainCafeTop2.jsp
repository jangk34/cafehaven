<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<!-- 로그인 하기 위해 컨트롤러에서 모델에 저장된 데이터를 받아옴 -->
   <%
   	String email = CmmUtil.nvl((String)session.getAttribute("email")); //형변환 해줘야됨 오브젝트로 넘어오기 떄문에 형변환 해주고 널값이 넘어오면 오류 같은거 발생하기 때문에 미리만든메소드를 이용해 널값을 공백으로 바꿈 
   	String name = CmmUtil.nvl((String)session.getAttribute("name"));
   	String userNo = CmmUtil.nvl((String)session.getAttribute("userNo"));
   %>
<script>
	function logout() {
		alert("로그아웃 하셨습니다.")
		location.href = "/user/logout.do"
	}
</script>

<div class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/home.do">CAFEHEAVEN</a>
		</div>
		<!-- 메인 첫화면 로그인 안된화면 -->
		<!-- 메뉴  카페정보  커뮤니티 관리 메뉴 목록 -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="/menu/menu.do">메뉴<span
						class="sr-only"></span></a></li>
				<li><a href="/cafe/cafeInfo.do">카페 정보<span class="sr-only"></span></a></li>
				<li><a href="/notice/communityTab.do">커뮤니티<span class="sr-only"></span></a></li>
				
				
				<!-- 여기도 if문  userno =1 인거 관리자-->
				
				<% if(userNo.equals("1")) { %>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<!--  연습용으로 넘어가게 지정해놓음 -->
						<li><a href="/user/userList.do">회원 관리</a></li>
						<li><a href="/menu/menuReg.do">메뉴 관리</a></li>
						<li><a href="#">주문 관리</a></li><!--  해야됨 -->
						<li><a href="/cafe/cafeInfoManage.do">카페 관리</a></li>
						<li><a href="/bigData/bigData.do">빅데이터 분석 관리</a></li>
					</ul></li>
				<%} %>
			
				<!--  장바구니 마이페이지 -->
			</ul>
			<!--  email 이 공백이 아니면 로그인 성공 -->
			<% if (!"".equals(email)) {%>
			<!--  로그인 성공 -->
			<div class="navbar-form navbar-right"><b><%=email+"님 환영합니다" +name%></b><button class="btn btn-info">마이페이지</button><button class="btn btn-warning">장바구니</button><button class="btn btn-secondary" onclick="logout();">로그아웃</button></div>
			
			<%} else { %>
			
			<!--  로그인 패스워드 입력 -->
		
			<form class="navbar-form navbar-right" action="/user/loginProc.do" method="post">
				<div class="form-group">
					<input type="text" name="email" class="form-control" placeholder="ID입력">
				</div>
				<div class="form-group">
					<input type="password" name="password" class="form-control" placeholder="PW입력">
				</div>
				<input type="submit" class="btn btn-primary" value="로그인" />
				<a href="/user/userFind.do"class="btn btn-success">ID/PW찾기</a>
				<a href="/user/userReg.do" class="btn btn-success">회원가입</a>
			</form>
				
				<%} %>
			<!-- 로그인 하고 나서  '아이디' 님 환영합니다. -->
	
		</div>
	</div>
</div>
	
