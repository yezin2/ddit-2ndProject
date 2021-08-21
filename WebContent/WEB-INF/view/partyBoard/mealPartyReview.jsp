<%@page import="kr.or.ddit.restInfo.vo.RestInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<RestInfoVO> restList =  (List<RestInfoVO>)request.getAttribute("restList");
%>
<%@include file="/WEB-INF/view/common/mainNav.jsp"%>

	<!-- Page Content -->
	<%
		String restCode = "";
		if(!"0".equals(request.getParameter("restCode"))) restCode = request.getParameter("restCode");
		else restCode = "0";
	%>
<form method="post" action="insertReview.do" enctype="multipart/form-data">
<input  type="hidden" value="<%=userId %>" name="userId">
	<div class="container">
		<div class="row">
			<!-- Blog Entries Column -->
			<div class="col-md-12">
				<h1 class>
					리뷰 등록
				</h1>

				<!-- Blog Post -->
				<div class="card mb-4">
					<div class="card-body">
						<h2 class="card-title">
							리뷰</h2>
						<table class="table" >
							<tbody>
								<tr class="d-flex text-left">
									<th class="col-1 "><h2>제목</h2></th>
									<th class="col-11 "><input type="text" id="boardTitle" name="boardTitle" class="form-control input-lg" placeholder="제목을 입력해주세요." value=""></th>
								</tr>
								<tr class="d-flex text-left">
									<th class="col-1 "><h2>작성자</h2></th>
									<td class="col-3 " id="userId"><%=userId %>
									</td>
									<td class="col-1"></td>
									<th class="col-1"><h2>평점</h2></th>
									<td class="col-3">
										<select id="scoSelect" onchange="opt()">
											<option id="score5" class="sco" value="5" selected="selected">5점
											<option id="score4" class="sco" value="4">4점
											<option id="score3" class="sco" value="3">3점
											<option id="score2" class="sco" value="2">2점
											<option id="score1" class="sco"  value="1">1점
										</select>
									</td>
									<th class="col-1">식당명</th>
									<td class="col-2">
										<%
										String insertRestCode;
										if("0".equals(restCode)){
											%>
										<select id="nameSelect" onchange="opt()">
											<%
											for(int i = 0; i < restList.size(); i++){
												 insertRestCode = restList.get(i).getRestCode();
										%>
											<option id="rest<%=i+1 %>" class="restN" value="<%=restList.get(i).getRestCode() %>"><%=restList.get(i).getRestName() %>
										<%
											}
										%>
										</select> 
										<%
										}else{
											for(int i = 0; i < restList.size(); i++){
												 insertRestCode = restList.get(i).getRestCode();
												if(restCode.equals(insertRestCode)){
										%>
										<span id="rest<%=i+1 %>" value="<%=restList.get(i).getRestName() %>">
										<%=restList.get(i).getRestName() %>
										</span>
										<%
												}
											}
										}
										%>
									</td>
								</tr>
								<tr class="d-flex text-left">
									<th class="col-1 "><h2>내용</h2></th>
									<td class="col-11 text-left"><span>블랙리스트에 오르고 싶지 않다면 순순히 바른말 고운말을 사용합시다.</span>
									</td>
								</tr>
								<tr>
									<td><textarea class="form-control" name="boardContent" rows="10" placeholder="내용을 입력하세요." value=""></textarea></td>
								</tr>
							</tbody>
						</table>
					</div>
					<input type="hidden" id="restScore" name="restScore" value="5">
					<input type="hidden" id="restCode" name="restCode" value="1">
					<script type="text/javascript">
						function opt(){
							var restScore = $('#scoSelect').val();
							$('#restScore').val(restScore);
							var restCode = $('#nameSelect').val();
							$('#restCode').val(restCode);
						}
					</script>
					<div class="card-footer d-flex justify-content-end">
						<button  type="submit" class="btn btn-lg btn-secondary"><a>게시물 등록</a></button>
						&nbsp;&nbsp;
						&nbsp;&nbsp;
						<a class="btn btn-lg btn-secondary" href="<%=request.getContextPath() %>/searchRest/detailRest.do?restCode=<%=restCode %>&userId=<%=userId %>">식당으로 돌아가기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
	<!-- /.container -->
	<%@include file="/WEB-INF/view/common/mainFooter.jsp"%>