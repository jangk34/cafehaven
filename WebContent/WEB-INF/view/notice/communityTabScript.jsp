<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  
<script>
	/*공지사항 더보기 버튼 함수*/
	$(function() {
		$(".hd-list").slice(0, 4).show();//select the first 5
		$("#load").click(function(c) {
			c.preventDefault();
			$(".hd-list:hidden").slice(0, 3).show();//select next5 hidden divs
			if ($(".hd-list:hidden").length == 0) {
			
				//alert if there are none left
			}
		});
	});
	/*Q&A 더보기 버튼 함수*/
	$(function() {
		$(".hd-list-two").slice(0, 4).show();//select the first 
		$("#load-two").click(function(c) {
			c.preventDefault();
			$(".hd-list-two:hidden").slice(0, 4).show();//select next5 hidden divs
			if ($(".hd-list-two:hidden").length == 0) {
			
				//alert if there are none left
			}
		});
	});
	/*리뷰 더보기 버튼 함수*/
		
	$(function() {
		$("#reviewList .hd-list-three").slice(0, 4).show();//select the first 
		$("#load-three").click(function(c) {
			c.preventDefault();
			$("#reviewList .hd-list-three:hidden").slice(0, 4).show();//select next5 hidden divs
			if ($("#reviewList .hd-list-three:hidden").length == 0) {

				//alert if there are none left
			}
		});
	});
	
	
	// 공지사항 검색 
	$(function(){
		  $("#myInput").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#menu1 .hd-list").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
</script>