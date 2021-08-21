<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/view/common/mainNav.jsp"%>
	<!-- Page Content -->
	<div class="container">
		<div class="row">

			<!-- Blog Entries Column -->
			<div class="col-md-12">
				<h1 class="my-4">
					개발 커뮤니티 게시판
				</h1>

				<!-- Blog Post -->
				<div class="card mb-4">
					<div class="card-body">
						<h2 class="card-title">게시판 수정</h2>
						<table class="table" >
							<tbody>
								<tr class="d-flex text-left">
									<th class="col-1 ">제목</th>
									<th class="col-11 "><input type="text" name="baordTitle" class="form-control input-lg" placeholder="제목을 보여주세요."></th>
								</tr>
								<tr class="d-flex text-left">
									<td class="col-1 ">작성자</td>
									<td class="col-3 ">userId가 표시됩니다.</td>
									<th class="col-6 "></th>
								</tr>
								<tr class="d-flex text-left">
									<td class="col-12"><input type="file" name="atchFileId">파일 뭐 선택했었는지 보이면 좋고
									</td>
								</tr>
								<tr class="d-flex text-left">
									<th class="col-1 ">내용</th>
									</td>
								</tr>
								
							</tbody>
						</table>
							<textarea class="form-control" name="baordContent" rows="10" placeholder="내용을 보여주세요."></textarea>
					</div>
					<div class="card-footer d-flex justify-content-end">
						<a class="btn btn-lg btn-secondary" type="submit">수정하기</a>
						&nbsp;&nbsp;
						&nbsp;&nbsp;
						<a class="btn btn-lg btn-secondary" type="reset" href="list.do">목록으로 돌아가기</a>
					</div>
				</div>
			</div>


		</div>
	</div>
	<!-- /.container -->

<%@include file="/WEB-INF/view/common/mainFooter.jsp"%>
