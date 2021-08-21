<%@page import="kr.or.ddit.blackList.vo.BlackListVO"%>
<%@page import="kr.or.ddit.adminBoard.vo.AdminBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/common/top.jsp"%>
<script src="<%=request.getContextPath() %>/assets/js/blackList/blackList.js"></script>
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4 mb-4">블랙리스트</h1>
                        
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
                               	 블랙리스트 
<!--                                	<a type="button" class="btn btn-outline-danger btn-sm float-right" href="noticeInsert.do">뒤로가기</a> -->
                               	<a type="button" class="btn btn-outline-info btn-sm float-right" href="<%=request.getContextPath() %>/blackList/listBlackList.do">뒤로가기</a>
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
													onclick="chkId()"></button>
											</div>
										</div>
										<span id="spUserId" style="display:none;"></span>
									</div><!-- 아이디 종료 -->
									
									<div class="form-group">
								      <label for="comment">블락 사유</label>
								      <textarea class="form-control" rows="5" id="blackReason" name="blackReason"></textarea>
								    </div>
									
									<div class="form-group text-center">
										<button type="button" class="btn btn-primary col-5"
											id="registerBtn" onclick="save()">추가</button>
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