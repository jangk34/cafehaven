<%@page import="poly.dto.CafeAttachDTO"%>
<%@page import="poly.dto.CafeInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	CafeInfoDTO cDTO = (CafeInfoDTO) request.getAttribute("cDTO");
%>
<!--선언및 매개변수 볼러오기 === ()는 불러올 매개변수값  -->
<%
	CafeAttachDTO caDTO = (CafeAttachDTO) request.getAttribute("caDTO");
%>
<%@ include file="/WEB-INF/view/cssjs.jsp"%>
<%@ include file="/WEB-INF/view/mainCafeTop.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
@media ( min-width : 768px) {
	.psyButton {
		
	}
}
</style>
<script>
$(function(){
	$('#mapp').show();
	$('#img').hide();
	$('#mapjc1').click(function(){
		$('#mapp').show();
		$('#img').hide();
	});
	$('#imgjc1').click(function(){
		$('#mapp').hide();
		$('#img').show();
	});
})
</script>
</head>
<body>

	<div class="container">
		<!-- 상단 -->
		<div class="col-sm-12">
			<button class="col-sm-6 buttoni-blue" id="mapjc1">카페 위치</button>
			<button class="col-sm-6 buttoni-blue" id="imgjc1">카페 정보</button>
		</div>
	</div>

	<!-- 카페정보 내용 -->
	<div id="img">
		<div class="container">
			<div id="img" class="btn btn sucsss" style="width: 100%">
				<div id="img" class="top-photo-areai-wrap">
					<div class="top_photo-areai" style="max-width: 2520px;">

						<!-- <div class="foflick_container"> -->

						<div class="page-header col-sm-12" style="width: 100%">
							<h1 style="float: left">
								카페정보&nbsp;&nbsp;&nbsp;<small>CAFE INFO</small>
							</h1>
						</div>
					</div>

					<img src="/uploadImg/<%=caDTO.getCafeImg()%>"
						style="width: 80%; margin-left: auto; margin-right: auto; display: block;" />
				</div>

			</div>
			<!--이미지 -->
			<!--이미지 불러오기 -->

			<div id="infocontent" class="infocontent">
				<div class="ci_box_areai">

					<div class="ciz_name_areai">

						<input type="text" maxlength="30"
							style="word-break: break-all; width: 100%; border: 0; margin-left: auto; margin-right: auto; display: block; text-align: center;"
							class="name" readonly value="<%=cDTO.getCafeName()%>" />

					</div>
				</div>


				<div class="ci_box_areai"
					style="margin-top: 2%; width: 100%; margin-bottom: 2%">
					<div class="cizinfo_areai">
						<div class="list_cizinfo">

							<!-- <div class="col-sm-12">
		<div class="col-sm-4" style="float:left; text-align:right;"> 
		<img src="/image/cafelo.png" style="width:11%"/></div> -->

							<!-- 전화번호  -->
							<div class="col-sm-12" style="width: 100%">
								<div class="col-sm-4">
									<p style="float: right">TEL :</p>
								</div>
								<div class="col-sm-8">
									<input type="text"
										style="float: left; width: 100%; border: 0; margin-left: auto; margin-right: auto; display: block;"
										readonly value="<%=cDTO.getCafeTel()%>" />
								</div>
							</div>
							<br />

							<!-- 주소  -->
							<div class="col-sm-12" style="width: 100%">
								<div class="col-sm-4">
									<p style="float: right">ADDRES :</p>
								</div>
								<div class="col-sm-8">
									<input type="text"
										style="float: left; width: 100%; border: 0; margin-left: auto; margin-right: auto; display: block;"
										readonly value="<%=cDTO.getCafeAddr1()%>" />
								</div>
							</div>
							<br />

							<!-- 여는 시간  -->
							<div class="col-sm-12" style="width: 100%">
								<div class="col-sm-4">
									<p style="float: right">OPEN TIME :</p>
								</div>
								<div class="col-sm-8">
									<input type="text"
										style="float: left; width: 100%; border: 0; margin-left: auto; margin-right: auto; display: block;"
										readonly value="<%=cDTO.getCafeOpt()%>" />
								</div>
							</div>
							<br />

							<!-- 닫는 시간  -->
							<div class="col-sm-12" style="width: 100%">
								<div class="col-sm-4">
									<p style="float: right">CLOSE TIME :</p>
								</div>
								<div class="col-sm-8">
									<input type="text"
										style="float: left; width: 100%; border: 0; margin-left: auto; margin-right: auto; display: block;"
										readonly value="<%=cDTO.getCafeClt()%>" />
								</div>
							</div>
							<br />

							<!-- 위도 -->
							<div class="col-sm-12" style="width: 100%">
								<div class="col-sm-4">
									<p style="float: right">CLOSE TIME :</p>
								</div>
								<div class="col-sm-8">
									<input type="text"
										style="float: left; width: 100%; border: 0; margin-left: auto; margin-right: auto; display: block;"
										readonly value="<%=cDTO.getCafeLat()%>" />
								</div>
							</div>
							<br />

							<!-- 경도  -->
							<div class="col-sm-12" style="width: 100%">
								<div class="col-sm-4">
									<p style="float: right">CLOSE TIME :</p>
								</div>
								<div class="col-sm-8">
									<input type="text"
										style="float: left; width: 100%; border: 0; margin-left: auto; margin-right: auto; display: block;"
										readonly value="<%=cDTO.getCafeHar()%>" />
								</div>
							</div>
							<br />

							<script>
		function geoFindMe() {
			  var output = document.getElementById("out");

			  if (!navigator.geolocation){
			    output.innerHTML = "<p>사용자의 브라우저는 지오로케이션을 지원하지 않습니다.</p>";
			    return;
			  }

			  function success(position) {
			    var latitude  = position.coords.latitude;
			    var longitude = position.coords.longitude;

			    output.innerHTML = '<p>위도 : ' + latitude + '° <br>경도 : ' + longitude + '°</p>';

			    var img = new Image();
			    img.src = "http://maps.googleapis.com/maps/api/staticmap?center=" + latitude + "," + longitude + "&zoom=13&size=300x300&sensor=false";

			    output.appendChild(img);
			  };

			  function error() {
			    output.innerHTML = "사용자의 위치를 찾을 수 없습니다.";
			  };

			  output.innerHTML = "<p>Locating…</p>";

			  navigator.geolocation.getCurrentPosition(success, error);
			}
		</script>



							<!-- 글 내용 -->

							<div class="col-sm-12" style="width: 100%">
								<div class="col-sm-4">
									<p style="float: right">CONTENT :</p>
								</div>
								<div class="col-sm-8 wrapi">
									<textarea class="autosize" onkeydown="resize(this)"
										onkeyup="resize(this)" name="txt"
										style="cols: 10; float: left; overflow: hidden; resize: none; width: 100%; border: 0; margin-left: auto; margin-right: auto;"><%=cDTO.getCafeContent()%></textarea>

									<script> 
		 function resize(obj) {
			  obj.style.height = "1px";
			  obj.style.height = (12+obj.scrollHeight)+"px";
			}
	    </script>

								</div>
							</div>
							<br />

						</div>
					</div>
				</div>

			</div>
		</div>
	</div>


	<!-- <input type="text" id="sample5_address" placeholder="주소">
