<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 다음주소api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
//아이디 중복체크

$(function() {
/////이메일 중복체크////////
	 //idck 버튼을 클릭했을 때 
	    
	    $("#emailCk").click(function() {
	    	  var idck = 0;
	    	  
	        //userid 를 param.
	         var email =  $("#email").val(); 
	        
	        $.ajax({
	            type : 'POST',
	            data : {'email':email} ,// parameter
	           	// resquest.getParameter X
	           	// @requestParameter("email");
	           
	            url : "/user/userChecked.do",
				//dataType : "json",
				//contentType: "application/json; charset=UTF-8",
	            success : function(data){ // return 갑 {
	            
	            	console.log(data);
	                if (data>0) {
	                     
	                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
	                    
	                	$("#conf").val("0");// 회원가입 유효성검사를 위해 바꾸는 값
	                    $("#email").focus();
	                   
	                
	                
	                } else {
	                    alert("사용가능한 아이디입니다.");
	                	$("#conf").val("1");
	                
	                    $("#email").focus();
	                  
	                    idck = 1;
	                   // $("#emailCk").val("가능합니다");
	                }
	            },
	            error : function(error) {
	                
	                alert("error : " + error);
	               
	            }
	        });
	    });

});


	//비밀번호 조합
	function checkUnion(str){
		var reg1=/^[a-zA-Z0-9]{8,20}$/;//대문자 소만자 8 -20 자리 허용
		var reg2=/[a-zA-Z]/g;
		var reg3=/[0-9]/g;
		return(reg1.test(str) && reg2.test(str) &&reg3.test(str))
	}



	// 재입력 일치여부 확인
	$(function(){
		var pwdvld = /^[a-zA-Z0-9]{8,20}$/;//패스워드  영문 숫자 합쳐서 8자이상
		var emavld = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i;
		var regname = /^[가-힝][A-Z][a-z]{2,}$/;
		var pwd=$("#pwd");
		var pwdCheck=$("#pwdCheck");
		var pwdval=pwd.val();
		
		
		$('#pwd').keyup(function(){
			$('font[id=check]').text('');
			
			if(!checkUnion(pwd.val())){
				
				$('font[id=length]').text('');
				$('font[id=length]').css('color','red');
				$('font[id=length]').html("8자리 이상 20자리 이하의 [영문 + 숫자] 조합");
			}else{
				$('font[id=length]').css('color','green');
				$('font[id=length]').html("적합");
			}
				
		});
		
		$('#pwdCheck').keyup(function(){
			if($('#pwd').val()!=$('#pwdCheck').val()){
				$('font[id=check]').css('color','red');
				$('font[id=check]').html("암호틀림");
			} else {
				
				$('font[id=check]').css('color','green');
				$('font[id=check]').html("암호맞음");
			}
		});
	});


$(function(){
	//이메일 비밀번호  이름유효성검사 전화번호 유효성
	var pwdvld = /^[a-zA-Z0-9]{8,20}$/;//패스워드  영문 숫자 합쳐서 8자이상 함수 방식으로 다시함
	var emavld = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i;
	var regname = /^[가-힝][A-Z][a-z]{2,}$/;

	
	
	var email= $("#email");
	var pwd=$("#pwd");
	var pwdCheck=$("#pwdCheck");
	var name=$("#name");
	var pwdqa=$("select[name=pwdqa] option:selected");
	var pwdA=$("#pwdA");
	var post_addr=$("#post_addr");
	var birth=$("#birth");
	var sub=$("#regSub");
	var addr2=$("#addr2");
	var userTel=$("#userTel");
	var pwdval=pwd.val();
	var conf=$("#conf");// 유효성검사
///유효성검사 @@@@@@@@@@@
	$("#regSub").click(function(){
		 if(email.val()==''){
			alert("이메일  ")
			email.focus();
			return false;
		}else if(!emavld.test(email.val())){
			alert("이메일 유효성검사 ")
			email.focus();
			return false;
		}
		else if(pwd.val()==''){
			alert("비밀빈호를 입력하세요");
			pwd.focus();
			return false;
			
		}else if(pwd.val()!=pwdCheck.val()){
			alert("비밀번호가 같지 않습니다.");
			pwdCheck.focus();
			return false;
		}else if(!checkUnion(pwd.val())){
			alert("비밀번호 유효성검사에 어긋남");
			pwd.focus();
			return false;
		}else if(pwdA.val()==''){
			alert("질문의 답을 입력하세요");
			pwdA.focus();
			return false;
		}else if(name.val()==''){
			alert("이름을 입력하세요");
			name.focus();
			return false;
		}else if(userTel.val()==''){
			alert("전화번호를 입력하세요");
			telvld();
			userTel.focus();
			return false;
		
		}else if(birth.val()==''){
			alert("생일을 선택하세요");
			birth.focus();
			return false;
		}else if(post_addr.val()==''){
			alert("주소를 선택하세요");
			post_addr.focus();
			return false;
		}else if(addr2.val()==''){
			alert("주소를 입력하세요");
			addr2.focus();
			return false;
		}else {
			if(conf.val()==0){
				alert("회원가입실패 이메일중복체크해주세요.");
				email.focus();
				return false;
				
			}else{
				alert("회원가입 성공!!");
			
			}
			
		}
		
	});
	
	
	

	
});

/* <!--전화번호 숫자입력함수 --> */
$(function telvld(){
	$('#userTel').keydown(function(e){

		if((e.keyCode<48 || e.keyCode>57)&&e.keyCode!=8&&(e.keyCode<96||e.keyCode>105)){
			alert("전화번호는 숫자만 입력됩니다.");
			return false;
		}
		
	});
});
	

	





/* <!-- 다음주소 --> */
function postcode_addr(){
new daum.Postcode({
    oncomplete: function(data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
        // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        //팝업에서 검색결과 항목을 클릭했을떄 실행할코드 작성
        var fullAddr='';
        var extraAddr='';
        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
            fullAddr = data.roadAddress;

        } else { // 사용자가 지번 주소를 선택했을 경우(J)
            fullAddr = data.jibunAddress;
        }
     // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
        if(data.userSelectedType === 'R'){
            //법정동명이 있을 경우 추가한다.
            if(data.bname !== ''){
                extraAddr += data.bname;
            }
            // 건물명이 있을 경우 추가한다.
            if(data.buildingName !== ''){
                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
            fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
        }
     // 우편번호와 주소 정보를 해당 필드에 넣는다.
        document.getElementById('post_addr').value = data.zonecode; //5자리 새우편번호 사용
        document.getElementById('addr1').value = fullAddr;

        // 커서를 상세주소 필드로 이동한다.
        document.getElementById('addr2').focus();
    }
}).open();
}


</script>


<!-- 비밀번호 유효성 검사 끝 -->
    