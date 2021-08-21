<%@page import="kr.or.ddit.commBoard.vo.CommBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<CommBoardVO> boardList = (List<CommBoardVO>)request.getAttribute("boardList");

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
       	h1, h2, li, a, th, td{
       		font-family: 'Jua', sans-serif;
			font-size: 1.2em;
       	}
       	h3,h4,h5,h6, p{
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
<input type="hidden" name="code" value="개발">
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
						<h2 class="card-title">게시판 목록</h2>
						<p class="card-text">온통 너의 생각 뿐야~</p>
						<table class="table" >
							<tbody>
								<tr class="d-flex text-center">
									<th class="col-1">번호</th>
									<th class="col-1">분류</th>
									<th class="col-5">제목</th>
									<th class="col-2">작성자</th>
									<th class="col-2">작성일</th>
									<th class="col-1">추천수</th>
								</tr>
																<%
				int boardSize = boardList.size();
				String atchFile = "N";
				if(boardSize > 0){
					for(int i = 0; i < boardSize; i++){
						if(boardList.get(i).getAtchFileId() > 0){
							atchFile="Y";
						}
		%>

								<tr>
									<td><a href="select.do?boardSeq=<%=boardList.get(i).getBoardSeq()%>"><%=boardList.get(i).getBoardSeq()%></a></td>
									<td><%=boardList.get(i).getCode() %></td>
									<td><%=boardList.get(i).getBoardTitle() %></td>
									<td><%=boardList.get(i).getUserId() %></td>
									<td><%=boardList.get(i).getBoardDate() %></td>
									<td><%=boardList.get(i).getBoardHitsNumber() %></td>
								</tr>
								<%
					}
				}else{
			
		%>
								<tr>
									<td colspan="8">게시판 정보가 없습니다.</td>
								</tr>
								<%
				}
		%>
							</tbody>
						</table>
					</div>
					<div class="card-footer d-flex justify-content-end">
						<a class="btn btn-lg btn-secondary" type="submit" href="insert.do">게시글 작성하기</a>
						&nbsp;&nbsp;
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
