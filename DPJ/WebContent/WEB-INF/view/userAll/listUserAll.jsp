<%@page import="kr.or.ddit.userAll.vo.UserAllVO"%>
<%@page import="kr.or.ddit.blackList.vo.BlackListVO"%>
<%@page import="kr.or.ddit.adminBoard.vo.AdminBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<UserAllVO> userAllList = (List<UserAllVO>)request.getAttribute("userAllList");
	
	String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");
%>
        
<%@include file="/WEB-INF/view/common/top.jsp"%>
<script src="<%=request.getContextPath() %>/assets/js/userAll/userAll.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/blackList/blackList.js"></script>
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4 mb-4">회원관리</h1>
                        
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
                               	 회원관리 
                               	<a type="button" class="btn btn-outline-danger btn-sm float-right" href="<%=request.getContextPath() %>/userAll/insertUserAll.do">추가</a>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0"> <!-- 테이블 데이터 시작 -->
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>아이디</th>
                                                <th>회원유형</th>
                                                <th>삭제여부</th>
                                                <th>관리</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody id="chk">
                                        <%
                                        	int userAllListSize = userAllList.size();
                                        	System.out.println("■ userAllListSize : " + userAllListSize);
                                        
                                        	if(userAllListSize > 0){
                                        		for(int i = 0 ; i < userAllListSize ; i++){ 
                                        			%>
                                        			<tr>
                                        				<td><%= (i+1) %></td>
                                        				<td><%= userAllList.get(i).getUserId() %></td>
                                        				<td><%= userAllList.get(i).getUserType() %></td>
                                        				<td><%= userAllList.get(i).getUserDelete() %></td>
                                        				<td>
                                                			<a type="button" class="btn btn-outline-info btn-sm float-right" onclick="deleteUserAll('<%= userAllList.get(i).getUserId() %>')">삭제</a>
                                                		</td>
                                        			</tr>
                                        			<%
                                        		}
                                        	} else { 
                                        	%>
                                        		<tr align="center">
                                        			<td colspan="5"> 회원이 없습니다.</td>
                                        		</tr>	
                                        	<%
                                        	}
                                        %>
                                        </tbody>
                                    </table><!-- 테이블 끝 -->
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