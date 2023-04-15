<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="menuScript.jsp" %> 
 <script>

	function menuUpdateList(menuNo){
	
		 var img="";//이미지내용을 저장할 변수 선언
		 var contents="";//글내용을 저장할 변수 선언
		 var footer="";
			$.ajax({
				url:"/menu/menuUpdView.do",
				type:'POST',
				data:{
					'menuNo':menuNo
				},
				success: function(data){
					console.log(data);
					console.log(data.mDTO.menuName);
					alert(data.caDTO.cafeImg);
				 	
						//이미지 관련 
						img +="<div style='float: left; width: 50%; height:250px'>"
						img += "<img src='/uploadImg/"+data.caDTO.cafeImg+"' id='preview1'style='width: 100%; height:100%'>";
						img +="<input type='file' name='prdtimg' id='getfile1' accept='image/*' onchange='check()' class='ellipsis'/>";
						img +="<p id='pid' class='help-block'>위 이미지는 기존 이미지입니다.</p>"
						img +="</div>"
						// 글내용을 저장 
						contents +="<div>커피명:<input type='text' name='menuName' style='width:50%'class='form-control' value='"+data.mDTO.menuName+"'/>  </div>";
						contents +="<div>총제공량:<input type='text' name='menuAmount' style='width:50%' class='form-control' value='"+data.mDTO.menuAmount+"' /></div>";
						contents +="<div>가격:<input type='text' name='menuPrice' style='width:50%' class='form-control' value='"+data.mDTO.menuPrice+"'/></div>";
						contents +="<div>내용:<input type='text' name='menuIntro' style='width:50%'  class='form-control' value='"+data.mDTO.menuIntro+"'/></div>";
						contents +="<div>메뉴 카테고리 : <select name='menuCgNo' style='width:50%' class='form-control'>"
						contents +="<option value='drink'>음료</option>"
						contents +="<option value='dessert'>디저트</option> "
						contents +="<option value='others'>그외</option>"
						contents +="</select>"
						contents +="</div>"
						
						contents +="<input type='hidden' name='menuNo' value='"+data.mDTO.menuNo+"' />";
						contents +="<input type='hidden' name='menuCgNo' value='"+data.mDTO.menuCgNo+"'/>";
						contents +="<input type='hidden' name='regDate' value='"+data.mDTO.regDate+"'/>";
						
						//삭제 관련 
						
					 	footer +="<div class='modal-footer' style='clear: both;'>";
					 	footer +="<input type='button' class='btn btn-info' onclick='updateMenu();' value='수정' >";
					 	//footer +="<button class='btn btn-danger' onclick='deleteMenu(&#39;"+data.mDTO.menuNo+"&#39;)'>삭제</button>"
						footer +="<button type='button' class='btn btn-primary' id='menuUpdateClose' data-dismiss='modal'>닫기</button>";
						footer +="</div>" 
			

					//deleteMenu += '<button class="btn btn-danger" onclick="deleteMenu("'+data.mDTO.menuNo+'")">삭제</button>';

						//deleteMenu += "<button class='btn btn-danger' onclick='deleteMenu('"+data.mDTO.menuNo+"')'>삭제</button>"
						
					//for each 문을 돌린 값으로  html 저장
					$('#imgModal').html(img);
					$('#menuUpdateModal').html(contents); 
					$('#buttonUD').html(footer);
				
				},
				error : function(error){
					alert(error);
				}
			});
	 }
//전송 버튼 쿼리
/* 
		function doSubmit(f) {
			if (f.prdtimg.value == "") {

				if (confirm("이미지 미 선택시 기존이미지가 유지됩니다.")) {
					f.submit();
				} else {
					return false;
				}

			}

		} */

		//체크 그대로 올리는 지 아닌지 
		function check() {
			var file = document.querySelector('#getfile1');
			var filelist = file.files;
			var reader = new FileReader();
			reader.readAsDataURL(filelist[0]);
			reader.onload = function() {
				document.querySelector('#preview1').src = reader.result;
			}
			document.getElementById('pid').innerHTML = "현재 이미지 그대로 업로드 됩니다."

		}
		
	
		function updateMenu(){
			var f=document.formName;
			f.action = "/menu/menuUpdateProc.do";
			// 파일 전송이 필요할 경우만 씀.
			f.encoding = "multipart/form-data";
			f.submit();
			}
	/* 		function deleteMenu(menuNo){
		
			alert("메뉴를 삭제했습니다.");
			alert(menuNo)
			location.href="/menu/menuDeleteProc.do?menuNo="+menuNo;
			} */
			
		
		
	</script>
	<!-- --------------- 메뉴 수정 및 삭제 모달----------- -->

 	<div class="modal fade" id="menu-upd">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">CAFE HEAVEN</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				<div class="modal-body">
					<form  name="formName" method="post" enctype="multipart/form-data"  >
						 <!-- 이미지 -->
						<div id="imgModal" style="float: left; width: 50%; height:250px ">
						</div>
						<!-- 본문 -->
						<div id="menuUpdateModal">
						</div>
						<!--  수정 버튼-->
						<div id="buttonUD">
					
						</div>
					</form>
				</div>
				<!--  위치좀 맞춰줘 -->
			</div>
		</div>
	</div>



	
    