<%@page import="kr.or.ddit.restInfo.vo.RestInfoVO"%>
<%@page import="kr.or.ddit.event.vo.EventVO"%>
<%@page import="kr.or.ddit.common.vo.AtchFileVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/WEB-INF/view/common/mainNav.jsp"%>
<%
	EventVO eventVO = (EventVO)request.getAttribute("eventVO");
	RestInfoVO restVO = (RestInfoVO)request.getAttribute("restVO");

	String date = eventVO.getBoardDate().substring(0,10);
	String endDate = eventVO.getBoardEnd().substring(0,10);
%>

	<!-- Page Content -->
	<div class="container">
		<div class="row">

			<!-- Blog Entries Column -->
			<div class="col-md-12">
				<h1 class="my-4">
					이벤트/홍보
				</h1>

				<!-- Blog Post -->
				<div class="card mb-4">
					<div class="card-body">
						<table class="table" >
							<tbody>
								<tr class="d-flex text-left">
									<th class="col-1 ">제목</th>
									<th class="col-3 "><%=eventVO.getBoardTitle() %></th>
									<th class="col-6 "></th>
									<th class="col-1 "><small>조회수</small></th>
									<th class="col-1 "><small><%=eventVO.getBoardHits() %></small></th>
								</tr>
								<tr class="d-flex text-left">
									<td class="col-1 ">작성자</td>
									<td class="col-3 "><%=restVO.getRestName() %></td>
									<th class="col-3 "></th>
									<td class="col-1 "><small>작성일</small></td>
									<td class="col-1.5 "><small><%=date %></small></td>
									<td class="col-1 "><small>종료일</small></td>
									<td class="col-1.5 "><small><%=endDate %></small></td>
								</tr>
								<tr class="d-flex text-left">
									<td class="col-12"><img id="atchFile" class="col-12" src="<%=request.getContextPath() %>/filedownload.do?fileId=<%=eventVO.getAtchFileId() %>">
									<%if(eventVO.getAtchFileId() == -1){
										%>
										<script type="text/javascript">
											$("#atchFile").hide();
										</script>
										<% }
										%>
									</td>
								</tr>
								<tr class="d-flex text-left">
									<td class="col-12"><pre><%=eventVO.getBoardContent() %></pre></td>
								</tr>
								
							</tbody>
						</table>
						<div class="card-footer d-flex justify-content-center">
							<a type="button" class="btn btn-lg btn-secondary" href="list.do">목록으로 돌아가기</a>
							<%
							String writer = eventVO.getUserId();
							if(writer.equals(userId)){
								%>
							<a type="button" class="btn btn-lg btn-secondary" href="update.do?boardSeq=<%=eventVO.getBoardSeq() %>">수정</a>
							<a type="button" class="btn btn-lg btn-secondary" href="delete.do?boardSeq=<%=eventVO.getBoardSeq() %>">삭제</a>
								<%
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
	<!-- /.container -->
	<%@include file="/WEB-INF/view/common/mainFooter.jsp"%>