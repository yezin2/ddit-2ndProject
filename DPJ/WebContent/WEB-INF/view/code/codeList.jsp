<%@page import="kr.or.ddit.code.vo.CodeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<CodeVO> codeList = (List<CodeVO>) request.getAttribute("codeList");
%>
<%@include file="/WEB-INF/view/common/top.jsp"%>

<main>
<div class="container-fluid">
	<h1 class="mt-4 mb-4">Code Administration</h1>

	<div class="card mb-4">
		<div class="card-body">
			그룹 코드의 하위 코드 관리
		</div>
	</div>

	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i> TB_CODE
			<a class="btn btn-outline-info btn-sm float-right"href="javascript:history.back();">뒤로 가기</a>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>#</th>
							<th>그룹코드</th>
							<th>코드</th>
							<th>코드명</th>
							<th>사용여부</th>
							<th>관리</th>
						</tr>
					</thead>

					<tbody>

						<%
							int codeSize = codeList.size();
							if (codeSize > 0) {
								for (int i = 0; i < codeSize; i++) {
						%>
						<tr>
							<td><%=i + 1%></td>
							<td><%=codeList.get(i).getGroupCode()%></td>
							<td><%=codeList.get(i).getCode()%></td>
							<td><%=codeList.get(i).getCodeName()%></td>
							<td><%=codeList.get(i).getUseYn()%></td>
							<td>
								<a class="btn btn-outline-info btn-sm" onclick="fn_update('<%=codeList.get(i).getCode()%>');">수정</a>
								<a class="btn btn-outline-info btn-sm" onclick="fn_delete('<%=codeList.get(i).getCode()%>');">삭제</a>
							</td>
						</tr>
						<%
							}
							} else {
						%>

						<tr>
							<td colspan="6">코드정보가 없습니다.</td>
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
	<input type="hidden" id="code" name="code" />
</form>
</main>
<script>
	function fn_delete(id) {
		if(confirm(id + ' 코드를 삭제하시겠습니까?')) {
			$('#fm').attr('action', '<%=request.getContextPath() %>/code/delete.do');
			$('#code').val(id);
			$('#fm').submit();
		}
	}
</script>

<%@include file="/WEB-INF/view/common/bottom.jsp"%>
