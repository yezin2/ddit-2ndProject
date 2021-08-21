<%@page import="kr.or.ddit.adminBoard.vo.AdminBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/WEB-INF/view/common/top.jsp"%>
<script src="<%=request.getContextPath() %>/assets/js/blackList/blackList.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/util/ejyooMyutils.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/userAll/userAll.js"></script>
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4 mb-4">회원등록</h1>
                        
<!--                         <ul class="nav nav-pills mb-4"> -->
<!-- 						  <li class="nav-item"> -->
<%-- 						    <a class="nav-link" href="<%=request.getContextPath() %>/userAll/getBlockUserAll.do">전체</a> --%>
<!-- 						  </li> -->
<!-- 						</ul>가운데 상위 메뉴 끝 -->
						
						
<!-- 						<div class="card mb-4"> -->
<!--                             <div class="card-body"> -->
<!--                               블랙리스트 -->
<!--                             </div> -->
<!--                         </div> -->
                        
                        <div class="card mb-4"><!-- 가운데 중간 영역 시작-->
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                               	회원등록 
<!--                                	<a type="button" class="btn btn-outline-danger btn-sm float-right" href="noticeInsert.do">뒤로가기</a> -->
                               	<a type="button" class="btn btn-outline-info btn-sm float-right" href="<%=request.getContextPath() %>/userAll/listUserAllList.do">뒤로가기</a>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                
                                
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
											id="registerBtn" onclick="save()">등록 </button>
										<button type="reset" class="btn btn-outline-primary col-5"
											id="resetBtn">초기화</button>
									</div>
									<input type="hidden" name="flag" id="formFlag">
								</form>
								
								
                                </div>
                            </div>
                  		</div>       
                   	</div>
                </main>
                
                <footer class="py-4 bg-light mt-auto"><!-- 가운데 하단 영역 -->
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Enjoy Your Meal Right On Time 2021</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <form id="fm" method="post">
        	<input type="hidden" id="boardSeq" name="boardSeq">
        </form>
<%@include file="/WEB-INF/view/common/bottom.jsp"%>