<%@page import="kr.or.ddit.restInfo.vo.RestInfoVO"%>
<%@page import="kr.or.ddit.event.vo.EventVO"%>
<%@page import="kr.or.ddit.common.vo.AtchFileVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	EventVO eventVO = (EventVO)request.getAttribute("eventVO");
	RestInfoVO restVO = (RestInfoVO)request.getAttribute("restVO");

	String date = eventVO.getBoardDate().substring(0,10);
	String end = eventVO.getBoardEnd().substring(0,10);
	List<AtchFileVO> atchFileList = (List<AtchFileVO>) request.getAttribute("atchFileList");
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
					이벤트/홍보
				</h1>

				<!-- Blog Post -->
				<div class="card mb-4">
					<div class="card-body">
						<table class="table" >
							<tbody>
								<tr class="d-flex text-left">
									<th class="col-1 ">제목</th>
									<th class="col-3 "><%=eventVO.getBoardTitle() %></th>
									<th class="col-6 "></th>
									<th class="col-1 "><small>조회수</small></th>
									<th class="col-1 "><small><%=eventVO.getBoardHits() %></small></th>
								</tr>
								<tr class="d-flex text-left">
									<td class="col-1 ">작성자</td>
									<td class="col-3 "><%=restVO.getUserId() %></td>
									<th class="col-3 "></th>
									<td class="col-1 "><small>작성일</small></td>
									<td class="col-1.5 "><small><%=date %></small></td>
									<td class="col-1 "><small>종료일</small></td>
									<td class="col-1.5 "><small><%=end %></small></td>
								</tr>
								<tr class="d-flex text-left">
									<td class="col-12"><img class="col-12" src="<%=request.getContextPath() %>>/assets/img/budae.jpg">
									</td>
								</tr>
								<tr class="d-flex text-left">
									<td class="col-12"><%=eventVO.getBoardContent() %></td>
								</tr>
								
							</tbody>
						</table>
						<div class="card-footer d-flex justify-content-center">
							<a type="button" class="btn btn-lg btn-secondary" href="list.do">목록으로 돌아가기</a>
						</div>
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
</body>
</html>
