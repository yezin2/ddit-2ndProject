<%@page import="kr.or.ddit.common.vo.AtchFileVO"%>
<%@page import="kr.or.ddit.commBoard.vo.CommBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CommBoardVO cv = (CommBoardVO)request.getAttribute("boardVO");
	List<AtchFileVO> atchFileList = (List<AtchFileVO>) request.getAttribute("atchFileList");
	
	String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");

%>    
    
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Enjoy your meal right on time! Main page</title>
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />

<!-- Font Awesome icons (free version)-->
	<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"crossorigin="anonymous"></script>
<!-- Google fonts-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"rel="stylesheet" type="text/css" />
	<link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
	<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<!-- Core theme CSS (includes Bootstrap)-->
	<link href="<%=request.getContextPath() %>/css/styles.css" rel="stylesheet" />
	<style type="text/css">
		h1, h2, li, a {
			font-family: 'Jua', sans-serif;
		}
		
		h3, h4, h5, h6, p {
			font-family: 'Sunflower', sans-serif;
			font-size: 1.2em;
		}
		
		body {
			padding-top: 56px;
		}
	</style>
</head>

<body>
<form action="insert.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="code" value="개발통합커뮤니티">
<input type="hidden" name="userId" value="세션전까지 아이디">
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand col-lg-2-h1" href="index.html">굿끼제먹</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse " id="navbarResponsive">
				<ul class="navbar-nav ml-auto col-lg-7-h1">
					<li class="nav-item"><a class="nav-link" href="#">이벤트 게시판</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">식당검색</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Meal파티
							게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="#">커뮤니티 게시판</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">고객 센터</a></li>
				</ul>
			</div>
			<div class="container col-sm-3">
				<ul class="navbar-nav text-uppercase ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#contact">로그인</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#contact">회원가입</a></li>
				</ul>
			</div>
		</div>
	</nav>
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
						<table class="table" >
							<tbody>
								<tr class="d-flex text-left">
									<th class="col-1 ">제목</th>
									<th class="col-3 " name="boardTitle"><%=cv.getBoardTitle() %></th>
									<th class="col-6 "></th>
									<th class="col-1 "><small>조회수</small></th>
									<th class="col-1 "name="boardHitsNumber"><small><%=cv.getBoardHitsNumber() %></small></th>
								</tr>
								<tr class="d-flex text-left">
									<td class="col-1 ">작성자</td>
									<td class="col-3 "name="userId"><%=cv.getUserId()%></td>
									<th class="col-6 "></th>
									<td class="col-1 "><small>작성일</small></td>
									<td class="col-1 "name="boardDate"><small><%=cv.getBoardDate() %></small></td>
								</tr>
								<tr class="d-flex text-left">
									<td class="col-12"><img class="col-12" src="../filedownload.do?fileId=<%=cv.getAtchFileId() %>">
									</td>
								</tr>
								<tr class="d-flex text-left">
									<td class="col-12">
								<%=cv.getBoardContent() %>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="card-footer d-flex justify-content-center">
							<a class="btn btn-lg btn-secondary" type="button" href="list.do">목록으로 돌아가기</a>
								&nbsp;&nbsp;
							<a class="btn btn-lg btn-secondary" type="submit" href="update.do">수정하기</a>
								&nbsp;&nbsp;
							<a class="btn btn-lg btn-secondary" type="reset" href="delete.do">삭제하기</a>
					</div>
						</div>
					</div>
 					<div class="card-footer">
						<h2 class="card-title">댓글</h2>
					</div>
					<div class="card-body">
						<table class="table table-sm table-hover" >
							<tbody>
								<tr class="d-flex text-left">
									<th class="col-3">무명의 더쿠</th>
									<th class="col-7"><small>2021-04-24</small></th>
									<th class="col-1 text-sm-right"><small>수정</small></th>
									<th class="col-1 text-sm-right"><small>삭제</small></th>
								</tr>
								<tr class="d-flex text-left">
									<th class="col-12">하루가 멀다하고 설레는데</th>
								</tr>
							</tbody>
							<tbody>
								<tr class="d-flex text-left">
									<th class="col-3">브브빠</th>
									<th class="col-7"><small>2021-04-24</small></th>
									<th class="col-1 text-sm-right"><small>수정</small></th>
									<th class="col-1 text-sm-right"><small>삭제</small></th>
								</tr>
								<tr class="d-flex text-left">
									<th class="col-12">너의 눈빛은 날 자꾸 니곁에 멤돌게 해~</th>
								</tr>
								<tr class="d-flex text-left">
									<th class="col-3 table-info">아이디가 표시되는 곳</th>
									<th class="col-3 table-info"><small>2021-04-24날짜표시</small></th>
									<th class="col-6 table-info"></th>
								</tr>
								<tr class="d-flex text-left table-info">
									<td class ="input-group-append col-11">
									<input type="text" class="form-control input-lg" aria-describedby="btn" placeholder="댓글을 입력해주세요.">
									</td>
									<td class ="input-group-append col-1">
									<button type="button" class="btn btn-outline-secondary" id="btn">등록</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- Pagination -->
				<ul class="pagination justify-content-center mb-4">
					<li class="page-item"><a class="page-link" href="#">&larr;
							Older</a></li>
					<li class="page-item disabled"><a class="page-link" href="#">Newer
							&rarr;</a></li>
				</ul>

			</div>


		</div>
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright © 그런거 없어요. 대덕인재개발원  ddit 202101</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Bootstrap core JS-->
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Third party plugin JS-->
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<!-- Core theme JS-->
		<script src="<%=request.getContextPath() %>/js/scripts.js"></script>
</form>
</body>
</html>
