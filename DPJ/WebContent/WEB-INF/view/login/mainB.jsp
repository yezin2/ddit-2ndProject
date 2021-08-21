<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.qna.vo.QnABoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션 출력 영역
	String userId = (String) session.getAttribute("USERID");
	String userType = (String) session.getAttribute("USERTYPE");
	String visitFlag = (String) session.getAttribute("VISITFLAG");
	System.out.println("★★JSP VISITFLAG : "+visitFlag);
%>
    
    
<!DOCTYPE HTML>
<html>
	<head>
		<title>Enjoy your meal right on time main</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/main.css" />
		<!-- js -->
		<script type="text/javascript" src="/DPJ/assets/js/main/main.js"></script>
		
	<style>@import url('https://fonts.googleapis.com/css2?family=Cute+Font&family=Jua&display=swap');</style>
		<style>
			h1, h2 {
				font-family: 'Jua', sans-serif;
				font-size : 1.5em;
			}
 			h3, h4, h5, h6, p, span{
				font-family: "gm"; 
				font-size : 1.5em;
			}
			#header h1{
				padding : 0px;
			}
		
		</style>
	</head>
	<body class="is-preload">
	<form id="shorty">
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header">
					<!-- logIn -->				
					<div id="log" class="row aln-right">
						<%
							if(userId == null){
								// visitFlag가 true이면
								if(!"TRUE".equals(visitFlag)){
								%>
								
									<script>
										alert("비회원님 환영합니다.");
									</script>
								<%
								}
								%>
								<span>
									<a href="#" onclick="movePageByGet('/DPJ/logInOut/login.do')">로그인</a>&nbsp;&nbsp;&nbsp;
									<a href="#" onclick="movePageByGet('/DPJ/register/registerType.do')">회원가입</a>
								<span>
								<%
							} else {
								if(!"TRUE".equals(visitFlag)){
									String sessionResult = userType + "(" + userType + ")님 환영합니다.";
								%> 
									<script>
										alert("<%=sessionResult%>");
									</script>
								<%
								}
								%>
								<span>
									<a href="#" onclick="logout('/DPJ/logInOut/logout.do')">로그아웃</a>&nbsp;&nbsp;&nbsp;
									<%
										if("관리자".equals(userType)){
											%>
											  <a href="#" onclick="movePageByGet('/DPJ/admin/main.do')">관리자메뉴</a>
											<%
										}
									%>
								<span>
								<%
							}
						%>
					</div>
					<!-- Logo -->
						<h1><a href="index.html" id="logo">굿 끼 제 먹</a></h1>
						<span>굿! 끼니는 제 때 먹어야지.</span>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li class="current"><a href="event.html">홍보 및 이벤트 게시판</a></li>
								<li class="current"><a href="search.html">식당 검색</a>
									<ul>
										<li><a href="#">거리별 검색</a></li>
										<li><a href="#">가격별 검색</a></li>
										<li><a href="#">분류별 검색</a></li>
										<li><a href="#">로나 안심식당</a></li>
									</ul>							
								</li>
								<li class="current"><a href="mealparty.html">Meal파티 게시판</a></li>
								<li class="current"><a href="community.html">커뮤니티 게시판</a>
									<ul>
										<li><a href="#">개발 게시판</a></li>
										<li><a href="#">취업 게시판</a></li>
										<li><a href="#">잡담 게시판</a></li>
									</ul>
								</li>
								<li class="current"><a href="mypage.html">마이 페이지</a>
									<ul>
										<li><a href="#">고객정보 조회</a></li>
										<li><a href="#">고객정보 수정</a></li>
										<li><a href="#">작성 게시글 조회</a>
											<ul>
												<li><a href="#">게시글 조회  주제 : 개발</a></li>
												<li><a href="#">게시글 조회  주제 : 취업</a></li>
												<li><a href="#">게시글 조회  주제 : 잡담</a></li>										
											</ul>
										</li>
										<li><a href="#">찜한식당 조회</a></li>
										<li><a href="#">Meal파티</a>
											<ul>
												<li><a href="#">매칭 Meal파티 조회</a></li>
												<li><a href="#">매칭 Meal파티 삭제</a></li>
											</ul>
										</li>
									</ul>
								</li>
								<li class="current"><a href="#footer">문의 게시판</a></li>
								<li class="current">
									<a href="#">SiteMap</a>
									<ul>
										<li><a href="#">마이페이지</a>
											<ul>
												<li><a href="#">내 정보 조회</a></li>
												<li><a href="#">찜한 식당</a></li>
												<li><a href="#">밀 파 티</a></li>
												<li><a href="#">작성 게시글 보기</a></li>
												<li><a href="#">작성 리뷰 보기</a></li>
											</ul>
										</li>
										<li><a href="#">커뮤니티 게시판</a>
											<ul>
												<li><a href="#">주제 : 개발 정보 게시판</a></li>
												<li><a href="#">주제 : 취업 정보 게시판</a></li>
												<li><a href="#">주제 : 친목(잡담) 게시판</a></li>
											</ul>
										</li>
										<li><a href="#">식당검색</a></a>
											<ul>
												<li><a href="#">거리별 검색</a></li>
												<li><a href="#">가격별 검색</a></li>
												<li><a href="#">분류별 검색</a></li>
												<li><a href="#">안심식당 여부</a></li>
											</ul>
										</li>
									</ul>
								</li>
							</ul>
						</nav>

				</div>

			<!-- Banner -->
				<section id="banner">
					<header>
						<h2>혼밥도 좋지만: <em><a href="">같이 밥먹으러갈 사람 모집</a></em></h2>
						<a href="#" class="button">밥친구 4명 모으기</a>
					</header>
				</section>

			<!-- Highlights -->
				<section class="wrapper style1">
					<div class="container">
						<h1>홈페이지 기능보기</h1>
						<div class="row gtr-200">
							<section class="col-4 col-12-narrower">
								<div class="box highlight">
									<i class="icon solid major fa-paper-plane"></i>
									<h3>1. 식당 정보 검색</h3>
									<p>식당을 조건별로 찾아서 검색할 수 있습니다.
									<br>
									한끼 지불 용의가 있는 가격과 이동거리 그리고 음식 종류에 대한 선택을 하고나면
									원하는 식당이 내 주변으로 검색됩니다.</p>
								</div>
							</section>
							<section class="col-4 col-12-narrower">
								<div class="box highlight">
									<i class="icon solid major fa-pencil-alt"></i>
									<h3>2. 빠른 파티 모집</h3>
									<p>같이 밥먹을 DDIT 친구를 모집할 수 있습니다.
									<br>
									혼자 먹기 애매한 음식의 경우 어떻게 해야할까요? 혼자 먹는 밥이 지겹진 않으신가요?
									가장 빠르게 나와 같은 의견을 지닌 사람들과 식사 파티 즉, "밀파티"를 모집합니다.</p> 
								</div>
							</section>
							<section class="col-4 col-12-narrower">
								<div class="box highlight">
									<i class="icon solid major fa-wrench"></i>
									<h3>3. 커뮤니티 게시판</h3>
									<p>학원생들과 여러 이야기를 나눌 커뮤니티가 있습니다.
									<br>
									같은 반끼리만 알고있고(심지어는 같은 반 끼리도 잘 모른다.) 다른 반은 뭐하나 전반은 뭐했나 궁금하죠?
									다같이 의견을 나눠보아요. 혼자 외롭게 지낼필요는 없잖아요? '우물 안 개구리'도 발견해 드립니다.</p> 
								</div>
							</section>
						</div>
					</div>
				</section>

			<!-- Gigantic Heading -->
				<section class="wrapper style2">
					<div class="container">
						<header class="major">
							<h2>굿! 끼니는 제때 먹어야지.</h2>
							<p>아무리 바빠도 밥은 챙겨 먹읍시다. 먹고살자고 하는 짓인데요 뭐.</p>
							<p>점심까진 바쁘다 쳐도 저녁까지 도시락먹고 김밥천국먹고 우리 그러지 맙시다.</p>
							<p>밥먹을 때마다 고민하고 선택장애 오시다가 결국 도시락 시켜먹고 김밥천국 가시는 분들을 위해 준비했어요.</p>
						</header>
					</div>
				</section>

			<!-- Posts -->
				<section class="wrapper style1">
					<div class="container">
						<div class="row">
							<span><h1>주변에 맛집. 어디까지 가봤니?</h1></span>
							<span>여기까진 안가보셨죠? 5분이면 간답니다.</span>
							<section class="col-6 col-12-narrower">
								<div class="box post">
									<a href="#" class="image left"><img src="images/restor/moms.jpg" alt="" /></a>
									<div class="inner">
										<h3>세호불백</h3>
										<p>불고기 백반집! 가성비 오지는 히든 맛집</p>
										<p>가격 8000원 / 거리 5분 / 한식</p>
									</div>
								</div>
							</section>
							<section class="col-6 col-12-narrower">
								<div class="box post">
									<a href="#" class="image left"><img src="images/restor/seho.jpg" alt="" /></a>
									<div class="inner">
										<h3>00반점</h3>
										<p>중국집인데 희안하게 제육덮밥이 기가 막히는 집</p>
										<p>가격 8000원 / 거리 5분 / 중식 + 한식</p>
									</div>
								</div>
							</section>
						</div>
						<div class="row">
							<section class="col-6 col-12-narrower">
								<div class="box post">
									<a href="#" class="image left"><img src="images/restor/macnal.jpg" alt="" /></a>
									<div class="inner">
										<h3>그리면</h3>
										<p>건너편에 짱박혀 있어서 잘 모르는 국수집.</p>
										<p>가격 4500원 / 거리 3분 / 한식</p>
									</div>
								</div>
							</section>
							<section class="col-6 col-12-narrower">
								<div class="box post">
									<a href="#" class="image left"><img src="images/restor/gimcheon.jpg" alt="" /></a>
									<div class="inner">
										<h3>종로 할매 칼국수</h3>
										<p>아는 사람만 아는 칼국수 맛집. 가성비 끝판왕</p>
										<p>가격 5000원 / 거리 5분 / 한식</p>	
									</div>
								</div>
							</section>
						</div>
					</div>
				</section>

			<!-- CTA -->
				<section id="cta" class="wrapper style3">
					<div class="container">
						<header>
							<h2>끼니. 제 때 챙기실 준비 되셨나요?</h2>
							<a href="#" class="button">굿끼제먹!</a>
						</header>
					</div>
				</section>
					<!-- Copyright -->
						<div class="copyright">
							<ul class="menu">
								<li>&copy; EatMealRightOnTime. All rights reserved</li><li>Design: <a href="">IHyeon, HTML5 UP</a></li>
							</ul>
						</div>

				</div>

		</div>

		<!-- Scripts -->
			<script src="<%=request.getContextPath() %>/assets/js/jquery.min.js"></script>
			<script src="<%=request.getContextPath() %>/assets/js/jquery.dropotron.min.js"></script>
			<script src="<%=request.getContextPath() %>/assets/js/browser.min.js"></script>
			<script src="<%=request.getContextPath() %>/assets/js/breakpoints.min.js"></script>
			<script src="<%=request.getContextPath() %>/assets/js/util.js"></script>
			<script src="<%=request.getContextPath() %>/assets/js/main.js"></script>
</form>
	</body>
</html>