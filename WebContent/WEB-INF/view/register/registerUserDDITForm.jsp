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
<title>일반회원 회원가입 - 굿끼제먹</title>
<link href="/DPJ/assets/css/styles.css" rel="stylesheet" />
<link href="/DPJ/assets/css/register/registerForm.css" rel="stylesheet" />

<script src="/DPJ/js/jquery-3.6.0.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="/DPJ/assets/js/scripts.js"></script>
<script src="/DPJ/assets/js/util/myUtils.js"></script>
<script src="/DPJ/assets/js/util/ejyooMyutils.js"></script>
<script src="/DPJ/assets/js/register/register.js"></script>
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
								<h3 class="text-center font-weight-light my-4">회원가입</h3>
							</div>
							<div class="card-body">
								<form id="fm">
								
									<div class="form-group"><!-- 아이디 시작 -->
										<label class="small mb-1" for="userId">아이디</label>
										<div class="input-group">
											<input type="text" class="form-control py-4" id="userId"
												placeholder="아이디를 입력하세요" name="userId">
											<div class="input-group-append">
												<button class="btn btn-primary" type="button" id="userIdChk"
													onclick="chkId()">중복체크</button>
											</div>
										</div>
										<span id="spUserId" style="display:none;"></span>
									</div><!-- 아이디 종료 -->
									
									<div class="form-group"><!-- 비밀번호 시작 -->
										<label class="small mb-1" for="userPw">비밀번호</label> <input
											class="form-control py-4" id="userPw" type="password"
											placeholder="비밀번호를 입력하세요" name="userPw" />
										<span id="spUserPw" style="display:none;"></span>
									</div><!-- 비밀번호 종료 -->
									
									<div class="form-group"><!-- 이름 시작 -->
										<label class="small mb-1" for="dditName">이름</label> <input
											class="form-control py-4" id="dditName" type="text"
											placeholder="이름을 입력하세요" name="dditName" />
										<span id="spDditName" style="display:none;"></span>
									</div><!-- 이름 종료 -->
									
									<div class="form-group"><!-- 프로필 사진 시작 -->
										<label class="small mb-1" for="userPhoto">프로필 사진</label><br>
										<input class="form-control py-4" id="userPhoto" type="hidden" name="userPhoto" value="A" readonly/>
										<img src="/DPJ/assets/img/profile/A.png" id="defaultImg" class="rounded profileImg" alt="A" name="A">
										<img src="/DPJ/assets/img/profile/B.png" class="rounded profileImg" alt="B" name="B">
										<img src="/DPJ/assets/img/profile/C.png" class="rounded profileImg" alt="C" name="C">
										<img src="/DPJ/assets/img/profile/D.png" class="rounded profileImg" alt="D" name="D">
										<img src="/DPJ/assets/img/profile/E.png" class="rounded profileImg" alt="E" name="E">
										<img src="/DPJ/assets/img/profile/F.png" class="rounded profileImg" alt="F" name="F">
									</div><!-- 프로필 사진 종료 --><br>
									
									<div class="form-group"><!-- 소속반 시작 -->
										<label class="small mb-1" for="dditClass">소속반</label>
										<select class="custom-select" id="dditClass" name="dditClass">
										  <option selected value="1">401</option>
										  <option value="2">402</option>
										  <option value="3">403</option>
										  <option value="4">404</option>
										  <option value="5">405</option>
										  <option value="6">406</option>
										  <option value="7">407</option>
										  <option value="8">408</option>
										</select>
										
										
									</div><!-- 소속반 종료 -->
									
									<div class="form-group"><!-- 휴대폰 번호 시작 -->
										<label class="small mb-1" for="dditHp">휴대폰 번호</label> <input
											class="form-control py-4" id="dditHp" type="text"
											placeholder="휴대폰 번호를 입력하세요(예: 010-0000-0000)" name="dditHp" />
										<span id="spDditHp" style="display:none;"></span>
									</div><!-- 휴대폰 번호 종료 -->
									
									<div class="form-group"><!-- 이메일 주소 시작 -->
										<label class="small mb-1" for="dditMail">이메일</label>
										<div class="input-group">
											<input type="email" class="form-control py-4" id="dditMail"
												placeholder="이메일을 입력하세요" name="dditMail">
											<div class="input-group-append">
												<button class="btn btn-primary" type="button" id="dditMailChk"
													onclick="chkMail()">중복체크</button>
											</div>
										</div>
										<span id="spDditMail" style="display:none;"></span>
									</div><!-- 이메일 주소 종료 -->
									
									<div class="form-group"><!-- 이메일 수신여부 시작 -->
										<div class="custom-control custom-checkbox">
									  		<input type="checkbox" class="custom-control-input" id="recvMail" name="recvMail">
									  		<label class="custom-control-label" for="recvMail">이메일 수신 여부</label>
										</div>
									</div><!-- 이메일 수신여부 종료 -->
									
									<div class="form-group"><!-- 생년월일 시작 -->
										<label class="small mb-1" for="dditBir">생년월일</label> <input
											class="form-control py-4" id="dditBir" name="dditBir" type="date" />
										<span id="spDditBir" style="display:none;"></span>
									</div><!-- 생년월일 종료 -->
									
									<div class="form-group text-center">
										<button type="button" class="btn btn-primary col-5"
											id="registerBtn" onclick="save()">회원가입</button>
										<button type="reset" class="btn btn-outline-primary col-5"
											id="resetBtn">초기화</button>
									</div>
									<input type="hidden" name="flag" id="formFlag">
								</form>
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