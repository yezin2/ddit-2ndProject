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
				<!-- 고객센터 a태그 클릭 이동 -->
					<div class="card-body">
					<div class="form-inline">
						<h2 class="card-title support"><a href="noticeGetAll.do">공지사항</a></h2>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<h2 class="card-title support"><a href="faqGetAll.do">FAQ(자주 묻는 질문)</a></h2>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<h2 class="card-title support"><a href="<%=request.getContextPath() %>/QNA/list.do">Q&A</a></h2>
					</div>
<!-- 						<p class="card-text">온통 너의 생각 뿐야~</p> -->
						<div class="input-group mb-3 col-4 float-right">
							<div class="input-group-prepend">
								<button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</button>
									<div class="dropdown-menu">
										<a class="dropdown-item" id="boardTitle" value="boardTitle">글제목</a>
										<a class="dropdown-item" id="userId" value="userId">작성자</a>
								    </div>
							</div>
							<input type="text" class="form-control" aria-label="Text input with dropdown button">
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="button" id="btnSearch">검색</button>
							</div>
						</div>
						
						<table class="table" >
							<thead>
								<tr class="d-flex text-center">
									<th class="col-2">글번호</th>
									<th class="col-5">제목</th>
									<th class="col-2">작성자</th>
									<th class="col-2">작성일</th>
									<th class="col-1">조회수</th>
								</tr>
							</thead>
							<tbody>
								<%
									int boardSize = boardList.size();
									if(boardSize > 0){
										for(int i = 0; i < boardSize; i++){
											System.out.print(boardList.get(i).toString());
								%>
								<tr class="d-flex text-center">
									<td class="col-2"><%=boardList.get(i).getBoardSeq() %></th>
									<td class="col-5" onclick="fnGet(<%=boardList.get(i).getBoardSeq() %>)"><%=boardList.get(i).getBoardTitle() %></th>
									<td class="col-2"><%=boardList.get(i).getUserId() %></th>
									<td class="col-2"><%=boardList.get(i).getBoardDate() %></th>
									<td class="col-1"><%=boardList.get(i).getBoardHits() %></th>
								</tr>
								<% 
										}
									}
						       %>
							</tbody>
						</table>
					</div>
					<%
						if("ADMIN".equals(userType)){
					%>
					<div class="card-footer d-flex justify-content-end">
						<a class="btn btn-lg btn-secondary" type="submit" href="<%=request.getContextPath() %>/adminBoardMain/noticeInsert.do">게시글 작성하기</a>
						&nbsp;&nbsp;
					</div>
					<%
						}
					%>
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
	<form id="fm" method="post">
		<input type="hidden" name="code" value="NOTICE">
		<input type="hidden" name="userId" value="<%=userId%>">
		<input type="hidden" name="boardTitle" id="boardTitle">
		<input type="hidden" name="boardSeq" id="boardSeq">
		<input type="hidden" name="boardDelete" id="boardDelete" value="N">
	</form>
	
	<!-- /.container -->
	<script type="text/javascript">
		function fnGet(data) {
	    	
			$("#fm").attr("action", "<%=request.getContextPath()%>/adminBoardMain/noticeGet.do");
			$("#boardSeq").val(data);
			$("#fm").submit();
		}
		function fnSearch() {
			$("#fm").attr("action", "<%=request.getContextPath()%>/adminBoardMain/noticeGetAll.do");
			
			if($("#searchKey option:selected").val() == 'boardTitle'){
				$("#boardTitle").val($("#searchValue").val());
			}  else if($("#searchKey option:selected").val() == 'userId'){
				$("#userId").val($("#searchValue").val());
			}

			$("#fm").submit();
		}
	</script>

	<!-- Footer -->
	<%@include file="/WEB-INF/view/common/mainFooter.jsp" %>
</html>