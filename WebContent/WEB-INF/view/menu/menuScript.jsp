<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
<!--메뉴등록 미리보기 스크립트 -->
$(document).ready(function(){ 
	
	function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#preview").attr('src', e.target.result);
				
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#getfile").change(function() {
			readURL(this);
		});
});


//메뉴 수정화면 미리보기


$(document).ready(function(){ 
	
	function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#preview1").attr('src', e.target.result);
				
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#getfile1").change(function() {
			readURL(this);
		});
});

</script>