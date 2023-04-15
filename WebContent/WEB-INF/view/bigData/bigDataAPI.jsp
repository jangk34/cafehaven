<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
//bigDataTest
//시도
$(function(){
	
		//선택된 시도의 값////////////////////////////////////////////////////////
		var	sido=$('select[name=sido]');
		var gugun=$('select[name=gugun]');
		var dong=$('select[name=dong]');
		var	radius=$('select[name=radius]');
	 	
	sido.change(function(){
		//시도 값 텍스트
		var sidoCode = sido.val();
		var	sidoText=$('select[name=sido] option:selected').text();
		gugunFind(sidoCode);
		$('#sidoVal').val(sidoText);
	});
	gugun.change(function(){
		//선택된 구군의 텍스트
		var gugunCode = gugun.val();
		var	gugunText=$('select[name=gugun] option:selected').text();
		dongFind(gugunCode);	
		$('#gugunVal').val(gugunText);
	});
	dong.change(function(){
		//선택된 동 텍스트
		var dongCode = dong.val();
		var	dongText=$('select[name=dong] option:selected').text();
		$('#dongVal').val(dongText);
	})
	radius.change(function(){
		var radiusVal=$('select[name=radius] option:selected').val();
		$('#radiusVal').val(radiusVal);
	});

		var sidoCon="";
		var allSido=[];
		$.ajax({
			url:"/sido/sidoSearch.do",
			type:'get',
			success: function(data){
				
				//sidocont
				$.each(data,function(key,value){
					sidoCon+='<option value='+value.ctprvnCd+'>'+value.ctprvnNm+'</option>'
					allSido.push({
						ctprvnNm:value.ctprvnNm,
						ctprvnCd:value.ctprvnCd
					})
				})
				
				sido.html(sidoCon);
				
				//맵과 차트 보여줄거
				$('#clusterChart').click(function(){
						allCafeSido(allSido);
				})
				geoAddr(allSido);
			
			},
			error: function(error){
				alert(error);
			}
		});

	//구군!!!!!!/////////////////////////////////////////////////////
	function gugunFind(sidoCode){
		//구군 
		var gugunCon="";
			$.ajax({
				url:"/gugun/gugunSearch.do",
				type:'get',
				data:{
					'sido':sidoCode
				},
				success: function(data){
					$.each(data,function(key,value){
						gugunCon+='<option value='+value.signguCd+'>'+value.signguNm+'</option>'
					})
					gugun.html(gugunCon);
				},
				error: function(error){
					alert(error);
				}
			});
	}
	
	//동 면읍///////////////////////////////////////////////////
	function dongFind(gugunCode){
		//구군 
		var dong=$('select[name=dong]');
		var dongCon="";
			$.ajax({
				url:"/dong/dongSearch.do",
				type:'get',
				data:{
					'gugun':gugunCode
				},
				success: function(data){
					//sidocont
					$.each(data,function(key,value){
						dongCon+='<option value='+value.adongCd+'>'+value.adongNm+'</option>'
					})
					dong.html(dongCon);
				},
				error: function(error){
					alert(error);
				}
				
			});
	}
	
	
});
//업종별 분류 !!!!!
$(function(){
	
	var big=$('select[name=bigBusiness]');
	var mid=$('select[name=midBusiness]');
	var small=$('select[name=smallBusiness]');
	
	
	big.change(function(){
		var bigCode= big.val();
		//val
		midCgBusiness(bigCode);	
		//텍스트
		var bigVal=$('select[name=bigBusiness] option:selected').val();
		$('#bigVal').val(bigVal)
		
	})
	mid.change(function(){
		var bigCode= big.val();
		var midCode= mid.val();
		//텍스트
		var midVal=$('select[name=midBusiness] option:selected').val();
		$('#midVal').val(midVal);
		smallCgBusiness(midCode,bigCode);	
	});
	small.change(function(){
		//선택된 동 텍스트
		var	smallVal=$('select[name=smallBusiness] option:selected').val();
		$('#smallVal').val(smallVal);
	})
	//대분류 //////////////////////////////////////////////////////////////////////
	
	var bigCon="";
		$.ajax({
			url:"/cgBusiness/bigSearch.do",
			type:'get',
			success: function(data){
				$.each(data,function(key,value){
					bigCon+='<option value='+value.indsLclsCd+'>'+value.indsLclsNm+'</option>'
				})
				big.html(bigCon);
			},
			error: function(error){
				alert(error);
			}
			
		});

	
	//중분류//////////////////////////////////////////////////////////////////////////////
		function midCgBusiness(bigCode){
			//중분류
			//console.log("중분류 빅코드"+bigCode);
			var midCon="";
				$.ajax({
					url:"/cgBusiness/midSearch.do",
					type:'get',
					data:{
						'bigCode':bigCode
					},
				
					success: function(data){
						$.each(data,function(key,value){
							midCon+='<option value='+value.indsMclsCd+'>'+value.indsMclsNm+'</option>'
						})
						
						mid.html(midCon);
						
					},
					error: function(error){
						alert(error);
					}
					
				});
		}
		
		// 소분류
		function smallCgBusiness(midCode,bigCode){
	
			var smallCon="";
				$.ajax({
					url:"/cgBusiness/smallSearch.do",
					type:'get',
					data:{
						'midCode':midCode,
						'bigCode':bigCode
					},
					success: function(data){
						$.each(data,function(key,value){
							smallCon+='<option value='+value.indsSclsCd+'>'+value.indsSclsNm+'</option>'
						})
						small.html(smallCon);
					},
					error: function(error){
						alert(error);
					}
					
				});
		}
});
//업종별 분포도 //서울 몇개 경기도 ~시  몇개ajax 
//업종 지역별 
	function regionList(){
		alert('일단 제이쿼리');	
		//divId는 분류 코드 
		//indsLclsCd
		//indsMclsCd
		//indsSclsCd
		
		var divId=$('select[name=businessCg]').val();
		var keys=$('select[name=bigBusiness]').val();
		
		if(divId=='indsLclsCd'){
			var key=$('select[name=bigBusiness]').val();
			$.ajax({
				url:"/bigData/bsCgDistribution.do",
				type:'get',
				contentType: "application/json",
				data:{
					
					"divId":divId,
					"key":key
				},
				success: function(data){

				},
				error: function(error){
					alert(error);
				}
				
			})
		}else if(divId=='indsMclsCd'){
			var key=$('select[name=midBusiness]').val();
			$.ajax({
			
				url:"/bigData/bsCgDistribution.do",
				type:'get',
				contentType: "application/json",
				data:{
					
					"divId":divId,
					"key":key
				},
				success: function(data){
					console.log(data);
				},
				error: function(error){
					alert(error);
				}
				
			})
		}else if(divId=='indsSclsCd'){
			var key=$('select[name=smallBusiness]').val();
			$.ajax({
			
				url:"/bigData/bsCgDistribution.do",
				type:'get',
				contentType: "application/json",
				data:{
					
					"divId":divId,
					"key":key
				},
				success: function(data){
				},
				error: function(error){
					alert(error);
				}
				
			})
		}
	
	}
	
	


//좌표 찍기 해야될것은 근처 상권 조회   // 시도 시군구 동 코드 받아서



</script>