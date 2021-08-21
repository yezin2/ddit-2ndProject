<%@page import="kr.or.ddit.partyBoard.vo.PartyBoardVO"%>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@include file="/WEB-INF/view/common/mainNav.jsp"%>

<%
	List<PartyBoardVO> partyBoardList = (List<PartyBoardVO>) request.getAttribute("partyBoardList");
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
	          	<h2 class="card-title col-12">모집한 밀파티 목록
	            &nbsp;&nbsp;&nbsp;&nbsp;
	            
<!-- 	            <small>굿끼제먹과 함께한지 01일</small> -->
	            </h2>
	            
	            <div class="col-12 d-flex justify-content-end">
				
	            </div>
				<div class="col-6 d-flex justify-content-end">

				</div>
	          </div>
	          <div class="text-muted d-flex justify-content-center" id="dataForm">
	          	
	          	<table class="table col-12" id="#">
	          		<thead>
						<tr class="d-flex text-center justify-content-start">
							<th class="col-1">#</th>
							<th class="col-8">게시글 제목</th> <!-- BOARD_TITLE -->
							<th class="col-3">게시글 작성일</th> <!-- BOARD_DATE -->
						</tr>
					</thead>
					<tbody class="col-12">
	          			<% 
	          			int partyBoardListSize = partyBoardList.size();
	          			
	          			
	          			if(partyBoardListSize > 0){
	          				for(int i = 0; i < partyBoardListSize ; i++){
	          					%>
	          					<tr class="d-flex text-center col-12">
	          						<td class="p-2 col-1"> <%= (i+1) %> </td>
	          						<td class="p-2 col-8"> <a href="<%=request.getContextPath() %>/PARTY/select.do?boardSeq=<%= partyBoardList.get(i).getBoardSeq()%>"><%= partyBoardList.get(i).getBoardTitle() %></a></td>
	          						<td class="p-2 col-3"> <%= partyBoardList.get(i).getBoardDate() %></td>
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
	  
	  
	  <!-- /.container -->
	  <%@include file="/WEB-INF/view/common/mainFooter.jsp"%>