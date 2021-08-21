<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.restInfo.vo.RestInfoVO"%>
<%@page import="kr.or.ddit.event.vo.EventVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<EventVO> eventList = (List<EventVO>)request.getAttribute("eventList");
	List<RestInfoVO> restList = (List<RestInfoVO>)request.getAttribute("restList");
%>
<%@include file="/WEB-INF/view/common/mainNav.jsp"%>

	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<!-- Blog Entries Column -->
			<div class="col-md-8">
			<div class="btn-group btn-group-toggle" data-toggle="buttons">
			  <label class="btn active" role="button">
			    <input type="radio" name="options" id="option1" value="1" required="required" onchange="divDis()"><span class="btn btn-warning" >이벤트</span>
			  </label>
			  <label class="btn" role="button">
			    <input type="radio" name="options" id="option0" value="0" onchange="divDis()"><span class="btn btn-warning">홍보</span>
			  </label>
			</div>
			<div id="divEve" >
				<h1 class="my-4">
					이벤트 게시판
				</h1>
				<!-- Blog Post -->
				<div class="card mb-4">
					<div class="card-footer text-muted col-12" >
					<h2 class="card-title">이벤트중인 식당 목록</h2>
						<table class="table col-12">
							<tbody class="col-12">
								<tr class="d-flex ">
									<th class="col-3">식당이름</th>
									<th class="col-7">제목</th>
									<th class="col-2">종료일</th>
								</tr>
								<%
								int eventSize = eventList.size();
                                
                               	if(eventSize > 0){
                               		for(int i = 0; i < eventSize; i++){
                               			if("EVE".equals(eventList.get(i).getCode())){
										String endDate = eventList.get(i).getBoardEnd();
								%>
								<tr class="d-flex ">
                              		<td class="col-3"><%=restList.get(i).getRestName() %></td>
									<td class="col-7"><a href="select.do?boardSeq=<%=eventList.get(i).getBoardSeq() %>"><%=eventList.get(i).getBoardTitle() %></a></td>
                              		<td class="col-2"><%=endDate %></td>
								</tr>
								<% 		}
                              		}
                                }else{ %>
										<tr class="d-flex justify-content-start">
                                  			<td class="col-12">게시글이 없습니다.</td>
                                  		</tr> 
                                 <% } %>
							</tbody>
						</table>
					</div>
					<%
 					if("식당회원".equals(session.getAttribute("USERTYPE"))){
						%>
					<div>
							<a type="button" class="btn btn-lg btn-secondary" href="insert.do">게시글 작성하기</a>
					</div>
						<%
 					}
					%>
				</div>

			</div>
			<div id="divPromo" style="display: none">
				<h1 class="my-4">
					홍보 게시판
				</h1>
				<!-- Blog Post -->
				<div class="card mb-4">
					<div class="card-footer text-muted col-12" >
					<h2 class="card-title">홍보중인 식당 목록</h2>
						<table class="table col-12">
							<tbody class="col-12">
								<tr class="d-flex">
									<th class="col-3">식당이름</th>
									<th class="col-7">제목</th>
									<th class="col-2">종료일</th>
								</tr>
								<%
                               	if(eventSize > 0){
                               		for(int i = 0; i < eventSize; i++){
                               			if("PROMO".equals(eventList.get(i).getCode())){
                               				
										String endDate = eventList.get(i).getBoardEnd();
								%>
								<tr class="d-flex justify-content-start">
                              		<td class="col-3"><%=restList.get(i).getRestName() %></td>
									<td class="col-7"><a href="select.do?boardSeq=<%=eventList.get(i).getBoardSeq() %>"><%=eventList.get(i).getBoardTitle() %></a></td>
                              		<td class="col-2"><%=endDate %></td>
								</tr>
								<%	 }
                             		}
                                }else{ %>
										<tr class="d-flex justify-content-start">
                                  			<th class="col-12">게시글이 없습니다.</th>
                                  		</tr> 
                                 <% } %>
							</tbody>
						</table>
					</div>
					<%
					if("식당회원".equals(session.getAttribute("USERTYPE"))){
						%>
					<div>
							<a type="button" class="btn btn-lg btn-secondary" href="insert.do">게시글 작성하기</a>
					</div>
						<%
					}
					%>
				</div>
			</div>
			</div>
			      <!-- Sidebar Widgets Column -->
	      <div class="col-md-4">
	        <!-- Categories Widget -->

	        <div class="card my-4">
	          <h5 class="card-header">세호불백<small>울트라콜</small></h5>
	          <img class="col-12" src="<%=request.getContextPath() %>/assets/img/restau/seho.jpg">
	          <div class="card-body">
	            <div class="row">
	              <div class="col-lg-12 d-flex align-content-start">
	              	<table class="table" >
						<tr class="d-flex align-content-start">
			              	<td class=" col-lg-4">가격&nbsp;</td>
			              	<td class=" col-lg-5"><a class="btn btn-md btn-success">8000원</a></td>
			              	<td class=" col-lg-3"></td>
	              		</tr>
						<tr class="d-flex">
			              	<td class="col-lg-4">거리&nbsp;</td>
			              	<td class="col-lg-5"><a class="btn btn-md btn-info">10분(600m)</a></td>
			              	<td class="col-lg-3"></td>
	              		</tr>
						<tr class="d-flex">
			              	<td class="col-lg-4">분류&nbsp;</td>
			              	<td class="col-lg-5"><a class="btn btn-md btn-danger">한식</a></td>
			              	<td class="col-lg-3"></td>
			              	
	              		</tr>
			              	<hr>
						<tr class="d-flex">
			              	<td class="col-lg-4">평점&nbsp;</td>
			              	<td class="col-lg-8">
						<span class='star-rating'>
						<span style ="width:80%"></span>
						</span>
			              	</td>
	              		</tr>
						<tr class="d-flex">
			              	<td class="col-lg-4">주력메뉴&nbsp;</td>
			              	<td class="col-lg-5"><a class="btn btn-md btn-warning">불고기</a></td>
			              	<td class="col-lg-3"></td>
	              		</tr>
	              	</table>
	              </div>
	              <div class="col-lg-6">
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
			</div>
		</div>
	<!-- /.container -->
	<script type="text/javascript">
	function divDis(){
		 if($('#option1').prop("checked")){
       		 $('#divEve').show();
       		 $('#divPromo').hide();
       	 }else if($('#option0').prop("checked")){
       		 $('#divEve').hide();
       		 $('#divPromo').show();
       	 }
	}
	</script>
	<%@include file="/WEB-INF/view/common/mainFooter.jsp"%>