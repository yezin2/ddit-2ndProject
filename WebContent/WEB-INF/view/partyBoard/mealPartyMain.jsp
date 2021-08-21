<%@page import="kr.or.ddit.partyBoard.vo.PartyBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/common/mainNav.jsp"%>


<%

List<PartyBoardVO> partyList = (List<PartyBoardVO>)request.getAttribute("list");  
int countJoin = (Integer) request.getAttribute("countJoin");

%>



        <!-- Masthead-->
        <header class="masthead2">
            <div class="container">
            	<div class="text-light bg-gray ">
	                <div class="masthead-heading text-uppercase">같이 밥먹어조!</div>
	            </div>
                <a class="btn btn-info btn-xl text-uppercase js-scroll-trigger" href="#services">파티 구경가기</a>
            </div>
        </header>
        <!-- Services-->
        <section class="page-section" id="services">
<!-- Page Content -->
	<div class="container">

		<div class="row">

			<!-- Blog Entries Column -->
			<div class="col-md-12">
				<h1 class="my-4">
					<i class="fas fa-utensils mr-3"></i>Meal파티 게시판
				</h1>
				
				<!-- Blog Post -->
				<div class="card mb-4">
					<div class="card-footer text-muted col-12">
					<h2 class="card-title">모집중인 밀파티 목록</h2>
						<table class="table col-12">
							<tbody class="col-12">
								<tr class="col-12 d-flex justify-content-start">
									<th class="p-1 col-1"></th>
									<th class="p-2 col-1 text-center">인원</th>
									<th class="p-2 col-2 text-center">파티마감일</th>
									<th class="p-2 col-2 text-center">거리</th>
									<th class="p-2 col-2 text-center">가격</th>
									<th class="p-2 col-1 text-center">분류</th>
									<th class="p-2 col-2 text-center">식당</th>
									<th class="p-2 col-1 text-center"></th>
								</tr>
								
								
							<%
								int partySize = partyList.size();
								if(partySize > 0) {
									for(int i = 0; i < partySize; i++) {
							%>
								
								
								<tr class="col-12 d-flex justify-content-start">
									<td class="p-2 col-1 text-center">
									<%
										if(partyList.get(i).getCountList() < 3 && partyList.get(i).getPartyYn().equals("N")) {
									%>
											<span class="badge badge-primary p-2 font-weight-normal">모집중</span>								
									<%		
										} else if(partyList.get(i).getCountList() == 3 && partyList.get(i).getPartyYn().equals("N")) {
									%>
											<span class="badge badge-success p-2 font-weight-normal">FULL</span>								
									<%
										} else if(partyList.get(i).getPartyYn().equals("Y")) {
									%>
											<span class="badge badge-danger p-2 font-weight-normal">마감</span>								
									<%	
										} else {}
									%>											
									</td>
									<td class="p-2 col-1 text-center"><%=partyList.get(i).getCountList() + 1%>/4</td>
									<td class="p-2 col-2 text-center"><%=partyList.get(i).getPartyEnd() %></td>
									<td class="p-2 col-2 text-center"><%=partyList.get(i).getDistance() %></td>
									<td class="p-2 col-2 text-center"><%=partyList.get(i).getPrice() %></td>
									<td class="p-2 col-1 text-center"><%=partyList.get(i).getRestType() %></td>
									<%
										if(partyList.get(i).getRestName() != null) {
									%>
											<td class="p-2 col-2 text-center"><%=partyList.get(i).getRestName() %></td>
									<%
										} else {
									%>
											<td class="p-2 col-2 text-center">아무거나</td>
									<%		
										}
									%>
									<td class="p-2 col-1 text-center">
										<a id="seq" class="btn btn-info" href="select.do?boardSeq=<%=partyList.get(i).getBoardSeq()%>">
											조회
										</a>
									</td>
								</tr>
							<%
									}
								} else {
		
							%>
							<tr>
								<td colspan="8">게시판 정보가 없습니다.</td>
							</tr>
							<%
							}
							%>
								<tr class="col-12 d-flex justify-content-start">
									<td class="col-12">
									
								<%
									if(userType.equals("일반회원") || userType.equals("관리자")) {
								%>
										<a class="btn btn-warning btn-lg float-right" href="<%=request.getContextPath()%>/PARTY/insert.do">파티 등록</a>
								<%		
									} else {
								%>
										<span>DDIT 인증 회원만 파티 등록이 가능합니다.</span>
								<%		
									} 									
								%>	
									
									</td>
								</tr>	
															
							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>

	</div>

</section>
	
<%@include file="/WEB-INF/view/common/mainFooter.jsp"%>
