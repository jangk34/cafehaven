<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- css js  -->
<%@ include file="/WEB-INF/view/cssjs.jsp" %>	
<%@ include file="/WEB-INF/view/mainCafeTop.jsp"%>

<script>
$(function(){
	//이메일찾기
	$("#emailFind").click(function(){
		
		var name=$("#name").val();
		//select 에서 선택된 값을 가져오기 위해서는
	
		var gender=$("#gender option:selected").val();
		/* 	alert(gender);  */
	
		var birth=$("#birth").val();
		var userTel=$("#userTel").val();
		if(name==''){
			alert("이름을 입력해주세요")
			return false;
		}else if(gender==''){
			alert ('성별 선택해주세요');
			return false;
		}else if(birth==''){
			alert('생일을 선택해주세요');	
			return false;
		}else if(userTel==''){
			alert('전화번호를 입력해주세요');
			return false;
		}else{
			$.ajax({
				url :  "/user/emailFind.do",
				type : 'POST',
				data : {
					'name': name ,
					'birth' : birth, 
					'gender' : gender,
					'userTel' : userTel
				},
			/* 	dataType:"json", */
				success:function(data){
					console.log(data);
					alert("일단 여기까지 "+data);
					var contents="";//화면 구성 할 태그 등 을 저장할 변수
					//리스트로 반환된 값을 각각 보여주기위해 $.each for문돌리는것이랑 같음
				 	$.each(data, function(key,value){ //여기서 키값은 컨트롤에 요청한 변수명?
						contents+= "<div class='form-group'>";
						contents+="<label class='col-sm-4 control-label' style='text-align: right'>"+value.name+'의 이메일은';
						contents+="</label>";
						contents+="<div class='col-sm-8'>";
						contents+="<input class='form-control' type='text' value="+ value.email+" readonly/>";
						contents+="</div>";
						contents+="</div>";
					});
					$('#emailFindValue').html(contents); 
				},
				error : function(error){
					alert("조회된 결과가 없습니다.");
					var contents="";
					contents+= "<div class='form-group'>";
					contents+="<label class='col-sm-4 control-label' style='text-align: right'>";
					contents+="</label>";
					contents+="<div class='col-sm-8'>";
					contents+="<input class='form-control' type='text' readonly/>";
					contents+="</div>";
					contents+="</div>";
					$('#emailFindValue').html(contents); 
				}
			});
		}
	});
	
});

</script>
<script>
//패스워드 찾기

function doSubmit(){
	var name = $("#namePw");
	var email= $("#email");
	var f =$("#f"); 
	console.log(name.val());
	console.log(email.val());
	
	if(name.val()==""){
		alert("이름을 입력해주세요");
		name.focus();
		return false;
	}else if(email.val()==""){
		alert("이메일을 입력해주세요");
		email.focus();
		return false;
	}else {
		f.attr("action", "/user/pwFindProc.do");//id 가 f 인 폼태그에 속성이 action인 값 user/pwFindProc.do 실행 
		f.submit();//전송
		return true;
	}
};
</script>






