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
			<form method="post" enctype="multipart/form-data">
			<input type="hidden" name="userId" value="<%=userId%>">
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
								<th class="col-1 ">작성자</th>
								<td class="col-3 ">
							<%
									if(userId.equals("null")) {
							%>
									비회원
							<%			
									} else {
							%>
									<%=userId %>
							<%			
									}
							%>
								</td>
								<th class="col-8 "></th>
							</tr>
							<tr class="d-flex text-left">
								<td class="col-6"><input type="file" name="atchFileId"></td>
								<td class="col-6"></td>
							</tr>
							<tr class="d-flex text-left">
								<th class="col-1 ">내용</th>
								<th class="col-11"></th>
						</tbody>
					</table>
					<textarea class="form-control" name="boardContent" rows="10" placeholder="내용을 입력하세요."></textarea>
					<input type="checkbox" id="boardSecret" name="boardSecret" onchange="secret()" value="N"> 비밀글
					<input type="text"> 비밀번호
				</div>
				<div class="card-footer d-flex justify-content-end">
					<button class="btn btn-lg btn-secondary" type="submit">글 등록</button>
					&nbsp;&nbsp;
					&nbsp;&nbsp;
					<a class="btn btn-lg btn-secondary" type="reset" href="list.do">목록으로 돌아가기</a>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	        function secret(){
	       	 if($('#boardSecret').prop("checked")){
	       		 $('#boardSecret').val('Y');
	       	 }else{
	       		 $('#boardSecret').val('N');
	       	 }
	        }
       </script>
	<!-- /.container -->
	<!-- Footer -->
	<%@include file="/WEB-INF/view/common/mainFooter.jsp" %>
