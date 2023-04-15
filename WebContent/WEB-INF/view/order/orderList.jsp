<!--  orderList by.황윤영
 최신화 : 20180726 -->
<%@page import="poly.dto.TotalOrderDTO"%>
<%@page import="poly.dto.OrderInfoDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<TotalOrderDTO> tList = (List<TotalOrderDTO>)request.getAttribute("TotalOrderList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<%@ include file="/WEB-INF/view/cssjs.jsp" %>
<%@ include file="orderListScript.jsp" %>
<title>CAFEHEAVEN - 주문목록</title>
<script>
$(function(){
	timer = setInterval( function () {
		$.ajax ({
			url : "orderInterval.do",  
			success : function (data) {
				console.log(data);
				var count = Object.keys(data).length;
				if(count != 0){
				var contents = "";
					$.each(data, function(key, value){
						var checkTimeOver = value.ord_remainTime.split(':');
						var remainMin = Number(checkTimeOver[1]);
						if(value.ord_stat == 1){
							if(remainMin <= 0){
								contents += "<tr align=center bgcolor=\"#F5A9A9\">";
							}else{
								contents += "<tr align=center>"
							}
							contents += "<td>" + value.ordInfoNo + "</td>";
							contents += "<td>" + value.userName + "</td>";
							contents += "<td>" + value.menuName + "</td>";
							contents += "<td>" + value.ordAmnt + "</td>";
							contents += "<td>" + value.usrRcvTime + "</td>";
							if(remainMin <= 0){
								contents += "<td id=\"" + value.ordInfoNo + "\"><b>TimeOver</b></td>";
							}else{
								contents += "<td id=\"" + value.ordInfoNo + "\">" + value.ordRemainTime + "</td>";
							}
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-primary btn-sm\" onclick=\"orderProc("+ value.ordInfoNo + ",2);\">접수하기</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-success btn-sm\" onclick=\"takeFirst();\">조리 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"cookFirst();\">수령 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ordInfoNo + ",'5');\">취소하기</button></div></td>";
							contents += "<td>" + value.menuPrice + "</td>";
							contents += "</tr>"
							$('#interval').html(contents);
							
						}else if(value.ordStat == 2){
							if(remainMin <= 0){
								contents += "<tr align=center bgcolor=\"#F5A9A9\">";
							}else{
								contents += "<tr align=center>"
							}
							contents += "<td>" + value.ordInfoNo + "</td>";
							contents += "<td>" + value.userName + "</td>";
							contents += "<td>" + value.menuName + "</td>";
							contents += "<td>" + value.ordAmnt + "</td>";
							contents += "<td>" + value.usrRcvTime + "</td>";
							if(remainMin <= 0){
								contents += "<td id=\"" + value.ordInfoNo + "\"><b>TimeOver</b></td>";
							}else{
								contents += "<td id=\"" + value.ordInfoNo + "\">" + value.ord_remainTime + "</td>";
							}
							contents += "<td>접수 완료</td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-success btn-sm\" onclick=\"orderProc("+ value.ord_no +",3)\">조리 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"cookFirst()\">수령 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ord_no  + ",'5');\">취소하기</button></div></td>";
							contents += "<td>" + value.menuPrice + "</td>";
							contents += "</tr>"
							$('#interval').html(contents);
						}else{
							contents += "<tr align=center bgcolor=\"#9FF781\">";
							contents += "<td>" + value.ordInfoNo + "</td>";
							contents += "<td>" + value.userName + "</td>";
							contents += "<td>" + value.menuName + "</td>";
							contents += "<td>" + value.ordAmnt + "</td>";
							contents += "<td>" + value.usrRcvTime + "</td>";
							if(remainMin <= 0){
								contents += "<td id=\"" + value.ordInfoNo + "\"><b>TimeOver</b></td>";
							}else{
								contents += "<td id=\"" + value.ordInfoNo + "\">" + value.ordRemainTime + "</td>";
							}
							contents += "<td>접수 완료</td>";
							contents += "<td>조리 완료</td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"barcodeProc(" + value.ordInfoNo + ",4)\">수령 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ordInfoNo + ",'5');\">취소하기</button></div></td>";
							contents += "<td>" + value.menuPrice + "</td>";
							contents += "</tr>"
							$('#interval').html(contents);
						}
					})
				}else{
					$('#interval').html('');
				}
			},
			error:function(error){
				alert(error);
			}
		});
	}, 5000);
})

	function barcodeProc(ordNo, statNo) {
		var barcodePage = "barcodePage.do?ordNo=" + ordNo + "&statNo=" + statNo;
		var popOption = "width=370, height=360,resizable=no, scrollbars=no, status=no;";
		window.open(barcodePage, "", popOption);
	}
