
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- css js  -->
<%@ include file="/WEB-INF/view/cssjs.jsp" %>
<!-- 유효성검사  -->
<%@ include file="userScript.jsp" %>
<!-- top -->
<%@ include file="/WEB-INF/view/mainCafeTop.jsp" %>
<title>회원가입</title>
</head>
<body>
	<!------------------  회원가입 폼  ---------------------->
	<div class="container">
		<div class="col-md-12">
			<div class="page-header">
				<h1>
					회원가입 <small><br/>CAFE HEAVEN</small>
				</h1>
			</div>
			<form class="form-horizontal" action="/user/userRegProc.do" method="post" ><!--onsubmit="checked()" -->
				<div class="form-group">
					<!--  이메일 입력란 -->
					<label class="col-sm-3 control-label">이메일</label>
					<div class="col-sm-6">
						<div class="input-group">
							<input type="text" class="form-control" id="email" name="email" 
								placeholder="*이메일 입력"> <span class="input-group-btn">
								<input type="button" class="btn btn-success" value="이메일 중복체크" id="emailCk" />
								<!-- 이메일이 중복이면  유효성 검사를 통해 안넘어가게 -->
								<input type="hidden" id="conf"value="0"/>
							</span>
						</div>
					</div>
				</div>
				<!--  패스워드 입력란 -->
				<div class="form-group">
					<label class="col-sm-3 control-label">비밀번호</label>
					<div class="col-sm-6">
						<input class="form-control" id="pwd" name="password" type="password" 
							placeholder="비밀번호" maxlength="20" value="">
						<font id="length" size="2" color="red">8자리 이상 20자리 이하의 [영문 + 숫자] 조합</font>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호
						확인</label>
					<div class="col-sm-6">
						<input class="form-control" id="pwdCheck"
							type="password" placeholder="비밀번호 확인" maxlength="20" value="">
							<font id="check" size="2" color="red"></font>
						<p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
					</div>
				</div>
				<!-- 비밀번호 찾기 질문 답 -->
				<div class="form-group">
					<label class="col-sm-3 control-label">비밀번호 찾기 질문</label>
					<div class="col-sm-6">
						<select name="pwdQ" class="form-control">
							<option disabled="disabled">*비밀번호 확인 질문 선택</option>
							<option  value="1">내가 태어난 고향은?</option>
							<option  value="2">감명 깊게 읽은 책의 제목은?</option>
							<option value="3">보물 제 1호는?</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label">비밀번호 답 입력</label>
					<div class="col-sm-6">
						<input class="form-control" id="pwdA" name="pwdA" type="text" placeholder="*비밀번호 찾기 답입력">
					</div>
				</div>
				<!-- 이름  -->
				<div class="form-group">
					<label class="col-sm-3 control-label">이름</label>
					<div class="col-sm-6">
						<input class="form-control" id="name" name="name" type="text"
							placeholder="*이름입력">
					</div>
				</div>
				<!-- 전화번호 -->
				<div class="form-group">
					<label class="col-sm-3 control-label" >전화번호</label>
					<div class="col-sm-6">
						<input class="form-control" id="userTel" name="userTel" type="text"
						maxlength="12"
							placeholder="* - 제외하고 입력해주세요 최대 12자리">
					</div>
				</div>
				<!-- 성별 -->
				<div class="form-group">
					<label class="col-sm-3 control-label">성별</label>
					<div class="col-sm-6">
						<select name="gender" class="form-control">
							<option value="M">남자</option>
							<option value="W">여자</option>
						</select>
					</div>
				</div>
				<!-- 생일 -->
				<div class="form-group">
					<label class="col-sm-3 control-label">생일</label>
					<div class="col-sm-6">
						<div class="input-group">
							<input type="date" class="form-control" id="birth" name="birth">
						</div>
					</div>
				</div>
				<!--  주소 입력란 -->
				<div class="form-group">
					<label class="col-sm-3 control-label">주소</label>
					<div class="col-sm-6">
						<div class="input-group">
							<input type="text" class="form-control" id="post_addr"  name="postAddr"readonly
								placeholder="*우편번호"> 
								<input type="text" class="form-control" id="addr1" name="addr1" readonly
								placeholder="*주소">
								<input type="text" class="form-control" id="addr2" name="addr2"
								placeholder="*주소입력">
								<span class="input-group-btn">
								<input type="button" class="btn btn-success" onclick="postcode_addr()" readonly value="주소 선택" />
							</span>
						</div>
					</div>
				</div>
				<!-- 회원가입 취소 버튼 -->
				<div class="form-group">
					<div class="col-sm-12 text-center">
						<button class="btn btn-primary" id="regSub"  type="submit">
							회원가입<i class="fa fa-check spaceLeft"></i>
						</button>
						<button class="btn btn-danger"  type="reset">
							가입취소<i class="fa fa-times spaceLeft"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>

