<%@page import="kr.or.ddit.groupCode.vo.GroupCodeInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	GroupCodeInfoVO groupCodeVO = (GroupCodeInfoVO) request.getAttribute("groupCodeVO");

%>

<%@include file="/WEB-INF/view/common/top.jsp"%>

<main>
<div class="container-fluid">
	<h1 class="mt-4 mb-4">Code Administration</h1>

	<div class="card mb-4">
		<div class="card-body">코드 수정 테스트용 임시 페이지 입니다.</div>
	</div>

	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i> TB_GROUP_CODE_INFO
		</div>
		<div class="card-body">
			<form action="update.do" method="post">
				<div class="table-responsive">
					<table class="table table-bordered text-center" width="100%" cellspacing="0">
						<tbody>
							<tr>
								<th class="table-info">그룹코드</th>
								<td><%=groupCodeVO.getGroupCode() %></td>
								<td>그룹코드는 수정 불가능</td>
							</tr>


							<tr>
								<th class="table-info">그룹코드명</th>
								<td><%=groupCodeVO.getGroupCodeName() %></td>
								<td><input type="text" class="form-control"
									id="newGroupCodeName" name="groupCodeName"></td>
							</tr>

							<tr>
								<td colspan=3>
									<button type="submit" class="btn btn-outline-primary mr-5">수정</button>
									<button type="reset" class="btn btn-outline-dark mr-5">초기화</button>
									<a class="btn btn-outline-dark"
									href="<%=request.getContextPath() %>/group/list.do">목록으로</a>
							</tr>
						</tbody>
					</table>
				</div>
				<input type="hidden" name="groupCode" value="<%=groupCodeVO.getGroupCode() %>">
			</form>
		</div>
	</div>
</div>
</main>
<%@include file="/WEB-INF/view/common/bottom.jsp"%>
