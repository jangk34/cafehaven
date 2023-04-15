<%@ page import="poly.util.CmmUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="/WEB-INF/view/template.jsp" %>
<title>CAFE HEAVEN'S HOME</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<script src="/templated-ion/js/jquery.min.js"></script>
<script src="/templated-ion/js/skel.min.js"></script>
<script src="/templated-ion/js/skel-layers.min.js"></script>
<script src="/templated-ion/js/init.js"></script>
<!-- <noscript>
	<link rel="stylesheet" href="/templated-ion/css/skel.css" />
	<link rel="stylesheet" href="/templated-ion/css/style.css" />
	<link rel="stylesheet" href="/templated-ion/css/style-xlarge.css" />
</noscript> -->
<%
	String email = CmmUtil.nvl((String) session.getAttribute("email")); //형변환 해줘야됨 오브젝트로 넘어오기 떄문에 형변환 해주고 널값이 넘어오면 오류 같은거 발생하기 때문에 미리만든메소드를 이용해 널값을 공백으로 바꿈 
	String name = CmmUtil.nvl((String) session.getAttribute("name"));
	String userNo = CmmUtil.nvl((String) session.getAttribute("userNo"));
%>
<script>
	function logout() {
		alert("로그아웃 하셨습니다.")
		location.href = "/user/logout.do"
	}
