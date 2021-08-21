<%@page import="kr.or.ddit.common.vo.AtchFileVO"%>
<%@page import="kr.or.ddit.commBoard.vo.CommBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/view/common/mainNav.jsp"%>
<%
CommBoardVO cv = (CommBoardVO) request.getAttribute("CommBoardVO");

List<AtchFileVO> atchFileList = (List<AtchFileVO>) request.getAttribute("atchFileList");

String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");

%>
	<!-- Page Content -->
<form method="post" action="update.do" enctype="multipart/form-data">
<input  type="hidden" value="<%=userId %>" name="userId">
<input  type="hidden" value="<%=cv.getBoardSeq() %>" name="boardSeq">
<input  type="hidden" value="<%=cv.getAtchFileId() %>" name="atchFileId">
<input  type="hidden" value="<%=cv.getCode() %>" name="code">

	<div class="container">
		<div class="row">

			<!-- Blog Entries Column -->
			<div class="col-md-12">
				<h1 class="my-4">
					<%
					String boardCode ="";
					if(cv.getCode().equals("DEV")){
						boardCode = "개발";
					}
					else if(cv.getCode().equals("JOB")){
						boardCode = "취업";
					}
					else if(cv.getCode().equals("SOCIAL")){
						boardCode = "잡담";
					}
					else if(cv.getCode().equals("CLASS401")){
						boardCode = "401호";
					}
					else if(cv.getCode().equals("CLASS402")){
						boardCode = "402호";
					}
					else if(cv.getCode().equals("CLASS403")){
						boardCode = "403호";
					}
					else if(cv.getCode().equals("CLASS404")){
						boardCode = "404호";
					}			
					else if(cv.getCode().equals("CLASS405")){
						boardCode = "405호";
					}			
					else if(cv.getCode().equals("CLASS406")){
						boardCode = "406호";
					}			
					else if(cv.getCode().equals("CLASS407")){
						boardCode = "407호";
					}			
					else if(cv.getCode().equals("CLASS408")){
						boardCode = "408호";
					}			
					%><%=boardCode %> 게시판
				</h1>

				<!-- Blog Post -->
				<div class="card mb-4">
					<div class="card-body">
						<h2 class="card-title">수정하기</h2>
						<table class="table" >
							<tbody>
								<tr class="d-flex text-left">
									<th class="col-1 ">제목</th>
									<th class="col-11 "><input type="text" name="boardTitle" class="form-control input-lg" value="<%=cv.getBoardTitle() %>"></th>
								</tr>
								<tr class="d-flex text-left">
									<td class="col-1 ">작성자</td>
									<td class="col-3 "><%=userId %></td>
									<th class="col-6 "></th>
								</tr>
								<tr class="d-flex text-left">
									<td class="col-12"><input type="file" name="atchFileId">
									</td>
								</tr>
								<tr class="d-flex text-left">
									<th class="col-1 ">내용</th>
									<td><span>블랙리스트에 오르고 싶지 않다면 순순히 바른말 고운말을 사용합시다.</span></td>
								</tr>
								
							</tbody>
						</table>
							<textarea class="form-control" name="boardContent" rows="10" placeholder="내용을 입력하세요. "><%=cv.getBoardContent() %></textarea>
					</div>
					<div class="card-footer d-flex justify-content-end">
						<button class="btn btn-lg btn-secondary" type="submit">수정하기</button>
						&nbsp;&nbsp;
						&nbsp;&nbsp;
						<a class="btn btn-lg btn-secondary" type="reset" href="<%=request.getContextPath() %>/<%=cv.getCode() %>/main.do">목록으로 돌아가기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->
</form>
<%@include file="/WEB-INF/view/common/mainFooter.jsp"%>
