<%@page import="kr.or.ddit.common.vo.AtchFileVO"%>
<%@page import="kr.or.ddit.qna.vo.QnABoardVO"%>
<%@page import="java.util.List"%>
<%@ page import="kr.or.ddit.comment.vo.CommentVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	QnABoardVO qnaVO = (QnABoardVO) request.getAttribute("qnaVO");

	int a = (Integer) request.getAttribute("cnt");
	List<CommentVO> commentList = (List<CommentVO>) request.getAttribute("commentList");
	List<AtchFileVO> atchFileList = (List<AtchFileVO>) request.getAttribute("atchFileList");
%>
<%@include file="/WEB-INF/view/common/top.jsp"%>
<%@include file="/WEB-INF/view/common/boardSubNav.jsp"%>
<!-- <main> -->
<!-- <div class="container-fluid"> -->
<!-- 	<h1 class="mt-4 mb-4">글 보기 테스트</h1> -->
		<div class="card mb-4">
			<div class="card-body">
				중프 게시판 테스트용 임시 페이지 입니다.
			</div>
		</div>
		<form id="fm" class="row col-10" method="post" enctype="multipart/form-data">
			<input type="hidden" value="<%=qnaVO.getUserId() %>">
			<input type="hidden" value="<%=qnaVO.getBoardSeq() %>">
			<div class="input-group mb-3 col-12">
				<span class="input-group-text" id="basic-addon3">제목</span>
				<input type="text" class="form-control" id="boardTitle" aria-describedby="basic-addon3" readonly="readonly" value="<%=qnaVO.getBoardTitle() %>">
			</div>

		<div class="input-group mb-3 col-12">
			<span class="input-group-text">내용</span>
			<textarea class="form-control" id="boardContent" aria-label="With textarea" rows="10" readonly="readonly"><%=qnaVO.getBoardContent() %></textarea>
		</div>

		<div class="input-group mb-3 col-5">
			<span class="input-group-text" id="atchFile">첨부파일</span>
				<%
				if(atchFileList != null) {
					for(AtchFileVO atchFileVO : atchFileList){
				%>
					<div>
						<a href="<%=request.getContextPath() %>/filedownload.do?fileId=<%=atchFileVO.getAtchFileId() %>&fileSn=<%=atchFileVO.getFileSn() %>">
	           				<%=atchFileVO.getOrignlFileNm() %>
           				</a>
					</div>
				<%
					}
				} else {
				%>
					<input type="text" class="form-control" name="atchFile" readonly="readonly" value="첨부파일이 없습니다.">
				<%
				}
				%>
		</div>

		<div class="col mb-3">
			<button type="reset" class="btn btn-outline-secondary">초기화</button>
			<a type="button" class="btn btn-outline-primary" href='update.do?boardSeq=<%=request.getParameter("boardSeq") %>'>수정</a>
			<a type="button" class="btn btn-outline-info" href="list.do">목록으로</a>
		</div>
	</form>

	<div class="col-11 ml-3 mt-3 text-monospace">
		<h5 class="text-weight-bold">Comments </h5>
		<span><%=a %></span>
		<%
		    for (CommentVO commentVO : commentList) {
		%>
			<div class="card border-secondary" style="max-width: 40rem;">
              <div id="reply-top<%=commentVO.getReplySeq()%>" class="row card-header pb-0">
                <p class="col px-md-3 font-weight-bold mb-1"><%=commentVO.getUserId() %></p>
                <a class="mr-3 text-primary" onclick="fn_update_click('<%=commentVO.getReplySeq()%>');">수정</a>
                <a class="text-danger" onclick="fn_delete('<%=commentVO.getReplySeq()%>');">삭제</a>
              </div>
              <div id="reply-bottom<%=commentVO.getReplySeq()%>" class="row card-header pb-0" style="display: none;">
                <p class="col px-md-3 font-weight-bold mb-1"><%=commentVO.getUserId() %></p>
                <a class="mr-3 text-primary" onclick="fn_update_cancel('<%=commentVO.getReplySeq()%>');">취소</a>
                <a class="text-danger" onclick="fn_update('<%=commentVO.getReplySeq()%>');">등록</a>
              </div>
              <div class="card-body">
                <p class="card-subtitle mb-2 text-muted text-right"><%=commentVO.getReplyDate() %></p>
                <p class="card-text" id="reply<%=commentVO.getReplySeq()%>"><%=commentVO.getReplyContent() %></p>
              </div>
            </div>
		<%
		    }
		%>
		<form id="reply" class="row col-11" method="post">
			<div class="input-group mt-4 mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">내용</span>
				</div>
				<textarea class="form-control" id="replyContent" aria-label="With textarea" name="replyContent"></textarea>
				<div class="input-group-append">
					<button class="btn btn-outline-secondary" id="commentBtn" onclick="fn_insert()">댓글<br>등록</button>
				</div>
			</div>
			<!-- 들고나갈 값 -->
			<input type="hidden" name="code" value="QNA">
			<input type="hidden" name="userId" value="admin">
			<input type="hidden" name="boardSeq" value="<%=qnaVO.getBoardSeq()%>">
			<input type="hidden" name="replySeq" id="replySeq">
			<input type="hidden" id="tmpContent">
		</form>
	</div>
</div>
<!-- <form id="delete" method="post"> -->
<!-- 	<input type="hidden" name="replySeq" id="replySeq"> -->
<!-- </form>  -->
</main>
<script type="text/javascript">
function fn_update(seq) {
    if(confirm("댓글을 수정하시겠습니까?")) {
        $('#reply').attr("action", "<%=request.getContextPath()%>/comment/update.do");
        $('#replySeq').val(seq);
        var text = $('#reply' + seq).find('textarea').val();
        $('#replyContent').val(text);
        $('#reply').submit();
    }
}

function fn_update_click(seq) {
    $('#reply-top' + seq).hide();
    $('#reply-bottom' + seq).show();
    var text = $('#reply' + seq).text();
    $('#reply' + seq).html('<textarea class="form-control">' + text + '</textarea>');
    $('#tmpContent').val(text);
}

function fn_update_cancel(seq) {
    $('#reply-bottom' + seq).hide();
    $('#reply-top' + seq).show();
    $('#reply' + seq).html($('#tmpContent').val());
}

function fn_insert() {
    $("#reply").attr("action", "<%=request.getContextPath()%>/comment/insert.do");
    $("#reply").submit();
}

function fn_delete(seq) {
    if(confirm("댓글을 삭제하시겠습니까?")) {
        $('#reply').attr("action", "<%=request.getContextPath()%>/comment/delete.do");
        $('#replySeq').val(seq);
        $('#reply').submit();
    }
}
</script>

<%@include file="/WEB-INF/view/common/bottom.jsp"%>
