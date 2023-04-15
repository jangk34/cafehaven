<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(function(){
	//상단 hide show
	$('#regionTypeBs').show();
	$('#myRegionSameBs').hide();
	$('#moveHuman').hide();
	$('#map1').show();//업종별 분포도
	$('#map2').hide();//상권 밀집도
	$('#map3').hide();
	$('#hdshone').click(function(){
		$('#regionTypeBs').show();
		$('#myRegionSameBs').hide();
		$('#moveHuman').hide();
		$('#map1').show();
		$('#map2').hide();
		$('#map3').hide();
	});
	$('#hdshtwo').click(function(){
		$('#myRegionSameBs').show();
		$('#regionTypeBs').hide();
		$('#moveHuman').hide();
		$('#map1').hide();
		$('#map3').show();
		$('#map2').hide();	
	});
})
//중단 지역별 hide show
$(function(){
	var	sido=$('select[name=sido]');
	var gugun=$('select[name=gugun]');
	var dong=$('select[name=dong]');
	var regionCg=$('select[name=regionCg]');
	sido.hide();
	gugun.hide();
	dong.hide();
		regionCg.click(function(){
			//클릭하면 id 바꿀거 조회하기 위해
		if(regionCg.val()=='sido'){
			sido.show();
			gugun.hide();
			dong.hide();
			$('#gugunVal').val("");
			$('#dongVal').val("");
			$('#mapChg').html('<div style="margin:auto; width:33%" class="regButton btn-5 taCp" id="mapDataSearch1" onclick="myBigLocData()">시도검색</div>');
		}else if(regionCg.val()=='gugun'){
			sido.show();
			gugun.show();
			dong.hide();
			$('#dongVal').val("");
			$('#mapChg').html('<div style="margin:auto; width:33%" class="regButton btn-5 taCp" id="mapDataSearch2" onclick="myMidLocData()">구군검색</div>');
		}else if(regionCg.val()=='dong'){
			sido.show();
			gugun.show();
			dong.show();
			$('#mapChg').html('<div style="margin:auto; width:33%" class="regButton btn-5 taCp" id="mapDataSearch3" onclick="mySmallLocData()">동읍면 검색</div>');
		}else{
			sido.hide();
			gugun.hide();
			dong.hide();
			$('#sidoVal').val("");
			$('#gugunVal').val("");
			$('#dongVal').val("");
			$('#mapChg').html('<button class="col-sm-4 regButton btn-5" ">조건 검색</button>');
		}
	})
	
	
	//업종별
	var big=$('select[name=bigBusiness]');
	var mid=$('select[name=midBusiness]');
	var small=$('select[name=smallBusiness]');
	var businessCg=$('select[name=businessCg]');

	big.hide();
	mid.hide();
	small.hide();
	  businessCg.click(function(){
	
		if(businessCg.val()=='indsLclsCd'){
			big.show();
			mid.hide();
			small.hide();
			$('#midVal').val("");
			$('#smallVal').val("");
		}else if(businessCg.val()=='indsMclsCd'){
			big.show();
			mid.show();
			small.hide();
			$('#smallVal').val("");
		}else if(businessCg.val()=='indsSclsCd'){
			big.show();
			mid.show();
			small.show();
		}else{
			big.hide();
			mid.hide();
			small.hide();
			$('#bigVal').val("");
			$('#midVal').val("");
			$('#smallVal').val("");
		}
	})
})

$(document).ready( function () {
    $('#myTable').DataTable();
} );

//유효성 value 없으면 검색 안되게

</script>