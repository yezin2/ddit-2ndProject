<%@page import="kr.or.ddit.event.vo.EventVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	EventVO eventVO = (EventVO)request.getAttribute("eventVO");
%>
<%@include file="/WEB-INF/view/common/mainNav.jsp"%>

	<!-- Page Content -->
<form id="fm" method="post" action="update.do" enctype="multipart/form-data">
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
									<option name="code" value="PROMO" checked>홍보글</option>
									<option name="code" value="EVE">이벤트글</option>
								</select>
							게시판</h2>
						<table class="table" >
							<tbody>
								<tr class="d-flex text-left">
									<th class="col-1 "><h2>제목</h2></th>
									<th class="col-11 "><input type="text" name="boardTitle" class="form-control input-lg" placeholder="제목을 입력해주세요." value="<%=eventVO.getBoardTitle() %>"></th>
								</tr>
								<tr class="d-flex text-left">
									<td class="col-1 "><h2>작성자</h2></td>
									<td class="col-3 "><%=userId %></td>
									<th class="col-6 "></th>
								</tr>
								<tr class="d-flex text-left">
									<td class="col-12"><input type="file" name="atchFileId">
									</td>
								</tr>
								<tr class="d-flex text-left">
									<th class="col-1 "><h2>내용</h2></th>
									<td><span>블랙리스트에 오르고 싶지 않다면 순순히 바른말 고운말을 사용합시다.</span>
									</td>
								</tr>
								<tr>
									<td><textarea class="form-control" name="boardContent" rows="10" placeholder="내용을 입력하세요." value=""><%=eventVO.getBoardContent() %></textarea></td>
								</tr>
								<%
									java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
		                        	String today = formatter.format(new java.util.Date());
								%>
								<tr class="d-flex text-left">
									<th class="col-1 "><h2>이벤트 종료일</h2></th>
									<td><input type="date" name="boardEnd" min="<%=today %>" value="<%=(eventVO.getBoardEnd()).substring(0,10) %>"></td>
								</tr>
								
							</tbody>
						</table>
					</div>
					<input type="hidden" name="boardSeq" value="<%=eventVO.getBoardSeq() %>">
					<div class="card-footer d-flex justify-content-end">
						<button type="submit" class="btn btn-lg btn-secondary">게시물 등록</button>
						&nbsp;&nbsp;
						&nbsp;&nbsp;
						<a class="btn btn-lg btn-secondary" href="list.do">목록으로 돌아가기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
	<!-- /.container -->
	<%@include file="/WEB-INF/view/common/mainFooter.jsp"%>