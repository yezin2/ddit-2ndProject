<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String userId = (String) session.getAttribute("USERID");
	String userType = (String) session.getAttribute("USERTYPE");
	String userPhoto = (String) session.getAttribute("USERPHOTO");
	String visitFlag = (String) session.getAttribute("VISITFLAG");
	
	if(userId == null) {
		userId = "null";
	}
	
	if(userType == null) {
		userType = "비회원";
	}
	
	if(userPhoto == null) {
		userPhoto = "null";
	}
	
	if(visitFlag == null) {
		visitFlag = "null";
	}
	
	
	System.out.println("★★JSP VISITFLAG : "+visitFlag);
%>
  
<!DOCTYPE html>
<html lang="kr">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>Enjoy your meal right on time!</title>
	<link rel="icon" type="image/x-icon" href="<%=request.getContextPath() %>/assets/img/favicon.ico" />
	<!-- Font Awesome icons (free version)-->
	<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
	<!-- Google fonts-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
	<link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic"
		rel="stylesheet" type="text/css" />
	<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
		rel="stylesheet" type="text/css" />
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Sunflower:wght@300&display=swap"
		rel="stylesheet">
	<!-- Core theme CSS (includes Bootstrap)-->
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.6.0.js"></script>
	<link href="<%=request.getContextPath() %>/css/styles.css" rel="stylesheet" />
	<script src="<%=request.getContextPath() %>/js/scripts.js"></script>
    <script>
        function movePageByGet(url){
        	  location.href = url;
        }
		function logout(url){ 
			alert("로그아웃 합니다.");
			movePageByGet(url);
		}
    </script>
	<style type="text/css">
		body {
			padding-top: 86px;
		}
		
		h1 {
			font-family: 'Jua', sans-serif;       	
		}
     	
		h2, li, a, th, td, button{
			font-family: 'Jua', sans-serif;
			font-size: 1.2em;
		}
		
		h3,h4,h5,h6, p {
			font-family: 'Sunflower', sans-serif;
			font-size: 1.2em;
		}
		tg{
			text-align: center;
		}
/* 		tr, td{ */
/* 			text-align: left; */
/* 		} */
	</style>
</head>

<body>
	
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand col-lg-2-h1" href="<%=request.getContextPath() %>/main/main.do"><h1><i class="fas fa-cookie-bite mr-3"></i>굿끼제먹</h1></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" 
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse " id="navbarResponsive">
				<ul class="navbar-nav ml-auto col-lg-7-h1">
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/searchRest/list.do">식당검색</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/PARTY/main.do">Meal파티</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/commBoard/main.do">커뮤니티</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/eventBoard/list.do"">이벤트</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/adminBoardMain/noticeGetAll.do">고객센터</a></li>
					<%
						if("일반회원".equals(userType) || "식당회원".equals(userType)){
					%>
						<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/mypage/main.do">마이페이지 </a></li>
					<%
						}
					%>
				</ul>
			</div>
			<div class="container col-sm-3">
				<ul class="navbar-nav text-uppercase ml-auto">
					<%
						if("null".equals(userId)){
					%>       
						<li class="nav-item"><a class="nav-link js-scroll-trigger" href="javascript:movePageByGet('<%=request.getContextPath() %>/logInOut/login.do');" >로그인</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger" href="javascript:movePageByGet('<%=request.getContextPath() %>/register/registerType.do');">회원가입</a></li>
					<%
						} else {
					%>
							<li class="nav-item"><a class="nav-link js-scroll-trigger" href="javascript:movePageByGet('<%=request.getContextPath() %>/logInOut/logout.do');">로그아웃</a></li>
						<%
							if("관리자".equals(userType)){
						%>
							<li class="nav-item"><a class="nav-link js-scroll-trigger" href="javascript:movePageByGet('<%=request.getContextPath() %>/admin/main.do');">관리자메뉴</a></li>
						<%
							}
						%>
					<%
						}
					%>	
				</ul>
			</div>
		</div>
	</nav>