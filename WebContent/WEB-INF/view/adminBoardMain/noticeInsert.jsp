<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/WEB-INF/view/common/mainNav.jsp"%>

<!-- Page Content -->
<div class="container">
	<div class="row">
		<!-- Blog Entries Column -->
		<div class="col-md-12">
			<h1 class="my-4">고객센터</h1>
			<!-- Blog Post -->
			<form method="post" action="<%=request.getContextPath() %>/adminBoardMain/noticeInsert.do">
			<div class="card mb-4">
				<div class="card-body">
					<h2 class="card-title">공지사항 등록</h2>
					<table class="table" >
						<tbody>
							<tr class="d-flex text-left">
								<th class="col-1 ">제목</th>
								<th class="col-11 "><input type="text" name="boardTitle" class="form-control input-lg" placeholder="제목을 입력해주세요."></th>
							</tr>
							<tr class="d-flex text-left">
								<td class="col-1 ">작성자</td>
								<td class="col-3 "><%=userId %></td>
								<input type="hidden" name="userId" value="<%=userId%>">
								<th class="col-6 "></th>
							</tr>
							<tr class="d-flex text-left">
								<td class="col-12"><input type="file" name="atchFileId">
								</td>
							</tr>
							<tr class="d-flex text-left">
								<th class="col-1 ">내용</th>
								</td>
							</tr>
							
						</tbody>
					</table>
						<textarea class="form-control" name="boardContent" rows="10" placeholder="내용을 입력하세요."></textarea>
				</div>
				<div class="card-footer d-flex justify-content-end">
					<button class="btn btn-lg btn-secondary" type="submit">입력완료</button>
					&nbsp;&nbsp;
					&nbsp;&nbsp;
					<a class="btn btn-lg btn-secondary" type="reset" href="<%=request.getContextPath() %>/adminBoardMain/noticeGetAll.do">목록으로 돌아가기</a>
				</div>
			</div>
			</form>
		</div>


	</div>
</div>
	<!-- /.container -->
	<!-- Footer -->
	<%@include file="/WEB-INF/view/common/mainFooter.jsp" %>
