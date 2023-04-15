<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>

////////////////////////////////////////////////////menu2//////////////////////////////////////////////////////////////////////////////
//성별 (남/여)///성별 만 했음
window.onload = function() {
   var date = ['8월 10일', '8월 11일', '8월 12일', '8월 13일', '8월 14일','8월 15일','8월 16일'];
   var maleAmount = [15,11,12,11,13,16,5];
   var femaleAmount = [18,20,15,17,17,19,7];
   var ctx = document.getElementById('genderChart').getContext('2d');
   
   var genderChart = new Chart(ctx, {
      type : 'line',
      data : {
         labels : date,
         datasets : [{
            label : '남성',
            data : maleAmount,
            backgroundColor : 'rgba(255, 206, 86, 0.2)',
            borderColor : 'rgba(255, 206, 86, 1)',
            fill : false,
         } , {
            label : '여성',
            data : femaleAmount,
            backgroundColor : 'rgba(255, 99, 132, 0.2)',
            borderColor : 'rgba(255,99,132,1)',
            fill : false,
         }]
      }
   })
}
</script>