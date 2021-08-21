<%@page import="kr.or.ddit.groupCode.vo.GroupCodeInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

    String msg = (String) request.getAttribute("msg");
	List<GroupCodeInfoVO> groupList = (List<GroupCodeInfoVO>) request.getAttribute("groupList");

%>

<%@include file="/WEB-INF/view/common/top.jsp"%>
<main>
<div class="container-fluid">
	<h1 class="mt-4 mb-4">Code Administration</h1>

	<div class="card mb-4">
		<div class="card-body">
			그룹 코드 관리 페이지입니다.
			<div class="float-right">
					<a class="btn btn-outline-primary btn-sm active" href="<%=request.getContextPath()%>/group/list.do">그룹코드</a>
					<a class="btn btn-outline-info btn-sm" href="<%=request.getContextPath()%>/code/allList.do">하위코드</a>
			</div>
		</div>
	</div>

	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i> TB_GROUP_CODE_INFO
			<a type="button" class="btn btn-outline-danger btn-sm float-right" href="<%=request.getContextPath()%>/group/insert.do">그룹 코드 추가</a>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>#</th>
							<th>그룹코드</th>
							<th>그룹코드명</th>
							<th>사용여부</th>
							<th>관리</th>
						</tr>
					</thead>

					<tbody id="chk">

						<%
							int groupSize = groupList.size();
							if (groupSize > 0) {
								for (int i = 0; i < groupSize; i++) {
						%>
						<tr>
							<td><%=i + 1%></td>
							<td><%=groupList.get(i).getGroupCode()%></td>
							<td><%=groupList.get(i).getGroupCodeName()%></td>
							<td><%=groupList.get(i).getUseYn()%></td>
							<td>
								<a class="btn btn-outline-info btn-sm" onclick="fn_detail('<%=groupList.get(i).getGroupCode()%>');">상세</a>
								<a class="btn btn-outline-info btn-sm" onclick="fn_update('<%=groupList.get(i).getGroupCode()%>');">수정</a>
								<a class="btn btn-outline-info btn-sm" onclick="fn_delete('<%=groupList.get(i).getGroupCode()%>');">삭제</a>
							</td>
						</tr>
						<%
							}
							} else {
						%>

						<tr>
							<td colspan="5">등록된 그룹코드가 없습니다.</td>
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
<form id="actionForm" method="post">
	<input type="hidden" id="groupCode" name="groupCode" />
</form>
</main>
<script type="text/javascript">
    function fn_update(id) {
        $('#actionForm').attr('method', 'get');
        $('#actionForm').attr('action', '<%=request.getContextPath()%>/group/update.do');
		$('#groupCode').val(id);
		$('#actionForm').submit();
	}

	function fn_detail(id) {
		$('#actionForm').attr('action', '<%=request.getContextPath() %>/code/list.do');
        $('#groupCode').val(id);
        $('#actionForm').submit();
    }

    function fn_delete(id) {
        if(confirm("삭제하시겠습니까?")) {
            $('#actionForm').attr('action', '<%=request.getContextPath() %>/group/delete.do');
            $('#groupCode').val(id);
            $('#actionForm').submit();
        }
    }
</script>

<%@include file="/WEB-INF/view/common/bottom.jsp"%>