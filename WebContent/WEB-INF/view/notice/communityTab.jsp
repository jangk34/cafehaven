<%@page import="poly.dto.ReviewDTO"%>
<%@page import="poly.util.DateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="poly.dto.NoticeDTO"%>
<%@page import="java.util.List"%>
<%
//받을때도 리스트 형변환 컨트롤러에서 보낸 데이터의 형이 리스트 형이기떄문에 받을때도 리스트
	List<NoticeDTO> nList=(List<NoticeDTO>)request.getAttribute("nList");

 

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!--  script css -->
<%@ include file="/WEB-INF/view/cssjs.jsp" %>
<!--  리스트로 데이터 받은것도 포함 되어있음 , script -->
<%@ include file="communityTabScript.jsp" %>

<script>
// 방식으로 보여주기
  $(function(){
		$("#reviewListView").click(function(){
		
			$.ajax({
			
				url :"/notice/reviewList.do",
				type : 'GET',
				success:function(data){
					var contents="";
					console.log(data);
					for(var i = 0; i < data.length; i++) {
					    var value = data[i];
						if(i<4){
							contents+='<div class="hd-list-three" style="display: block;" >';//style="display: block;"
							contents+='<div><p><a href="#">'+value.menuName+'</a></p></div>';
							contents+='<div>'+value.cafeStar+'</div>';
							contents+='<div><p>'+value.cafeReview+'</p></div>';
							contents+='<div><p>'+value.rvWriter+'</p></div>';	
							contents+='</div>';
						}else{
							contents+='<div class="hd-list-three">';//style="display: block;"
							contents+='<div><p><a href="#">'+value.menuName+'</a></p></div>';
							contents+='<div>'+value.cafeStar+'</div>';
							contents+='<div><p>'+value.cafeReview+'</p></div>';
							contents+='<div><p>'+value.rvWriter+'</p></div>';	
							contents+='</div>';
						}
						$('#reviewList').html(contents);
					}
				 	
				 /* 	$.each(data, function(key,value){
					contents+='<div class="hd-list-three" >';//style="display: block;"
					contents+='<div><p><a href="#">'+value.menuName+'</a></p></div>';
					contents+='<div>'+value.cafeStar+'</div>';
					contents+='<div><p>'+value.cafeReview+'</p></div>';
					contents+='<div><p>'+value.rvWriter+'</p></div>';	
					contents+='</div>';
				 	}); */
				 /* 	alert(data.length);
				 if(data.length>=4){
					 console.log("test");
				  	for(var i=0; i<4 ; i++){
				  		console.log("testdata : "+data)
				  		console.log("testdata[0] " +data[0]);
				 		$(data[i],function(key,value){
				 			contents+='<div class="hd-list-three" style="display: block;">';
							contents+='<div><p><a href="#">'+value.menuName+'</a></p></div>';
							contents+='<div>'+value.cafeStar+'</div>';
							contents+='<div><p>'+value.cafeReview+'</p></div>';
							contents+='<div><p>'+value.rvWriter+'</p></div>';	
							contents+='</div>';
				 		})
				 		console.log("콘텐츠"+contents);
				 		
				 	} 
				 	for(var i=4;i<data.length;i++){
						$(data[i],function(key,value){
				 		contents+='<div class="hd-list-three">';
						contents+='<div><p><a href="#">'+value.menuName+'</a></p></div>';
						contents+='<div>'+value.cafeStar+'</div>';
						contents+='<div><p>'+value.cafeReview+'</p></div>';
						contents+='<div><p>'+value.rvWriter+'</p></div>';	
						contents+='</div>';
						})
				 	}
				 	$('#reviewList').html(contents);  */
				 	
				 /* }else{
					 $.each(data, function(key,value){
							contents+='<div class="hd-list-three" style="display: block;">';//style="display: block;"
							contents+='<div><p><a href="#">'+value.menuName+'</a></p></div>';
							contents+='<div>'+value.cafeStar+'</div>';
							contents+='<div><p>'+value.cafeReview+'</p></div>';
							contents+='<div><p>'+value.rvWriter+'</p></div>';	
							contents+='</div>';
					 
				 		})
				 		$('#reviewList').html(contents); 
				 } */
 				 	console.log(contents);
				
			},
			error:function(error){
				alert('실패');
				alert(error);
			}
			
	 		});
		});
	  
	}); 


