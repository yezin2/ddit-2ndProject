<%@page import="kr.or.ddit.commBoard.vo.CommBoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.common.vo.PagingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/view/common/mainNav.jsp"%>
<%
	List<CommBoardVO> boardList = (List<CommBoardVO>) request.getAttribute("boardList");

	PagingVO pagingVO = (PagingVO)request.getAttribute("pagingVO");
%>

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
						<p class="card-text">개발 관련된 내용만 올려주세요!</p>
						<table class="table" >
							<tbody>
								<tr class="d-flex col-12">
									<th class="col-2">게시글번호</th>
									<th class="col-5">제목</th>
									<th class="col-2">작성자</th>
									<th class="col-2">작성일</th>
									<th class="col-1">추천수</th>
								</tr>
																<%
				int boardSize = boardList.size();
				String atchFile = "N";
				if(boardSize > 0){
					for(int i = 0; i < boardSize; i++){
						if(boardList.get(i).getAtchFileId() > 0){
							atchFile="Y";
						}
		%>

								<tr class="d-flex col-12">
									<td class="col-2"><a href="<%=request.getContextPath() %>/<%=boardList.get(i).getCode() %>/select.do?boardSeq=<%=boardList.get(i).getBoardSeq()%>"><%=boardList.get(i).getBoardSeq()%></a></td>
									<td class="col-5"><%=boardList.get(i).getBoardTitle() %></td>
									<td class="col-2"><%=boardList.get(i).getUserId() %></td>
									<td class="col-2"><%=boardList.get(i).getBoardDate() %></td>
									<td class="col-1"><%=boardList.get(i).getBoardHitsNumber() %></td>
								</tr>
								<%
					}
				}else{
			
		%>
								<tr>
									<td colspan="8">게시판 정보가 없습니다.</td>
								</tr>
								<%
				}
		%>
		<!-- 페이징 처리 시작 -->
		<%if(pagingVO.getTotalCount() > 0) {%>
			<tr>
				<td colspan="4" align="center">
					<%if(pagingVO.getFirstPageNo() > pagingVO.getPageSize()) { %>
					<a href="list.do?pageNo=<%=pagingVO.getFirstPageNo() - pagingVO.getPageSize() %>">[이전]</a>
					<%} %>
					<%for(int pNo = pagingVO.getFirstPageNo(); pNo <= pagingVO.getLastPageNo(); pNo++) { %>
						<a <%if(pNo == pagingVO.getCurrentPageNo()){ %> style="color:orange;"<%} %> href="list.do?pageNo=<%=pNo %>">[<%=pNo %>]</a>
					<%} %>
					<%if(pagingVO.getLastPageNo() < pagingVO.getTotalPageCount()) {%>
					<a href="list.do?pageNo=<%=pagingVO.getFirstPageNo() + pagingVO.getPageSize() %>">[다음]</a>
					<%} %>
					<a class="btn btn-lg btn-secondary ml-3" href="<%=request.getContextPath() %>/commBoard/main.do">목록으로 돌아가기</a>
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
						<div class="btn-info"><a class="btn btn-lg" href="<%=request.getContextPath() %>/DEV/insert.do">게시글 등록</a></div>
					</div>
					<% }
					else{}%>
					</div>
				</div>

			</div>
		</div>
	</div>

<%@include file="/WEB-INF/view/common/mainFooter.jsp"%>