<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br> -->

	<div id="mapp" class="container">
		<div class="page-header col-sm-12" style="width: 100%;">
			<h1 style="float: left;">
				카페위치&nbsp;&nbsp;&nbsp;<small>CAFE MAP</small>
			</h1>
		</div>

		<div style="width: 100%">
			<div id="map"
				style="width: 90%; height: 50%; margin-top: 10%; margin-left: 5%"></div>

			<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
			<script
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c09c0f4cae21431cb83a41042bbed743&libraries=services"></script>

			<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch("<%=cDTO.getCafeAddr1()%>", function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === daum.maps.services.Status.OK) {

    var coords = new daum.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new daum.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new daum.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">"<%=cDTO.getCafeName()%>
				"</div>'
												});
										infowindow.open(map, marker);

										// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										map.setCenter(coords);

										map
												.addOverlayMapTypeId(daum.maps.MapTypeId.TRAFFIC);

									}
								});
			</script>

			<!--   <input type="hidden" " />
    <input type="hidden" value="result[0].x" /> -->


			<!-- <!-- 현재위치 위도,경도 -->
			<!-- <p><button onclick="geoFindMe()">현 위치</button></p>
<div id="out"></div>
<script>

function geoFindMe() {
  var output = document.getElementById("out");

  if (!navigator.geolocation){
    output.innerHTML = "<p>사용자의 브라우저는 지오로케이션을 지원하지 않습니다.</p>";
    return;
  }

  function success(position) {
    var latitude  = position.coords.latitude;
    var longitude = position.coords.longitude;

    output.innerHTML = '<p>위도 : ' + latitude + '° <br>경도 : ' + longitude + '°</p>';

    var img = new Image();
    img.src = "http://maps.googleapis.com/maps/api/staticmap?center=" + latitude + "," + longitude + "&zoom=13&size=300x300&sensor=false";

    output.appendChild(img);
  };

  function error() {
    output.innerHTML = "사용자의 위치를 찾을 수 없습니다.";
  };

  output.innerHTML = "<p>Locating…</p>";

  navigator.geolocation.getCurrentPosition(success, error);
}
	
		function geoFindMe() {
			  var output = document.getElementById("out");

			  if (!navigator.geolocation){
			    output.innerHTML = "<p>사용자의 브라우저는 지오로케이션을 지원하지 않습니다.</p>";
			    return;
			  }

			  function success(position) {
			    var latitude  = position.coords.latitude;
			    var longitude = position.coords.longitude;

			    output.innerHTML = '<p>위도 : ' + latitude + '° <br>경도 : ' + longitude + '°</p>';

			    var img = new Image();
			    img.src = "http://maps.googleapis.com/maps/api/staticmap?center=" + latitude + "," + longitude + "&zoom=13&size=300x300&sensor=false";

			    output.appendChild(img);
			  };

			  function error() {
			    output.innerHTML = "사용자의 위치를 찾을 수 없습니다.";
			  };

			  output.innerHTML = "<p>Locating…</p>";

			  navigator.geolocation.getCurrentPosition(success, error);
			}
	
		</script> -->

		</div>


	</div>







	<!-- 지오로케이션  
		<script>
		
	function getLocation() {
  if (navigator.geolocation) { // GPS를 지원하면
    navigator.geolocation.getCurrentPosition(function(position) {
      alert(position.coords.latitude + ' ' + position.coords.longitude);
    }, function(error) {
      console.error(error);
    }, {
      enableHighAccuracy: false,
      maximumAge: 0,
      timeout: Infinity
    });
  } else {
    alert('GPS를 지원하지 않습니다');
  }
}
getLocation();

</script> -->




	<!-- 	일반지도출력
	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c09c0f4cae21431cb83a41042bbed743"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
	</script>
		 -->

	<!--  지도끝 -->
	<!--  본문 카페정보 상단 -->

	<!-- --- -->
</body>
</html>