//눌렀을때 계속 추가
function cafeReviewReg(){
	alert("확인");
	$('#ajaxform').ajaxForm({
		beforeSubmit: function(){
			if($('#menuName').val()=='0'){
				alert("구매했던 메뉴를 선택해주세요");
				$('#menuName').focus();
				return false;
			}else if($('#cafeReview').val()==""){
				alert("내용을 입력해주세요");
				$('#cafeReview').focus();
				return false;
			};
			
			
	
		},
		success:function(data){
			alert('성공');
			var contents=""
			console.log(data);
			for(var i = 0; i < data.length; i++) {
			    var value = data[i];
		
				if(i<4){
					contents+='<div class="hd-list-three" style="display: block;" >';//style="display: block;"
					contents+='<div><p><a href="#">'+value.menuName+'</a></p></div>';
					contents+='<div>'+value.cafeStar+'</div>';
					contents+='<div><p>'+value.cafeReview+'</p></div>';
					contents+='<div><p>'+value.rvWriter+'</p></div>';	
					contents+='</div>';
				}else{
					contents+='<div class="hd-list-three">';//style="display: block;"
					contents+='<div><p><a href="#">'+value.menuName+'</a></p></div>';
					contents+='<div>'+value.cafeStar+'</div>';
					contents+='<div><p>'+value.cafeReview+'</p></div>';
					contents+='<div><p>'+value.rvWriter+'</p></div>';	
					contents+='</div>';
				}
				$('#reviewList').html(contents);
			}
		 	
			
		},
		error:function(){
			alert("에러발생");
		}
		
	}).submit();
};

</script>
<script>
function ansUncom(str){
	 alert(str);
};

</script>

