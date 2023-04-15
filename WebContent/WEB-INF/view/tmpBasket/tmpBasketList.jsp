<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="poly.dto.TmpDTO"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Map<String, TmpDTO> tMap = (Map<String, TmpDTO>) session.getAttribute("ss_tmpBasket");
	if (tMap == null) {
		tMap = new HashMap();
	}
	int resultPrice = 0;
	String addedComma = "";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<%@ include file="/WEB-INF/view/cssjs.jsp"%>
<title>장바구니</title>
<script>
/* 가격에 콤마 */
function addComma(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
function tmpPlMi(menuNo, flag) {
	var qty = parseInt($('#' + menuNo + "Cnt").val());
	if(qty >= 1){
		if(flag == 'm'){
			if(qty == 1){return;}
			qty = qty -1;
		}else{
			qty = qty +1;
		}
		$.ajax({
			url : "/tmpBasket/userTmpItemPlusMinus.do",
			type : "post",
			data : {
				'menuNo' : menuNo,
				'menuQty' : qty
			},
			dataType : "json",
			success : function(data) {
				var count = Object.keys(data).length;
				if(count != 0){
					var contents = "";
					var resultPrice = 0;
					$.each(data, function(key, value){
						contents += "<div class=\"w3-col s12\">\n";
						contents += "<input type=\"checkbox\" name=\"del_check\" value=\"" + value.menuNo + "\">\n";
						contents += "<div class=\"tmpBasketText\">" + value.menuName + "</div>\n";
						contents += "<a href=\"#\" class=\"tmpBasketPlMi\" onclick=\"tmpPlMi('" + value.menuNo +"', 'm');\">-</a>";
						contents += "<input type=\"text\" value=\"" + value.menuQty + "\"class=\"tmpBasketCount\" maxlength=\"2\" readonly id=\"" + value.menuNo + "Cnt\">";
						contents += "<a href=\"#\" class=\"tmpBasketPlMi\" onclick=\"tmpPlMi('" + value.menuNo + "', 'p')\">+</a>\n";
						contents += "<div class=\"tmpBasketPrice\" name=\"price\">" + (addComma((parseInt(value.menuQty) * parseInt(value.menuPrice)))) + "원</div>";
						contents += "<a href=\"#\" onclick=\"tmpBasketDeleteOne(" + value.menuNo + ");\"><img src=\"#\" class=\"tmpBasketDeleteImg\"></a>\n";
						contents += "<hr class=\"tmpBasketHr\">\n";
						contents += "</div>\n";
						$('#tmpList').html(contents);
						resultPrice += (parseInt(value.menuQty) * parseInt(value.menuPrice));
					})
					resultPrice = addComma(resultPrice) + "원";
					$('#totPrice').text(resultPrice);
				}else{
					var contents = "";
					contents += "<div class=\"col-xs-12\" style=\"text-align: center;\">";
					contents += "<div class=\"tmpBasketResultPriceText\">선택하신 상품이 없습니다.</div>";
					contents += "</div>";
					$('#tmpList').html(contents);
					$('#totPrice').text("0원");
				}
			},
			error : function(error) {
				alert(error);
			}
		})
	}else{
		return;
	}
}
function tmpBasketDeleteOne(menuNo){
	$.ajax({
		url : "userTmpItemDeleteOne.do",
		type : "post",
		data : {
			'menuNo' : menuNo
		},
		dataType : "json",
		success : function(data) {
			var count = Object.keys(data).length;
			if(count != 0){
				var contents = "";
				var resultPrice = 0;
				$.each(data, function(key, value){
					contents += "<div class=\"w3-col s12\">\n";
					contents += "<input type=\"checkbox\" name=\"del_check\" value=\"" + value.menuNo + "\">\n";
					contents += "<div class=\"tmpBasketText\">" + value.menuName + "</div>\n";
					contents += "<a href=\"#\" class=\"tmpBasketPlMi\" onclick=\"tmpPlMi('" + value.menuNo +"', 'm');\">-</a>";
					contents += "<input type=\"text\" value=\"" + value.menuQty + "\"class=\"tmpBasketCount\" maxlength=\"2\" readonly id=\"" + value.menuNo + "Cnt\">";
					contents += "<a href=\"#\" class=\"tmpBasketPlMi\" onclick=\"tmpPlMi('" + value.menutNo + "', 'p')\">+</a>\n";
					contents += "<div class=\"tmpBasketPrice\" name=\"price\">" + (addComma((parseInt(value.tmpBasketPrdtQty) * parseInt(value.menuPrice)))) + "원</div>";
					contents += "<a href=\"#\" onclick=\"tmpBasketDeleteOne(" + value.menuNo + ");\"><img src=\"#\" class=\"tmpBasketDeleteImg\"></a>\n";
					contents += "<hr class=\"tmpBasketHr\">\n";
					contents += "</div>\n";
					$('#tmpList').html(contents);
					resultPrice += (parseInt(value.menuQty) * parseInt(value.menuPrice));
				})
				resultPrice = addComma(resultPrice) + "원";
				$('#totPrice').text(resultPrice);
			}else{
				var contents = "";
				contents += "<div class=\"col-xs-12\" style=\"text-align: center;\">";
				contents += "<div class=\"tmpBasketResultPriceText\">선택하신 상품이 없습니다.</div>";
				contents += "</div>";
				$('#tmpList').html(contents);
				$('#totPrice').text("0원");
			}
		},
		error : function(error) {
			alert(error);
	    }
	})
}
function tmpBasketSelectedDelete(){
	var del = document.getElementsByName('del_check');
	var menuNo = new Array();
	for(var i = 0; i< del.length; i++){
		if(del[i].checked){
			menuNo.push(del[i].value);
		}
	}
	if(menuNo.length == 0){
		alert("제품을 선택해 주세요.");
		return;
	}
	jQuery.ajaxSettings.traditional = true;
	$.ajax({
		url : "userTmpItemSelectedDelete.do",
		type : "post",
		data : {
			'menuNo' : menuNo
		},
		dataType : "json",
		success : function(data) {
			var count = Object.keys(data).length;
			if(count != 0){
				var contents = "";
				var resultPrice = 0;
				$.each(data, function(key, value){
					contents += "<div class=\"w3-col s12\">\n";
					contents += "<input type=\"checkbox\" name=\"del_check\" value=\"" + value.menuNo + "\">\n";
					contents += "<div class=\"tmpBasketText\">" + value.menuName + "</div>\n";
					contents += "<a href=\"#\" class=\"tmpBasketPlMi\" onclick=\"tmpPlMi('" + value.menuNo +"', 'm');\">-</a>";
					contents += "<input type=\"text\" value=\"" + value.menuQty + "\"class=\"tmpBasketCount\" maxlength=\"2\" readonly id=\"" + value.menuNo + "Cnt\">";
					contents += "<a href=\"#\" class=\"tmpBasketPlMi\" onclick=\"tmpPlMi('" + value.menuNo + "', 'p')\">+</a>\n";
					contents += "<div class=\"tmpBasketPrice\" name=\"price\">" + (addComma((parseInt(value.menuQty) * parseInt(value.menuPrice)))) + "원</div>";
					contents += "<a href=\"#\" onclick=\"tmpBasketDeleteOne("+ value.menuNo +");\"><img src=\"#\" class=\"tmpBasketDeleteImg\"></a>\n";
					contents += "<hr class=\"tmpBasketHr\">\n";
					contents += "</div>\n";
					$('#tmpList').html(contents);
					resultPrice += (parseInt(value.menuQty) * parseInt(value.menuPrice));
				})
				resultPrice = addComma(resultPrice) + "원";
				$('#totPrice').text(resultPrice);
			}else{
				var contents = "";
				contents += "<div class=\"col-xs-12\" style=\"text-align: center;\">";
				contents += "<div class=\"tmpBasketResultPriceText\">선택하신 상품이 없습니다.</div>";
				contents += "</div>";
				$('#tmpList').html(contents);
				$('#totPrice').text("0원");
			} 
		},
		error : function(error) {
			alert(error);
	    }
	})
}
// 계속 쇼핑하기
function keepShopping(){
	location.href="/menu/menuList.do";
}
// 
function doOrder(){
	var orderTmpUserNo = $('#orderTmpUserNo').val();
	if(orderTmpUserNo==""){
		alert("로그인이 필요합니다");
		location.href="/home.do";
		return false;
	}else{
		location.href="/order/userDoOrder.do";
		return true;
	}
}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/view/mainCafeTop.jsp"%>
	<input type="hidden" id="orderTmpUserNo" value="<%= userNo %>" />
	<div class="container">
		<div class="page-header">
			<h1>
				장바구니&nbsp;&nbsp;&nbsp;<small>CAFE HEAVEN</small>
			</h1>
		</div>
		<div class="w3-container">
			<div class="orderHead" style="max-width: 100%">장바구니</div>
			<div id="tmpList">
				<!-- 정보가 없을 경우 노출되는 화면 -->
				<%
					if (tMap.size() == 0) {
				%>
				<div class="col-xs-12" style="text-align: center;">
					<div class="tmpBasketResultPriceText">선택하신 상품이 없습니다.</div>
				</div>
				<%
					} else {
						Iterator<String> keys = tMap.keySet().iterator();
						while (keys.hasNext()) {
							String key = keys.next();
				%>
				<!-- 정보가 없을 경우 노출되는 화면 끝 -->
				<div class="w3-col s12">
					<input type="checkbox" name="del_check" value="<%=CmmUtil.nvl(tMap.get(key).getMenuNo())%>" />
					<div class="tmpBasketText"><%=CmmUtil.nvl(tMap.get(key).getMenuName())%></div>
					<a href="#" class="tmpBasketPlMi" onclick="tmpPlMi('<%=CmmUtil.nvl(tMap.get(key).getMenuNo())%>', 'm');">-</a>
					<input type="text" value="<%=CmmUtil.nvl(tMap.get(key).getMenuQty()) %>"
						class="tmpBasketCount" maxlength="2" readonly id="<%=CmmUtil.nvl(tMap.get(key).getMenuNo() + "Cnt")%>">
					<a href="#" class="tmpBasketPlMi" onclick="tmpPlMi('<%=CmmUtil.nvl(tMap.get(key).getMenuNo())%>', 'p');">+</a>
					<div class="tmpBasketPrice" name="price"><%=CmmUtil.addComma(Integer.parseInt(tMap.get(key).getMenuPrice()) * Integer.parseInt(tMap.get(key).getMenuQty())) + "원" %></div>
					<a href="#" onclick="tmpBasketDeleteOne('<%=CmmUtil.nvl(tMap.get(key).getMenuNo())%>');"><img src="#" class="tmpBasketDeleteImg"></a>
					<hr class="tmpBasketHr">
				</div>
				<%
					resultPrice += Integer.parseInt(tMap.get(key).getMenuPrice())
									* Integer.parseInt(tMap.get(key).getMenuQty());
						}
					}
				%>
			</div>
			<div class="w3-col s12 w3-row-padding">
				<div class="w3-col s6">결제 예정금액</div>
				<div class="w3-col s6" id="totPrice" style="margin-bottom: 10px;"><%=CmmUtil.nvl(CmmUtil.addComma(resultPrice)) + "원" %></div>
			</div><br />
			<div class="w3-col s12 w3-row-padding">
				<div class="w3-col s6 w3-row-padding" style="padding: 0px 10px 0px 0px;">
					<button class="tmpBasketSelectDeleteButton" onclick="tmpBasketSelectedDelete();">선택삭제</button>
				</div>
				<div class="w3-col s6 w3-row-padding" style="padding: 0px 0px 0px 10px;">
					<button class="tmpBasketKeepShopping" onclick="keepShopping();">계속 쇼핑하기</button>
				</div>
			</div>
			<div class="w3-col s12 w3-row-padding">
				<button class="tmpBasketOrder" onclick="return doOrder();">주문 하기</button>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/view/mainCafeBottom.jsp"%>
</body>
</html>