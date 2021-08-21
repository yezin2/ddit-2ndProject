<%@page import="kr.or.ddit.restInfo.vo.RestInfoVO"%>
<%@page import="kr.or.ddit.restInfo.vo.RestFavVO"%>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@include file="/WEB-INF/view/common/mainNav.jsp"%>

<%
	List<RestInfoVO> favInfoList = (List<RestInfoVO>) request.getAttribute("favInfoList");
%>

  <!-- Page Content -->
	  <div class="container">
	
	    <div class="row">
	
	      <!-- Blog Entries Column -->
	      <div class="col-md-8">
	
	        <h1 class="my-4">마이페이지
	        </h1>
	
	        <!-- Blog Post -->
	        <div class="card mb-4">
	        	
	          <div class="card-body col-12">
	          	<h2 class="card-title col-12">내가 찜한 식당 
	            &nbsp;&nbsp;&nbsp;&nbsp;
	            
<!-- 	            <small>굿끼제먹과 함께한지 01일</small> -->
	            </h2>
<!-- 	            <div class="form-group"> -->
<!-- 			      <select class="form-control" id="boardOpt" name="boardOpt"> -->
<!-- 			        <option>--선택하세요--</option> -->
<!-- 			        <option value="QNA,INQUIRY">문의 목록</option> -->
<!-- 			        <option value="BOARD,CLASS">소속반 게시판</option> -->
<!-- 			        <option value="BOARD,DEV">개발 게시판</option> -->
<!-- 			        <option value="BOARD,JOB">취업 게시판</option> -->
<!-- 			        <option value="BOARD,SOCIAL">친목 게시판</option> -->
<!-- 			      </select> -->
<!-- 			    </div> -->
	            
	            <div class="col-12 d-flex justify-content-end">
				
	            </div>
				<div class="col-6 d-flex justify-content-end">

				</div>
	          </div>
	          <div class="card-footer text-muted d-flex justify-content-center" id="dataForm">
	          	
	          	<table class="table col-12" id="favBoard">
	          		<thead>
						<tr class="d-flex text-center justify-content-start">
							<th class="col-2">#</th>
							<th class="col-5">식당 이름</th>
							<th class="col-5">전화번호</th>
						</tr>
					</thead>
					<tbody class="col-12">
	          			<% 
	          			if(favInfoList.size() > 0){
	          				for(int i = 0; i < favInfoList.size() ; i++){
	          					%>
	          					<tr class="d-flex text-center col-12">
	          						<td class="p-2 col-1"> <%= (i+1) %> </td>
	          						<td class="p-2 col-8"> <a href="<%=request.getContextPath() %>/searchRest/detailRest.do?restCode=<%=favInfoList.get(i).getRestCode() %>&userId=<%=favInfoList.get(i).getUserId()%>">
	          						<%=favInfoList.get(i).getRestName() %></a></td>
	          						<td class="p-2 col-3"> <%=favInfoList.get(i).getRestTel() %></td>
	          					</tr>
	          					<%
	          				}
	          			} else {
	          			%>
	          				<tr align="center">
	          					<td colspan="3"> 검색결과가 없습니다. </td>
	          				</tr>
	          			<%
	          			} 
	          			%>
	          		</tbody>
	        	</table>
	          	
	          	
	          	
	          	
	          	
	          </div>
	        </div>	
	      </div>
	
	      <!-- Sidebar Widgets Column -->
	      <div class="col-md-4">
	      <br>
	      <br>
				<h5 class="card-header">프로필 사진</h5>
	            <img class="card-text col-12" src="/DPJ/assets/img/profile/<%= userPhoto %>.png" style="width: 100%;border: 1px solid lightgray; padding: 50px;">
	            
   			<br>
	        <!-- Categories Widget -->
	        <div class="card my-4">
	          <h5 class="card-header">Categories</h5>
	          <div class="card-body">
	            <div class="row">
	              <div class="col-lg-12">
	                <ul class="list-unstyled mb-0">
	                  <li>
	                    <a class="text-info" href="<%=request.getContextPath()%>/mypage/myDips.do">내가 찜한 식당</a>
	                  </li>
	                  <li>
	                    <a class="text-info" href="<%=request.getContextPath()%>/mypage/myPagePartyBoard.do">내가 모집한 Meal파티</a>
	                  </li>
	                  <li>
	                    <a class="text-info" href="<%=request.getContextPath() %>/mypage/myPageBoard.do">내가 쓴 문의 목록</a>
	                  </li>
	                  <li>
	                    <a class="text-info" href="#">내가 쓴 커뮤니티 게시글 목록</a>
	                  </li>
	                  <li>
	                    <a class="text-info" href="<%=request.getContextPath() %>/mypage/myPageReview.do">내가 쓴 리뷰 보기</a>
	                  </li>
	                  <li>
	                    <a class="text-info" href="<%=request.getContextPath() %>/mypage/myPageComment.do">내가 쓴 댓글 보기</a>
	                  </li>
	                  
	                </ul>
	              </div>
	            </div>
	          </div>
	        </div>
	
	      </div>
	
	    </div>
	    <!-- /.row -->
	
	  </div>
	  
	  <script>
	  	$(function(){
	  		$("#boardOpt").change(function(){
	  			var value = $("#boardOpt").val();
	  			alert("셀렉트값 : " + value);
	  		});
	  	});
	  </script>
	  
	  <!-- /.container -->
	  <%@include file="/WEB-INF/view/common/mainFooter.jsp"%>