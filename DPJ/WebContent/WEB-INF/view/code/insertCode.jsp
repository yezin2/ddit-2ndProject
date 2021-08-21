<%@page import="kr.or.ddit.groupCode.vo.GroupCodeInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<GroupCodeInfoVO> gv = (List<GroupCodeInfoVO>)request.getAttribute("groupCode");
%>
<%@include file="/WEB-INF/view/common/top.jsp"%>

<main>
<div class="container-fluid">
	<h1 class="mt-4 mb-4">Code Administration</h1>

	<div class="card mb-4">
		<div class="card-body">
			코드 추가
		</div>
	</div>

	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i> TB_CODE
			<a class="text-info float-right" href="<%=request.getContextPath()%>/code/allList.do">
				전체코드 목록으로
			</a>
		</div>
		<div class="card-body">
			<form action="insert.do" method="post">
				<div class="table-responsive">
					<table class="table table-bordered" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>그룹코드</th>
								<th>코드</th>
								<th>코드명</th>
								<th>추가</th>
							</tr>
						</thead>
						
						<tbody>
							<tr>
								<td>
									<select class="custom-select" name="groupCode">
										<option selected>그룹코드선택</option>
										<%
											for(int i = 0; i < gv.size(); i++) {
										%>
										<option value="<%=gv.get(i).getGroupCode()%>"><%=gv.get(i).getGroupCode()%></option>
										<%
											}
										%>
									</select>
								</td>
								<td><input type="text" class="form-control" id="code" name="code"></td>
								<td><input type="text" class="form-control" id="codeName" name="codeName"></td>
								<td><button type="submit" class="btn btn-outline-primary mr-5">추가</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
		</div>
	</div>
</div>
</main>
 <%@include file="/WEB-INF/view/common/bottom.jsp"%>   