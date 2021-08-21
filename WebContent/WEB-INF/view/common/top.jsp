<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>관리자 페이지</title>
    <link href="<%=request.getContextPath() %>/adminView/css/styles.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    <script src="<%=request.getContextPath()%>/js/jquery-3.6.0.js"></script>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand" href="<%=request.getContextPath() %>/admin/main.do">Welcome, Admin!</a>
		<button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
		
		<!-- Navbar Search-->
		<form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />
				<div class="input-group-append">
					<button class="btn btn-primary" type="button"><i class="fas fa-search"></i></button>
				</div>
			</div>
		</form>
		
		<!-- Navbar-->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
					<a class="dropdown-item" href="<%=request.getContextPath() %>/main/main.do">HOME MAIN</a>
<!-- 					<a class="dropdown-item" href="#">Activity Log</a> -->
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#" onclick="logout('<%=request.getContextPath() %>/logInOut/logout.do')">로그아웃</a>
				</div>
			</li>
		</ul>
		</nav>
        
        <div id="layoutSidenav">
			<div id="layoutSidenav_nav">
				<nav class="sb-sidenav accordion sb-sidenav-light" id="sidenavAccordion">
					<div class="sb-sidenav-menu">
						<div class="nav">
							<div class="sb-sidenav-menu-heading">MAIN</div>
								<a class="nav-link" href="<%=request.getContextPath() %>/admin/main.do">
									<div class="sb-nav-link-icon"><i class="fas fa-users-cog"></i></i></div>
										관리자 메인 페이지
								</a>
								<div class="sb-sidenav-menu-heading">ADMIN DATA</div>
                            
								<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseMembers" aria-expanded="false" aria-controls="collapseMembers">
								<div class="sb-nav-link-icon"><i class="fas fa-address-card"></i></div>
                                회원 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            	</a>
                            	<div class="collapse" id="collapseMembers" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
	                                <nav class="sb-sidenav-menu-nested nav">
	                                    <a class="nav-link" href="<%=request.getContextPath() %>/userAll/listUserAllList.do">가입회원</a>
	                                    <a class="nav-link" href="<%=request.getContextPath() %>/blackList/listBlackList.do">블랙리스트</a>
	                                </nav>
                            	</div>
                            
                            	<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
	                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
	                                게시글 관리
	                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            	</a>
	                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
	                                <nav class="sb-sidenav-menu-nested nav">
	                                    <a class="nav-link" href="<%=request.getContextPath()%>/adminBoard/noticeGetAll.do">공지사항 및 FAQ</a>
	                                    <a class="nav-link" href="#">전체 게시판</a>
	                                </nav>
	                            </div>
                            
	                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseComments" aria-expanded="false" aria-controls="collapseComments">
	                                <div class="sb-nav-link-icon"><i class="fas fa-comments"></i></div>
	                                댓글 관리
	                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                            </a>
	                            <div class="collapse" id="collapseComments" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
	                                <nav class="sb-sidenav-menu-nested nav">
	                                    <a class="nav-link" href="<%=request.getContextPath()%>/comment/allList.do">전체 댓글</a>
	                                    <a class="nav-link" href="#">삭제 댓글</a>
	                                </nav>
	                            </div>
	                            
	                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseCodes" aria-expanded="false" aria-controls="collapseCodes">
	                                <div class="sb-nav-link-icon"><i class="fas fa-hashtag"></i></div>
	                                코드 관리
	                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                            </a>
	                            <div class="collapse" id="collapseCodes" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
	                                <nav class="sb-sidenav-menu-nested nav">
	                                    <a class="nav-link" href="<%=request.getContextPath() %>/group/list.do">그룹 코드</a>
	                                    <a class="nav-link" href="<%=request.getContextPath()%>/code/allList.do">하위 코드</a>
	                                </nav>
	                            </div>
	                            
	                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseCharts" aria-expanded="false" aria-controls="collapseCharts">
	                                <div class="sb-nav-link-icon"><i class="fas fa-chart-line"></i></div>
	                                통계 현황
	                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                            </a>
	                            <div class="collapse" id="collapseCharts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
	                                <nav class="sb-sidenav-menu-nested nav">
	                                    <a class="nav-link" href="#">회원 통계</a>
	                                    <a class="nav-link" href="#">식당 통계</a>
	                                </nav>
	                            </div>
                            
                            
<!-- 	                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages"> -->
<!-- 	                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div> -->
<!-- 	                                Pages -->
<!-- 	                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div> -->
<!-- 	                            </a> -->
	                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
	                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
	                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
	                                        Authentication
	                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                                    </a>
	                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
	                                        <nav class="sb-sidenav-menu-nested nav">
	                                            <a class="nav-link" href="login.html">Login</a>
	                                            <a class="nav-link" href="register.html">Register</a>
	                                            <a class="nav-link" href="password.html">Forgot Password</a>
	                                        </nav>
	                                    </div>
	                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
	                                        Error
	                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                                    </a>
	                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
	                                        <nav class="sb-sidenav-menu-nested nav">
	                                            <a class="nav-link" href="401.html">401 Page</a>
	                                            <a class="nav-link" href="404.html">404 Page</a>
	                                            <a class="nav-link" href="500.html">500 Page</a>
	                                        </nav>
	                                    </div>
	                                </nav>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="sb-sidenav-footer">
	                        <div class="small">Logged in as:</div>
	                        굿끼제먹 관리자
	                    </div>
	                </nav>
	            </div>
	            <script> // 로그아웃 JS
			        function movePageByGet(url){
			        	  location.href = url;
			        }
					function logout(url){ 
						alert("로그아웃 합니다.");
						movePageByGet(url);
					}
			    </script>
	            
	            <div id="layoutSidenav_content">