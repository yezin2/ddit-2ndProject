<%@page import="kr.or.ddit.qna.vo.QnABoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/WEB-INF/view/common/top.jsp"%>
<%@include file="/WEB-INF/view/common/boardSubNav.jsp"%>
                        
						<div class="card mb-4">
                            <div class="card-body">
                               중프 게시판 테스트용 임시 페이지 입니다.
                            </div>
                        </div>
                        <form id="fm" method="post" enctype="multipart/form-data">
                        	<input type="hidden"  id="userId" name="userId" value="<%=session.getId() %>">
							<div class="input-group mb-3 col-md-10">
							  <span class="input-group-text" id="basic-addon3">제목</span>
							  <input type="text" class="form-control" id="boardTitle" name="boardTitle" aria-describedby="basic-addon3" value="">
							</div>
							
							<div class="input-group mb-3 col-md-10">
							  <span class="input-group-text">내용</span>
							  <textarea class="form-control" id="boardContent" name="boardContent" aria-label="With textarea" rows="10"></textarea>
							</div>
							
							<div class="input-group mb-3 col-md-10">
							  <span class="input-group-text">첨부파일</span>
							  <input type="file" class="form-control" id="atchFileId" name="atchFileId">
							</div>
							
							<div class="input-group mb-3 col-md-10">
								비밀글<input type="checkbox" class="" id="boardSecret" name="boardSecret" onchange="secret()" value="N">
								비밀번호<input type="text" class="" id="boardPw" name="boardPw">
							</div>
							
							<div class="col-12">
							   <button type="reset" class="btn btn-outline-secondary btn-sm">초기화</button>
							   <button type="submit" class="btn btn-outline-primary btn-sm">등록</button>
							   <a type="button" class="btn btn-outline-info btn-sm" href="qnaGet.do">목록으로</a>
						    </div>
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
        <script type="text/javascript">
	        function secret(){
	       	 if($('#boardSecret').prop("checked")){
	       		 $('#boardSecret').val('Y');
	       	 }else{
	       		 $('#boardSecret').val('N');
	       	 }
	        }
       </script>
    </body>
</html>
