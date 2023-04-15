<%@page import="poly.dto.TmpDTO"%>
<%@page import="poly.dto.MenuDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	MenuDTO mDTO=(MenuDTO)request.getAttribute("mDTO");
	TmpDTO tDTO = (TmpDTO)request.getAttribute("tDTO");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
body, html {
	height: 100%;
	font-family: "Inconsolata", sans-serif;
}

.menu {
	display: none;
}
/* Style the tab */
.tab {
	overflow: hidden;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
}

/* Style the buttons that are used to open the tab content */
.tab button {
	background-color: inherit;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	transition: 0.3s;
}

/* Change background color of buttons on hover */
.tab button:hover {
	background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
	background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
	display: none;
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-top: none;
}
</style>
<title>CAFEHEAVEN - 메뉴</title>
<%@ include file="/WEB-INF/view/cssjs.jsp"%>
<!-- Ajax를 이용하여 이중탭 -->

<!-- Ajax를 이용하여 데이터 불러오기 -->
<script>
	function userMenuList(menuCgNo){
		var orderUserNo=$('#orderUserNo').val();
		
			$.ajax({
				url:"/menu/userMenuList.do",
				type:"POST",
				data:{
					'menuCgNo':menuCgNo
				},
				success: function(data){
					var contents="";
					// 사용자 메뉴 조회 글
				 	var caList = data.caList;
					var mList = data.mList;
						for(var i = 0; i< caList.length; i++){
							var caListImg = caList[i].menuNo;
							var menuListImg = mList[i].menuNo;
							if(orderUserNo==""){
							contents+="<div class='w3-col s4'>";
							contents+="<span>";
							contents+="<a href='#' data-toggle='modal' data-target='#menu-dt'>";
							contents+="<img src='/uploadImg/"+caList[i].cafeImg+" 'onclick='getUserMenuDetail(&#39;"+mList[i].menuNo+"&#39;) 'class='img-thumbnail'>";
							contents+="</a>";
							contents+="</span>";
							contents+="<div>";
							contents+="<a href=''#'></a>";
							contents+="</div>";
							contents+="<h5>"+mList[i].menuName+"</h5>";
							contents+="<p class='w3-text-grey'>"+mList[i].menuPrice+"원</p>"
							contents+="<div>";
							contents+="<a onclick='doOrder(&#39;loginplz&#39;);' class='btn btn-primary'";
							contents+="style='margin-bottom: 2px'>주문하기</a><br>";
							contents+="</div><br>";
							contents+="</div>";
							
							contents += "<input type='hidden' value'"+data.mList[i].menuNo+"' />";
							}else{
								contents+="<div class='w3-col s4'>";
								contents+="<span>";
								contents+="<a href='#' data-toggle='modal' data-target='#menu-dt'>";
								contents+="<img src='/uploadImg/"+caList[i].cafeImg+" 'onclick='getUserMenuDetail(&#39;"+mList[i].menuNo+"&#39;) 'class='img-thumbnail'>";
								contents+="</a>";
								contents+="</span>";
								contents+="<div>";
								contents+="<a href=''#'></a>";
								contents+="</div>";
								contents+="<h5>"+mList[i].menuName+"</h5>";
								contents+="<p class='w3-text-grey'>"+mList[i].menuPrice+"원</p>"
								contents+="<div>";
								contents+="<a onclick='doOrder('suc');' href='/order/orderDirect.do?menuNo="+mList[i].menuNo+"&userNo="+orderUserNo+"' class='btn btn-primary'";
								contents+="style='margin-bottom: 2px'>주문하기</a><br>";
								contents+="</div><br>";
								contents+="</div>";
								
								contents += "<input type='hidden' value'"+data.mList[i].menuNo+"' />";	
							}
						}
					$('#userMenuList').html(contents);
				},
				error:function(error){
					alert(error);
				}
			});
	}
	function getUserMenuDetail(menuNo){
		$.ajax({
			url:"/menu/getUserMenuDetail.do",
			type:"POST",
			data:{
				'menuNo':menuNo
			},
			success: function(data){
				console.log(data);
				var img="";
				var contents ="";
				
				// 이미지
				img+="<div style='float: left; height: 100%'>";
				img+="<img src='/uploadImg/"+data.caDTO.cafeImg+"' style='width: 100%; height: 100%; object-fit: contain'>";
				img+="</div>"
				
				// 글
				contents += "<div>제품명<input type='text' class='form-control' style='width:100%;' value='"+data.mDTO.menuName+"' readonly /></div>";
				contents += "<div>가격<input type='text' class='form-control' style='width:100%;' value='"+data.mDTO.menuPrice+"' readonly /></div>";
				contents += "<div>제공량<input type='text' class='form-control' style='width:100%;' value='"+data.mDTO.menuAmount+"' readonly /></div>";
				contents += "<div>소개<input type='text' class='form-control' style='width:100%;' value='"+data.mDTO.menuIntro+"' readonly /></div>";
				
				contents += "<input type='hidden' value'"+data.mDTO.menuNo+"' />";
				contents += "<input type='hidden' value'"+data.mDTO.menuCgNo+"' />";
				contents += "<input type='hidden' value'"+data.mDTO.menuPrice+"' />";
				contents += "<input type='hidden' value'"+data.mDTO.menuName+"' />";
				contents += "<input type='hidden' value'"+data.mDTO.regDate+"' />";
				$('#userMenuListModalImg').html(img);
				$('#userMenuListModal').html(contents);
			},
			error:function(error){
				alert(error);
			}
		});
	}
	
	 <%-- function addTmpBasket(menuNo){
		$.ajax({
			url : "/tmpBaket/tmpBasketRegProc.do",
			method : "post",
			data : {
				'menuNo' : <%= tDTO.getMenuNo() %>,
				'menuPrice' : <%= tDTO.getMenuPrice() %>,
				'menuQty' : 1,
				'menuName' : <%= tDTO.getMenuName() %>
			},
			success : function(data){
				alert('장바구니에 추가되었습니다.');
			},
			error:function(error){
				alert(error);
			}
		});
	}  --%>
	// 로그인 필요(수정해야함)
	function doOrder(str){
		if(str=="loginplz"){
			alert("로그인이 필요합니다");
			$('input[name=email]').focus();
			return false;
		}else{
			return true;
		}
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/view/mainCafeTop.jsp"%>
	<input type="hidden" id="orderMenuUserNo" value="<%= userNo %>" />
	<!-- --------------------메뉴 ------------------------------------------------------------------------- -->
	<div class="container">
		<div class="page-header">
			<h1>
				메뉴 <small>CAFE HEAVEN</small>
			</h1>
		</div>
		<div class="menu_kind_wrap">
			<p class="title">븐류 보기</p>
			<div class="menu_kind_btn">
				<a href="javascript:void(0)" role="button">
					<img src="#" alt="분류보기 메뉴 접기">
				</a>
			</div>
			<div class="menu_toggle_wrap" style="display: block;">
				<dl></dl>
			</div>
		</div>
		<!--  메뉴 본문  for문돌려 -->
		<div class="w3-container" id="menu">
			<div class="w3-content" style="text-align: center; max-width: 100%">
				<!-- 메뉴 대분류 탭 -->
				<!-- <div class="tab w3-row w3-padding w3-black">
					<button class="tablinks" onclick="openMajor(event,'Total')"
						id="defaultMajorOpen">전체</button>
					<button class="tablinks" onclick="openMajor(event,'Recommend')">추천</button>
					<button class="tablinks" onclick="openMajor(event,'Recent')">히스토리</button>
				</div> -->
				<!-- 메뉴 대분휴 탭 끝! -->

				<!-- Total 메뉴 중분류 -->
				<div id="Total" class="tab w3-row w3-center w3-card w3-padding">
					<div class="w3-col s4 tablink">
						<a href="#" onclick="userMenuList('drink');" id="myLink">음료 </a>
					</div>
					<div class="w3-col s4 tablink">
						<a href="#" onclick="userMenuList('dessert');">디저트</a>
					</div>
					<div class="w3-col s4 tablink">
						<a href="#" onclick="userMenuList('others');">그 외</a>
					</div>
				</div>
				<br>
				<!-- Total 메뉴 중뷴류 끝! -->

				<!-- 사용자 메뉴 조회 -->
				<!-- <div class="w3-container menu w3-padding-48 w3-card tabcontent"> -->
				<div
					style="text-align: center; margin-left: auto; margin-right: auto;"
					id="userMenuList"></div>
				<!-- </div> -->
			</div>
		</div>
	</div>


	<!-- ------------------------------------------------------------ -->
	<!-- Modal 클릭했으면 화면이 위에서 나오는것  첫 아메리카노만 만듬 나중에  for문 , index로 이미지 네임줘서  적용할거임 적용할거임 기능만 구현함  -->
	<!--  <a href="#" data-toggle="modal" data-target="#myModal"><img src="image/americano.jpg" alt="americano" style="width:70%"></a>
      <h3>아메리카노  모달기능됨</h3>
       <h4>￦ 3,000</h4> -->

	<div class="modal fade" id="menu-dt">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">CAFE HEAVEN</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				<!--  이미지 경로 나중에 바꿀거임 -->
				<div class="modal-body">
					<!--  modal의 50%은 사진  -->
					<!-- 나중에 db로 정보 받아오기 이미지나-->
					<div id="userMenuListModalImg"
						style="float: left; width: 50%; height: 250px; padding-left: 4px; padding-right: 4px;">

					</div>
					<div id="userMenuListModal"
						style="float: right; width: 50%; height: 250px; padding-left: 4px; padding-right: 4px;">

					</div>
					<div class="modal-footer" style="clear: both;">
						<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
					</div>
					<input type="hidden" id="orderUserNo" value="<%=userNo %>" />
				</div>
			</div>
		</div>
	</div>
	<!-- 메뉴 탭 -->
	<!-- 디폴트로 열려 있는 탭 시작 -->
	<!-- <script>
		document.getElementById("defaultMajorOpen").click();
		document.getElementById("defaultMenuOpen").click();
	</script> -->
	<!-- 디폴트로 열려 있는 탭 끝 -->

	<!-- 대분류 탭 시작 -->
	<!-- <script>
		function openMajor(evt, majorName) {
			// 모든 변수 선언
			var i, tabcontent, tablinks;
			// 
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			//
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" active", "");
			}
			//
			document.getElementById(majorName).style.display = "block";
			evt.currentTarget.className += " active";
		}
	</script> -->
	<!-- 대분류 탭 끝 -->

	<!-- 중분류 탭 시작 -->
	<script>
		// 모든 변수 선언
		function openMenu(evt, menuName) {
			var i, x, tablinks;
			x = document.getElementsByClassName("menu");
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablink");
			for (i = 0; i < x.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" w3-dark-grey", "");
			}
			document.getElementById(menuName).style.display = "block";
			evt.currentTarget.firstElementChild.className += " w3-dark-grey";
		}
		document.getElementById("myLink").click();
	</script>
	<!-- 중분류 탭 끝 -->

</body>
</html>