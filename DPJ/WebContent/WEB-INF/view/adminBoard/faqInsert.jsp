<%@page import="kr.or.ddit.adminBoard.vo.AdminBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/common/top.jsp"%>
<%@include file="/WEB-INF/view/common/boardSubNav.jsp"%>

						<div class="card mb-4">
                            <div class="card-body">
                               FAQ 등록
                            </div>
                        </div>
                        <form method="post" action="faqInsert.do">
                        <div class="input-group mb-3">
                        	<input type="hidden" name="userId" value="admin">
						  	<div class="input-group-prepend">
						    	<span class="input-group-text" id="basic-addon1">제목</span>
						  	</div>
						  	<input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" id="boardTitle" name="boardTitle">
						</div>
                        <div class="input-group mb-3 col-md-10">
						  	<span class="input-group-text">내용</span>
						  	<textarea class="form-control" aria-label="With textarea" rows="10" id="boardContent" name="boardContent"></textarea>
						</div>
						<div class="col-12">
						   	<button type="submit" class="btn btn-outline-primary btn-sm">등록</button>
						   	<button type="reset" class="btn btn-outline-secondary btn-sm">초기화</button>
						   	<a type="button" class="btn btn-outline-info btn-sm" href="<%=request.getContextPath() %>/adminBoard/faqGetAll.do">목록으로</a>
					    </div>
				        	<input type="hidden" id="boardList" name="boardSeq">
					    </form>
                   	</div>
                </main>
                <%@include file="/WEB-INF/view/common/bottom.jsp"%>