</head>
<body>
<%@ include file="/WEB-INF/view/mainCafeTop.jsp" %>
	<!-- 부트스트랩 탭 메뉴 공지사항 qna 별점 -->

	<div class="container">
		<h2>내용변경탭구성</h2>
		<!--  탭  구성 상단 -->
		<ul class="nav nav-tabs">
			<li class="active" style="width: 33%;"><a data-toggle="tab" href="#menu1" aria-expanded="true">공지사항</a></li>
			<!-- class= active 활성화된탭 -->
			<li style="width: 34%;" class=""><a data-toggle="tab" href="#menu2" aria-expanded="false">Q&amp;A</a></li>
			<!-- <li style="width: 33%;" class=""><a data-toggle="tab" href="#menu3" id="reviewListView" aria-expanded="false">리뷰</a></li> -->
			<li style="width: 33%;" class=""><a data-toggle="tab" href="#menu3" id="reviewListView"  aria-expanded="false">리뷰</a></li>
		</ul>
		<!--  tab클릭 내용 -->
		<div class="tab-content">
		<!--  공지사항 --><!-- div 게시판 -->
				
		<div id="menu1" class="tab-pane in active">
				<div class="hd-list-top">
					<!-- hd-list 리스트를 꺼내기위한 -->
					<div>제목</div>
					<div>작성자</div>
					<div>작성일</div>
					<div>조회수</div>
				</div>
				
				<!--  나중에 if 문 써서 데이터 없을떄 어떤것을 보여주면 됨 -->
			
				<!--  공지사항것만 보여줌 -->
	
			
			<% for (int i=0 ; i<nList.size();i++) {%>
				<%if (nList.get(i).getNtSort().equals("nt")){ %>
				<div class="hd-list " >
		<!-- <div><p><a href="#"></a></p></div> -->
			
					<div style="height: 50px"><p><a href="/notice/noticeDetail.do?regNo=<%=nList.get(i).getRegNo()%>&ntNo=<%=nList.get(i).getNtNo() %>"><%=nList.get(i).getNtTitle() %></a></p></div>
					<div style="height: 50px"> <%=nList.get(i).getNtWriter() %></div>
					<!-- 수정일 -->
					<% if (nList.get(i).getUpdDate()==null){ %>
					<div style="height: 50px"><p><%=DateUtil.DateFormat(nList.get(i).getRegDate()) %></p></div>
					<%} else { %>
					<div style="height: 50px"><p><%=DateUtil.DateFormat(nList.get(i).getUpdDate()) %></p></div>
					<%} %>
					<!--  조회수 -->	
				
					<div style="height: 50px"><p><%=nList.get(i).getNtCount() %></p></div><!--  이건 나중에 카운트 해서넣기 -->
				</div>
					<%} %>
				<%} %>
					
					
				 <input class="form-control" id="myInput" type="text" placeholder="Search..">
				<a href="#" id="load" style="width:100%" class="btn btn-primary">더보기</a>
				<br />	<br />
					<% if(userNo.equals("1")) { %>
				<a href="/notice/noticeReg.do" style="width:100px; float:right; "class="btn btn-primary">공지사항글쓰기</a>
			
					<%} %>
					
			</div>
			<!--  Q&A -->
			
			<div id="menu2" class="tab-pane">
				<div class="hd-list-top-two  ">
					<!-- hd-list 리스트를 꺼내기위한 -->
					<div>제목</div>
					<div>작성자</div>
					<div>작성일</div>
					<div>답변완료여부</div>
				</div>
				
			<!-- 게시판내용 -->
				<% for (int i=0 ; i<nList.size();i++) {%>
				<%if (nList.get(i).getNtSort().equals("q") ){ %><%--|| nList.get(i).getNt_sort().equals("a") --%>
				<%-- index --%>
					<input type="hidden" class="index" value="<%=i%>"/>
				<div class="hd-list-two" >
					<div style="height: 50px">
					<%-- <div>글분류:<%=nList.get(i).getNt_sort() %></div> --%>
					<p><a href="/notice/questionDetail.do?regNo=<%=nList.get(i).getRegNo()%>&ntNo=<%=nList.get(i).getNtNo() %>"><%=nList.get(i).getNtTitle() %></a></p>
					</div>				
					<div><%=nList.get(i).getNtWriter() %></div>
				
					<% if (nList.get(i).getUpdDate()==null){ %>
					<div style="height: 50px"><p><%=DateUtil.DateFormat(nList.get(i).getRegDate())%></p></div>
					<%} else { %>
					<div style="height: 50px"><p><%=DateUtil.DateFormat(nList.get(i).getUpdDate()) %></p></div>
					<%}%>
					<!-- 답변보기  qaGrpno 와  nt no 이 일치하면-->
					<% for(int j=0 ; j<nList.size();j++){%>
					<%if (nList.get(i).getRegNo().equals(userNo)) { %>
						<%if (nList.get(i).getNtNo().equals(nList.get(j).getQaGrpNo())){ %>
						<div style="height: 50px"><a href="/notice/answerDetail.do?qaGrpNo=<%=nList.get(i).getNtNo()%>">
							답변완료</a></div>
						<%}%>
					<%}%>	
					<%}%>		
				</div>
				<%} %>
				<%} %>
								<a href="#" id="load-two" style="width:100%" class="btn btn-primary">더보기</a>
				<br />	<br />
				<% if(!userNo.equals("")) { %>
				<a href="/notice/questionReg.do"style="width:100px; float:right; "class="btn btn-primary">글쓰기</a>
				<%} %>
			
			</div>
		
			
			
			<!-- review 및 별점입니다.  크기 조절은 알아서 해주세요 css  적용-->
			<div id="menu3" class="tab-pane">
				<div class="hd-list-top-three">
					<div>상품명</div>
					<div>별점</div>
					<div>리뷰</div>
					<div>작성자</div>
				</div>
				<!--  별점 기능 넣기 인터넷 찾아서 -->
				<div id="reviewList">
			
				</div>
				<div style="clear: both;"></div><!-- 문자밀림 방지하기 위해서 -->
				
				<!-- 리뷰 목록 끝-->
				<div style="clear: both;"></div>
				<!-- -------------------------------리뷰 별점 등록 화면 ------------------------------------------------- -->
				<!-- 여기도 modal 구현해야됨 -->
				
	<%if (userNo !="") {%>
	<!-- 보내기  폼-->
			<form id="ajaxform" action="/notice/cafeReviewRegProc.do" method="post">
			<!-- 회원이 구매한 메뉴 보여주기 -->
				<div class="form-group" style="width: 30% ;float:left">
				  <select class="form-control" id="menuName" name="menuName">
				    <option value="1">1</option>
				    <option value="2">2</option>
				    <option value="3">3</option>
				    <option value="4">4</option>
				  </select>
				</div>
				<!-- 별점 -->
				<div style="width:30%; float:left; text-align: center">
				<select id="example" name="cafeStar" >
				    <option value="1">1</option>
				    <option value="2">2</option>
				    <option value="3">3</option>
				    <option value="4">4</option>
				    <option value="5">5</option>
				</select>
 				</div>
				<script type="text/javascript">
						  $(function() {
						     $('#example').barrating({
						       theme: 'fontawesome-stars'
						     });
						  });
				</script>
				
				
				<!-- 회원번호  -->
				<input type="hidden" name="userNo" value="<%=userNo%>"/>

				<div style="width:30%; float:left"><input type="text"  id="cafeReview" name="cafeReview" class="form-control" placeholder="*댓글을 입력해주세요" /></div>
				<div>
				<a href="javascript:cafeReviewReg()" class="btn btn-success">등록</a>
				</div>
			</form>
		<%} %>
				<!-- 리뷰등록 -->
				
				<a href="#" id="load-three" style="width:100%" class="btn btn-primary">리뷰 더보기</a>
				<!-- ------------------------------------------------------------------------ -->
			</div>
		</div>

	</div>

</body>
</html>