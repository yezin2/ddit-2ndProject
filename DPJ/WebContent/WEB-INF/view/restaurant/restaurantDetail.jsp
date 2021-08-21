<%@page import="kr.or.ddit.review.vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.restInfo.vo.RestInfoVO"%>
<%@page import="kr.or.ddit.restInfo.vo.RestFavVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ReviewVO> reviewList = (List<ReviewVO>)request.getAttribute("reviewList");
	List<RestFavVO> favList = (List<RestFavVO>)request.getAttribute("favList");
	RestInfoVO rv = (RestInfoVO)request.getAttribute("restVO");
	int dipsCnt = (Integer)request.getAttribute("dipsCnt");
%>
<%@include file="/WEB-INF/view/common/mainNav.jsp"%>

	<!-- Page Content -->
	<div class="container">
		<div class="row">
      <!-- Sidebar Widgets Column -->
	      <div class="col-md-4">
	        <!-- Categories Widget -->
	        <div class="card my-4">
	          <h5 class="card-header">세호불백</h5>
	          <img class="col-12" src="/DPJ/assets/img/restau/seho.jpg">
	          <div class="card-body">
	            <div class="row">
	              <div class="col-lg-12 justify-content-center">
	              	<table class="table">
						<tr class="d-flex">
			              	<td class="col-lg-4">가격&nbsp;</td>
			              	<td class="col-lg-5"><a class="btn btn-md btn-success">8000원</a></td>
			              	<td class="col-lg-3"></td>
	              		</tr>
						<tr class="d-flex">
			              	<td class="col-lg-4">거리&nbsp;</td>
			              	<td class="col-lg-5"><a class="btn btn-md btn-info">5분(415m)</a></td>
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
			              	<td class="col-lg-5"><a class="btn btn-md btn-warning">불고기 백반</a></td>
			              	<td class="col-lg-3"></td>
	              		</tr>
	              	</table>
	              </div>
	              <div class="col-lg-6">
	              </div>
	            </div>
	          </div>
	        </div>
		<!-- Search Widget -->
	        <div class="card my-4 d-flex justify-content-end">
	          <h5 class="card-header">다른식당 검색하러 가기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	          <a class="btn btn-md btn-primary " href="">목록</a></h5>
	          
	          <div class="card-body">
	            <div class="input-group">
	              <input type="text" class="form-control" placeholder="식당이름으로 찾기">
	              <span class="input-group-append">
	                <button class="btn btn-secondary" type="button">찾기</button>
	              </span>
	            </div>
	          </div>
	        </div>
	
	      </div>
			
			<!-- Blog Entries Column -->
			<div class="col-md-8">
				<h1 class="my-4">
					식당 검색결과
				</h1>
				<!-- Blog Post -->
				<div class="card mb-4">
					<div class="card-body">
						<table class="table" >
							<tbody>
								<tr class="d-flex text-left">

									<th class="col-2 " >식당 이름</th>
									<th class="col-3 " name="boardTitle"><%=rv.getRestName() %></th>
									<th class="col-3 "></th>
									<th class="col-2 "><small>찜</small></th>
									<th class="col-1 ">
									<%
										Boolean chkdips = false;
										for(int i=0; i<favList.size(); i++){
											if(rv.getRestCode().equals(favList.get(i).getRestCode())){//식당코드 :1은 세호불백임
												chkdips = true;
											}
										}
										if(chkdips == true){
									%>
									<img alt="dipsY" src="<%=request.getContextPath() %>/assets/img/restau/heart.png" id="favbtn" onclick="fnFav()"></th>
									<th class="col-1 "name="dipsCnt" id="dipscnt"><%=dipsCnt%></th>
									<%
										} else if(chkdips == false){
											
									%>
									<img alt="dipsN" src="<%=request.getContextPath() %>/assets/img/restau/eheart.png" id="favbtn" onclick="fnFav()"></th>
									<th class="col-1 "name="dipsCnt" id="dipscnt"><%=dipsCnt%></th>
											
									<%
										}
									%>
								</tr>
								<tr class="d-flex text-left">
									<td class="col-12"><img class="col-12" src="/DPJ/assets/img/menu/sehoMenuList.jpg">
									</td>
								</tr>
								<tr class="d-flex text-left">
									<td class="col-3">식당 주소지</td>
									<td class="col-9">
									<%=rv.getRestZip() %> <%=rv.getRestAdd1() %> <%=rv.getRestAdd2() %>
									</td>
								</tr>
								<tr class="d-flex text-left">
									<td class="col-3">식당 전화번호</td>
									<td class="col-9">
									<%=rv.getRestTel()%>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="card-footer d-flex justify-content-center">
							<a class="btn btn-lg btn-secondary" type="button" href="list.do">목록으로 돌아가기</a>
								&nbsp;&nbsp;
							<%
								if(rv.getUserId().equals(userId)){
							%>
							<a class="btn btn-lg btn-secondary" type="submit" href="update.do">수정하기</a>
								&nbsp;&nbsp;
							<a class="btn btn-lg btn-secondary" type="reset" href="delete.do">삭제하기</a>
							<%
								}
							%>
					</div>
						</div>
					</div>
 					<div class="card-footer">
						<h2 class="card-title">리뷰보기</h2>
					</div>
					<div class="card-body">
						<table class="table table-sm table-hover" >
						<%
						if(reviewList.size() > 0){
							
							for(int i = 0; i < reviewList.size(); i++ ){
								%>
							<tbody>
								<tr class="d-flex text-left">
									<th class="col-5"><small id="rboardTitle<%=reviewList.get(i).getBoardSeq() %>"><%=reviewList.get(i).getBoardTitle() %></small></th>
									<th class="col-3"><small id="userId">작성자 : <%=reviewList.get(i).getUserId() %></small></th>
									<th class="col-2"><small id="score<%=reviewList.get(i).getBoardSeq() %>">평점 : <%=reviewList.get(i).getRestScore() %></small></th>
									<th class="col-2"><small ><%=reviewList.get(i).getBoardDate().substring(0,10) %></small></th>
								</tr>
								<tr class="d-flex text-left">
									<th class="col-10" id="rboardContent<%=reviewList.get(i).getBoardSeq() %>" ><%=reviewList.get(i).getBoardContent() %></th>
									<%
									if(reviewList.get(i).getUserId().equals(session.getAttribute("USERID"))){
									%>
									<th class="col-1 text-sm-right" id="upBtn<%=reviewList.get(i).getBoardSeq() %>" onClick="reviewUpdate(<%=reviewList.get(i).getBoardSeq() %>)"><small>수정</small></th>
									<th class="col-1 text-sm-right" id="deBtn<%=reviewList.get(i).getBoardSeq() %>" onClick="reviewDelete(<%=reviewList.get(i).getBoardSeq() %>)"><small>삭제</small></th>
									<th class="col-1 text-sm-right" id="reBtn<%=reviewList.get(i).getBoardSeq() %>" onClick="reviewSubmit(<%=reviewList.get(i).getBoardSeq() %>)" style="display: none"><small>등록</small></th>
									<th class="col-1 text-sm-right" id="cnBtn<%=reviewList.get(i).getBoardSeq() %>" onClick="reviewCancel(<%=reviewList.get(i).getBoardSeq() %>)" style="display: none"><small>취소</small></th>
									<%
									}else{
										%>
										<td class="col-2"></td>
										<%
									}
									%>
								</tr>
							</tbody>
								<%
							}
						}
						%>
						</table>
						
					</div>
					<form id="fmReview" method="post" enctype="multipart/form-data">
						<input type="hidden" id="boardSeq" name="boardSeq">
						<input type="hidden" id="restCode" name="restCode" value="<%=rv.getRestCode() %>">
						<input type="hidden" name="userId" value="<%=userId %>">
						<input type="hidden" id="boardTitle" name="boardTitle">
						<input type="hidden" id="boardContent" name="boardContent">
						<input type="hidden" id="restScore" name="restScore">
						<input type="hidden" name="atchFileId" value="-1">
						<input type="hidden" name="atchBillId" value="-1">
						<input type="hidden" id="tmpContent">
						<input type="hidden" id="tmpScore">
					</form>
					<script type="text/javascript">
					function reviewUpdate(seq){
						$('#upBtn' + seq).hide();
						$('#deBtn' + seq).hide();
						$('#reBtn' + seq).show();
						$('#cnBtn' + seq).show();
						
						var text = $('#rboardContent' + seq).html();
						var score = $('#score' + seq).html();
						$('#rboardContent' + seq).html('<input type="text" id="newContent" value="' + text + '">');
						$('#score' + seq).html('<input type="text" class="col-10" id="newScore" value="' + score + '">');
						$('#tmpContent').val(text);
						$('#tmpScore').val(score);
					}
					function reviewDelete(seq){
						if(confirm("리뷰를 삭제하시겠습니까?")){
							$('#fmReview').attr("action","<%=request.getContextPath() %>/searchRest/deleteReview.do");
							$('#boardSeq').val(seq);
							$('#fmReview').submit();
						}
					}
					function reviewSubmit(seq){
						if(confirm("리뷰를 수정하시겠습니까?")){
							$('#fmReview').attr("action","<%=request.getContextPath() %>/searchRest/updateReview.do");
							var boardTitle = $('#rboardTitle' + seq).html();
							var boardContent = $('#newContent').val();
							var restScore = $('#newScore').val().substr(5);
							$('#boardSeq').val(seq);
							$('#boardTitle').val(boardTitle);
							$('#boardContent').val(boardContent);
							$('#restScore').val(restScore);
							$('#fmReview').submit();
						}
						
					}
					function reviewCancel(seq){
						$('#upBtn' + seq).show();
						$('#deBtn' + seq).show();
						$('#reBtn' + seq).hide();
						$('#cnBtn' + seq).hide();
						
						$('#rboardContent' + seq).html($('#tmpContent').val());
						$('#score' + seq).html($('#tmpScore').val());
					}
					</script>

				</div>

			</div>
		</div>
		<form id="fmfav" method="post">
			<input type="hidden" name="userId" id="userId" value="<%=userId%>">
			<input type="hidden" name="restCodefav" id="restCodefav" value="<%=rv.getRestCode() %>">
		</form>
	</div>
	<script type="text/javascript">
		function fnFav() {
			if("dipsY" == ($("#favbtn").attr("alt")) && $("#favbtn").attr("src") == "<%=request.getContextPath()%>/assets/img/restau/heart.png"){
				$("#favbtn").attr("src", "<%=request.getContextPath()%>/assets/img/restau/eheart.png");
				$("#fmfav").attr("action", "<%=request.getContextPath()%>/searchRest/deleteDips.do");
				$("#favbtn").attr("alt","dipsN");
// 				$("#dipscnt").val() - 1;
				$("#fmfav").submit();
				
			} else if("dipsN" == ($("#favbtn").attr("alt")) && $("#favbtn").attr("src") == "<%=request.getContextPath()%>/assets/img/restau/eheart.png"){
				$("#favbtn").attr("src","<%=request.getContextPath()%>/assets/img/restau/heart.png");
				$("#fmfav").attr("action", "<%=request.getContextPath()%>/searchRest/insertDips.do");
				$("#favbtn").attr("alt","dipsY");
// 				$("#dipscnt").val() + 1;
				$("#fmfav").submit();
			}
			
		}
	</script>
	<!-- /.container -->
	
<%@include file="/WEB-INF/view/common/mainFooter.jsp"%>