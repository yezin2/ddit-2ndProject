<%@page import="kr.or.ddit.code.vo.CodeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CodeVO cv = (CodeVO) request.getAttribute("codeVO");
%>   
<%@include file="/WEB-INF/view/common/top.jsp"%>

<main>
	<div class="container-fluid">
		<h1 class="mt-4 mb-4">Code Administration</h1>
		
		<div class="card mb-4">
			<div class="card-body">
				코드 수정
				<div class="float-right">
					<a class="btn btn-outline-primary btn-sm" href="<%=request.getContextPath()%>/group/list.do">그룹코드</a>
					<a class="btn btn-outline-info btn-sm active" href="<%=request.getContextPath()%>/code/allList.do">하위코드</a>
				</div>
			</div>
		</div>
		
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i> TB_GROUP_CODE_INFO
			</div>
			<div class="card-body">
				<form action="update.do" method="post">
					<div class="table-responsive">
						<table class="table table-bordered" width="100%" cellspacing="0">
							<thead>
								<tr>
									<th>그룹코드</th>
									<td><%=cv.getGroupCode() %></td>
									<td>그룹코드는 그룹코드 메뉴에서 수정하세요.</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>코드</th>
									<td><%=cv.getCode() %></td>
									<td><input type="text" class="form-control" id="code" name="code"></td>
								</tr>
								<tr>
									<th>코드이름</th>
									<td><%=cv.getCodeName()%></td>
									<td><input type="text" class="form-control" id="codeName" name="codeName"></td>
								</tr>
								<tr>
									<td colspan=3>
									<button type="submit" class="btn btn-outline-primary mr-5">수정</button>
									<button type="reset" class="btn btn-outline-dark mr-5">초기화</button>
								</tr>
							</tbody>
						</table>
						<input type="hidden" name="groupCode" value="<%=cv.getGroupCode() %>" />
					</div>
				</form>
			</div>
		</div>
	</div>
</main>

<%@include file="/WEB-INF/view/common/bottom.jsp"%>
