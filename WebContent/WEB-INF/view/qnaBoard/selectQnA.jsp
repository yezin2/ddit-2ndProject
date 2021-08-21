<%@page import="kr.or.ddit.common.vo.AtchFileVO"%>
<%@page import="kr.or.ddit.comment.vo.CommentVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.qna.vo.QnABoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	QnABoardVO qnaVO = (QnABoardVO) request.getAttribute("qnaVO");
	
	int a = (Integer) request.getAttribute("cnt");
	List<CommentVO> commentList = (List<CommentVO>) request.getAttribute("commentList");
	List<AtchFileVO> atchFileList = (List<AtchFileVO>) request.getAttribute("atchFileList");
%>    

<%@include file="/WEB-INF/view/common/mainNav.jsp"%>
<section class="page-section bg-light" id="team">
<div class="container">
	<div class="col-md-12">
		<h1 class="my-4">Q&A 문의 게시판</h1>

		<div class="card mb-4">
			<div class="card-body">
				<table class="table" >
					<tbody>
						<tr class="d-flex text-left">
							<th class="col-1 ">제목</th>
							<th class="col-3 " name="boardTitle"><%=qnaVO.getBoardTitle() %></th>
							<th class="col-6 "></th>
							<th class="col-1 "><small>조회수</small></th>
							<th class="col-1 "name="boardHitsNumber"><small><%=qnaVO.getBoardHits() %></small></th>
						</tr>
						<tr class="d-flex text-left">
							<td class="col-1 ">작성자</td>
							<td class="col-3 "name="userId"><%=qnaVO.getUserId() %></td>
							<th class="col-6 "></th>
							<td class="col-1 "><small>작성일</small></td>
							<td class="col-1 "name="boardDate"><small><%=qnaVO.getBoardDate() %></small></td>
						</tr>
						<%
						if(qnaVO.getAtchFileId() != -1){
							%>
						<tr class="d-flex text-left">
							<td class="col-12"><img class="col-12" src="../filedownload.do?fileId=<%=qnaVO.getAtchFileId() %>">
							</td>
						</tr>
							<%
						}
						%>
						<tr class="d-flex text-left">
							<td class="col-12">
						<%=qnaVO.getBoardContent() %>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="card-footer d-flex justify-content-center">
					<a class="btn btn-lg btn-secondary" type="button" href="list.do">목록으로 돌아가기</a>
					<%
					if(userId != null && userId.equals(qnaVO.getUserId())){
						%>
					<a class="btn btn-lg btn-secondary ml-3" type="submit" href="update.do?boardSeq=<%=qnaVO.getBoardSeq() %>">수정하기</a>
					<a class="btn btn-lg btn-secondary ml-3" type="reset" href="delete.do?boardSeq=<%=qnaVO.getBoardSeq() %>">삭제하기</a>
						<%
					}
					%>
				</div>
			</div>
		</div>
	
			
		<!-- 댓글 영역 -->
		<div class="card-footer">
			<h2 class="card-title">댓글<small class="ml-5"><%=a %> 개</small></h2>
		</div>
		
		<div class="card-body">
			<table class="table table-sm table-hover" >
				<tbody>
				<%
				    for (CommentVO commentVO : commentList) {
				%>
					<tr class="d-flex text-left">
						<th class="col-3">
				<%
					if(commentVO.getUserId().equals("admin2")) {
				%>
					관리자
				<%		
					} else {
				%>
							<%=commentVO.getUserId() %>
				<%		
					}
				%>			
							
						</th>
						<th class="col-7"><small><%=commentVO.getReplyDate() %></small></th>
				<%
						if(commentVO.getUserId().equals(userId)) {
				%>	
						<td class="col-1 text-sm-right">
							<a class="small" id="upBtn<%=commentVO.getReplySeq()%>" onclick="fn_update_click('<%=commentVO.getReplySeq()%>')">수정</a>
							<a class="small" id="cnBtn<%=commentVO.getReplySeq()%>" style="display: none;" onclick="fn_update_cancel('<%=commentVO.getReplySeq()%>');">취소</a>
						</td>
						<td class="col-1 text-sm-right">
							<a class="small" id="dlBtn<%=commentVO.getReplySeq()%>" onclick="fn_delete('<%=commentVO.getReplySeq()%>');">삭제</a>
							<a class="small" id="cmBtn<%=commentVO.getReplySeq()%>" style="display: none;" onclick="fn_update('<%=commentVO.getReplySeq()%>');">등록</a>
						</td>
				<%
						}
				%>		
					</tr>
					<tr class="d-flex text-left">
						<td class="col-12" id=content<%=commentVO.getReplySeq()%>><%=commentVO.getReplyContent() %></td>
					</tr>
				<%
					}
				%>
				</tbody>
				<%
					if(userId.equals(qnaVO.getUserId()) || userType.equals("관리자")) {
				%>
				<tbody id="replyArea">
					<tr class="d-flex text-left">
						<th class="col-12 table-info" id="rUserId">
				<%
							if(userType.equals("관리자")) {
								System.out.println("유저타입 : " + userType);
				%>
							관리자
				<%			
							} else {
				%>
							<%=userId %>		
				<%			
							}
				%>
						</th>
					</tr>
					<tr class="d-flex text-left table-info">
						<td class ="input-group-append col-11">
						<input type="text" class="form-control input-lg" id="rContent" placeholder="댓글을 입력해주세요.">
						</td>
						<td class ="input-group-append col-1">
						<button type="button" class="btn btn-outline-secondary" id="commentBtn" onclick="fn_insert()">등록</button>
						</td>
					</tr>
				</tbody>
				<%	
					}
				%>
			</table>
		</div>
	</div>
