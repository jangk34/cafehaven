<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
<!--카페 정보 이미지 미리 보기 3장 -->
$(document).ready(function(){ 
	
	function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#curImg1").attr('src', e.target.result);
			}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#preImg1").change(function() {
			readURL(this);
		});
	
});
$(document).ready(function(){ 
	
	function readURL2(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#curImg2").attr('src', e.target.result);
					
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#preImg2").change(function() {
			readURL2(this);
		});
});

$(document).ready(function(){ 
	
	function readURL3(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#curImg3").attr('src', e.target.result);
				
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#preImg3").change(function() {
			readURL3(this);
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



