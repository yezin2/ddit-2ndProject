<%@page import="kr.or.ddit.commBoard.vo.CommBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/view/common/mainNav.jsp"%>
<%
List<CommBoardVO> boardList = (List<CommBoardVO>)request.getAttribute("boardList");

CommBoardVO cv = (CommBoardVO) request.getAttribute("boardVO");

String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");

%>
	<!-- Page Content -->
<form method="post" action="insert.do" enctype="multipart/form-data">
<input  type="hidden" value="<%=userId %>" name="userId">
	<div class="container">
		<div class="row">
			<!-- Blog Entries Column -->
			<div class="col-md-12">
				<h1 class>
					게시글 등록
				</h1>

				<!-- Blog Post -->
				<div class="card mb-4">
					<div class="card-body">
						<h2 class="card-title">
								<select name="code">
									<option value="CLASS401">401호</option>
									<option value="CLASS402">402호</option>
									<option value="CLASS403">403호</option>
									<option value="CLASS404">404호</option>
									<option value="CLASS405">405호</option>
									<option value="CLASS406">406호</option>
									<option value="CLASS407">407호</option>
									<option value="CLASS408">408호</option>
								</select>
							게시판</h2>
						<table class="table" >
							<tbody>
								<tr class="d-flex text-left">
									<th class="col-1 "><h2>제목</h2></th>
									<th class="col-11 "><input type="text" name="boardTitle" class="form-control input-lg" placeholder="제목을 입력해주세요." value=""></th>
								</tr>
								<tr class="d-flex text-left">
									<td class="col-1 "><h2>작성자</h2></td>
									<td class="col-2 "><%=userId %></td>
									<td class="col-9 "></td>
								</tr>
								<tr class="d-flex text-left">
									<td class="col-1"><input type="file" name="atchFileId"></td>
									<td class="col-11 "></td>
								</tr>
								<tr class="d-flex text-left">
									<th class="col-1 "><h2>내용</h2></th>
									<td><span>블랙리스트에 오르고 싶지 않다면 순순히 바른말 고운말을 사용합시다.</span>
									</td>
								</tr>
								
							</tbody>
						</table>
							<textarea class="form-control" name="boardContent" rows="10" placeholder="내용을 입력하세요." value=""></textarea>
					</div>
					<div class="card-footer d-flex justify-content-end">
						<button class="btn btn-lg btn-secondary" type="submit">게시물 등록</button>
						&nbsp;&nbsp;
						&nbsp;&nbsp;
						<a class="btn btn-lg btn-secondary" href="<%=request.getContextPath() %>/classBoard/main.do">목록으로 돌아가기</a>
					</div>
				</div>
			</div>


		</div>
	</div>
</form>
	<!-- /.container -->
<%@include file="/WEB-INF/view/common/mainFooter.jsp"%>