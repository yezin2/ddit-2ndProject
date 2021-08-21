<%@page import="kr.or.ddit.userDdit.vo.UserDditVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@include file="/WEB-INF/view/common/mainNav.jsp"%>
<%
	UserDditVO userDdit = (UserDditVO) request.getAttribute("userDdit");
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
	            <h2 class="card-title col-12"><%= userDdit.getDditName() %> 님의 페이지  
	            &nbsp;&nbsp;&nbsp;&nbsp;
	            
<!-- 	            <small>굿끼제먹과 함께한지 01일</small> -->
	            </h2>
	            
	            <div class="col-12 d-flex justify-content-end">
				
	            </div>
				<div class="col-6 d-flex justify-content-end">

				</div>
	          </div>
	          <div class="card-footer text-muted d-flex justify-content-center" id="dataForm">
	          	<table class="table col-12" id="myPageTable">
	          		<tr class="d-flex text-center col-12">
	          			<td class="p-2 col-6">아이디 : </td>
	          			<td class="p-2 col-6"><%= userDdit.getUserId() %></td>
	          		</tr>
	          		<tr class="d-flex text-center col-12">
	          			<td class="p-2 col-6">이름 : </td>
	          			<td class="p-2 col-6"><%= userDdit.getDditName() %></td>
	          		</tr>
	          		<tr class="d-flex text-center col-12">
	          			<td class="p-2 col-6">생년월일 : </td>
	          			<td class="p-2 col-6">
	          			<%= userDdit.getDditBir() %>
	          			</td>
	          		</tr>
	          		<tr class="d-flex text-center col-12">
	          			<td class="p-2 col-6">휴대폰번호 : </td>
	          			<td class="p-2 col-6"><%= userDdit.getDditHp() %></td>
	          		</tr>
	          		<tr class="d-flex text-center col-12">
	          			<td class="p-2 col-6">이메일 : </td>
	          			<td class="p-2 col-6"><%= userDdit.getDditMail() %></td>
	          		</tr>
	          		<tr class="d-flex text-center col-12">
	          			<td class="p-2 col-6">이메일 수신여부 : </td>
	          			<td class="p-2 col-6"><%= userDdit.getPolicyYn() %></td>
	          		</tr>
	          		<tr class="d-flex text-center col-12">
	          			<td class="p-2 col-6">소속반 : </td>
	          			<td class="p-2 col-6">
							<%
	          				String dditClassNum = userDdit.getDditClass();
	          				String dditClass = "";
	          				if("1".equals(dditClassNum)){
	          					dditClass = "401호";	
	          				} else if ("2".equals(dditClassNum)){
	          					dditClass = "402호";	
	          				} else if ("3".equals(dditClassNum)){
	          					dditClass = "403호";	
	          				} else if ("4".equals(dditClassNum)){
	          					dditClass = "404호";	
	          				} else if ("5".equals(dditClassNum)){
	          					dditClass = "405호";	
	          				} else if ("6".equals(dditClassNum)){
	          					dditClass = "406호";	
	          				} else if ("7".equals(dditClassNum)){
	          					dditClass = "407호";	
	          				} else if ("8".equals(dditClassNum)){
	          					dditClass = "408호";	
	          				}
	          				%>
		          				<%= dditClass %>
						</td>
	          		</tr>
	          		<tr class="d-flex text-center col-12">
	          			<td class="p-2 col-12">
	          			<a class="btn btn-lg btn-info" href="<%=request.getContextPath() %>/mypage/myPageEdit.do">회원정보 수정하기</a>	 
<%-- 	          			<a class="btn btn-lg btn-info" href="<%=request.getContextPath() %>/searchRest/list.do">회원정보 수정하기</a>	  --%>
	          			</td>
	          		</tr>
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