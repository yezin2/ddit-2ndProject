<%@page import="kr.or.ddit.code.vo.CodeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<CodeVO> cv = (List<CodeVO>) request.getAttribute("codeList");
%>

<%@include file="/WEB-INF/view/common/top.jsp"%>

<main>
	<div class="container-fluid">
		<h1 class="mt-4 mb-4">Code Administration</h1>
		
		<div class="card mb-4">
			<div class="card-body">
				하위 코드 관리 페이지입니다.
				<div class="float-right">
					<a class="btn btn-outline-primary btn-sm" href="<%=request.getContextPath()%>/group/list.do">그룹코드</a>
					<a class="btn btn-outline-info btn-sm active" href="<%=request.getContextPath()%>/code/allList.do">하위코드</a>
				</div>
			</div>
		</div>
		
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i> TB_GROUP_CODE_INFO
				<a type="button" class="btn btn-outline-danger btn-sm float-right" href="<%=request.getContextPath()%>/code/insert.do">코드 추가</a>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
							int codeSize = cv.size();
							if(codeSize > 0) {
								for(int i = 0; i < codeSize; i++) {
							%>
							<tr>
								<td><%=i+1 %></td>
								<td><%=cv.get(i).getGroupCode() %></td>
								<td><%=cv.get(i).getCode() %></td>
								<td><%=cv.get(i).getCodeName() %></td>
								<td><%=cv.get(i).getUseYn() %></td>
								<td>
									<a class="btn btn-outline-info btn-sm" onclick="fn_update('<%=cv.get(i).getCode()%>');">수정</a>
									<a class="btn btn-outline-info btn-sm" onclick="fn_delete('<%=cv.get(i).getCode()%>');">삭제</a>
								</td>
							</tr>
							<%		
								}
							} else {
							%>
							<tr>
								<td colspan="6">등록된 코드가 없습니다.</td>
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
<script type="text/javascript">
	function fn_update(id) {
		$('#fm').attr('method', 'get');
		$('#fm').attr('action', '<%=request.getContextPath()%>/code/update.do');
		$('#code').val(id);
		$('#fm').submit();
	}
	
	function fn_delete(id) {
		if(confirm(id + ' 코드를 삭제하시겠습니까?')) {
			$('#fm').attr('action', '<%=request.getContextPath() %>/code/delete.do');
			$('#code').val(id);
			$('#fm').submit();
		}
	}
</script>

<%@include file="/WEB-INF/view/common/bottom.jsp"%>
