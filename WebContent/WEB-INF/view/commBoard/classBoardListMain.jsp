<%@page import="kr.or.ddit.common.vo.PagingVO"%>
<%@page import="kr.or.ddit.commBoard.vo.CommBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<CommBoardVO> boardList = (List<CommBoardVO>) request.getAttribute("boardList");

	PagingVO pagingVO = (PagingVO)request.getAttribute("pagingVO");
%>
    
<%@include file="/WEB-INF/view/common/mainNav.jsp"%>

<!-- Page Content -->
<div class="container">
	<div class="row">
			<!-- Sidebar Widgets Column -->
		<div class="col-md-4">
			<img class = "col-md-12" src="/DPJ/assets/img/about/10.jpg">
			<br>
			<p>408호 수료했어요!</p>
			<!-- Categories Widget -->
			<div class="card my-4">
				<h5 class="card-header">게시판 카테고리</h5>
				<div class="card-body">
					<div class="row">
						<div class="col-lg-6">
														<ul class="list-unstyled mb-0">
								<li><a class="text-info" href="<%=request.getContextPath() %>/commBoard/main.do">커뮤니티 통합</a></li>
								<li><a class="text-info" href="<%=request.getContextPath() %>/DEV/list.do">개발 커뮤니티</a></li>
								<li><a class="text-info" href="<%=request.getContextPath() %>/JOB/list.do">취업 커뮤니티</a></li>
								<li><a class="text-info" href="<%=request.getContextPath() %>/SOCIAL/list.do">잡담 커뮤니티</a></li>
							</ul>
						</div>
						<div class="col-lg-6">
							<ul class="list-unstyled mb-0">
								<li><a class="text-info" href="<%=request.getContextPath() %>/classBoard/main.do">클래스 통합</a></li>
								<li><a class="text-info" href="<%=request.getContextPath() %>/CLASS401/list.do">401호</a></li>
								<li><a class="text-info" href="<%=request.getContextPath() %>/CLASS402/list.do">402호</a></li>
								<li><a class="text-info" href="<%=request.getContextPath() %>/CLASS403/list.do">403호</a></li>
								<li><a class="text-info" href="<%=request.getContextPath() %>/CLASS404/list.do">404호</a></li>
								<li><a class="text-info" href="<%=request.getContextPath() %>/CLASS405/list.do">405호</a></li>
								<li><a class="text-info" href="<%=request.getContextPath() %>/CLASS406/list.do">406호</a></li>
								<li><a class="text-info" href="<%=request.getContextPath() %>/CLASS407/list.do">407호</a></li>
								<li><a class="text-info" href="<%=request.getContextPath() %>/CLASS408/list.do">408호</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Blog Entries Column -->
		<div class="col-md-8">
			<h1>
				클래스 게시판<br>
				<small>[401호부터 408까지]</small>
			</h1>

			<!-- Blog Post -->
			<div class="card mb-4">

				<div class="card-body">
					<h2 class="card-title">클래스 커뮤니티</h2>
					<p class="card-text">비밀글은 없어요~</p>
				</div>
				<div class="card-footer text-muted">
					<table class="table col-12">
						<tbody>
							<tr class="d-flex justify-content-start">
								<td class="col-2">#</td>
								<td class="col-2">분류</td>
								<td class="col-4">제목</td>
								<td class="col-2">작성자</td>
								<td class="col-2">조회수</td>
							</tr>
							<%
								int boardSize = boardList.size();
								String atchFile = "N";
								if(boardSize > 0) {
									for(int i = 0; i < boardSize; i++) {
										if(boardList.get(i).getAtchFileId() > 0) {
											atchFile="Y";
										}
							%>

							<tr class="d-flex justify-content-start">
								<td class="col-2"><a href="<%=request.getContextPath() %>/<%=boardList.get(i).getCode() %>/select.do?boardSeq=<%=boardList.get(i).getBoardSeq()%>"><%=boardList.get(i).getBoardSeq()%></a></td>
								<td class="col-2"><%=boardList.get(i).getCode() %></td>
								<td class="col-4"><%=boardList.get(i).getBoardTitle() %></td>
								<td class="col-2"><%=boardList.get(i).getUserId() %></td>
								<td class="col-2"><%=boardList.get(i).getBoardHitsNumber() %></td>
							</tr>
							<%
									}
								} else {
		
							%>
							<tr>
								<td colspan="12">게시판 정보가 없습니다.</td>
							</tr>
							<%
							}
							%>
								<!-- 페이징 처리 시작 -->
		<%if(pagingVO.getTotalCount() > 0) {%>
			<tr>
				<td colspan="4" align="center">
					<%if(pagingVO.getFirstPageNo() > pagingVO.getPageSize()) { %>
					<a href="main.do?pageNo=<%=pagingVO.getFirstPageNo() - pagingVO.getPageSize() %>">[이전]</a>
					<%} %>
					<%for(int pNo = pagingVO.getFirstPageNo(); pNo <= pagingVO.getLastPageNo(); pNo++) { %>
						<a <%if(pNo == pagingVO.getCurrentPageNo()){ %> style="color:orange;"<%} %> href="main.do?pageNo=<%=pNo %>">[<%=pNo %>]</a>
					<%} %>
					<%if(pagingVO.getLastPageNo() < pagingVO.getTotalPageCount()) {%>
					<a href="main.do?pageNo=<%=pagingVO.getFirstPageNo() + pagingVO.getPageSize() %>">[다음]</a>
					<%} %>
				</td>
			</tr>
		<%} %>
		<!-- 페이징 처리 끝 -->	
						</tbody>
					</table>
					<% if(userId ==null){}
					else if(userType.equals("일반회원") || userType.equals("관리자")){
					%>
					<div class="d-flex justify-content-center mb-4">
						<div class="btn-info"><a class="btn btn-lg" href="<%=request.getContextPath() %>/CLASS401/insert.do?">게시글 등록</a></div>
					</div>
					<% }
					else{}%>

				</div>
			</div>
		</div>


	</div>
</div>

<%@include file="/WEB-INF/view/common/mainFooter.jsp"%>
