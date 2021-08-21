<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.commBoard.vo.CommBoardVO"%>
<%@page import="kr.or.ddit.comment.vo.CommentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CommBoardVO cv = (CommBoardVO) request.getAttribute("boardVO");
	int commentCount = (Integer) request.getAttribute("commentCnt");
	List<CommentVO> commentList = (List<CommentVO>) request.getAttribute("commentList");
	if(commentList == null) commentList = new ArrayList<CommentVO>();
%>

<%@include file="/WEB-INF/view/common/mainNav.jsp"%>

	<!-- Page Content -->
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
						boardCode = "401호 12월반";
					}
					else if(cv.getCode().equals("CLASS402")){
						boardCode = "402호 3월반";
					}
					else if(cv.getCode().equals("CLASS403")){
						boardCode = "403호 1월반";
					}
					else if(cv.getCode().equals("CLASS404")){
						boardCode = "404호 2월반";
					}			
					else if(cv.getCode().equals("CLASS405")){
						boardCode = "405호 3월반";
					}			
					else if(cv.getCode().equals("CLASS406")){
						boardCode = "406호 11월반";
					}			
					else if(cv.getCode().equals("CLASS407")){
						boardCode = "407호 10월반";
					}			
					else if(cv.getCode().equals("CLASS408")){
						boardCode = "408호 ?월반";
					}	
					%><%=boardCode %> 게시판
				</h1>

				<!-- Blog Post -->
				<div class="card mb-4">
					<div class="card-body">
						<table class="table" >
							<tbody>
								<tr class="d-flex text-left col-xs-12">
									<th class="col-xs-2 ">제목</th>
									<th class="col-xs-10 " name="boardTitle"><%=cv.getBoardTitle() %></th>
								</tr>
								<tr class="d-flex text-left col-xs-12">
									<td class="col-xs-1 "><small>작성자</small></td>
									<td class="col-xs-3 "name="userId"><%=cv.getUserId()%></td>
									<th class="col-xs-2 "><small>조회수</small></th>
									<th class="col-xs-2 "name="boardHitsNumber"><small><%=cv.getBoardHitsNumber() %></small></th>
									<td class="col-xs-2 "><small>작성일</small></td>
									<td class="col-xs-2 "name="boardDate"><small><%=cv.getBoardDate() %></small></td>

								</tr>
								<tr class="d-flex text-left">
									<td class="col-12"><img id="atchFile" class="col-12" src="<%=request.getContextPath() %>/filedownload.do?fileId=<%=cv.getAtchFileId() %>">
									<%if(cv.getAtchFileId() == -1){
										%>
										<script type="text/javascript">
											$("#atchFile").hide();
										</script>
										<% }
										%>
									
									</td>
								</tr>
								<tr class="d-flex text-left">
									<td class="col-12">
								<%=cv.getBoardContent() %>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="card-footer d-flex justify-content-center">
					<div class="d-flex justify-content-center mb-4">
							<a id="list" class="btn btn-lg btn-secondary" type="button" href="<%=request.getContextPath() %>/<%=cv.getCode() %>/list.do">목록</a>
								&nbsp;&nbsp;
					<% if(userId ==null){
						
					}
					else if(userId.equals("" + cv.getUserId()+ "") || userType.equals("관리자")){
					%>
						<a id="upd" class="btn btn-lg btn-secondary" type="submit" href="<%=request.getContextPath() %>/<%=cv.getCode() %>/update.do?boardSeq=<%=cv.getBoardSeq()%>">수정하기</a>
							&nbsp;&nbsp;
						<a id="del" class="btn btn-lg btn-secondary" type="reset" onclick="alert('삭제하시겠습니까?')" href="<%=request.getContextPath() %>/<%=cv.getCode() %>/delete.do?boardSeq=<%=cv.getBoardSeq()%>">삭제하기</a>
					</div>
					<% }
					else{}%>
					</div>
						</div>
					</div>
 					<div class="card-footer">
						<h2 class="card-title">댓글<small class="ml-5"><%=commentCount %> 개</small></h2>
						
					</div>
					<div class="card-body">
						<table class="table table-sm table-hover" >
							<tbody>
							<%
								for (CommentVO commentVO : commentList) {
							%>
								<tr class="d-flex text-left">
									<th class="col-3"><%=commentVO.getUserId() %></th>
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
								if(userId != null){
							%>
							<tbody id="replyArea">
								<tr class="d-flex text-left">
									<th class="col-12 table-info" id="rUserId"><%=userId %></th>
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
		</div>
	</div>
<!-- 들고나갈 값 -->
<form id="fm" method="post">
	<input type="hidden" name="code" value="DEV">
	<input type="hidden" id="boardSeq" name="boardSeq" value="<%=cv.getBoardSeq()%>">
	<input type="hidden" id="userId" name="userId" value=<%= userId%>>
	<input type="hidden" id="replyContent" name="replyContent">
	<input type="hidden" id="tmpContent">
	<input type="hidden" id="replySeq" name="replySeq">
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
			$('#fm').attr("action", "<%=request.getContextPath()%>/comment/delete.do");
			$('#replySeq').val(seq);
			$('#fm').submit();
		}
	}
	
	
</script>
	
<%@include file="/WEB-INF/view/common/mainFooter.jsp"%>
