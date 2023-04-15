<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43345c9ebcab9cfdb9af11b8112451b4&libraries=services"></script>
			<script src="http://dmaps.daum.net/map_js_init/v3.js"
					type="text/javascript"></script>

				<!-- 전국카페 지도  -->
				<script>	
				<!--지도-->
			//	var sidoGeo=[];	//시도의 좌표를 받을 배열
				//좌표변환
			 	function geoAddr(allSido){
			 		//JSONObject jsonObj = new JSONObject();
			 			//시도의 좌표를 받을 배열
			 		var sidoGeo=[];
			 		var total= allSido.length;//시도  갯수
			 		var counter=0;
			 		var geocoder = new daum.maps.services.Geocoder();
							var callback = function(result, status) {
								counter++;
								//console.log(counter)
							    if (status === daum.maps.services.Status.OK) {
							    		 var cy=result[0].y;
								         var cx=result[0].x;
								       		sidoGeo.push({
												title:result[0].address_name,
												latlng:new daum.maps.LatLng(cy, cx)
								       		})
								       	 if(total===counter){
												allCafeMap(sidoGeo,allSido);
								       	}
							    	}; 
							    		
							        return result;
									
							    }
							for(var i = 0 ; i<total;i++){
								geocoder.addressSearch(allSido[i].ctprvnNm, callback);	
							}
						};
						//구군 주소 좌표 변환
					 	function geoAddrGugun(addr,allGugun,pos){
					 		//JSONObject jsonObj = new JSONObject();
					 			//시도의 좌표를 받을 배열
					 		var gugunGeo=[];
					 		var total= allGugun.length;//시도  갯수
					 		var counter=0;
					 		
					 		var geocoder = new daum.maps.services.Geocoder();
									var callback = function(result, status) {
										counter++;
										//console.log(counter)
									    if (status === daum.maps.services.Status.OK) {
									    		 var cy=result[0].y;
										         var cx=result[0].x;
										       		gugunGeo.push({
														title:result[0].address_name,
														latlng:new daum.maps.LatLng(cy, cx)
										       		});
										       	 if(total===counter){
										       		allCafeGugunMap(allGugun,gugunGeo,pos,addr);
														//console.log(sidoGeo)
										       	}
									    	}; 
									    		
									        return result;
											
									    }
									for(var i = 0 ; i<total;i++){
										geocoder.addressSearch(addr+" "+allGugun[i].signguNm, callback);	
									}
								}; 
						//동 좌표변환
						//구군 주소 좌표 변환
					 	function geoAddrDong(addr,addrG,allDong,pos){
					 		//JSONObject jsonObj = new JSONObject();
					 			//시도의 좌표를 받을 배열
					 		var dongGeo=[];
					 		var total= allDong.length;//시도  갯수
					 		var counter=0;
					 		
					 		var geocoder = new daum.maps.services.Geocoder();
									var callback = function(result, status) {
										counter++;
										//console.log(counter)
									    if (status === daum.maps.services.Status.OK) {
									    		 var cy=result[0].y;
										         var cx=result[0].x;
										       		dongGeo.push({
														title:result[0].address_name,
														latlng:new daum.maps.LatLng(cy, cx)
										       		});
										       	 if(total===counter){
										       		allCafeDongMap(allDong,dongGeo,pos);
														//console.log(sidoGeo)
										       	}
									    	}; 
									    		
									        return result;
											
									    }
									for(var i = 0 ; i<total;i++){
										geocoder.addressSearch(addr+" "+addrG+" "+allDong[i].adongNm, callback);	
									}
								}; 
						
								
				function allCafeMap(sidoGeo,allSido){
					//확인
					var mapContainer = document.getElementById('map1'), // 지도를 표시할 div 
				    mapOption = { 
				        center: new daum.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표
				        level: 13 // 지도의 확대 레벨
				    };
					// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
					var map = new daum.maps.Map(mapContainer, mapOption); 
					var positions=sidoGeo;
					//마커를 표시할 위치와 title  객체 배열
					//console.log(positions[0].latlng)
					//마커는 나중에 css 로 만들거임 
					// 마커 이미지의 이미지 주소입니다
					var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
					
					$.each(positions,function(i){
						var imageSize = new daum.maps.Size(24,35);
						 // 마커 이미지를 생성합니다    
					    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
								 
					    // 마커를 생성합니다
					    var marker = new daum.maps.Marker({
					        map: map, // 마커를 표시할 지도
					        position: positions[i].latlng, // 마커를 표시할 위치
					        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					        image : markerImage // 마커 이미지 
					    });
						    daum.maps.event.addListener(marker,'click',function(){
								allCafeGugun(marker,allSido);
								
							})
						})
					  
					}
				
				function allCafeGugun(marker,allSido){
					//$('#sidoMapVal').val(marker.Xd);
					
					//나중에 charAt으로 바꿀거
					var addr="";
					if(marker.Xd=="강원"){
						addr="강원도";
					}else if(marker.Xd=="경기"){
						addr="경기도";
					}else if(marker.Xd=="경북"){
						addr="경상북도";
					}else if(marker.Xd=="대전"){
						addr="대전광역시";
					}else if(marker.Xd=="대구"){
						addr="대구광역시";
					}else if(marker.Xd=="서울"){
						addr="서울특별시";
					}else if(marker.Xd=="인천"){
						addr="인천광역시";
					}else if(marker.Xd=="부산"){
						addr="부산광역시";
					}else if(marker.Xd=="세종특별자치시"){
						addr="세종특별자치시";
					}else if(marker.Xd=="전북"){
						addr="전라북도";
					}else if(marker.Xd=="울산"){
						addr="울산광역시";
					}else if(marker.Xd=="제주특별자치도"){
						addr="제주특별자치도";
					}else if(marker.Xd=="전남"){
						addr="전라남도";
					}else if(marker.Xd=="전남"){
						addr="전라남도";
					}else if(marker.Xd=="충남"){
						addr="충청남도";
					}else if(marker.Xd=="충북"){
						addr="충청북도";
					}
					var sidoMap=$('#sidoMapVal').val(marker.Xd);
					var sidoCode="";
					var allGugun=[];
					for(var i = 0 ;i< allSido.length;i++)
					if(addr==allSido[i].ctprvnNm){
						sidoCode=allSido[i].ctprvnCd;
						pos=marker.getPosition();
						//console.log(allSido[i].ctprvnCd)
					 	$.ajax({
							url:"/gugun/gugunSearch.do",
							type:'get',
							data:{
								'sido':sidoCode
							},
							success:function(data){
						 	 	$.each(data,function(key,value){
								allGugun.push({
									signguNm:value.signguNm,
									signguCd:value.signguCd
								})
							})
								geoAddrGugun(addr,allGugun,pos); 
								allCafeGugunAjax(allGugun,addr);
							},
							error:function(error){
								alert(error)
							}
						}) 
					}					
					
				}
				
		 		function allCafeGugunMap(allGugun,gugunGeo,pos,addr){
		 			//확인
					var mapContainer = document.getElementById('map1'), // 지도를 표시할 div 
				    mapOption = { 
				        center: pos, // 지도의 중심좌표
				        level: 9 // 지도의 확대 레벨
				    };
					// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
					var map = new daum.maps.Map(mapContainer, mapOption); 
					var positions=gugunGeo;
					//마커를 표시할 위치와 title  객체 배열
					//console.log(positions[0].latlng)
					//마커는 나중에 css 로 만들거임 
					// 마커 이미지의 이미지 주소입니다
					var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
					
					$.each(positions,function(i){
						var imageSize = new daum.maps.Size(24,35);
						 // 마커 이미지를 생성합니다    
					    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
								 
					    // 마커를 생성합니다
					    var marker = new daum.maps.Marker({
					        map: map, // 마커를 표시할 지도
					        position: positions[i].latlng, // 마커를 표시할 위치
					        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					        image : markerImage // 마커 이미지 
					    });
					    daum.maps.event.addListener(marker,'click',function(){
							allCafeDong(marker,allGugun,addr);
						})
						// 마커가 지도 위에 표시되도록 설정합니다
						marker.setMap(map);
					}); 
		 		}
		 			//cafeDong
		 			function allCafeDong(marker,allGugun,addr){
		 				var gugunCode="";
		 				var addrG='';
						var allDong=[];
						var beforeStr = marker.Xd;
						var afterStr = beforeStr.split(' ');
						var gugunNm='';
						
						// 구군 만 뽑아내는 if문
						if(afterStr[1]!=null&&afterStr[2]==null){
							gugunNm=afterStr[1];
						}else if(afterStr[1]!=null&&afterStr[2]!=null){
							gugunNm=afterStr[1]+" "+afterStr[2];
						}
						
		 				for(var i = 0; i<allGugun.length;i++){
		 					if(gugunNm==allGugun[i].signguNm){
		 						addrG=gugunNm;
		 						gugunCode=allGugun[i].signguCd;
								pos=marker.getPosition();
							 	$.ajax({
									url:"/dong/dongSearch.do",
									type:'get',
									data:{
										'gugun':gugunCode
									},
									success:function(data){
								 	 	$.each(data,function(key,value){
										allDong.push({
											adongNm:value.adongNm,
											adongCd:value.adongCd
										})
									})
										geoAddrDong(addr,addrG,allDong,pos); 
										allCafeDongAjax(allDong,addrG,addr);
									},
									error:function(error){
										alert(error)
									}
								}) 
		 					}
		 				}
		 			}
		 			//allCafeDongMap
		 			function allCafeDongMap(allDong,dongGeo,pos){
		 	 			//확인
						var mapContainer = document.getElementById('map1'), // 지도를 표시할 div 
					    mapOption = { 
					        center: pos, // 지도의 중심좌표
					        level: 6 // 지도의 확대 레벨
					    };
						// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
						var map = new daum.maps.Map(mapContainer, mapOption); 
						var positions=dongGeo;
						//마커를 표시할 위치와 title  객체 배열
						//console.log(positions[0].latlng)
						//마커는 나중에 css 로 만들거임 
						// 마커 이미지의 이미지 주소입니다
						var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
						
						$.each(positions,function(i){
							var imageSize = new daum.maps.Size(24,35);
							 // 마커 이미지를 생성합니다    
						    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
									 
						    // 마커를 생성합니다
						    var marker = new daum.maps.Marker({
						        map: map, // 마커를 표시할 지도
						        position: positions[i].latlng, // 마커를 표시할 위치
						        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						        image : markerImage // 마커 이미지 
						    });
		 				});
		 			}
					
					//시도에 관한 상가 개수 total count 
					
					function allCafeSido(allSido){
						var cont="";
						var conTextBody="";
						var totalCountSum=parseInt("0");
						var cafeRegNm=new Array();
						var cafeRegTotal=new Array();
						var cafePercent=new Array();
						
						var colorArr = ["#ff6384","#ff9f40","#ffcd56","#4bc0c0","#36a2eb","#9966ff","#c9cbcf"
			                ,"#ff6384","#ff9f40","#ffcd56","#4bc0c0","#36a2eb","#9966ff","#c9cbcf"
			                ,"#ff6384","#ff9f40","#ffcd56","#4bc0c0","#36a2eb","#9966ff","#c9cbcf"
			                ,"#ff6384","#ff9f40","#ffcd56","#4bc0c0","#36a2eb","#9966ff","#c9cbcf"
			                ];
						var barColorArr=[ 'rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)','rgba(255, 206, 86, 0.2)','rgba(75, 192, 192, 0.2)','rgba(153, 102, 255, 0.2)','rgba(255, 159, 64, 0.2)',
							'rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)','rgba(255, 206, 86, 0.2)','rgba(75, 192, 192, 0.2)','rgba(153, 102, 255, 0.2)','rgba(255, 159, 64, 0.2)',
							'rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)','rgba(255, 206, 86, 0.2)','rgba(75, 192, 192, 0.2)','rgba(153, 102, 255, 0.2)','rgba(255, 159, 64, 0.2)',
							'rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)','rgba(255, 206, 86, 0.2)','rgba(75, 192, 192, 0.2)','rgba(153, 102, 255, 0.2)','rgba(255, 159, 64, 0.2)'
							];
						var barBdColorArr=['rgba(255,99,132,1)','rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)','rgba(255, 159, 64, 1)',
							'rgba(255,99,132,1)','rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)','rgba(255, 159, 64, 1)',
							'rgba(255,99,132,1)','rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)','rgba(255, 159, 64, 1)',
							'rgba(255,99,132,1)','rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)','rgba(255, 159, 64, 1)'
							
							]
								          $.ajax({
									        	url:"/bigData/allCafeSido.do",
									        	type:"post",
									        	 contentType : "application/json; charset=utf-8",
									        	data:JSON.stringify(allSido),
									        	success:function(data){
												for (var i = 0 ; i<data.length; i++){
													totalCountSum+=parseInt(data[i].totalCount);
													cafeRegNm.push(data[i].ctprvnNm);
													cafeRegTotal.push(data[i].totalCount);
													
												}
												var color=new Array();
												var barColor=new Array();
												var barBdColor=new Array();
												var result='';
												for(var i = 0 ; i<cafeRegNm.length;i++){
													color.push(colorArr[i]);
													barColor.push(barColorArr[i]);
													barBdColor.push(barBdColorArr[i]);
													cafePercent.push(((parseInt(data[i].totalCount)/totalCountSum)*100).toFixed(2));
													//이거 나중에 면적 구해와서 할거임
													if((parseInt(data[i].totalCount))>10000){
														result='<h5 style="color:red">많음</h5>'
													}else if((parseInt(data[i].totalCount))>3000){
														result='<h5 style="color:green">적절</h5>'
													}else{
														result='<h5 style="color:blue">적음</h5>'
													}
													conTextBody+='<tr style="text-align:center">'
													conTextBody+='<td>'+data[i].ctprvnNm+'</td>'
													conTextBody+='<td>'+data[i].totalCount+'</td>'
													conTextBody+='<td>'+((parseInt(data[i].totalCount)/totalCountSum)*100).toFixed(2)+'</td>'
													conTextBody+='<td>'+result+'</td>'
													conTextBody+='</tr>'
												}
													cont+="<div style='text-align:center; padding-top:10px'><h4><b>전국 카페 지역별 비율</b></h4></div>"
													cont+="<div id='chartHs' style='max-width:500px; margin:auto'>";
													cont+="<canvas id='cafeChart' width='500' height='500' style='display:block; width:500px; height:500px; margin:auto'></canvas>";
													cont+="</div>";
													cont+="<div id='barHs' style='max-width:500px; margin:auto'>";
													cont+="<canvas id='barChart' width='500' height='500' style='display:block; width:500px; height:500px; margin:auto'></canvas>";
													cont+="</div>";
													cont+='<table id="tableHs" ><tr style="background-color:#f6f5ef;text-align:center"><td><h4>지역</h4></td><td><h4>상권 개수</h4></td><td><h4>분포율</h4></td><td><h4>밀집도</h4></td></tr>'+conTextBody+'</table>';
													cont+="<div class='col-sm-12'>";
													cont+='<div style="width:33% ;float:left;" class="regButton btn-5 taCp" onclick="chartHs(&#39;table&#39;)" >테이블</div>';
													cont+='<div style="width:33% ;float:left;" class="regButton btn-5 taCp" onclick="chartHs(&#39;circle&#39;)" >원형차트</div>';
													cont+='<div style="width:33% ;float:left;" class="regButton btn-5 taCp" onclick="chartHs(&#39;bar&#39;)">막대차트</div>';
													cont+="</div>";
													cont+="<div class='col-sm-12'>";
													cont+="<div style='margin:auto; width:50%;float:left;' class='regButton btn-5 taCp'onclick='bigdataReset()'>초기화</div>"
													cont+="<div style='margin:auto; width:50%' class='regButton btn-5 taCp' id='clusterChart'>검색</div>";
													cont+="</div>";
											
													
													//텍스트 만들기 테이블 
													$('#showChart').html(cont);
													$('#barHs').hide();
													$('#chartHs').hide();
												
													cafeDstChart(cafeRegNm,cafeRegTotal,color,cafePercent);
													cafeBarChart(cafeRegNm,cafeRegTotal,color,cafePercent,barColor,barBdColor);
													//geoAddr(cafeRegNm);
									    
									        	},
									        	error:function(error){
									        		alert("잘못 조회 하셨습니다.")
									        	} 
							    		});  
						
						
					}
					
					
					
		///////////////구군Ajax
					function allCafeGugunAjax(allGugun,addr){
						var cont="";
						var conTextBody="";
						var totalCountSum=parseInt("0");
						var cafeRegNm=new Array();
						var cafeRegTotal=new Array();
						var cafePercent=new Array();
						
						var colorArr = ["#ff6384","#ff9f40","#ffcd56","#4bc0c0","#36a2eb","#9966ff","#c9cbcf"
			                ,"#ff6384","#ff9f40","#ffcd56","#4bc0c0","#36a2eb","#9966ff","#c9cbcf"
			                ,"#ff6384","#ff9f40","#ffcd56","#4bc0c0","#36a2eb","#9966ff","#c9cbcf"
			                ,"#ff6384","#ff9f40","#ffcd56","#4bc0c0","#36a2eb","#9966ff","#c9cbcf"
			                ,"#ff6384","#ff9f40","#ffcd56","#4bc0c0","#36a2eb","#9966ff","#c9cbcf"
			                ,"#ff6384","#ff9f40","#ffcd56","#4bc0c0","#36a2eb","#9966ff","#c9cbcf"
			                ,"#ff6384","#ff9f40","#ffcd56","#4bc0c0","#36a2eb","#9966ff","#c9cbcf"
			                ,"#ff6384","#ff9f40","#ffcd56","#4bc0c0","#36a2eb","#9966ff","#c9cbcf"
			                ];
						var barColorArr=[ 'rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)','rgba(255, 206, 86, 0.2)','rgba(75, 192, 192, 0.2)','rgba(153, 102, 255, 0.2)','rgba(255, 159, 64, 0.2)',
							'rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)','rgba(255, 206, 86, 0.2)','rgba(75, 192, 192, 0.2)','rgba(153, 102, 255, 0.2)','rgba(255, 159, 64, 0.2)',
							'rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)','rgba(255, 206, 86, 0.2)','rgba(75, 192, 192, 0.2)','rgba(153, 102, 255, 0.2)','rgba(255, 159, 64, 0.2)',
							'rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)','rgba(255, 206, 86, 0.2)','rgba(75, 192, 192, 0.2)','rgba(153, 102, 255, 0.2)','rgba(255, 159, 64, 0.2)',
							'rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)','rgba(255, 206, 86, 0.2)','rgba(75, 192, 192, 0.2)','rgba(153, 102, 255, 0.2)','rgba(255, 159, 64, 0.2)',
							'rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)','rgba(255, 206, 86, 0.2)','rgba(75, 192, 192, 0.2)','rgba(153, 102, 255, 0.2)','rgba(255, 159, 64, 0.2)',
							'rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)','rgba(255, 206, 86, 0.2)','rgba(75, 192, 192, 0.2)','rgba(153, 102, 255, 0.2)','rgba(255, 159, 64, 0.2)'
							];
						var barBdColorArr=['rgba(255,99,132,1)','rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)','rgba(255, 159, 64, 1)',
							'rgba(255,99,132,1)','rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)','rgba(255, 159, 64, 1)',
							'rgba(255,99,132,1)','rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)','rgba(255, 159, 64, 1)',
							'rgba(255,99,132,1)','rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)','rgba(255, 159, 64, 1)',
							'rgba(255,99,132,1)','rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)','rgba(255, 159, 64, 1)',
							'rgba(255,99,132,1)','rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)','rgba(255, 159, 64, 1)',
							'rgba(255,99,132,1)','rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)','rgba(255, 159, 64, 1)'
							]
								          $.ajax({
									        	url:"/bigData/allCafeGugun.do",
									        	type:"post",
									        	 contentType : "application/json; charset=utf-8",
									        	data:JSON.stringify(allGugun),
									        	success:function(data){
												for (var i = 0 ; i<data.length; i++){
													totalCountSum+=parseInt(data[i].totalCount);
													cafeRegNm.push(data[i].signguNm);
													cafeRegTotal.push(data[i].totalCount);
												}
												var color=new Array();
												var barColor=new Array();
												var barBdColor=new Array();
												var result='';
												for(var i = 0 ; i<cafeRegNm.length;i++){
													color.push(colorArr[i]);
													barColor.push(barColorArr[i]);
													barBdColor.push(barBdColorArr[i]);
													cafePercent.push(((parseInt(data[i].totalCount)/totalCountSum)*100).toFixed(2));
													//이거 나중에 면적 구해와서 할거임
													if((parseInt(data[i].totalCount))>=1000){
														result='<h5 style="color:red">많음</h5>'
													}else if((parseInt(data[i].totalCount))>=500){
														result='<h5 style="color:green">적절</h5>'
													}else{
														result='<h5 style="color:blue">적음</h5>'
													}
													conTextBody+='<tr style="text-align:center">'
													conTextBody+='<td>'+addr+" "+data[i].signguNm+'</td>'
													conTextBody+='<td>'+data[i].totalCount+'</td>'
													conTextBody+='<td>'+((parseInt(data[i].totalCount)/totalCountSum)*100).toFixed(2)+'</td>'
													conTextBody+='<td>'+result+'</td>'
													conTextBody+='</tr>'
												}
													cont+="<div style='text-align:center; padding-top:10px'><h4><b>"+addr+" 카페 지역별 비율</b></h4></div>"
													cont+="<div id='chartHs' style='max-width:500px; margin:auto'>";
													cont+="<canvas id='cafeChart' width='500' height='500' style='display:block; width:500px; height:500px; margin:auto'></canvas>";
													cont+="</div>";
													cont+="<div id='barHs' style='max-width:500px; margin:auto'>";
													cont+="<canvas id='barChart' width='500' height='500' style='display:block; width:500px; height:500px; margin:auto'></canvas>";
													cont+="</div>";
													cont+='<table id="tableHs" ><tr style="background-color:#f6f5ef;text-align:center"><td><h4>지역</h4></td><td><h4>상권 개수</h4></td><td><h4>분포율</h4></td><td><h4>밀집도</h4></td></tr>'+conTextBody+'</table>';
													cont+="<div class='col-sm-12'>";
													cont+='<div style="width:33% ;float:left;" class="regButton btn-5 taCp" onclick="chartHs(&#39;table&#39;)" >테이블</div>';
													cont+='<div style="width:33% ;float:left;" class="regButton btn-5 taCp" onclick="chartHs(&#39;circle&#39;)" >원형차트</div>';
													cont+='<div style="width:33% ;float:left;" class="regButton btn-5 taCp" onclick="chartHs(&#39;bar&#39;)">막대차트</div>';
													cont+="</div>";
													cont+="<div class='col-sm-12'>";
													cont+="<div style='margin:auto; width:50%;float:left;' class='regButton btn-5 taCp'onclick='bigdataReset()'>초기화</div>"
													cont+="<div style='margin:auto; width:50%' class='regButton btn-5 taCp' id='clusterChart'>검색</div>";
													cont+="</div>";
											
													//텍스트 만들기 테이블 
													$('#showChart').html(cont);
													$('#barHs').hide();
													$('#chartHs').hide();
												
													cafeDstChart(cafeRegNm,cafeRegTotal,color,cafePercent);
													cafeBarChart(cafeRegNm,cafeRegTotal,color,cafePercent,barColor,barBdColor);
									        	},
									        	error:function(error){
									        		alert("잘못 조회 하셨습니다.")
									        	} 
							    		});  
						
						
					}
					//////////////동Ajax
					function allCafeDongAjax(allDong,addrG,addr){
						var cont="";
						var conTextBody="";
						var totalCountSum=parseInt("0");
						var cafeRegNm=new Array();
						var cafeRegTotal=new Array();
						var cafePercent=new Array();
						
						var colorArr = ["#ff6384","#ff9f40","#ffcd56","#4bc0c0","#36a2eb","#9966ff","#c9cbcf"
			                ,"#ff6384","#ff9f40","#ffcd56","#4bc0c0","#36a2eb","#9966ff","#c9cbcf"
			                ,"#ff6384","#ff9f40","#ffcd56","#4bc0c0","#36a2eb","#9966ff","#c9cbcf"
			                ,"#ff6384","#ff9f40","#ffcd56","#4bc0c0","#36a2eb","#9966ff","#c9cbcf"
			                ,"#ff6384","#ff9f40","#ffcd56","#4bc0c0","#36a2eb","#9966ff","#c9cbcf"
			                ,"#ff6384","#ff9f40","#ffcd56","#4bc0c0","#36a2eb","#9966ff","#c9cbcf"
			                ,"#ff6384","#ff9f40","#ffcd56","#4bc0c0","#36a2eb","#9966ff","#c9cbcf"
			                ,"#ff6384","#ff9f40","#ffcd56","#4bc0c0","#36a2eb","#9966ff","#c9cbcf"
			                ];
						var barColorArr=[ 'rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)','rgba(255, 206, 86, 0.2)','rgba(75, 192, 192, 0.2)','rgba(153, 102, 255, 0.2)','rgba(255, 159, 64, 0.2)',
							'rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)','rgba(255, 206, 86, 0.2)','rgba(75, 192, 192, 0.2)','rgba(153, 102, 255, 0.2)','rgba(255, 159, 64, 0.2)',
							'rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)','rgba(255, 206, 86, 0.2)','rgba(75, 192, 192, 0.2)','rgba(153, 102, 255, 0.2)','rgba(255, 159, 64, 0.2)',
							'rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)','rgba(255, 206, 86, 0.2)','rgba(75, 192, 192, 0.2)','rgba(153, 102, 255, 0.2)','rgba(255, 159, 64, 0.2)',
							'rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)','rgba(255, 206, 86, 0.2)','rgba(75, 192, 192, 0.2)','rgba(153, 102, 255, 0.2)','rgba(255, 159, 64, 0.2)',
							'rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)','rgba(255, 206, 86, 0.2)','rgba(75, 192, 192, 0.2)','rgba(153, 102, 255, 0.2)','rgba(255, 159, 64, 0.2)',
							'rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)','rgba(255, 206, 86, 0.2)','rgba(75, 192, 192, 0.2)','rgba(153, 102, 255, 0.2)','rgba(255, 159, 64, 0.2)'
							];
						var barBdColorArr=['rgba(255,99,132,1)','rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)','rgba(255, 159, 64, 1)',
							'rgba(255,99,132,1)','rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)','rgba(255, 159, 64, 1)',
							'rgba(255,99,132,1)','rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)','rgba(255, 159, 64, 1)',
							'rgba(255,99,132,1)','rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)','rgba(255, 159, 64, 1)',
							'rgba(255,99,132,1)','rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)','rgba(255, 159, 64, 1)',
							'rgba(255,99,132,1)','rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)','rgba(255, 159, 64, 1)',
							'rgba(255,99,132,1)','rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)','rgba(255, 159, 64, 1)'
							]
								          $.ajax({
									        	url:"/bigData/allCafeDong.do",
									        	type:"post",
									        	 contentType : "application/json; charset=utf-8",
									        	data:JSON.stringify(allDong),
									        	success:function(data){
									        		console.log(data)
												for (var i = 0 ; i<data.length; i++){
													totalCountSum+=parseInt(data[i].totalCount);
													cafeRegNm.push(data[i].adongNm);
													cafeRegTotal.push(data[i].totalCount);
												}
												var color=new Array();
												var barColor=new Array();
												var barBdColor=new Array();
												var result='';
												for(var i = 0 ; i<cafeRegNm.length;i++){
													color.push(colorArr[i]);
													barColor.push(barColorArr[i]);
													barBdColor.push(barBdColorArr[i]);
													cafePercent.push(((parseInt(data[i].totalCount)/totalCountSum)*100).toFixed(2));
													//이거 나중에 면적 구해와서 할거임
													if((parseInt(data[i].totalCount))>=100){
														result='<h5 style="color:red">많음</h5>'
													}else if((parseInt(data[i].totalCount))>=50){
														result='<h5 style="color:green">적절</h5>'
													}else{
														result='<h5 style="color:blue">적음</h5>'
													}
													conTextBody+='<tr style="text-align:center">'
													conTextBody+='<td>'+addr+" "+addrG+" "+data[i].adongNm+'</td>'
													conTextBody+='<td>'+data[i].totalCount+'</td>'
													conTextBody+='<td>'+((parseInt(data[i].totalCount)/totalCountSum)*100).toFixed(2)+'</td>'
													conTextBody+='<td>'+result+'</td>'
													conTextBody+='</tr>'
												}
													cont+="<div style='text-align:center; padding-top:10px'><h4><b>"+addr+" "+addrG+"카페 지역별 비율</b></h4></div>"
													cont+="<div id='chartHs' style='max-width:500px; margin:auto'>";
													cont+="<canvas id='cafeChart' width='500' height='500' style='display:block; width:500px; height:500px; margin:auto'></canvas>";
													cont+="</div>";
													cont+="<div id='barHs' style='max-width:500px; margin:auto'>";
													cont+="<canvas id='barChart' width='500' height='500' style='display:block; width:500px; height:500px; margin:auto'></canvas>";
													cont+="</div>";
													cont+='<table id="tableHs" ><tr style="background-color:#f6f5ef;text-align:center"><td><h4>지역</h4></td><td><h4>상권 개수</h4></td><td><h4>분포율</h4></td><td><h4>밀집도</h4></td></tr>'+conTextBody+'</table>';
													cont+="<div class='col-sm-12'>";
													cont+='<div style="width:33% ;float:left;" class="regButton btn-5 taCp" onclick="chartHs(&#39;table&#39;)" >테이블</div>';
													cont+='<div style="width:33% ;float:left;" class="regButton btn-5 taCp" onclick="chartHs(&#39;circle&#39;)" >원형차트</div>';
													cont+='<div style="width:33% ;float:left;" class="regButton btn-5 taCp" onclick="chartHs(&#39;bar&#39;)">막대차트</div>';
													cont+="</div>";
													cont+="<div class='col-sm-12'>";
													cont+="<div style='margin:auto; width:50%;float:left;' class='regButton btn-5 taCp'onclick='bigdataReset()'>초기화</div>"
													cont+="<div style='margin:auto; width:50%' class='regButton btn-5 taCp' id='clusterChart'>검색</div>";
													cont+="</div>";
											
													//텍스트 만들기 테이블 
													$('#showChart').html(cont);
													$('#barHs').hide();
													$('#chartHs').hide();
												
													cafeDstChart(cafeRegNm,cafeRegTotal,color,cafePercent);
													cafeBarChart(cafeRegNm,cafeRegTotal,color,cafePercent,barColor,barBdColor);
									        	},
									        	error:function(error){
									        		alert("잘못 조회 하셨습니다.")
									        	} 
							    		});  
						
						
					}
					
					//이부분은 차트 숨기고 보여주는 부분 급해서 ajax 안하고 바로
					function chartHs(shape){
						if(shape=="circle"){
							$('#chartHs').show();
							$('#barHs').hide();
							$('#tableHs').hide();
						}else if(shape=="bar"){
							$('#barHs').show();
							$('#chartHs').hide();
							$('#tableHs').hide();
						}else{
							$('#barHs').hide();
							$('#chartHs').hide();
							$('#tableHs').show();
						}
					}
						
					//카페 분포 원형 차트 
					function cafeDstChart(cafeRegNm,cafeRegTotal,color,cafePercent){
						var ctx = document.getElementById('cafeChart').getContext('2d');
						var myPieChart = new Chart(ctx,{
						    type: 'doughnut',
						    data: {
						   		datasets:[{
						   			data:cafeRegTotal,
						   			backgroundColor:color
						   		},
						   		{
						   			data:cafePercent,
						   			backgroundColor:color
						   		}
						   		
						   		],
						   		labels:cafeRegNm
						    },
						   
						});
						
					}
				
					
					//카페분포 막대 차트
					function cafeBarChart(cafeRegNm,cafeRegTotal,color,cafePercent,barColor,barBdColor){
						var regNm = cafeRegNm;
						var regTotal = cafeRegTotal;
						var ctx = document.getElementById("barChart").getContext('2d');

						var cafeBarChart = new Chart(ctx, {
							type : 'horizontalBar',
							data : {
								labels : regNm,//지역명
								datasets : [ {
									label : '전국 카페 분포 수',
									data : regTotal,//지역카페 수
									borderWidth : 1,
									backgroundColor : barColor,
									borderColor : barBdColor
								} ,
								]
							},
							options : {

								scales : {
									xAxes : [ {
										ticks : {
											beginAtZero : false
										}
									} ]
								}
							}
						});
					} 
					
					 
				</script>
				
				
				
				
				<!-- 이거는 상권 밀집도--------------------------------------------------------- -->
				<script>
				//분류 분석
				function searchCg(cy,cx,data,radius,bigVal,midVal,smallVal,addr1,addr2,addr3){
					var cont ="";
					//console.log(data.body.items[0].indsLclsCd);
					 var jsonObj=[];
					if(bigVal!=""&&midVal==""&&smallVal==""){
						 for( var i=0; i < data.body.items.length; i++){
		        			 if(data.body.items[i].indsLclsCd==bigVal){
		        				 jsonObj.push({
				        				title:data.body.items[i].bizesNm,
				        				latlng: new daum.maps.LatLng(data.body.items[i].lat, data.body.items[i].lon)
				        			 });
		        			 }
		        		 } 
						 cont+='<div>'+addr1+" "+addr2+" "+addr3+'을/를 중심으로 반경'+radius+'m 총 상권의 개수는 '+jsonObj.length+'입니다 .</div>'	;	
			        	$('#searchResult').html(cont);
					}else if(bigVal!=""&&midVal!=""&&smallVal==""){
						 for( var i=0; i < data.body.items.length; i++){
							 if(data.body.items[i].indsLclsCd==bigVal&&data.body.items[i].indsMclsCd==midVal){
		        				 jsonObj.push({
				        				title:data.body.items[i].bizesNm,
				        				latlng: new daum.maps.LatLng(data.body.items[i].lat, data.body.items[i].lon)
				        			 });
		        			 } 
						 }
						 cont+='<div>'+addr1+" "+addr2+" "+addr3+'을/를 중심으로 반경'+radius+'m 총 상권의 개수는 '+jsonObj.length+'입니다 .</div>'	;	
				        	$('#searchResult').html(cont);
						
					}else if(bigVal!=""&&midVal!=""&&smallVal!=""){
						for( var i=0; i < data.body.items.length; i++){
							 if(data.body.items[i].indsLclsCd==bigVal&&data.body.items[i].indsMclsCd==midVal&&data.body.items[i].indsSclsCd==smallVal){
		        				 jsonObj.push({
				        				title:data.body.items[i].bizesNm,
				        				latlng: new daum.maps.LatLng(data.body.items[i].lat, data.body.items[i].lon)
				        			 });
		        			 } 
						 }
						cont+='<div>'+addr1+" "+addr2+" "+addr3+'을/를 중심으로 반경'+radius+'m 총 상권의 개수는 '+jsonObj.length+'입니다 .</div>'	;	
			        	$('#searchResult').html(cont);
					}else{ 
						for( var i=0; i < data.body.items.length; i++){
				       				 jsonObj.push({
				        				title:data.body.items[i].bizesNm,
				        				latlng: new daum.maps.LatLng(data.body.items[i].lat, data.body.items[i].lon)
		        			 			});
						 }
						cont+='<div>'+addr1+" "+addr2+" "+addr3+'을/를 중심으로 반경'+radius+'m 총 상권의 개수는 '+jsonObj.length+'입니다 .</div>'	;	
			        	$('#searchResult').html(cont);
					}
					mapMarker(cy,cx,jsonObj);
	        	} 
	        	
				
				//시도 좌표 
					function myBigLocData(){
						 $('#map3').hide();	
		        		 $('#map2').show();	
					
					var radius=$('#radiusVal').val();
					var addr1=$('#sidoVal').val();
					var addr2=$('#gugunVal').val();
				 	var addr3=$('#dongVal').val();
					var bigVal=$('#bigVal').val();
					var midVal=$('#midVal').val();
					var smallVal=$('#smallVal').val();
					
					if(radius!=""&&addr1!=""){
				    var geocoder = new daum.maps.services.Geocoder();
					var callback = function(result, status) {
					    if (status === daum.maps.services.Status.OK) {
					    		 var cy=result[0].y;
						         var cx=result[0].x;

						         $.ajax({
							        	url:"/bigData/cafeLocAnalysis.do",
							        	type:"get",
							        	data:{
							        		'cy':cy,
							        		'cx':cx,
							        		'radius':radius
							        	},
							        	success:function(data){
								        	// console.log(data.body.totalCount);
							        		 searchCg(cy,cx,data,radius,bigVal,midVal,smallVal,addr1,addr2,addr3);    
							        		 
							        	},
							        	error:function(error){
							        		alert("잘못 조회 하셨습니다.")
							        	} 
					    		}); 
					         	
					        return result;
					    }
					};
					geocoder.addressSearch(addr1, callback);
					}else{
						alert("조건을 선택해주세요\r\n 안될시 주소  / 반경을 한번 더 클릭해주세요");
						return false;
					}
				}
				//구군
					function myMidLocData(){
						 $('#map3').hide();	
		        		 $('#map2').show();	
						var radius=$('#radiusVal').val();
						var addr1=$('#sidoVal').val();
						var addr2=$('#gugunVal').val();
					 	var addr3=$('#dongVal').val();
						var bigVal=$('#bigVal').val();
						var midVal=$('#midVal').val();
						var smallVal=$('#smallVal').val();
						if(radius!=""&&addr1!=""&&addr2!=""){
						var geocoder = new daum.maps.services.Geocoder();
						var callback = function(result, status) {
						    if (status === daum.maps.services.Status.OK) {
						    	 var cy=result[0].y;
							     var cx=result[0].x;
							     	$.ajax({
								        	url:"/bigData/cafeLocAnalysis.do",
								        	type:"get",
								        	data:{
								        		'cy':cy,
								        		'cx':cx,
								        		'radius':radius
								        	},
								        	success:function(data){
								        		 searchCg(cy,cx,data,radius,bigVal,midVal,smallVal,addr1,addr2,addr3);
								        		
								        		
								        	},
								        	error:function(error){
								        		alert("잘못 조회 하셨습니다.");
								        	}
						    		});
						    
						         
						        return result;
						    }
						};
				
					geocoder.addressSearch(addr1+" "+addr2, callback);
						}else{
							alert("조건을 선택해주세요\r\n 안될시 주소  / 반경을 한번 더 클릭해주세요");
							return false;
						}
					}
				//동
					function mySmallLocData(){
						 $('#map3').hide();	
		        		 $('#map2').show();	
						var radius=$('#radiusVal').val();
						var addr1=$('#sidoVal').val();
						var addr2=$('#gugunVal').val();
					 	var addr3=$('#dongVal').val();
						var bigVal=$('#bigVal').val();
						var midVal=$('#midVal').val();
						var smallVal=$('#smallVal').val();
					 	if(radius!=""&&addr1!=""&&addr2!=""&&addr3!=""){
					 	var geocoder = new daum.maps.services.Geocoder();
						var callback = function(result, status) {
						    if (status === daum.maps.services.Status.OK) {
						    	 var cy=result[0].y;
							     var cx=result[0].x;
							 
						    		 $.ajax({
								        	url:"/bigData/cafeLocAnalysis.do",
								        	type:"get",
								        	data:{
								        		'cy':cy,
								        		'cx':cx,
								        		'radius':radius
								        	},
								        	success:function(data){
								        		 //cont+='<div>'+addr1+'을/를 중심으로 반경'+radius+' 총 상권의 개수는 '+data.body.items.length+'입니다 .</div>';
								        		 //$('#searchResult').html(cont);
								        		 searchCg(cy,cx,data,radius,bigVal,midVal,smallVal,addr1,addr2,addr3);
								        	},
								        	error:function(error){
								        		alert("잘못 조회 하셨습니다.")
								        	}
								        		
						    		});
						        return result;
						    }
						};
						geocoder.addressSearch(addr1+" "+addr2+" "+addr3, callback);
					 	}else{
							alert("조건을 선택해주세요\r\n 안될시 주소  / 반경을 한번 더 클릭해주세요");
							return false;
						}
					 }
				
					function mapMarker(cy,cx,jsonObj){
						var mapContainer = document.getElementById('map2'), // 지도를 표시할 div  
						mapOption = { 
					        center: new daum.maps.LatLng(cy,cx), // 지도의 중심좌표 y,x
					        level: 4 // 지도의 확대 레벨 1~14
					    };
						
						var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
						// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
						var zoomControl = new daum.maps.ZoomControl();
						map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

						// 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
						daum.maps.event.addListener(map, 'zoom_changed', function() {        
						    // 지도의 현재 레벨을 얻어옵니다
						    var level = map.getLevel();
						    
						});
						
						//console.log(jsonObj[0]);
						// 마커를 표시할 위치와 title 객체 배열입니다 
						var positions =jsonObj;
						var center =[
							{	title:'중심위치',
								latlng:new daum.maps.LatLng(cy,cx)}
						]
						$.merge(positions,center);
						//jsonObj;
						// 마커 이미지의 이미지 주소입니다
						var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
						if(positions.length==1){
							 // 마커 이미지의 이미지 크기 입니다
						    var imageSize = new daum.maps.Size(24, 35); 
						    
						    // 마커 이미지를 생성합니다    
						    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
				    
						    // 마커를 생성합니다
						    var marker = new daum.maps.Marker({
						        map: map, // 마커를 표시할 지도
						        position: positions[0].latlng, // 마커를 표시할 위치
						        title : positions[0].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						        image : markerImage // 마커 이미지 
				    		});
						}else if(positions.length>1){
							for (var i = 0; i < positions.length-1; i ++) {
								// 마커 이미지의 이미지 주소입니다
								var imageSrc = "/image/marker.png"; 
								
							    // 마커 이미지의 이미지 크기 입니다
							    var imageSize = new daum.maps.Size(24, 35); 
							    
							    // 마커 이미지를 생성합니다    
							    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
					    
							    // 마커를 생성합니다
							    var marker = new daum.maps.Marker({
							        map: map, // 마커를 표시할 지도
							        position: positions[i].latlng, // 마커를 표시할 위치
							        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
							        image : markerImage // 마커 이미지 
					    		});
							}
							//중심위치
							// 마커 이미지의 이미지 주소입니다
							var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
							
						    // 마커 이미지의 이미지 크기 입니다
						    var imageSize = new daum.maps.Size(24, 35); 
						    
						    // 마커 이미지를 생성합니다    
						    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
				    
						    // 마커를 생성합니다
						    var marker = new daum.maps.Marker({
						        map: map, // 마커를 표시할 지도
						        position: positions[positions.length-1].latlng, // 마커를 표시할 위치
						        title : positions[positions.length-1].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						        image : markerImage // 마커 이미지 
				    		});
							
						}
					}
				
				
					</script>
			<script>
		
			var mapContainer = document.getElementById('map3'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new daum.maps.Map(mapContainer, mapOption); 
			// 마커가 표시될 위치입니다 
			var markerPosition  = new daum.maps.LatLng(33.450701, 126.570667); 

			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
			    position: markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			
			</script>
			
				
			