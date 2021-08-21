<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.qna.vo.QnABoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	List<QnABoardVO> qnaList = (List<QnABoardVO>)request.getAttribute("qnaList");

	String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");
%>

<%@ include file="/WEB-INF/view/common/top.jsp" %>
<main>
    <div class="container-fluid">
        <h1 class="mt-4 mb-4">Board Administration</h1>

        <ul class="nav nav-pills mb-4">
          <li class="nav-item">
            <a class="nav-link" href="boardAdmin.html">전체</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="noticeAdmin.html">공지</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="faqAdmin.html">FAQ</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="qnaAdmin.html">문의</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="eventAdmin.html">홍보/이벤트</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="commuAdmin.html">커뮤니티</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="partyAdmin.html">파티</a>
          </li>
        </ul>
        <div class="card mb-4">
            <div class="card-body">
               문의 게시판 테스트용 임시 페이지 입니다.
               <a type="button" class="btn btn-outline-danger btn-sm" href="insert.do">글쓰기</a>
            </div>
        </div>

        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table mr-1"></i>
                문의 게시판
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>조회수</th>
                                <th>작성 게시판</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                        int qnaSize = qnaList.size();

                        if(qnaSize > 0){
                            for(int i = 0; i < qnaSize; i++){
                            %>
                            <tr>
                                <td><%= qnaList.get(i).getBoardSeq() %></td>
                                <td><a href="select.do?boardSeq=<%=qnaList.get(i).getBoardSeq() %>"><%=qnaList.get(i).getBoardTitle() %></a></td>
                                <td><%= qnaList.get(i).getUserId() %></td>
                                <td><%= qnaList.get(i).getBoardDate() %></td>
                                <td><%= qnaList.get(i).getBoardHits() %></td>
                                <td><%= qnaList.get(i).getBoardType() %></td>
                            </tr>
                            <%
                            }
                        }else{
                            %>
                            <tr align="center">
                                <td colspan="5">게시글이 없습니다.</td>
                            </tr>
                            <%
                        }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>
        
<%@ include file="/WEB-INF/view/common/bottom.jsp" %>
