<%@page import="kr.or.ddit.adminBoard.vo.AdminBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AdminBoardVO abv = (AdminBoardVO)request.getAttribute("adminBoardVO");
%>
<%@include file="/WEB-INF/view/common/top.jsp"%>
<%@include file="/WEB-INF/view/common/boardSubNav.jsp"%>
<link href="<%=request.getContextPath() %>/css/boardCss.css" rel="stylesheet" />
						<div class="card mb-4">
                            <div class="card-body">
                               공지 게시판 관리 페이지
                            </div>
                        </div>
                        <div class="get-board">
                               	<a class="btn btn-outline-secondary btn-sm float-left" onclick="fnGetAll()">목록</a>
                               	<a class="btn btn-outline-info btn-sm float-left mr-2" onclick="fnDelete(<%=abv.getBoardSeq() %>)">삭제</a>
                               	<a class="btn btn-outline-info btn-sm float-left mr-2" onclick="fnUpdate(<%=abv.getBoardSeq() %>)">수정</a>
								<br><br>
                        	<table class="board-table table-spacing right">
                       			<tr class="border-bottom">
                       				<th class="tr-th text-center border-right">제목</th>
                       				<td colspan="3"><%=abv.getBoardTitle() %></td>
                       			</tr>
                       			<tr class="border-bottom">
                       				<th class="tr-th text-center border-right">작성자</th>
                       				<td><%=abv.getUserId() %></td>
                       				<th class="tr-th border-left text-center border-right">작성일</th>
                       				<td><%=abv.getBoardDate() %></td>
                       			</tr>
                       			<tr class="border-bottom">
                       				<th class="tr-th text-center border-right">내용</th>
                       				<td colspan="3"><%=abv.getBoardContent() %></td>
                       			</tr>
                       			<tr class="border-bottom">
                       				<th class="tr-th text-center border-right">첨부파일</th>
                       				<td>(첨부파일)</td>
                       				<th class="tr-th border-left text-center border-right">삭제여부</th>
                       				<td><%=abv.getBoardDelete() %></td>
                       			</tr>
                        	</table>
                        </div>
                   	</div>
                </main>
        <form id="fm" method="post">
        	<input type="hidden" id="boardSeq" name="boardSeq">
        </form>
        <script type="text/javascript">
        function fnDelete(data){
    		if(confirm("삭제하시겠습니까?")){//삭제하기
    			$("#fm").attr("action", "<%=request.getContextPath()%>/adminBoard/noticeDelete.do");
    			$("#boardSeq").val(data);
    			$("#fm").submit();
    		}
    	}
        function fnUpdate(data) {//수정하기
//				if(confirm("수정ㄱ?")){
				$("#fm").attr("method", "get");
				$("#fm").attr("action", "<%=request.getContextPath()%>/adminBoard/noticeUpdate.do");
				$("#boardSeq").val(data);
				$("#fm").submit();
//				}
		}
        function fnGetAll() {//목록으로 돌아가기
			$("#fm").attr("action", "<%=request.getContextPath()%>/adminBoard/noticeGetAll.do");
			$("#fm").submit();
		}	
		</script>
		
		
<%@include file="/WEB-INF/view/common/bottom.jsp"%>