</script>
</head>
<body id="top">
	<!-- Header -->
	<header id="header" class="skel-layers-fixed">
		<div class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<h1>
						<a href="/index.do">CAFE HEAVEN</a>
					</h1>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<nav id="nav">
						<ul>
							<li><a href="/menu/menuList.do">메뉴<span class="sr-only"></span></a></li>
							<li><a href="/cafe/cafeInfo.do?cafeNo=1">카페 정보<span class="sr-only"></span></a></li>
							<li><a href="/notice/communityTab.do">커뮤니티<span class="sr-only"></span></a></li>

							<%
								if(userNo.equals("1")) {
							%>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">관리<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<!--  연습용으로 넘어가게 지정해놓음 -->
									<li><a href="/user/userList.do">회원 관리</a></li>
									<li><a href="/menu/menuReg.do">메뉴 관리</a></li>
									<li><a href="/order/orderList.do">주문 관리</a></li>
									<!--  해야됨 -->
									<li><a href="/cafe/cafeInfoManage.do">카페 관리</a></li>
									<li><a href="/bigData/bigData.do">빅데이터 분석 관리</a></li>
								</ul></li>
							<%} %>
						</ul>
					</nav>
				</div>
			</div>
		</div>
		
	</header>

	<!-- Banner -->
	<section id="banner">
		<div class="inner">
			<h2>This is Ion</h2>
			<p>
				A free responsive template by <a href="http://templated.co">TEMPLATED</a>
			</p>
			<ul class="actions">
				<li><a href="#content" class="button big special">Sign Up</a></li>
				<li><a href="#elements" class="button big alt">Learn More</a></li>
			</ul>
		</div>
	</section>

	<!-- One -->
	<section id="one" class="wrapper style1">
		<header class="major">
			<h2>Ipsum feugiat consequat</h2>
			<p>Tempus adipiscing commodo ut aliquam blandit</p>
		</header>
		<div class="container">
			<div class="row">
				<div class="4u">
					<section class="special box">
						<i class="icon fa-area-chart major"></i>
						<h3>Justo placerat</h3>
						<p>Eu non col commodo accumsan ante mi. Commodo consectetur
							sed mi adipiscing accumsan ac nunc tincidunt lobortis.</p>
					</section>
				</div>
				<div class="4u">
					<section class="special box">
						<i class="icon fa-refresh major"></i>
						<h3>Blandit quis curae</h3>
						<p>Eu non col commodo accumsan ante mi. Commodo consectetur
							sed mi adipiscing accumsan ac nunc tincidunt lobortis.</p>
					</section>
				</div>
				<div class="4u">
					<section class="special box">
						<i class="icon fa-cog major"></i>
						<h3>Amet sed accumsan</h3>
						<p>Eu non col commodo accumsan ante mi. Commodo consectetur
							sed mi adipiscing accumsan ac nunc tincidunt lobortis.</p>
					</section>
				</div>
			</div>
		</div>
	</section>

	<!-- Two -->
	<section id="two" class="wrapper style2">
		<header class="major">
			<h2>Commodo accumsan aliquam</h2>
			<p>Amet nisi nunc lorem accumsan</p>
		</header>
		<div class="container">
			<div class="row">
				<div class="6u">
					<section class="special">
						<a href="#" class="image fit"><img src="template-ion/images/pic01.jpg"
							alt="" /></a>
						<h3>Mollis adipiscing nisl</h3>
						<p>Eget mi ac magna cep lobortis faucibus accumsan enim
							lacinia adipiscing metus urna adipiscing cep commodo id. Ac quis
							arcu amet. Arcu nascetur lorem adipiscing non faucibus odio
							nullam arcu lobortis. Aliquet ante feugiat. Turpis aliquet ac
							posuere volutpat lorem arcu aliquam lorem.</p>
						<ul class="actions">
							<li><a href="#" class="button alt">Learn More</a></li>
						</ul>
					</section>
				</div>
				<div class="6u">
					<section class="special">
						<a href="#" class="image fit"><img src="template-ion/images/pic02.jpg"
							alt="" /></a>
						<h3>Neque ornare adipiscing</h3>
						<p>Eget mi ac magna cep lobortis faucibus accumsan enim
							lacinia adipiscing metus urna adipiscing cep commodo id. Ac quis
							arcu amet. Arcu nascetur lorem adipiscing non faucibus odio
							nullam arcu lobortis. Aliquet ante feugiat. Turpis aliquet ac
							posuere volutpat lorem arcu aliquam lorem.</p>
						<ul class="actions">
							<li><a href="#" class="button alt">Learn More</a></li>
						</ul>
					</section>
				</div>
			</div>
		</div>
	</section>

	<!-- Three -->
	<section id="three" class="wrapper style1">
		<div class="container">
			<div class="row">
				<div class="8u">
					<section>
						<h2>Mollis ut adipiscing</h2>
						<a href="#" class="image fit"><img src="template-ion/images/pic03.jpg"
							alt="" /></a>
						<p>Vis accumsan feugiat adipiscing nisl amet adipiscing
							accumsan blandit accumsan sapien blandit ac amet faucibus aliquet
							placerat commodo. Interdum ante aliquet commodo accumsan vis
							phasellus adipiscing. Ornare a in lacinia. Vestibulum accumsan ac
							metus massa tempor. Accumsan in lacinia ornare massa amet. Ac
							interdum ac non praesent. Cubilia lacinia interdum massa faucibus
							blandit nullam. Accumsan phasellus nunc integer. Accumsan euismod
							nunc adipiscing lacinia erat ut sit. Arcu amet. Id massa aliquet
							arcu accumsan lorem amet accumsan commodo odio cubilia ac eu
							interdum placerat placerat arcu commodo lobortis adipiscing
							semper ornare pellentesque.</p>
					</section>
				</div>
				<div class="4u">
					<section>
						<h3>Magna massa blandit</h3>
						<p>Feugiat amet accumsan ante aliquet feugiat accumsan. Ante
							blandit accumsan eu amet tortor non lorem felis semper. Interdum
							adipiscing orci feugiat penatibus adipiscing col cubilia lorem
							ipsum dolor sit amet feugiat consequat.</p>
						<ul class="actions">
							<li><a href="#" class="button alt">Learn More</a></li>
						</ul>
					</section>
					<hr />
					<section>
						<h3>Ante sed commodo</h3>
						<ul class="alt">
							<li><a href="#">Erat blandit risus vis adipiscing</a></li>
							<li><a href="#">Tempus ultricies faucibus amet</a></li>
							<li><a href="#">Arcu commodo non adipiscing quis</a></li>
							<li><a href="#">Accumsan vis lacinia semper</a></li>
						</ul>
					</section>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<footer id="footer">
		<div class="container">
			<div class="row double">
				<div class="6u">
					<div class="row collapse-at-2">
						<div class="6u">
							<h3>Accumsan</h3>
							<ul class="alt">
								<li><a href="#">Nascetur nunc varius</a></li>
								<li><a href="#">Vis faucibus sed tempor</a></li>
								<li><a href="#">Massa amet lobortis vel</a></li>
								<li><a href="#">Nascetur nunc varius</a></li>
							</ul>
						</div>
						<div class="6u">
							<h3>Faucibus</h3>
							<ul class="alt">
								<li><a href="#">Nascetur nunc varius</a></li>
								<li><a href="#">Vis faucibus sed tempor</a></li>
								<li><a href="#">Massa amet lobortis vel</a></li>
								<li><a href="#">Nascetur nunc varius</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="6u">
					<h2>Aliquam Interdum</h2>
					<p>Blandit nunc tempor lobortis nunc non. Mi accumsan. Justo
						aliquet massa adipiscing cubilia eu accumsan id. Arcu accumsan
						faucibus vis ultricies adipiscing ornare ut. Mi accumsan justo
						aliquet.</p>
					<ul class="icons">
						<li><a href="#" class="icon fa-twitter"><span
								class="label">Twitter</span></a></li>
						<li><a href="#" class="icon fa-facebook"><span
								class="label">Facebook</span></a></li>
						<li><a href="#" class="icon fa-instagram"><span
								class="label">Instagram</span></a></li>
						<li><a href="#" class="icon fa-linkedin"><span
								class="label">LinkedIn</span></a></li>
						<li><a href="#" class="icon fa-pinterest"><span
								class="label">Pinterest</span></a></li>
					</ul>
				</div>
			</div>
			<ul class="copyright">
				<li>&copy; Untitled. All rights reserved.</li>
				<li>Design: <a href="http://templated.co">TEMPLATED</a></li>
				<li>Images: <a href="http://unsplash.com">Unsplash</a></li>
			</ul>
		</div>
	</footer>

</body>
</html>