<!-- <script>
$(function(){

	//패스워드 찾기 조회가 되면 카운트 보내줘서
 	
	$('#pwFind').click(function(){
		var email=$('#email').val();
		var pwdQ=$("#pwdQ option:selected").val();
		var pwdA=$("#pwdA").val();
		alert(email);
		alert(pwdQ);
		alert(pwdA);
		
		if(email==''){
			alert('이메일을 입력해주세요');
			return false;
		}else if(pwdQ==''){
			alert('질문을 선택해주세요');
			return false;
		}else if(pwdA==''){
			alert('답을 입력해주세요');
			return false;
		}else{
			
			$.ajax({
				url:"user/pwFindProc.do",
				type:'POST',
				data:{
					'email' : email,
					'pwdQ' : pwdQ,
					'pwdA' : pwdA
		
				} , 
				success : function(data){
					console.log(data);
					var contents="";
					$.each(data, function(key,value){ //여기서 키값은 컨트롤에 요청한 변수명?
						contents+= "<div class='form-group'>";
						contents+="<label class='col-sm-4 control-label' style='text-align: right'>"+value.name+'의 비밀번호는';
						contents+="</label>";
						contents+="<div class='col-sm-8'>";
						contents+="<input class='form-control' type='text' value="+ value.password+" readonly/>";
						contents+="</div>";
						contents+="</div>";
					});
					$('#pwFindValue').html(contents); 
					
					
				},
				error : function(data){
					alert("조회된 결과가 없습니다.");
					var contents="";
					contents+= "<div class='form-group'>";
					contents+="<label class='col-sm-4 control-label' style='text-align: right'>";
					contents+="</label>";
					contents+="<div class='col-sm-8'>";
					contents+="<input class='form-control' type='text' readonly/>";
					contents+="</div>";
					contents+="</div>";
					$('#pwFindValue').html(contents); 
				}
				
				
			});
			
			
			
			
		}
		
		
		
	});
})


</script>

 -->

<div class="container">
	<h2>회원 ID/PW 찾기</h2>
	<hr />
	<!--  여기도 유효성검사 -->
	<!-- 아이디 찾기 질문 답 -->
	<div class="form-group">
		<label class="col-sm-12 control-label">아이디 찾기</label>
	</div>
	<!-- 이름  -->
	<div class="form-group">
		<label class="col-sm-4 control-label" style="text-align: right">이름</label>
		<div class="col-sm-8">
				<input class="form-control" id="name" name="name" type="text"
							placeholder="*이름입력"/>
		</div>
	</div>
	<!-- 성별 -->
	
	<div class="form-group">
		<label class="col-sm-4 control-label" style="text-align: right">성별</label>
		<div class="col-sm-8">
			<select id="gender" class="form-control">
				<option value="M">남자</option>
				<option value="W">여자</option>
			</select>
		</div>
	</div>
	<!-- 생일 -->
	<div class="form-group">
		<label class="col-sm-4 control-label" style="text-align: right">생일</label>
		<div class="col-sm-8">
			<div class="input-group">
					<input type="date" class="form-control" id="birth" name="birth">
			</div>
		</div>
	</div>
	<!-- 전화번호 -->
	<div class="form-group">
		<label class="col-sm-4 control-label" style="text-align: right">전화번호</label>
		<div class="col-sm-8">
				<input class="form-control" id="userTel" name="userTel" type="text"
							placeholder="*전화번호"/>
		</div>
	</div>
	
	 <!-- 이메일찾기 나타내줄 폼 -->
	<div class="form-group" id="emailFindValue">
		<label class="col-sm-4 control-label"></label>
		<div class="col-sm-8">
				<input class="form-control"  type="text"placeholder="*이메일 찾기" readonly/>
		</div>
	</div>
	<center><input type="button" class="btn btn-primary"  value="email찾기" id="emailFind" /></center>
	
	<!--나중에 탭으로 바꾸기  -->
	<!-- 비밀번호 찾기!!!!  -->
<!-- 연습 -->
<form name="f" id="f" method="post" action="/user/pwFindProc.do">
<!-- 이메일  -->
	<div class="form-group">
		<label class="col-sm-4 control-label" style="text-align: right">이메일</label>
		<div class="col-sm-8">
				<input class="form-control" id="email" name="email" type="text"
							placeholder="*이메일입력"/>
		</div>
	</div>

<!-- 이름  -->
	<div class="form-group">
		<label class="col-sm-4 control-label" style="text-align: right">이름</label>
		<div class="col-sm-8">
				<input class="form-control" id="namePw" name="namePw" type="text"
							placeholder="*이름입력"/>
		</div>
	</div>
	<a href= "javascript:doSubmit();" id="submitLink" class="btn-primary">패스워드 찾기</a>
</form>



</div>

</body>
</html>