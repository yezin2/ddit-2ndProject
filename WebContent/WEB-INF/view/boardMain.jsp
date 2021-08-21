<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Enjoy your meal right on time! Main page</title>
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Jua&family=Sunflower:wght@300&display=swap" rel="stylesheet">
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="<%=request.getContextPath() %>/css/styles.css" rel="stylesheet" />
        <style type="text/css">
        	h1, h2, li, a{
        		font-family: 'Jua', sans-serif;
        	}
        	h3,h4,h5,h6, p{
 				font-family: 'Sunflower', sans-serif;
 				font-size: 1.2em;
        	
        	}
        	body{
        		  padding-top: 56px;
        	}
        </style>
    </head>
    
    <body>
    <form action="insert.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="userId" value="세션전까지 아이디">
     <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container" >
      <a class="navbar-brand col-lg-2-h1" href="index.html">굿끼제먹</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      
      <div class="collapse navbar-collapse " id="navbarResponsive">
        <ul class="navbar-nav ml-auto col-lg-7-h1">
          <li class="nav-item">
            <a class="nav-link" href="#">이벤트 게시판</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">식당검색</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Meal파티 게시판</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">커뮤니티 게시판</a>
          </li>		
          <li class="nav-item">
            <a class="nav-link" href="#">고객 센터</a>
          </li>
        </ul>
      </div>
      <div class="container col-sm-3">
			<ul class="navbar-nav text-uppercase ml-auto">
	            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#contact">로그인</a></li>
	   	        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#contact">회원가입</a></li>
	 	    </ul>
	  </div>
	  </div>
  </nav>
	   <!-- Page Content -->
	  <div class="container">
	
	    <div class="row">
	
	      <!-- Blog Entries Column -->
	      <div class="col-md-8">
	
	        <h1 class="my-4">통합 커뮤니티 게시판
	          <small>[개발, 취업, 잡담, 반별]</small>
	        </h1>
	
	        <!-- Blog Post -->
	        <div class="card mb-4">
	        	
	          <div class="card-body">
	            <h2 class="card-title">통합 커뮤니티</h2>
	            <p class="card-text">아닌척 하지 마이요오~</p>
	          </div>
	          <div class="card-footer text-muted">
	            <table class="table">
	        		<tbody>
	        			<tr>
	        				<td>분류</td>
	        				<td>제목</td>
	        				<td>작성자</td>
	        				<td>작성일</td>
	        				<td>조회수</td>
	        			</tr>
	        			<tr>
	        				<td name="code">개발</td>
	        				<td name="boardTitle">타이틀</td>
	        				<td name="userId">ihyeon</td>
	        				<td name="boardDate">오늘</td>
	        				<td name="boardHitsNumber">999</td>
	        			</tr>
	        		</tbody>
	        	</table>
	          </div>
	        </div>	
	        <!-- Pagination -->
	        <ul class="pagination justify-content-center mb-4">
	          <li class="page-item">
	            <a class="page-link" href="#">&larr; Older</a>
	          </li>
	          <li class="page-item disabled">
	            <a class="page-link" href="#">Newer &rarr;</a>
	          </li>
	        </ul>
	
	      </div>
	
	      <!-- Sidebar Widgets Column -->
	      <div class="col-md-4">
	
	        <!-- Search Widget -->
	        <div class="card my-4">
	          <h5 class="card-header">Search</h5>
	          <div class="card-body">
	            <div class="input-group">
	              <input type="text" class="form-control" placeholder="Search for...">
	              <span class="input-group-append">
	                <button class="btn btn-secondary" type="button">Go!</button>
	              </span>
	            </div>
	          </div>
	        </div>
	
	        <!-- Categories Widget -->
	        <div class="card my-4">
	          <h5 class="card-header">Categories</h5>
	          <div class="card-body">
	            <div class="row">
	              <div class="col-lg-6">
	                <ul class="list-unstyled mb-0">
	                  <li>
	                    <a class="text-info" href="#">통합 커뮤니티 게시판</a>
	                  </li>
	                  <li>
	                    <a class="text-info" href="#">개발 커뮤니티</a>
	                  </li>
	                  <li>
	                    <a class="text-info" href="#">취업 커뮤니티</a>
	                  </li>
	                  <li>
	                    <a class="text-info" href="#">잡담 커뮤니티</a>
	                  </li>
	                  
	                </ul>
	              </div>
	              <div class="col-lg-6">
	                <ul class="list-unstyled mb-0">
		              <li>
	                    <span class="text-info" href="#">반별 커뮤니티</span>
	                  </li>
	                  <li>
	                    <a class="text-info" href="#">401호</a>
	                  </li>
	                  <li>
	                    <a class="text-info" href="#">402호</a>
	                  </li>
	                  <li>
	                    <a class="text-info" href="#">403호</a>
	                  </li>
	                  <li>
	                    <a class="text-info" href="#">404호</a>
	                  </li>
	                </ul>
	              </div>
	            </div>
	          </div>
	        </div>
	
	        <!-- Side Widget -->
	        <div class="card my-4">
	          <h5 class="card-header">Side Widget</h5>
	          <div class="card-body">
	            You can put anything you want inside of these side widgets. They are easy to use, and feature the new Bootstrap 4 card containers!
	          </div>
	        </div>
	
	      </div>
	
	    </div>
	    <!-- /.row -->
	
	  </div>
	  <!-- /.container -->
	
	  <!-- Footer -->
	  <footer class="py-5 bg-dark">
	    <div class="container">
	      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2020</p>
	    </div>
	    <!-- /.container -->
	  </footer>
	
	  <!-- Bootstrap core JavaScript -->
	  <script src="vendor/jquery/jquery.min.js"></script>
	  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Core theme JS-->
        <script src="<%=request.getContextPath() %>/js/scripts.js"></script>
        </form>
    </body>
</html>
