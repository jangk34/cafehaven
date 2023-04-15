<%@page import="poly.dto.OrderInfoDTO"%>
<%@page import="poly.dto.UserDTO"%>
<%@page import="poly.dto.MenuDTO"%>
<%@page import="poly.dto.CafeAttachDTO"%>
<%@page import="poly.dto.TmpDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
   MenuDTO mDTO = (MenuDTO)request.getAttribute("mDTO");
   UserDTO uDTO = (UserDTO)request.getAttribute("uDTO");
   CafeAttachDTO caDTO = (CafeAttachDTO)request.getAttribute("caDTO");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<%@ include file="/WEB-INF/view/cssjs.jsp"%>
<title>Insert title here</title>
<script>
   function addComma(x) {
      return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
   }
   function addItemCnt() {
      var qty = parseInt($('#itemQty').val());
      if(qty < 99) {
         qty++;
         $('#itemQty').val(qty);
         $('#itemPrice').text(addComma(qty * <%= mDTO.getMenuPrice() %>));
         $('#totPrice').val("결제예정금액 : " + addComma(qty * <%= mDTO.getMenuPrice() %>) + " 원");
      }
   }
   function minusItemCnt(){
      var qty = $('#itemQty').val();
      if(qty > 1){
         qty--;
         $('#itemQty').val(qty);
         $('#itemPrice').text(addComma(qty * <%= mDTO.getMenuPrice() %>));
         $('#totPrice').val("결제예정금액 : " + addComma(qty * <%= mDTO.getMenuPrice() %>) + " 원");
      }
   }
   // 장바구니 추가
   /* function addTmpBasket(){
	   var tmpUserNo=$('#tmpUserNo').val();
	   var tmpMenuNo=$('#tmpMenuNo').val();
	   var tmpMenuPrice=$('#tmpMenuPrice').val();
	   var tmpMenuQty=$('#itemQty').val();
	   var tmpMenuName=$('#tmpMenuName').val();
      $.ajax({
         url:"/tmpBasket/tmpBasketRegProc.do",
         type:"POST",
         data : {
        	 'userNo':tmpUserNo,
            'menuNo': tmpMenuNo,
            'menuPrice':tmpMenuPrice,
            'menuQty':tmpMenuQty,
            'menuName':tmpMenuName
         },
         success:function(data){
            alert('장바구니에 추가되었습니다.');
         },
         error:function(error){
            alert(error);
         }
      });
   } */
   
	function addTmpBasket() {
	   var tmpMenuNo=$('#tmpMenuNo').val();
	   var tmpMenuPrice=$('#tmpMenuPrice').val();
	   var tmpMenuQty=$('#itemQty').val();
	   var tmpMenuName=$('#tmpMenuName').val();
		$.ajax({
			url : "/tmpBasket/tmpBasketRegProc.do",
			type : "post",
			data : {
	            'menuNo': tmpMenuNo,
	            'menuPrice':tmpMenuPrice,
	            'menuQty':tmpMenuQty,
	            'menuName':tmpMenuName
			},
			success : function(data) {
				alert('장바구니에 추가되었습니다.');
			},
			error : function(error) {
				alert(error);
			}
		});
	}
	// 로그인 필요 완료
	function orderDirect() {
		var orderDirectUserNo = $('#orderDirectUserNo').val();
		if (orderDirectUserNo == "") {
			alert("로그인이 필요한 서비스입니다.");
			location.href = "/home.do";
			return false;
		} else {
			var f = document.getElementById('f');
			f.qty.value = document.getElementById('itemQty').value;
			f.submit();
			return true;
		}
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/view/mainCafeTop.jsp"%>
	<input type="hidden" id="orderDirectUserNo" value="<%= userNo %>" />
	<div class="container">
		<div class="page-header">
			<h1>
				주문하기&nbsp;&nbsp;&nbsp;<small>CAFE HEAVEN</small>
			</h1>
		</div>
		<div class="w3-container w3-row-padding">
			<div class="orderHead" style="max-width: 100%">주문 정보</div>
			<div class="w3-content w3-row-padding" style="max-width: 100%">
				<!-- 나중에 for문 돌려야함 for문 시작 -->
				<!-- 이미지 -->
				<div class="w3-col s6 w3-row-padding"
					style="margin-bottom: 4px; text-align: center;">
					<img style="width: 100%; vertical-align: middle; height: auto;"
						src="/uploadImg/<%=caDTO.getCafeImg()%>" class="img-thumbnail">
				</div>
				<!-- 내용 -->
				<div class="w3-col s6 w3-row-padding">
					<div class="w3-col s12">
						<div style="max-width: 100%;">
							<h3>
								<small>제품명</small>
							</h3>
							<p><%=mDTO.getMenuName()%></p>
						</div>
					</div>
					<div class="w3-col s6">
						<div style="max-width: 100%;">
							<h3>
								<small>수량</small>
							</h3>
							<input type="button" onclick="minusItemCnt();" value="-" /> 
							<input type="text" value="1" style="text-align: center;" size="5" maxlength="2" readonly id="itemQty" /> 
							<input type="button" onclick="addItemCnt();" value="+" />
						</div>
					</div>
					<div class="w3-col s6">
						<div style="max-width: 100%;">
							<h3>
								<small>가격</small>
							</h3>
							<span id="itemPrice"><%=CmmUtil.nvl(CmmUtil.addComma(mDTO.getMenuPrice()))%></span><span> 원</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr />
		<!-- for문 종료 -->
		<div class="w3-col s12 w3-row-padding"
			style="margin-bottom: 4px; margin-top: 4px;">
			<!-- 장바구니 버튼 -->
			<div class="w3-col s6">
				<button class="btn btn-danger" style="width: 100%;"	onclick="addTmpBasket();">장바구니</button>
				<input type="hidden" name="userNo" id="tmpUserNo" value="<%=CmmUtil.nvl(uDTO.getUserNo()) %>" /> 
				<input type="hidden" name="menuNo" id="tmpMenuNo" value="<%=CmmUtil.nvl(mDTO.getMenuNo()) %>" /> 
				<input type="hidden" name="menuPrice" id="tmpMenuPrice"	value="<%=CmmUtil.nvl(mDTO.getMenuPrice()) %>" /> 
				<input type="hidden" name="menuName" id="tmpMenuName" value="<%=CmmUtil.nvl(mDTO.getMenuName()) %>" />
			</div>
			
			<!-- 결제버튼 -->
			<div class="w3-col s6">
				<form action="orderDirectDetail.do" method="post" id="f">
					<input type="hidden" name="menuNo" value="<%=CmmUtil.nvl(mDTO.getMenuNo()) %>" />
					<input type="hidden" name="qty" id="qty" />
					<input type="hidden" name="menuPrice" value="<%=CmmUtil.nvl(mDTO.getMenuPrice()) %>" />
					<input type="hidden" name="menuName" value="<%=CmmUtil.nvl(mDTO.getMenuName()) %>" /> 
					<a href="#"><button class="btn btn-primary" style="width: 100%;" onclick="return orderDirect();">바로결제</button></a>
				</form>
			</div>
		</div>
		<!--  결제 선택버튼  name 은 같게-->
	</div>
</body>
</html>