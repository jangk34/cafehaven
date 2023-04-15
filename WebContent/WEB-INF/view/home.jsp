<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<%@ include file="/WEB-INF/view/cssjs.jsp"%>
<%-- <%@ include file="/WEB-INF/view/template.jsp" %> --%>
<title>CAFEHEAVEN'S HOME</title>
</head>
<body>
	<%@ include file="mainCafeTop.jsp"%>
	<div>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!--페이지-->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<!--페이지-->
			<div class="carousel-inner">
				<!--슬라이드1-->
				<div class="item active">
					<img style="width: 100%; height: 800px;" src="/image/banner.jpg"
						alt="First slide">
				</div>
				<!--슬라이드1-->
				<!--슬라이드2-->
				<div class="item">
					<img style="width: 100%; height: 800px;" src="/image/cafeIN.jpg"
						data-src="" alt="Second slide">
				</div>
				<!--슬라이드2-->
				<!--슬라이드3-->
				<div class="item">
					<img style="width: 100%; height: 800px;" src="/image/cafeIN2.jpg"
						data-src="" alt="Third slide">
				</div>
				<!--슬라이드3-->
			</div>
		</div>
		<div id="div_new" style="position:absolute; top:100px; left:48%; width:auto; margin-left:-276px; z-index:1;  text-align: center;">
			<img src="/image/logo.png" id="logo_img" alt="logo" style="margin-bottom:30px;">
			<div id="search_area">
				<form id="search_form" action="" class="">
					<div class="hide" id="hidden_wrapper">
						<input type="hidden" id="title_onoff" name="rn" value="0" style="display: none;">
						<input type="hidden" id="page" name="page">
						<input type="hidden" id="chunk" name="chunk">
						<input type="hidden" id="lat" name="lat">
						<input type="hidden" id="lng" name="lng">
					</div>
					<div class="container-fluid" id="search_wrapper">
						<div class="container-fluid" id="search_input_wrapper">
							<input type="text" id="s_input" name="query" autocomplete="off" value="" style="width:500px; height:50px;">
							<button type="submit" onclick="$('#s_button').click();" style="width:50px; height:50px; border:#ffffff solid 1px; background-color:#f6f5ef; float:left;">
								<img src="/image/searcher.png" style="width:40px; height:40px;">
							</button>
							<!-- <button type="submit" id="s_button" style="display:none;"></button> -->
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- git test -->
	<%@ include file="mainCafeBottom.jsp"%>
</body>
</html>