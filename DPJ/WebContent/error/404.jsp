<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ERROR</title>
<!-- css -->
<link href="/DPJ/assets/css/styles.css" rel="stylesheet" />

<!-- js -->
<script type="text/javascript" src="/DPJ/js/jquery-3.6.0.js"></script> 
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="/DPJ/assets/js/scripts.js"></script>
<script src="/DPJ/assets/js/util/myUtils.js"></script>
<script type="text/javascript" src="/DPJ/assets/js/util/ejyooMyutils.js"></script>
<script type="text/javascript" src="/DPJ/assets/js/login/login.js"></script>

</head>
<body class="bg-light">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-7">
						<div class="card shadow-lg border-0 rounded-lg mt-5 mb-5">
							<div class="card-header">
								<h3 class="text-center font-weight-bold">ERROR</h3>
							</div>
							<div class="card-body">
							
							
				<!-- 에러페이지 -->			
							
		<div id="layoutError">
            <div id="layoutError_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-6">
                                <div class="text-center mt-4">
                                    <img class="mb-4 img-error" src="../assets/img/error-404-monochrome.svg" style="d"/>
                                    <p class="lead">This requested URL was not found on this server.</p>
                                    <a href="javascript:history.back();">
                                        <i class="fas fa-arrow-left mr-1"></i>
                                        Return to Dashboard
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutError_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2020</div>
                            <div>
                                <a href="<%=request.getContextPath()%>/QNA/list.do">문의 게시판으로 이동</a>
                                &middot;
                                <a href="<%=request.getContextPath()%>/main/main.do">웹사이트로 이동</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        
        <!-- 에러페이지 -->	
        
        
							</div>
						</div>
					</div>
				</div>
			</div>
			</main>
		</div>
	</div>
</body>
</html>