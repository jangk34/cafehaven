<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="/WEB-INF/view/cssjs.jsp" %>
<!--  json/xml 공공데이터 불러와보기  -->
<!-- 시구동 api -->
<%@ include file="bigDataAPI.jsp" %>
<!-- 차트 스크립트 -->
<%@ include file="bigDataChart.jsp" %>
<%@ include file="bigDataCss.jsp" %>
<%@ include file="bigDataJs.jsp" %>
<script>
function bigdataReset(){
   location.href="/bigData/bigData.do"
}

</script>
</head>
<body>
<%@  include file="/WEB-INF/view/mainCafeTop.jsp"%> <!-- 경로 바꿔야될거같음  -->

   <div class="container">
      <!-- 상단 -->

      <div class="page-header">
         <h1>
            CAFE HEAVEN &nbsp;&nbsp;&nbsp;<br/><small>빅데이터 분석</small>
         </h1>
      </div>
      <ul class="nav nav-tabs">
         <li class="active hd-font" style="width: 33%;"><a
            data-toggle="tab" href="#bd-menu1" aria-expanded="true">상권밀집도</a></li>
         <!-- class= active 활성화된탭 -->
         <li style="width: 34%;" class="hd-font"><a data-toggle="tab"
            href="#bd-menu2" aria-expanded="false">고객성향분석</a></li>
         <li style="width: 33%;" class="hd-font"><a data-toggle="tab"
            href="#bd-menu3" aria-expanded="false">매출관리</a></li>
      </ul>
      <!--  차트 -->
      <div class="tab-content">
         <!--  매출관리 //여기다가 카페 주소 객체화시켜서 받으면됨-->
         <div id="bd-menu1" class="tab-pane in active">
            <div id="map1" style="width: 100%; ;height: 400px;"></div> <!-- 상권 밀집도 맵 --> <!-- 처음화면은 카페 위치 -->
            <div id="map2" style="width: 100%; height: 400px;"></div><!-- 업종별 분포도 맵 -->
            <div id="map3" style="width: 100%; height: 400px;"></div><!-- 업종별 분포도 맵 -->
            <%@ include file="bigDataMapJs.jsp" %>

            <!-- 지역 분석 목록리스트 -->
            <!-- 지역별 선택ㄷ -->
            <div style="padding-top: 30px"></div>
            <div id="hdshone" style="width:50%;float:left; " class="regButton btn-5 taCp" > 카페 분포 지도</div>
            <div id="hdshtwo"  style="width:50%;float:left;" class="regButton btn-5 taCp" >지역 상권 밀집도</div>
            <div id="regionTypeBs">
               <!-- 카페 분포로 바꿈 차트   , 텍스트보여줄곳 -->
            <div id="showChart">
            <div style="margin-top:30px">
               <div style="margin:auto; width:33%;" class="regButton btn-5 taCp" id="clusterChart">검색</div>         
            </div>
            </div>
            </div>

         
               <!-- 업종별 -->
               
            <div id="myRegionSameBs" >
               <!-- 내 지역 같은 업종 분포 및 좌표 -->
               <div id="searchResult"></div>
               <label class="col-sm-12 control-label">지역별</label>
               <div class="col-sm-3">
                  <div class="form-group">
                     <select class="col-sm-12 form-control" name="regionCg">
                        <option  value="n">지역별 선택</option>
                        <option value="sido">시,도</option>
                        <option value="gugun">시,도,시,군,구</option>
                        <option value="dong">...,동,읍,면</option>
                     </select> 
               </div>
               </div>
               <!-- 시 구 동 -->
               <div  class="col-sm-9">
                  <div class="form-group">
                     <select class="col-sm-4 form-control" name="sido">
                     </select> 
                     <select class="col-sm-4 form-control" name="gugun">
                     </select> 
                     <select class="col-sm-4 form-control" name="dong">
                     </select> 
                  </div>
               </div>
               
            
               <!-- 업종별 분류 -->
            <label class="col-sm-12 control-label">업종별</label>
               <div class="col-sm-3">
                  <div class="form-group">
                     <select class="col-sm-12 form-control" name="businessCg">
                        <option value="">업종분류별 선택</option>
                        <option value="indsLclsCd">대분류</option>
                        <option value="indsMclsCd">대,중분류</option>
                        <option value="indsSclsCd">대,중,소분류</option>
                     </select> 
                  </div>
               </div>
            
               <div class="col-sm-9">
                  <div class="form-group">
                     <select class="col-sm-4 form-control" name="bigBusiness">
                     </select> 
                     <select class="col-sm-4 form-control" name="midBusiness">
                     </select> 
                     <select class="col-sm-4 form-control" name="smallBusiness">
                     </select> 
                  </div>
               </div>   
               
               <!-- 반경 -->      
               <label class="col-sm-12 control-label">반경별</label>
               <div class="col-sm-12">
                  <div class="form-group">
                     <select class="col-sm-12 form-control" name="radius">
                        <option value="">반경선택</option>
                        <option value="100">100M</option>
                        <option value="250">250M</option>
                        <option value="500">500M</option>
                        <option value="1000">1KM</option>
                     </select> 
                  </div>
               </div>
               <input type="hidden" id="sidoVal" value="" />
               <input type="hidden" id="gugunVal" value="" />
               <input type="hidden" id="dongVal" value="" />
               <input type="hidden" id="radiusVal" value="" />
               <input type="hidden" id="bigVal" value="" />
               <input type="hidden" id="midVal" value="" />   
               <input type="hidden" id="smallVal" value="" />
               
               <!-- 카페 분포에서 받은 값 -->
               <input type="hidden" id="sidoMapVal" value=""/>
               <input type="hidden" id="gugunMapVal" value=""/>
               <input type="hidden" id="dongMapVal" value=""/>
            
               <!--  -->
               <!-- 검색 -->
               <div class="col-sm-12" id="mapChg">
                  <div style="margin:auto; width:33%" class="regButton btn-5 taCp">조건 검색</div>         
               </div>
               
            </div>
         </div>
         <!--  고객성향분석 -->

      <div id="bd-menu2" class="tab-pane">
            <div class="col-sm-4 regButton btn-5 taCp">성별</div>
            <div class="col-sm-4 regButton btn-5 taCp">연령별</div>
            <div class="col-sm-4 regButton btn-5 taCp">시간대별</div>
            <div class="chart-container">
               <canvas id="genderChart"></canvas>
            </div>
         </div>
         <div id="bd-menu3" class="tab-pane">
            <div class="chart-container" >
               <canvas id="menuChart"></canvas>
            </div>
            <div class="col-sm-4 regButton btn-5 taCp" >일별 </div>
            <div class="col-sm-4 regButton btn-5 taCp" >월별</div>
            <div class="col-sm-4 regButton btn-5 taCp">연도별</div>
         </div>
      </div>
   </div>
   <%@ include file="/WEB-INF/view/mainCafeBottom.jsp"%>
</body>
</html>