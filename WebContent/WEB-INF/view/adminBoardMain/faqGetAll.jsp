<%@page import="kr.or.ddit.adminBoard.vo.AdminBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<AdminBoardVO> boardList = (List<AdminBoardVO>)request.getAttribute("boardList");
%>
<%@include file="/WEB-INF/view/common/mainNav.jsp"%>
	<!-- Page Content -->
	<div class="container">
		<div class="row">

			<!-- Blog Entries Column -->
			<div class="col-md-12">
				<h1 class="my-4">
					고객센터
				</h1>

				<!-- Blog Post -->
				<div class="card mb-4">

					<div class="card-body">
						<div class="form-inline">
							<h2 class="card-title support"><a href="noticeGetAll.do">공지사항</a></h2>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<h2 class="card-title support"><a href="faqGetAll.do">FAQ(자주 묻는 질문)</a></h2>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<h2 class="card-title support"><a href="<%=request.getContextPath() %>/QNA/list.do">Q&A</a></h2>
						</div>
						<h2 class="card-title">FAQ(자주 묻는 질문)</h2>
<!-- 						<p class="card-text">온통 너의 생각 뿐야~</p> -->
						
						
						<div id="accordion">
						<%
							int boardSize = boardList.size();
							if(boardSize > 0){
								for(int i = 0; i < boardSize; i++){
									System.out.print(boardList.get(i).toString());
						%>
						  <div class="card">
						    <div class="card-header" id="headingOne">
						      <h5 class="mb-0">
						        <button style="color: #084B8A; font-family: sans-serif;" class="btn" data-toggle="collapse" data-target="#collapse<%=i %>" aria-expanded="false" aria-controls="collapse<%=i %>">
						          <strong>Q<%=i+1 %>. <%=boardList.get(i).getBoardTitle() %></strong>
						        </button>
						      </h5>
						    </div>
						
						    <div style="color: #6E6E6E; font-family: sans-serif;" id="collapse<%=i %>" class="collapse" aria-labelledby="heading<%=i %>" data-parent="#accordion">
						      <div class="card-body">
						      	<%=boardList.get(i).getBoardContent() %>
						      </div>
						    </div>
						  </div>
						
<!-- 						<div class="card"> -->
<!-- 						  <div class="card-body"> -->
<!-- 						    <blockquote class="blockquote mb-0"> -->
<%-- 						      <p><%=boardList.get(i).getBoardTitle() %></p> --%>
<!-- 						      <cite title="Source Title">Source Title</cite> -->
<%-- 						      <footer class="blockquote-footer"><%=boardList.get(i).getBoardContent() %></footer> --%>
<!-- 						    </blockquote> -->
<!-- 						  </div> -->
<!-- 						</div> -->
						<% 
								}
							}
				       %>
						</div>
					</div>
				</div>
				<!-- Pagination -->
				<ul class="pagination justify-content-center mb-4">
					<li class="page-item"><a class="page-link" href="#">&larr;
							Older</a></li>
					<li class="page-item disabled"><a class="page-link" href="#">Newer
							&rarr;</a></li>
				</ul>

			</div>

		
		</div>
	</div>
	<!-- Footer -->
	<%@include file="/WEB-INF/view/common/mainFooter.jsp" %>
