<%@page import="kr.or.ddit.adminBoard.vo.AdminBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AdminBoardVO abv = (AdminBoardVO)request.getAttribute("adminBoardVO");
%>

<%@include file="/WEB-INF/view/common/top.jsp"%>
<%@include file="/WEB-INF/view/common/boardSubNav.jsp"%>

						<div class="card mb-4">
                            <div class="card-body">
                               공지 게시판 테스트용 임시 페이지 입니다.
                            </div>
                        </div>
                        <form method="post" action="faqUpdate.do">
	                        <div class="input-group mb-3">
	                        	<input type="hidden" name="code" value="faq">
	                        	<input type="hidden" name="userId" value="admin">
							  	<div class="input-group-prepend">
							    	<span class="input-group-text" id="basic-addon1">제목</span>
							  	</div>
							  	<input type="text" class="form-control" id="boardTitle" name="boardTitle" value="<%=abv.getBoardTitle() %>">
							  	
							</div>
	                        <div class="input-group mb-3 col-md-10">
							  	<span class="input-group-text">내용</span>
							  	<textarea class="form-control" rows="10" id="boardContent" name="boardContent"><%=abv.getBoardContent() %></textarea>
							</div>
							<div class="col-12">
							   	<button type="submit" class="btn btn-outline-primary btn-sm">수정완료</button>
							   	<a type="button" class="btn btn-outline-info btn-sm" href="<%=request.getContextPath() %>/adminBoard/getAll.do">목록으로</a>
						    </div>
				        	<input type="hidden" id="boardList" name="boardSeq" value="<%=abv.getBoardSeq()%>">
					    </form>
                   	</div>
                </main>
                <footer class="py-4 bg-light mt-auto">
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
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="<%=request.getContextPath() %>/adminView/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="<%=request.getContextPath() %>/adminView/assets/demo/chart-area-demo.js"></script>
        <script src="<%=request.getContextPath() %>/adminView/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="<%=request.getContextPath() %>/adminView/assets/demo/datatables-demo.js"></script>
    </body>
</html>