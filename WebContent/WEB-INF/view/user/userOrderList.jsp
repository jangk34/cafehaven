<!--  orderList by.황윤영
 최신화 : 20180726 -->
<%@page import="poly.dto.MenuDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% MenuDTO uDTO = (MenuDTO)request.getAttribute("mDTO"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<%@ include file="/WEB-INF/view/cssjs.jsp" %>
<title>CAFEHEAVEN - 주문내역</title>
<script>
	var check
	window.onload = function(){
		check = true;
	}
	
	$(function(){
		$('#order2').hide()
		$('#order4').hide()
		$('#order6').hide()
		$('#order8').hide()
		
		$('#order1').click(function(){
			if(check){
				document.getElementById('order1').style.background="#f2f2f2";
				check=false;
			}else{
				document.getElementById('order1').style.background="#ffffff";
				check=true;
			}
			$('#order2').toggle();
		});
		$('#order3').click(function(){
			if(check){
				document.getElementById('order3').style.background="#f2f2f2";
				check=false;
			}else{
				document.getElementById('order3').style.background="#ffffff";
				check=true;
			}
			$('#order4').toggle();
		});
		$('#order5').click(function(){
			if(check){
				document.getElementById('order5').style.background="#f2f2f2";
				check=false;
			}else{
				document.getElementById('order5').style.background="#ffffff";
				check=true;
			}
			$('#order6').toggle();
		});
		$('#order7').click(function(){
			if(check){
				document.getElementById('order7').style.background="#f2f2f2";
				check=false;
			}else{
				document.getElementById('order7').style.background="#ffffff";
				check=true;
			}
			$('#order8').toggle();
		});
	})
	
</script>
</head>
<body>
	<!-- 상단 -->
	<%@ include file = "/WEB-INF/view/mainCafeTop.jsp" %>
	<!-- 본문제목 -->
	<input type="hidden" id="adminUserNo" value="<%= userNo %>" />
	<input type="hidden" id="adminUserName" value="<%= name %>" />
	<input type="hidden" id="adminUserEmail" value="<%= email %>" />
	<div class="container">
		<div class="page-header">
			<h1>주문 내역&nbsp;&nbsp;&nbsp;<small>CAFE HEAVEN</small></h1>
		</div>
		
		<div>
		<!-- 본문 리스트 내용 -->
			<table class="table">
			<thead>
				<tr style="background-color:#ebf7ff">
					<th style="width:20%; text-align:center">주문번호</th>
					<th style="width:20%; text-align:center">주문메뉴</th>
					<th style="width:20%; text-align:center">날짜</th>
					<th style="width:20%; text-align:center">결제금액</th>
					<th style="width:20%; text-align:center">주문상태</th>
				</tr>
			</thead>
			<tbody>
				<tr id="order1" style="cursor:pointer;">
					<td style="width:20%; text-align:center">201808010150</td>
					<td style="width:20%; text-align:center">카푸치노</td>
					<td style="width:20%; text-align:center">2018-08-01</td>
					<td style="width:20%; text-align:center">3,300원</td>
					<td style="width:20%; text-align:center">조리완료</td>
				</tr>
				<tr id="order2" >
				<td colspan="5" style="text-align:center; background-color:#f2f2f2; padding-left:8px; padding-right:8px; padding-top:5px; padding-bottom:5px;">
					<div style="width:100%; border:1px solid #cccccc; box-sizing: border-box; background-color:white;">
						<img src="/image/barcode.png">
					</div>
				</td>
				</tr>
				<tr id="order3" style="cursor:pointer;">
					<td style="width:20%; text-align:center">201807130208</td>
					<td style="width:20%; text-align:center">아메리카노</td>
					<td style="width:20%; text-align:center">2018-07-13</td>
					<td style="width:20%; text-align:center">3,000원</td>
					<td style="width:20%; text-align:center">주문취소</td>
				</tr>
				<tr id="order4">
				<td colspan="5" style="text-align:center; background-color:#f2f2f2; padding-left:8px; padding-right:8px; padding-top:5px; padding-bottom:5px;">
					<div style="width:100%; border:1px solid #cccccc; box-sizing: border-box; background-color:white;">
						<img src="/image/barcode2.png">
					</div>
				</td>
				</tr>
				<tr id="order5" style="cursor:pointer;">
					<td style="width:20%; text-align:center">201806240042</td>
					<td style="width:20%; text-align:center">ICE바닐라라떼</td>
					<td style="width:20%; text-align:center">2018-06-24</td>
					<td style="width:20%; text-align:center">3,700원</td>
					<td style="width:20%; text-align:center">수령완료</td>
				</tr>
				<tr id="order6">
				<td colspan="5" style="text-align:center; background-color:#f2f2f2; padding-left:8px; padding-right:8px; padding-top:5px; padding-bottom:5px;">
					<div style="width:100%; border:1px solid #cccccc; box-sizing: border-box; background-color:white;">
						<img src="/image/barcode3.png">
					</div>
				</td>
				</tr>
				<tr id="order7" style="cursor:pointer;">
					<td style="width:20%; text-align:center">201806100112</td>
					<td style="width:20%; text-align:center">아메리카노(2)</td>
					<td style="width:20%; text-align:center">2018-06-10</td>
					<td style="width:20%; text-align:center">6,000원</td>
					<td style="width:20%; text-align:center">수령완료</td>
				</tr>
				<tr id="order8">
				<td colspan="5" style="text-align:center; background-color:#f2f2f2; padding-left:8px; padding-right:8px; padding-top:5px; padding-bottom:5px;">
					<div style="width:100%; border:1px solid #cccccc; box-sizing: border-box; background-color:white;">
						<img src="/image/barcode4.png">
					</div>
				</td>
				</tr>
				</tbody>
			</table>
			
			<br>
				<a href="#" id="load-list" style="width: 100%" class="btn btn-primary">더보기</a>
				<br><br>
		</div>
	</div>
</body>
</html>