</div>
</section>
<!-- 들고나갈 값 -->
<form id="fm" method="post">
	<input type="hidden" name="code" value="QNA">
	<input type="hidden" name="boardSeq" value="<%=qnaVO.getBoardSeq()%>">
	<input type="hidden" name="userId" value="<%=userId%>">
	<input type="hidden" id="replyContent" name="replyContent">
	<input type="hidden" id="tmpContent">
	<input type="hidden" name="replySeq" id="replySeq">
</form>
<script type="text/javascript">

function fn_insert() {
	$("#fm").attr("action", "<%=request.getContextPath()%>/comment/insert.do");
	$("#replyContent").val($("#rContent").val());
	$("#fm").submit();
}

function fn_update(seq) {
    if(confirm("댓글을 수정하시겠습니까?")) {
        $('#fm').attr("action", "<%=request.getContextPath()%>/comment/update.do");
        $('#replySeq').val(seq);
        var text = $('#newContent').val();
        $('#replyContent').val(text);
        $('#fm').submit();
    }
}

function fn_update_click(seq) {
    $('#upBtn' + seq).hide();
    $('#cnBtn' + seq).show();
    $('#dlBtn' + seq).hide();
    $('#cmBtn' + seq).show();
    var text = $('#content' + seq).text();
    $('#content' + seq).html('<textarea class="form-control" id="newContent">' + text + '</textarea>');
    $('#tmpContent').val(text);
}

function fn_update_cancel(seq) {
	$('#upBtn' + seq).show();
    $('#cnBtn' + seq).hide();
    $('#dlBtn' + seq).show();
    $('#cmBtn' + seq).hide();
    $('#content' + seq).html($('#tmpContent').val());
}

function fn_delete(seq) {
	if(confirm('댓글을 삭제하시겠습니까?')) {
		$('#fm').attr('action', '<%=request.getContextPath()%>/comment/delete.do');
		$('#replySeq').val(seq);
		$('#fm').submit();
	}
}
</script>
		
<%@include file="/WEB-INF/view/common/mainFooter.jsp" %>