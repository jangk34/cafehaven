<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/view/cssjs.jsp" %>
<%@ include file="cafeInfoRegScript.jsp" %>
<title>Insert title here</title>


<!-- 다음주소api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


</head>
<body>
<%@ include file="/WEB-INF/view/mainCafeTop.jsp" %>



	<div class="container">
		<div class="page-header">
			<h1>
				카페 정보 등록 <small>CAFE HEAVEN</small>
			</h1>
		</div>
		<!-- 카페 정보 -->
		<form method="post" action="/cafe/cafeInfoProc.do" Enctype="multipart/form-data" class="form-horizontal">  <!-- post 대용량,이미지  -->
			<div class="form-group">
				<label class="col-sm-3 control-label">카페명</label>
				<div class="col-sm-6">
					<input class="form-control" id="cafeName" type="text" name="cafeName"
						placeholder="카페명">
						<input type="hidden" name="cafeNo" value="1"/>  <!-- 넘버를 넣어줘야 호출 가능  -->
				</div>
			</div>

			
				<!--  주소 입력란 -->
				<!--  주소 입력란 -->
				<div class="form-group">
					<label class="col-sm-3 control-label">주소</label>
					<div class="col-sm-6">
						<div id="map" class="input-group">
							<input type="text" class="form-control" id="post_addr"  name="cafePostAddr"readonly
								placeholder="*우편번호"> 
								<input type="text" class="form-control" id="addr1" name="cafeAddr1" readonly
								placeholder="*주소">
								<input type="text" class="form-control" id="addr2" name="cafeAddr2"
								placeholder="*주소입력">
								<span class="input-group-btn">
								<input type="button" class="btn btn-success" onclick="postcode_addr()" readonly value="주소 선택" />
							</span>
							
							
						</div>
					</div>
				</div>
			<!-- 전화번호 -->
			<div class="form-group">
				<label class="col-sm-3 control-label">전화번호</label>
				<!-- 숫자만 입력하게 하면됨 -->
				<div class="col-sm-6">
					<input class="form-control" id="telNum" type="tel" name="cafeTel"
						placeholder="전화번호입력"><!-- 추가 dto 컬럼 -->
				</div>
			</div>
			<!-- 영업시간  -->
			<div class="form-group">
				<label class="col-sm-3 control-label">영업일</label>
				<div class="col-sm-6">
					<select class="form-control" name="openDate">
						<option>*영업요일</option>
						<option value="monfri">월~금</option>
						<option value="monsat">월~토</option>
						<option value="norest">연중무휴</option>
						<option value="onerest">공휴일 및 주 1회 휴무</option>
						<!--  이걸 선택하면 텍스트 창 나오게 -->
					</select>
				</div>
			</div>
			<!-- 카페소개글 -->
			<div class="form-group">
				<label class="col-sm-3 control-label">카페 소개</label>
				<div class="col-sm-6">
					<textarea class="form-control" rows="10" name="cafeContent"></textarea>
				</div>
			</div>

			<!-- 영업시간 오픈 클로즈시간 -->
			<div class="form-group">
				<label class="col-sm-3 control-label">영업시간</label>
				<div class="col-sm-6">
					<p class="col-sm-2">OPEN</p>
					<input class="col-sm-4"
						style="border: 1px solid #ccc; border-radius: 4px;"
						id="cafeOpenTime" name="cafeOpt" type="time">
					<p class="col-sm-2">CLOSE</p>
					<input class="col-sm-4"
						style="border: 1px solid #ccc; border-radius: 4px;"
						id="cafeCloseTime" name="cafeClt" type="time">
				</div>
			</div>
			<div>
		
			
			</div>
			
			<!-- 이미지 수정 -->
			<div
				style="padding-left: 100px; padding-right: 100px; padding-top: 50px">
				<h3>
					카페 이미지 <small>CAFE HEAVEN</small>
				</h3>
				<div style="border-bottom: 1px solid #eee;"></div>

				<div>
					<!-- 카페 외부 -->

					<div
						style="padding-bottom: x; width: 70%; height: 300px; margin: 0 auto">
						<img id="curImg1" class="img-thumbnail" src="image/cafeIN.jpg"
							style="width: 100%; height: 300px;" />
					</div>

					<div>
						<input id="preImg1"  name="cafeimg" type="file" accept="/image/*"  /> 
					</div>
				</div>
			</div>
			<div style="padding-top: 40px"><center>  <button type="submit" class="btn btn-success" >수정</button><a href="#" class="btn btn-danger">취소</a></center></div>
	
		</form>
	</div>
		

	<!--  수정 취소 버튼  하나라도  이미지 업로드가 안되면 바로  -->
</body>
</html>