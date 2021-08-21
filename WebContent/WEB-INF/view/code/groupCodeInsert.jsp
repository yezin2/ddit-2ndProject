<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/common/top.jsp"%>

<main>
<div class="container-fluid">
	<h1 class="mt-4 mb-4">Group Code Administration</h1>

	<div class="card mb-4">
		<div class="card-body">
			그룹코드 추가
			<div class="g-recaptcha" data-sitekey="6LfwG7QaAAAAADom_Fp9nORAKjAkPpyThYdUKyIl" data-callback="recaptcha"></div>
		</div>
	</div>

	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i> TB_GROUP_CODE_INFO
		</div>
		<div class="card-body">
			<form action="insert.do" method="post">
				<div class="table-responsive">
					<table class="table table-bordered" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>그룹코드</th>
								<th>그룹코드명</th>
								<th>추가</th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td><input type="text" class="form-control" id="groupCode" name="groupCode"></td>
								<td><input type="text" class="form-control" id="groupCodeName" name="groupCodeName"></td>
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