<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="poly.dto.TmpDTO"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String userTel = CmmUtil.nvl((String) session.getAttribute("userTel"));
	// 시간 설정
	String hour = new SimpleDateFormat("HH").format(new Date());
	hour = CmmUtil.nvl(hour,"0");
	String minute = new SimpleDateFormat("mm").format(new Date());
	// 시간 설정을 위한 변수
	int tmpMinute = Integer.parseInt(minute);
	tmpMinute = (tmpMinute/10)*10+10;
	Map<String, TmpDTO> tMap=(Map<String, TmpDTO>)session.getAttribute("ss_tmpBasket");
	if(tMap==null){
		tMap = new HashMap();
	}
	String orderNo = System.currentTimeMillis() + "";
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
function checkBoxControll(){
	var checked = document.getElementById('userInfoCheck');
	var orderUserName = document.getElementById('orderUserName');
	if(checked.checked == false){
		console.log("false");
		console.log("<%=CmmUtil.nvl((String)session.getAttribute(userTel))%>" + "aaa");
		document.getElementById('CUSTOMER_NAME').value = '<%=CmmUtil.nvl((String)session.getAttribute("name"))%>';
		document.getElementById('CUSTOMER_TEL').value = '<%=CmmUtil.nvl((String)session.getAttribute("userTel"))%>';
		checked.checked = true;
	}else{
		document.getElementById('CUSTOMER_NAME').value = '';
		document.getElementById('CUSTOMER_TEL').value = '';
		checked.checked = false;
	}
}
function changeCustomerName(){
	var checked = document.getElementById('userInfoCheck');
	checked.checked = false;
}
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}
function doSubmitOrder(){
	var f = document.getElementById('frmPayment');
	var userUseMil = document.getElementById('userUseMil'); // 마일리지 사용
	if(document.getElementById('CUSTOMER_NAME').value==""){
		alert("이름을 입력해주세요");
		document.getElementById('CUSTOMER_NAME').focus();
		return;
	}
	if(document.getElementById('CUSTOMER_TEL').value == ""){
		alert("연락처를 입력해 주세요.");
		document.getElementById('CUSTOMER_TEL').focus();
		return;
	}
	if(userUseMil != null){
		document.getElementById('ETC_DATA1').value = document.getElementById('ETC_DATA1').value +  ";" + "dec-" + uncomma($('#userUseMil').text());
	}else{
		document.getElementById('ETC_DATA1').value = document.getElementById('ETC_DATA1').value + ";" + "inc-" + (parseInt(parseInt(uncomma($('#resultPrice').text())) * 0.05));
	}
	f.submit();
}
function radioPhonCheck(){
	var phonCheckBox = document.getElementsByName('TRAN_TYPE');
	phonCheckBox[0].checked = true;
}
function radioCardCheck(){
	var cardCheckBox = document.getElementsByName('TRAN_TYPE');
	cardCheckBox[1].checked = true;
}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/view/mainCafeTop.jsp"%>
	<input type="hidden" id="orderUserName" value="<%= name %>" />
	<!-- <form class="form" method="post" name="frmPayment" id="frmPayment" action="/order/orderProcTest.do" method="post"> -->
	<form class="form" method="post" name="frmPayment" id="frmPayment" action="https://pg.paynuri.com/paymentgateway/mobile/reqPay.do" accept-charset="euc-kr" target="_self">
	<!-- 페이누리로 전송할 데이터 /////// 수정해야함  -->
	
	<!-- <input type="hidden" id="REP_CODE" name="REP_CODE" value="0000"> -->
	<!-- 가맹점 번호 -->
	<input type="hidden" id="STOREID" name="STOREID" value="1500000088" readonly="readonly" />
	<!-- 가맹점 key -->
	<input type="hidden" id="CRYPTO_KEY" name="CRYPTO_KEY" value="AF866C9C429290750A6D4255590C0328" />
	<!-- 가맹점 명 -->
	<input type="hidden" id="STORE_NAME" name="STORE_NAME" value="페이누리쇼핑몰" />
	<!-- 가맹점 로고 -->
	<input type="hidden" id="STORE_LOGO" name="STORE_LOGO" value="https://demo.paynuri.com/images/logo_shop.png" />
	<!-- 사업자 번호 -->
	<input type="hidden" id="BUSINESS_NO" name="BUSINESS_NO" value="1068621229" />
	<!-- 가맹점 주문 번호 -->
	<input type="hidden" id="TRAN_NO" name="TRAN_NO" value="<%=orderNo %>" size=20 maxlength=20 />
	<!-- 상품 구분 -->
	<input type="hidden" id="PRODUCTTYPE_1" name="PRODUCTTYPE" value="1" checked="checked"/>
	<input type="hidden" id="PRODUCTTYPE_2" name="PRODUCTTYPE" value="2" />
	<!-- 상품명   !!!!!!!!!!!!!!!!!!!!!!!!이거는 바꿔줘야하는 파라미터!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
	
	<%
		String menuNames = "";
		int menuCnt = 0;
		if(tMap.size()>1){
			menuCnt = tMap.size() -1;
			Iterator<String> keys = tMap.keySet().iterator();
			String key = keys.next();
			TmpDTO tDTO = tMap.get(key);
			menuNames += tDTO.getMenuName() + " 외 " + menuCnt;
		} else {
			Iterator<String> keys = tMap.keySet().iterator();
			String key = keys.next();
			TmpDTO tDTO = tMap.get(key);
			menuNames += tDTO.getMenuName();
		}
	%>
	<input type="hidden" type="text" id="GOODS_NAME" name="GOODS_NAME" value="<%=menuNames %>" size=15 maxlength=20 />
	<!-- 결제 금액  !!!!!!!!!!!!!!!!!!!!!!!!이거는 바꿔줘야하는 파라미터!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
	<input type="hidden" type="text" id="AMT" name="AMT" value="1004" size=8 />
	<!-- 상품 갯수 !!!!!!!!!!!!!!!!!!!!!!!!이거는 바꿔줘야하는 파라미터!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
	<input type="hidden" type="text" id="QUANTITY" name="QUANTITY" value="<%=tMap.size() %>" size=3 maxlength=3/>
	<!-- 거래 일자  오늘 날짜로 바꿔주기-->
	<input type="hidden" id="SALE_DATE" name="SALE_DATE" value="150923" size=8 maxlength=6 />
	<!-- 고객명  !!!!!!!!!!!!!!!!!!!!!!!!이거는 바꿔줘야하는 파라미터!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
	<!-- <input type="hidden" id="CUSTOMER_NAME" name="CUSTOMER_NAME" value="홍길동" size=30 maxlength=100 /> -->
	<!-- 리턴 URL  !!!!!!!!!!!!!!!!!!!!!!!!이거는 바꿔줘야하는 파라미터!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
	<input type="hidden" id="RETURN_URL" name="RETURN_URL" value="/order/orderComplete.do" size=30 maxlength=100 />
	<!-- 결제 성공  URL !!!!!!!!!!!!!!!!!!!!!!!!이거는 바꿔줘야하는 파라미터!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
	<input type="hidden" id="COMPLETE_URL" name="COMPLETE_URL" value="/order/orderSuccess.do?userNo=<%=userNo %>" size=30 maxlength=100 />
	<!-- 결제도중 취소  URL !!!!!!!!!!!!!!!!!!!!!!!!이거는 바꿔줘야하는 파라미터!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
	<input type="hidden" id="CANCEL_URL" name="CANCEL_URL" value="#" size=30 maxlength=100 />
	<!-- 여분의 데이터 1 -->
	<input type="hidden" id="ETC_DATA1" name="ETC_DATA1" value="#" />
	<!-- 여분의 데이터 2 -->
	<!-- 여분의 데이터 3 -->
	<%
		String orderItems = "";
		Iterator<String> keyss = tMap.keySet().iterator();
		while(keyss.hasNext()){
			String key = keyss.next();
			TmpDTO tDTO = tMap.get(key);
			orderItems += tDTO.getMenuNo() + ":" + tDTO.getMenuQty() + "-";
		}
	%>
		<div class="w3-container w3-row-padding">
			<div class="orderHead" style="max-width: 100%">주문 정보 입력</div>
			<div>
				<h5>수령 시간</h5>
			</div>
			<div>
				<select class="orderSelect form-control" id="ETC_DATA2" name="ETC_DATA2">
					<%for(int i = Integer.parseInt(hour); i<22; i++){
						for(int j = tmpMinute; j<=50; j+=10){
							String min = "";
							if(j<10){
								min="00";
							}else{
								min=j+"";
							}
							%>
					<option value="<%=i %>:<%=min %>"><%=i %> : <%=min %></option>
						<%}
							tmpMinute=0;
					}%>
				</select>
			</div>
			<hr>
			<div>
				<h5>주문 고객</h5>
			</div>
			<div>
				<input class="form-control" type="text" name="CUSTOMER_NAME" id="CUSTOMER_NAME" value="<%=CmmUtil.nvl((String)session.getAttribute("name")) %>" onchange="changeCustomerName();">
			</div>
			<hr>
			<div>
				<h5>연락처</h5>
			</div>
			<div>
				<input class="form-control" type="text" name="CUSTOMER_TEL" id="CUSTOMER_TEL" value="<%=CmmUtil.nvl((String)session.getAttribute("userTel"))%>" onchange="changeCustomerName();">
			</div>
			<hr>
			<div>
				<h5>요청 사항</h5>
				<textarea class="form-control" rows="6"></textarea>
			</div>
			<hr>
			<div>
				<input type="checkbox" id="userInfoCheck" checked="checked" />
				<label for="asbestos" onclick="checkBoxControll();">
					<p>회원 정보와 동일합니다.</p>
				</label>
			</div>
			<div>주문 내역</div>
			<%if(tMap.size()==0){ %>
				<h5>선택하신 상품이 없습니다.</h5>
				<div>
					<p>결제 예정 금액</p>
					<p>0원</p>
				</div>
			<%}else{
				Iterator<String> keys = tMap.keySet().iterator();
				int totPrice=0;
				while(keys.hasNext()){
					String key = keys.next();
					TmpDTO tDTO = tMap.get(key);%>
					<p><%=CmmUtil.nvl(tDTO.getMenuName()) %></p>
					<p>금액</p>
					<p>수량 : <%=CmmUtil.nvl(tDTO.getMenuQty()) %>개</p>
					<p><%=CmmUtil.nvl(CmmUtil.addComma(Integer.parseInt(tDTO.getMenuPrice())*Integer.parseInt(tDTO.getMenuQty()))) %>원</p>
					<hr>
				<% totPrice += Integer.parseInt(tDTO.getMenuPrice())*Integer.parseInt(tDTO.getMenuQty());
				}%>
				<div>
					<p>결제 예정 금액</p>
					<p id="totPrice"><%=CmmUtil.nvl(CmmUtil.addComma(totPrice)) %>원</p>
				</div>
			<%}%>
			<div>
				<input type="radio" id="TRAN_TYPE" name="TRAN_TYPE" value="PHON" checked="checked" />
					<label for="asbestos1" onclick="radioPhonCheck();">휴대폰 소액 결제</label>
			</div>
			<div>
				<input type="radio" id="TRAN_TYPE" name="TRAN_TYPE" value="CARD"/> 
				<label for="asbestos2" onclick="radioCardCheck();">신용카드(온라인 결제)</label>
			</div>
		</div>
	</form>
	<button onclick="doSubmitOrder();">결제하기</button>
	<br>
</body>
</html>