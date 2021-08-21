<%@page import="kr.or.ddit.adminBoard.vo.AdminBoardVO"%>
<%@page import="kr.or.ddit.common.vo.AtchFileVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AdminBoardVO abv = (AdminBoardVO)request.getAttribute("adminBoardVO");
	List<AtchFileVO> atchFileList = (List<AtchFileVO>) request.getAttribute("atchFileList");
	
	String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");

%>    

<%@include file="/WEB-INF/view/common/mainNav.jsp"%>
	<!-- Page Content -->
	<div class="container">
		<div class="row">

			<!-- Blog Entries Column -->
			<div class="col-md-12">
				<h1 class="my-4">
					개발 커뮤니티 게시판
				</h1>

				<!-- Blog Post -->
				<div class="card mb-4">
					<div class="card-body">
						<table class="table" >
							<tbody>
								<tr class="d-flex text-left">
									<th class="col-1 ">제목</th>
									<th class="col-3 " name="boardTitle"><%=abv.getBoardTitle() %></th>
									<th class="col-5 "></th>
									<th class="col-1 "><small>조회수</small></th>
									<th class="col-2 "name="boardHitsNumber"><small><%=abv.getBoardHits() %></small></th>
								</tr>
								<tr class="d-flex text-left">
									<td class="col-1 ">작성자</td>
									<td class="col-3 "name="userId"><%=abv.getUserId()%></td>
									<th class="col-5 "></th>
									<td class="col-1 "><small>작성일</small></td>
									<td class="col-2 "name="boardDate"><small><%=abv.getBoardDate() %></small></td>
								</tr>
								<tr class="d-flex text-left">
									<td class="col-12"><pre><%=abv.getBoardContent() %></pre></td>
								</tr>
							</tbody>
						</table>
						<div class="card-footer d-flex justify-content-center">
							<a class="btn btn-lg btn-secondary" type="button" href="<%=request.getContextPath() %>/adminBoardMain/noticeGetAll.do">목록으로 돌아가기</a>
<!-- 								&nbsp;&nbsp; -->
<!-- 							<a class="btn btn-lg btn-secondary" type="submit" href="update.do">수정하기</a> -->
<!-- 								&nbsp;&nbsp; -->
<!-- 							<a class="btn btn-lg btn-secondary" type="reset" href="delete.do">삭제하기</a> -->
					</div>
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
	<!-- /.container -->

	<!-- Footer -->
	<%@include file="/WEB-INF/view/common/mainFooter.jsp" %>