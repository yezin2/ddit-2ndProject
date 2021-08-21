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
<title>회원가입유형 - 굿끼제먹</title>
<!-- css -->
<link href="/DPJ/assets/css/styles.css" rel="stylesheet" />
<link href="/DPJ/assets/css/register/registerType.css" rel="stylesheet" />
 
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
<script type="text/javascript" src="/DPJ/assets/js/register/register.js"></script>
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
								<h3 class="text-center font-weight-bold">유형선택</h3>
							</div>
							<div class="card-body">
									<div class="form-group text-center">
										<button type="button" class="btn btn-light col-5 userType" onclick="movePageByGet('/DPJ/register/registerDDIT.do')">학원생</button>
		        						<button type="button" class="btn btn-light col-5 userType" onclick="movePageByGet('/DPJ/register/registerREST.do')">판매자</button>
									</div>
									<input type="hidden" name="flag" id="formFlag">
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