<%@page import="kr.or.ddit.comment.vo.CommentVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<CommentVO> cv = (List<CommentVO>)request.getAttribute("list");
%>
<%@include file="/WEB-INF/view/common/top.jsp"%>
<main>
	<div class="container-fluid">
		<h1 class="mt-4 mb-4">Comment Administration</h1>
		
		<div class="card mb-4">
			<div class="card-body">
				전체 댓글 관리 페이지입니다.
				<div class="float-right">
					<a class="btn btn-outline-danger btn-sm" href="">전체</a>
					<a class="btn btn-outline-warning btn-sm" href="">문의</a>
					<a class="btn btn-outline-success btn-sm" href="">홍보</a>
					<a class="btn btn-outline-info btn-sm" href="">리뷰</a>
					<a class="btn btn-outline-dark btn-sm" href="">반별</a>
					<a class="btn btn-outline-dark btn-sm" href="">개발</a>
					<a class="btn btn-outline-dark btn-sm" href="">취업</a>
					<a class="btn btn-outline-dark btn-sm" href="">친목</a>
				</div>
			</div>
		</div>
		
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i> TB_COMMENT
				<a class="btn btn-outline-danger btn-sm float-right" href="#">삭제 댓글</a>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>댓글SEQ</th>
								<th>게시판</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>내용</th>
								<th>삭제</th>
								<th>관리</th>
							</tr>
						</thead>
						<tbody>
							<%
							int cs = cv.size();
							if(cs > 0) {
								for(int i = 0; i < cs; i++) {
							%>
							<tr>
								<td><%=cv.get(i).getReplySeq() %></td>
								<td><%=cv.get(i).getCode() %></td>
								<td><%=cv.get(i).getUserId() %></td>
								<td><%=cv.get(i).getReplyDate() %></td>
								<td><%=cv.get(i).getReplyContent() %></td>
								<td><%=cv.get(i).getReplyDelete() %></td>
								<td>
									<a class="btn btn-outline-info btn-sm" onclick="fn_update('<%=cv.get(i).getReplySeq()%>');">수정</a>
									<a class="btn btn-outline-info btn-sm" onclick="fn_delete('<%=cv.get(i).getReplySeq()%>');">삭제</a>
									<input type="hidden" id="getBoardSeq" value="<%=cv.get(i).getBoardSeq()%>">
								</td>
							</tr>
							<%		
								}
							} else {
							%>
							<tr>
								<td colspan="8">등록된 댓글이 없습니다.</td>
							</tr>
							
							<%	
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<form id="fm" method="post">
		<input type="hidden" id="replySeq" name="replySeq">
		<input type="hidden" id="boardSeq" name="boardSeq">
	</form>
</main>
<script type="text/javascript">
	function fn_delete(id) {
		if(confirm('댓글을 삭제하시겠습니까?')) {
			$('#fm').attr('action', '<%=request.getContextPath() %>/comment/delete.do');
			$('#replySeq').val(id);
			$('#boardSeq').val($('#getBoardSeq').val());
			$('#fm').submit();
		}
	}
</script>
<%@include file="/WEB-INF/view/common/bottom.jsp"%>