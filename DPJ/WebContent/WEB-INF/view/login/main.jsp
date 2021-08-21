<%@page import="kr.or.ddit.event.vo.EventVO"%>
<%@page import="kr.or.ddit.restInfo.vo.RestInfoVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.qna.vo.QnABoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션 출력 영역
	String userId = (String) session.getAttribute("USERID");
	String userType = (String) session.getAttribute("USERTYPE");
	String userPhoto = (String) session.getAttribute("USERPHOTO");
	String visitFlag = (String) session.getAttribute("VISITFLAG");
	System.out.println("★★JSP VISITFLAG : "+visitFlag);
	
	if(userId == null) {
		userId = "null";
	}
	
	if(userType == null) {
		userType = "비회원";
	}
	
	if(userPhoto == null) {
		userType = "null";
	}
	
	if(visitFlag == null) {
		visitFlag = "null";
	}
	
	
	List<RestInfoVO> restList = (List<RestInfoVO>)request.getAttribute("restList");
	List<EventVO> eventList = (List<EventVO>)request.getAttribute("eventList");
%>    
<!DOCTYPE html>
<html lang="kr">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Enjoy your meal right on time! Main page</title>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
		<link href="https://fonts.googleapis.com/css2?family=Jua&family=Sunflower:wght@300&display=swap" rel="stylesheet">
        
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="<%=request.getContextPath() %>/css/styles.css" rel="stylesheet" />
        <script src="<%=request.getContextPath() %>/js/jquery-3.6.0.js"></script>
        <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
      	 <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Contact form JS-->
        <script src="<%=request.getContextPath() %>/assets/mail/jqBootstrapValidation.js"></script>
        <script src="<%=request.getContextPath() %>/assets/mail/contact_me.js"></script>
        <!-- Core theme JS-->
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
        	h1, h2, li, a, th, td{
        		font-family: 'Jua', sans-serif;
 				font-size: 1.2em;
        	}
        	h3,h4,h5,h6, p{
 				font-family: 'Sunflower', sans-serif;
 				font-size: 1.2em;
        	}
        </style>
    </head>
    
    <body id="page-top">
        
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container col-md-3">
                <a class="navbar-brand js-scroll-trigger" href="<%=request.getContextPath() %>/main/main.do"><h1>굿끼제먹</h1><span>굿 ! 끼니는 제때 먹어야지!</span></a>
               
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
		                메뉴
                <i class="fas fa-bars ml-1"></i>
                </button>
            </div>   
                         
            <div class="collapse navbar-collapse col-lg-7 h1" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="<%=request.getContextPath() %>/searchRest/list.do">식당검색</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="<%=request.getContextPath() %>/PARTY/main.do">Meal파티</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="<%=request.getContextPath() %>/commBoard/main.do">커뮤니티</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="<%=request.getContextPath() %>/eventBoard/list.do">이벤트</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="<%=request.getContextPath() %>/adminBoardMain/noticeGetAll.do">고객센터</a></li>
                        <% if("일반회원".equals(userType) || "식당회원".equals(userType)){ %>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="<%=request.getContextPath() %>/mypage/main.do">마이페이지</a></li>
						<%} %>
                    </ul>
            </div>

            <div class="container col-sm-2">
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
								<li class="nav-item"><a class="nav-link js-scroll-trigger" href="javascript:movePageByGet('<%=request.getContextPath() %>/admin/main.do');" >관리자메뉴</a></li>
							<%
								}
							%>
						<%
							}
						%>	
               	    </ul>
			</div>
        </nav>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container">
            	<div class="text-light bg-gray ">
	                <div class="masthead-heading text-uppercase">끼니는 챙기셨나요?</div>
	            </div>
                <a class="btn btn-info btn-xl text-uppercase js-scroll-trigger" href="#services">홈페이지 알아보기</a>
            </div>
        </header>
        <!-- Services-->
        <section class="page-section" id="services">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">굿끼제먹 Services</h2>
                    <h3 class="section-subheading text-muted">굿 끼니는 제 때 먹어야지요.</h3>
                </div>
                <div class="row text-center">
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">식당 검색 기능</h4>
                        <p class="text-muted">가격, 거리, 분류에 맞춰서 <br>원하는 식당 정보를 제공합니다.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-laptop fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">밀파티 모집</h4>
                        <p class="text-muted">혼자 밥먹기 싫다면 같이 먹으면 되죠!<br> 마음 맞는 사람 최대한 빨리 4명까지 모아봐요!</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-lock fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">커뮤니티</h4>
                        <p class="text-muted">학원생들의 소통공간입니다. <br> 커뮤니티 하나 정도 있을 때 되지 않았나요?</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- Portfolio Grid-->
        <section class="page-section bg-light" id="portfolio">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">주변 식당의 홍보 및 이벤트</h2>
                    <p class="section-subheading text-muted">식당 주인 회원들께는 홍보 및 이벤트가 가능합니다.
                    		<br>김천 말고 주변에 이렇게 괜찮은 식당들이 있던거 몰랐죠?</p>
                </div>
                <div class="row">
                    <%
                    int cnt = 0;
                    for(int i = 0; i < restList.size(); i++){
                    	if("EVE".equals(eventList.get(i).getCode())){
                    	%>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal<%=cnt+1 %>">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <div style="min-height: 250px; display: flex">
	                                <img class="img-fluid" src="<%=request.getContextPath() %>/assets/img/restau/<%=restList.get(i).getRestCode() %>_rest.jpg" alt="" />
                                </div>
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading"><%=restList.get(i).getRestName() %></div>
                                <div class="portfolio-caption-subheading">가격 : 8,000원 ~ 10,000원 <br>거리 : 10분 이내 <br>분류 : <%=restList.get(i).getRestType() %></div>
                            </div>	
                        </div>
                    </div>
                    	<%
                    	cnt ++;
                    	if(cnt == 3) break;
                    	}
                    }
                    %>
                </div>
            </div>
        </section>
        <!-- About-->
        <section class="page-section" id="about">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">About process</h2>
                    <h3 class="section-subheading">홈페이지를 이용하는 방법은 아주 간단합니다.</h3>
                </div>
                <ul class="timeline">
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<%=request.getContextPath() %>/assets/img/about/5.jpg" alt="" /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>1. 가격 설정하기</h4>
                                <h4 class="subheading">가격은 5000원 부터 천원 단위</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">가격은 5000원 부터 천원 단위로 10,000원 이상까지 설정 가능! </p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<%=request.getContextPath() %>/assets/img/about/6.jpg" alt="" /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>2. 거리 설정하기</h4>
                                <h4 class="subheading">거리는 3분 거리부터 15분까지!</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">3분거리 = 100m, 5분 거리 = 300m, <br> 10분거리 600m, 15분거리 900m.</p></div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<%=request.getContextPath() %>/assets/img/about/7.jpg" alt="" /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>3. 분류 설정하기</h4>
                                <h4 class="subheading">한식 양식 중식 일식</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">어떤 종류를 먹을지 결정했다면 <br> 메뉴는 금방 고르게 되어있습니다.</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<%=request.getContextPath() %>/assets/img/about/8.jpg" alt="" /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>4. 같이 먹을 사람 모집하기 <h4>
                                <h4 class="subheading">같이 밥먹으러 갈 사람. 통칭 밀파티</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">혼자 밥먹기 애매하면? <br>같이 먹을 친구를 구하면 되죠! <br> 코시국 고려해서 4인까지!</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted ">
                        <div class="timeline-image ">
                            <h4>
                                	끼니는
                                <br />
                                	제때
                                <br />
                                	챙깁시다!
                            </h4>
                        </div>
                    </li>
                </ul>
            </div>
        </section>
        <!-- Team-->
        <section class="page-section bg-light" id="team">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading ">한 끼만 같이 먹어도 우리 모두 친구!</h2>
                    <h3 class="section-subheading">서로 알고지내면 좋잖아요! 같이 밥먹으러 가요!</h3>
                </div>
                <div class="row">
                    <div class="col-lg-4">
						<div class="team-member">
							<img class="img-fluid img-thumbnail rounded-circle" src="<%=request.getContextPath()%>/assets/img/profile/C.png"/>
							<h4>IHYEON KIM</h4>
							<p class="text-muted">Project Leader</p>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="team-member">
							<img class="img-fluid img-thumbnail rounded-circle" src="<%=request.getContextPath()%>/assets/img/profile/B.png"/>
							<h4>EUNJI YOO</h4>
							<p class="text-muted">Application Architect</p>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="team-member">
							<img class="img-fluid img-thumbnail rounded-circle" src="<%=request.getContextPath()%>/assets/img/profile/G.png"/>
							<h4>YOONSUNG CHOI</h4>
							<p class="text-muted">Data Architect</p>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="team-member">
							<img class="img-fluid img-thumbnail rounded-circle" src="<%=request.getContextPath()%>/assets/img/profile/E.png"/>
							<h4>YOOJIN JEONG</h4>
							<p class="text-muted">Technical Architect</p>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="team-member">
							<img class="img-fluid img-thumbnail rounded-circle" src="<%=request.getContextPath()%>/assets/img/profile/A.png"/>
							<h4>YEJIN PARK</h4>
							<p class="text-muted">UI Architecture</p>
						</div>
					</div>
                </div>
                <div class="row">
                    <div class="col-lg-8 mx-auto text-center"><p class="large">커뮤니티를 통해<br>같이 공부하고 정보를 나눠요.<br>내친김에 프로젝트까지?
                    <br>대덕인재개발원 100% 이용하기 완전 Possible!</p></div>
                </div>
            </div>
        </section>
        <!-- Contact-->
        <section class="page-section" id="contact">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">회원가입 바로 고고싱!</h2>
                    <h3 class="section-subheading text-muted">이미 회원이신분은 얼른 밥 한 끼 하러 가시죠?</h3>
                </div>
                <form id="contactForm" name="sentMessage" novalidate="novalidate">
                    <div class="row align-items-stretch mb-5">
                    </div>
                    <div class="text-center">
                        <div id="success"></div>
                        <button class="btn btn-primary btn-xl btn-info text-uppercase" id="sendMessageButton" type="submit" onclick="movePageByGet('/DPJ/register/registerType.do')">회원가입 하러가기!</button>
                    </div>
                </form>
            </div>
        </section>
        <!-- Footer-->
        <footer class="footer py-4">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 text-lg-left">Copyright &copy 2021. Eat Your Meal Right On Time</div>
                    <div class="col-lg-6 text-lg-right">
                        <span>DDIT 202101 #403</span>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Portfolio Modals-->
        <!-- Modal 1-->
        <%
        int cntM = 0;
        for(int i = 0; i < restList.size(); i++){
        	if("EVE".equals(eventList.get(i).getCode())){
	        cntM++;
        %>
        <div class="portfolio-modal modal fade" id="portfolioModal<%=cntM %>" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-dismiss="modal"><img src="<%=request.getContextPath() %>/assets/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body">
                                    <!-- Project Details Go Here-->
                                    <h2 class="text-uppercase"><%=restList.get(i).getRestName() %></h2>
                                    <p class="item-intro text-muted"><%=eventList.get(i).getBoardTitle() %></p>
                                    <img class="img-fluid d-block mx-auto" src="<%=request.getContextPath() %>/assets/img/restau/<%=cntM %>_rest.jpg" alt="" />
                                    <pre><p><%=eventList.get(i).getBoardContent() %></p></pre>
                                    <ul class="list-inline">
                                        <li>이벤트 기간 : <%=(eventList.get(i).getBoardStart()) %> ~ <%=(eventList.get(i).getBoardEnd()) %></li>
                                        <li>Category: <%=restList.get(i).getRestType() %></li>
                                    </ul>
                                    <button class="btn btn-primary" data-dismiss="modal" type="button">
                                        <i class="fas fa-times mr-1"></i>
                                        Close Project
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
     	   if(cntM == 3) break;
        	}
        }
        %>
    </body>
</html>