function orderProc(ordNo, statNo){
	$.ajax ({
		url : "adminOrderProc.do",
		type : "post",
		data : {
			'ordNo' : ordNo,
			'statNo' : statNo
		},
		success : function (data) {
			var count = Object.keys(data).length;
			if(count != 0){
				var contents = "";
				$.each(data, function(key, value){
					var checkTimeOver = value.ord_remainTime.split(':');
					var remainMin = Number(checkTimeOver[1]);
					if(value.ordStat == 1){
						if(remainMin <= 0){
							contents += "<tr align=center bgcolor=\"#F5A9A9\">";
						}else{
							contents += "<tr align=center>"
						}
						contents += "<td>" + value.ordInfoNo + "</td>";
						contents += "<td>" + value.userName + "</td>";
						contents += "<td>" + value.menuName + "</td>";
						contents += "<td>" + value.ordAmnt + "</td>";
						contents += "<td>" + value.usrRcvTime + "</td>";
						if(remainMin <= 0){
							contents += "<td id=\"" + value.ordInfoNo + "\"><b>TimeOver</b></td>";
						}else{
							contents += "<td id=\"" + value.ordInfoNo + "\">" + value.ordRemainTime + "</td>";
						}
						contents += "<td><div class=\"btn-group\"><button class=\"btn btn-primary btn-sm\" onclick=\"orderProc("+ value.ordInfoNo + ",2);\">접수하기</button></div></td>";
						contents += "<td><div class=\"btn-group\"><button class=\"btn btn-success btn-sm\" onclick=\"takeFirst();\">조리 완료</button></div></td>";
						contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"cookFirst();\">수령 완료</button></div></td>";
						contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ordInfoNo + ",'5');\">취소하기</button></div></td>";
						contents += "<td>" + value.menuPrice + "</td>";
						contents += "</tr>"
						$('#interval').html(contents);
						
					}else if(value.ordStat == 2){
						if(remainMin <= 0){
							contents += "<tr align=center bgcolor=\"#F5A9A9\">";
						}else{
							contents += "<tr align=center>"
						}
						contents += "<td>" + value.ordInfoNo + "</td>";
						contents += "<td>" + value.userName + "</td>";
						contents += "<td>" + value.menuName + "</td>";
						contents += "<td>" + value.ordAmnt + "</td>";
						contents += "<td>" + value.usrRcvTime + "</td>";
						if(remainMin <= 0){
							contents += "<td id=\"" + value.ordInfoNo + "\"><b>TimeOver</b></td>";
						}else{
							contents += "<td id=\"" + value.ordInfoNo + "\">" + value.ordRemainTime + "</td>";
						}
						contents += "<td>접수 완료</td>";
						contents += "<td><div class=\"btn-group\"><button class=\"btn btn-success btn-sm\" onclick=\"orderProc("+ value.ordInfoNo +",3)\">조리 완료</button></div></td>";
						contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"cookFirst()\">수령 완료</button></div></td>";
						contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ordInfoNo + ",'5');\">취소하기</button></div></td>";
						contents += "<td>" + value.menuPrice + "</td>";
						contents += "</tr>"
						$('#interval').html(contents);
					}else{
						contents += "<tr align=center bgcolor=\"#9FF781\">";
						contents += "<td>" + value.ordInfoNo + "</td>";
						contents += "<td>" + value.userName + "</td>";
						contents += "<td>" + value.menuName + "</td>";
						contents += "<td>" + value.ordAmnt + "</td>";
						contents += "<td>" + value.usrRcvTime + "</td>";
						if(remainMin <= 0){
							contents += "<td id=\"" + value.ordInfoNo + "\"><b>TimeOver</b></td>";
						}else{
							contents += "<td id=\"" + value.ordInfoNo + "\">" + value.ordRemainTime + "</td>";
						}
						contents += "<td>접수 완료</td>";
						contents += "<td>조리 완료</td>";
						contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"barcodeProc(" + value.ordInfoNo + ",4)\">수령 완료</button></div></td>";
						contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ordInfoNo + ",'5');\">취소하기</button></div></td>";
						contents += "<td>" + value.menuPrice + "</td>";
						contents += "</tr>"
						$('#interval').html(contents);
					}
				})
			}else{
				$('#interval').html('');
			}
		},
		error:function(error){
			alert(error);
		}
	});
}
function takeFirst(){
	 alert("접수를 먼저 해야 가능합니다.");
	 return;
}
function cookFirst(){
	alert("조리완료를 먼저 해야 가능합니다.");
	return;
} 
function orderCancel(ordNo, statNo){
	if(confirm("주문을 취소하시겠습니까?")){
		<%-- var f = document.getElementById('frmPayment');
		if(payTp == "p"){
			payTp = "PHON";
		}else{
			payTp = "CARD"
		}
		f.TRAN_TYPE.value=payTp;
		f.TID.value=tid;
		f.CANCEL_ID.value='<%=CmmUtil.nvl((String)session.getAttribute("ss_user_email"))%>';
		f.CANCEL_CAUSE.value="non";
		f.submit(); --%>
		console.log("cancel");
		$.ajax ({
			url : "adminOrderCancel.do",
			type : "post",
			data : {
				'ordNo' : ordNo,
				'statNo' : statNo
			},
			success : function (data) {
				var count = Object.keys(data).length;
				if(count != 0){
					var contents = "";
					$.each(data, function(key, value){
						var checkTimeOver = value.ord_remainTime.split(':');
						var remainMin = Number(checkTimeOver[1]);
						if(value.ord_stat == 1){
							if(remainMin <= 0){
								contents += "<tr align=center bgcolor=\"#F5A9A9\">";
							}else{
								contents += "<tr align=center>"
							}
							contents += "<td>" + value.ordInfoNo + "</td>";
							contents += "<td>" + value.userName + "</td>";
							contents += "<td>" + value.menuName + "</td>";
							contents += "<td>" + value.ordAmnt + "</td>";
							contents += "<td>" + value.usrRcvTime + "</td>";
							if(remainMin <= 0){
								contents += "<td id=\"" + value.ordInfoNo + "\"><b>TimeOver</b></td>";
							}else{
								contents += "<td id=\"" + value.ordInfoNo + "\">" + value.ordRemainTime + "</td>";
							}
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-primary btn-sm\" onclick=\"orderProc("+ value.ordInfoNo + ",2);\">접수하기</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-success btn-sm\" onclick=\"takeFirst();\">조리 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"cookFirst();\">수령 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ordInfoNo + ",'5');\">취소하기</button></div></td>";
							contents += "<td>" + value.menuPrice + "</td>";
							contents += "</tr>"
							$('#interval').html(contents);
						}else if(value.ordStat == 2){
							if(remainMin <= 0){
								contents += "<tr align=center bgcolor=\"#F5A9A9\">";
							}else{
								contents += "<tr align=center>"
							}
							contents += "<td>" + value.ordInfoNo + "</td>";
							contents += "<td>" + value.userName + "</td>";
							contents += "<td>" + value.menuName + "</td>";
							contents += "<td>" + value.ordAmnt + "</td>";
							contents += "<td>" + value.usrRcvTime + "</td>";
							if(remainMin <= 0){
								contents += "<td id=\"" + value.ordInfoNo + "\"><b>TimeOver</b></td>";
							}else{
								contents += "<td id=\"" + value.ordInfoNo + "\">" + value.ordRemainTime + "</td>";
							}
							contents += "<td>접수 완료</td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-success btn-sm\" onclick=\"orderProc("+ value.ordInfoNo +",3)\">조리 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"cookFirst()\">수령 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ordInfoNo + ",'5');\">취소하기</button></div></td>";
							contents += "<td>" + value.menuPrice + "</td>";
							contents += "</tr>"
							$('#interval').html(contents);
						}else{
							contents += "<tr align=center bgcolor=\"#9FF781\">";
							contents += "<td>" + value.ordInfoNo + "</td>";
							contents += "<td>" + value.userName + "</td>";
							contents += "<td>" + value.menuName + "</td>";
							contents += "<td>" + value.ordAmnt + "</td>";
							contents += "<td>" + value.usrRcvTime + "</td>";
							if(remainMin <= 0){
								contents += "<td id=\"" + value.ordInfoNo + "\"><b>TimeOver</b></td>";
							}else{
								contents += "<td id=\"" + value.ordInfoNo + "\">" + value.ordRemainTime + "</td>";
							}
							contents += "<td>접수 완료</td>";
							contents += "<td>조리 완료</td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"barcodeProc(" + value.ordInfoNo + ",4)\">수령 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ordInfoNo + ",'5');\">취소하기</button></div></td>";
							contents += "<td>" + value.menuPrice + "</td>";
							contents += "</tr>"
							$('#interval').html(contents);
						}
					})
				}else{
					$('#interval').html('');
				}
			},
			error:function(error){
				alert(error);
			}
		});
	}
}
</script>
</head>
<body>
	<!-- 상단 -->
	<%@ include file = "/WEB-INF/view/mainCafeTop.jsp" %>
	<!-- 본문제목 -->
	<input type="hidden" id="adminUserNo" value="<%=userNo%>" />
	<input type="hidden" id="adminUserName" value="<%=name%>" />
	<input type="hidden" id="adminUserEmail" value="<%=email%>" />
	<div class="container">
		<div class="page-header">
			<h1>주문 목록&nbsp;&nbsp;&nbsp;<small>CAFE HEAVEN</small></h1>
		</div>
		<!-- 본문 리스트 상단-->
		<table>
			<thead>
				<tr align="center">
					<th align="center" style="text-align: center;">주문번호</th>
					<th align="center" style="text-align: center;">주문자</th>
					<th align="center" style="text-align: center;">상품명</th>
					<th align="center" style="text-align: center;">수량</th>
					<th align="center" style="text-align: center;">수령 시간</th>
					<th align="center" style="text-align: center;">남은 시간</th>
					<th align="center" style="text-align: center;">접수 여부</th>
					<th align="center" style="text-align: center;">조리 여부</th>
					<th align="center" style="text-align: center;">수령 여부</th>
					<th align="center" style="text-align: center;">취소 여부</th>
					<th align="center" style="text-align: center;">금액</th>
				</tr>
			</thead>
			<tbody id="interval">
				<% for(TotalOrderDTO tDTO : tList){
						String ordStat = CmmUtil.nvl(tDTO.getOrdStat());
						String[] arr = CmmUtil.nvl(tDTO.getOrdRemainTime()).split(":");
						int remainMin = Integer.parseInt(arr[1]);
						if(remainMin < 0 && !(tDTO.getOrdStat().equals("3"))){
				%>
					<tr bgcolor="#F5A9A9">
					<%
						} else if(tDTO.getOrdStat().equals("3")){
					%>
					<tr align="center" bgcolor="#9FF781">
					<%
						}else{
					%>
					<tr>
					<%
						}
					%>
					<td align="center"><%=CmmUtil.nvl(tDTO.getOrdInfoNo()) %></td>
					<td align="center"><%=CmmUtil.nvl(tDTO.getUserName()) %></td>
					<td align="center"><%=CmmUtil.nvl(tDTO.getMenuName()) %></td>
					<td align="center"><%=CmmUtil.nvl(tDTO.getOrdAmnt()) %></td>
					<td align="center"><%=CmmUtil.nvl(tDTO.getUsrRcvTime()) %></td>
					<%
						if(remainMin<0){
					%>
					<td align="center" id="<%=CmmUtil.nvl(tDTO.getOrdInfoNo()) %>"><b>TimeOver</b></td>
					<%
						}else{
					%>
					<td align="center" id="<%=CmmUtil.nvl(tDTO.getOrdInfoNo())%>"><%=CmmUtil.nvl(tDTO.getOrdRemainTime()) %></td>
					<%
						}
					%>
					<%if(ordStat.equals("1")){ %>
					<td align="center">
						<div>
							<button class="btn btn-primary btn-sm" onclick="orderProc('<%=CmmUtil.nvl(tDTO.getOrdInfoNo())%>', '2');">접수 하기</button>
						</div>
					</td>
					<td align="center">
						<div>
							<a href="#"><button class="btn btn-success btn-sm" onclick="takeFirst();">조리 완료</button></a>
						</div>
					</td>
					<td align="center">
						<div>
							<button class="btn btn-warning btn-sm" onclick="cookFirst();">수령 완료</button>
						</div>
					</td>
					<td align="center">
						<div>
							<button class="btn btn-danger btn-sm" onclick="orderCancel('<%=CmmUtil.nvl(tDTO.getOrdInfoNo())%>', '5');">취소 하기</button>
						</div>
					</td>
					<%}else if(ordStat.equals("2")){ %>
					<td align="center">
						접수완료
					</td>
					<td align="center">
						<div>
							<button class="btn btn-success btn-sm" onclick="orderProc('<%=CmmUtil.nvl(tDTO.getOrdInfoNo()) %>','3');">조리 완료</button>
						</div>
					</td>
					<td align="center">
						<div class="btn-group">
							<button class="btn btn-warning btn-sm" onclick="cookFirst();">수령
								완료</button>
						</div>
					</td>
					<td align="center">
						<div>
							<button class="btn btn-danger btn-sm" onclick="orderCancel('<%=CmmUtil.nvl(tDTO.getOrdInfoNo())%>','5');">취소하기</button>
						</div>
					</td>
					<%}else{ %>
					<td align="center">
						접수완료
					</td>
					<td align="center">
						<div>
							<button class="btn btn-warning btn-sm" onclick="barcodeProc('<%=CmmUtil.nvl(tDTO.getOrdInfoNo())%>','4');">수령 완료</button>
						</div>
					</td>
					<td align="center">
						<div>
							<button class="btn btn-danger" onclick="orderCancel('<%=CmmUtil.nvl(tDTO.getOrdInfoNo())%>','5');">취소하기</button>
						</div>
					</td>
					<%} %>
					<td align="center"><%=CmmUtil.nvl(tDTO.getMenuPrice()) %></td>
				</tr>
				<%} %>
				</tbody>
		</table>
		<div class="us-list-top hd-font">
			<div><input id="allCheck" type="checkbox" /></div>
			<div>주문메뉴</div>
			<div>주문시간</div>
			<div>고객명</div>
			<div>완료여부</div>
		</div>
		<div id="myTable">
		<!-- 본문 리스트 내용 -->
			<% for (int i = 0; i < tList.size(); i++) {%>
			<div class="us-list hd-font">
				<!-- 주문번호 -->
				<div><%=tList.get(i).getOrdInfoNo() %></div>
				<!-- 주문메뉴 -->
				<%-- <div><%=oList.get(i).getMenuName() %></div> --%>
				<!-- 주문시간 -->
				<div><%=tList.get(i).getOrdDtDate() %></div>
				<!-- 고객명 -->
				<%-- <div><%=oList.get(i).getName() %></div> --%>
				<!-- 완료버튼 -->
				<div><a href="#" class="btn btn-primary">완료</a></div><!-- 버튼을 누르면 고객에게 알람 전송, 상품완료 텍스트로 변경 -->
			</div>
			<br>
			<% } %>
		<!-- 본문 리스트 검색 -->
			<input class="form-control" id="myInput" type="text" placeholder="Search..">
				<a href="#" id="load-list" style="width: 100%" class="btn btn-primary">더보기</a>
				<br><br>
		</div>
	</div> 
	
</body>
</html>