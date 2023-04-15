<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	$(function() {
		$(".us-list").slice(0, 4).show();//select the first 5
		$("#load-list").click(function(c) {
			c.preventDefault();
			$(".us-list:hidden").slice(0, 3).show();//select next5 hidden divs
			if ($(".us-list:hidden").length == 0) {
				//alert if there are none left
			}
		});
	});
	// 목록 검색 
	
	$(function() {
		$("#myInput").on("keyup",function() {
					var value = $(this).val().toLowerCase();
					$("#myTable .us-list").filter(
					function() {
						$(this).toggle(
							$(this).text().toLowerCase().indexOf(value) > -1)});
				});
		});
</script>

<!-- 
<script>
	$(function() {
		
		$("#allCheck").click(function() {
			if ($("#allCheck").prop("checked")) {
				$("input[type=checkbox]").prop("checked", true);
			} else {
				$("input[type=checkbox]").prop("checked", false);
			}
		})
	})
</script> -->

    