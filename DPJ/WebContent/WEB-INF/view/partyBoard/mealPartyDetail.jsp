<%@page import="kr.or.ddit.partyJoin.vo.PartyJoinVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.comment.vo.CommentVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.partyBoard.vo.PartyBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	PartyBoardVO pv = (PartyBoardVO) request.getAttribute("partyVO");
	
	int countJoin = (Integer) request.getAttribute("countJoin");
	List<PartyJoinVO> joinList = (List<PartyJoinVO>) request.getAttribute("joinList");
	
	int commentCount = (Integer) request.getAttribute("commentCnt");
	List<CommentVO> commentList = (List<CommentVO>) request.getAttribute("commentList");
	if(commentList == null) commentList = new ArrayList<CommentVO>();
	
	String uSrc = "";
	if(pv.getUserProfile().equals("A")) {
		uSrc = "/assets/img/profile/A.png";
	} else if(pv.getUserProfile().equals("B")) {
		uSrc = "/assets/img/profile/B.png";
	} else if(pv.getUserProfile().equals("C")) {
		uSrc = "/assets/img/profile/C.png";
	} else if(pv.getUserProfile().equals("D")) {
		uSrc = "/assets/img/profile/D.png";
	} else if(pv.getUserProfile().equals("E")) {
		uSrc = "/assets/img/profile/E.png";
	} else if(pv.getUserProfile().equals("F")) {
		uSrc = "/assets/img/profile/F.png";
	} 
	
%>    
    
<%@include file="/WEB-INF/view/common/mainNav.jsp"%>

<section class="page-section bg-light" id="team">
	<div class="container">
		<div class="col-md-12">
			<div class="text-center">
				<h2 class="section-heading "><i class="fas fa-utensils mr-3"></i>한 끼만 같이 먹어도 우리는 모두 친구!</h2>
				<h3 >모집중인 Meal 파티입니다.</h3>
			</div>
			
			<div class="card mb-4">
				<div class="card-body">
					<table class="table" >
						<tbody>
							<tr class="d-flex text-left">
								<th class="col-6" name="boardTitle">제목 : <%=pv.getBoardTitle() %></th>
								<td class="col-1"><small>작성자</small></td>
								<td class="col-1" name="userId"><small><%=pv.getUserId()%></small></td>
								<td class="col-1"><small>작성일</small></td>
								<td class="col-1" name="boardDate"><small><%=pv.getBoardDate() %></small></td>
								<td class="col-1"><small>조회수</small></td>
								<td class="col-1" name="boardHitsNumber"><small><%=pv.getBoardHit() %></small></td>
							</tr>
							<tr class="d-flex">
								<td class="col-lg-1">가격</td>
								<td class="col-lg-2"><a class="btn btn-md btn-success"><%=pv.getPrice() %></a></td>
								<td class="col-lg-1">거리</td>
								<td class="col-lg-2"><a class="btn btn-md btn-info"><%=pv.getDistance() %></a></td>
								<td class="col-lg-1">분류</td>
								<td class="col-lg-2"><a class="btn btn-md btn-danger"><%=pv.getRestType() %></a></td>
								<td class="col-lg-1">식당</td>
								<td class="col-lg-2">
									<%
										if(pv.getRestName() != null) {
									%>
									<a class="btn btn-md btn-warning"><%=pv.getRestName() %></a>
									<%
										} else {
									%>
									<a class="btn btn-md btn-warning">아무거나</a>
									<%		
										}
									%>	
								</td>
							</tr>
							<tr class="d-flex text-left">
								<td class="col-12 pt-5">
								<%=pv.getBoardContent() %>
								</td>
							</tr>
						</tbody>
					</table>
					<hr class="mt-5">
					<div class="row">
						<div class="col-lg-3">
							<div class="team-member">
								<img class="img-fluid img-thumbnail rounded-circle" src="<%=request.getContextPath()%><%=uSrc%>"/>
								<h4><%=pv.getUserId() %></h4>
							</div>
						</div>
					<%
						String src = "";
						for (int i = 0; i < joinList.size(); i++) {
							if(joinList.get(i).getUserId() != null) {
								if(joinList.get(i).getUserProfile().equals("A")) {
									src = "/assets/img/profile/A.png";
								} else if(joinList.get(i).getUserProfile().equals("B")) {
									src = "/assets/img/profile/B.png";
								} else if(joinList.get(i).getUserProfile().equals("C")) {
									src = "/assets/img/profile/C.png";
								} else if(joinList.get(i).getUserProfile().equals("D")) {
									src = "/assets/img/profile/D.png";
								} else if(joinList.get(i).getUserProfile().equals("E")) {
									src = "/assets/img/profile/E.png";
								} else if(joinList.get(i).getUserProfile().equals("F")) {
									src = "/assets/img/profile/F.png";
								} 
					%>
								<div class="col-lg-3">
									<div class="team-member">
										<img class="img-fluid img-thumbnail rounded-circle" src="<%=request.getContextPath()%><%=src%>"/>
										<h4><%=joinList.get(i).getUserId() %></h4>
									</div>
								</div>
					<%
							} 
						}
					
						int notJoin = 3 - joinList.size();
						for (int j = 0; j < notJoin; j++) {
					%>
						<div class="col-lg-3">
							<div class="team-member">
								<img class="img-fluid img-thumbnail rounded-circle" src="<%=request.getContextPath()%>/assets/img/profile/0.jpg"/>
								<h4>파티원 모집 중</h4>
							</div>
						</div>
					<%
						}
					%>
					<hr>
					</div>
					
					<div class="d-flex justify-content-center mb-5">
					<!-- 밀파티 참가 및 출발 -->
					<%
						if(userId.equals(pv.getUserId()) && pv.getPartyYn().equals("N")) {
					%>
							<a class="btn btn-lg btn-success" onclick="fn_endParty()">파티모집 마감하기</a>
					<%
						} else if(userId.equals(pv.getUserId()) && pv.getPartyYn().equals("Y")) {
					%>
							<a class="btn btn-lg btn-warning ml-5" href="<%=request.getContextPath() %>/searchRest/insertReview.do?restCode=<%=pv.getRestCode() %>">리뷰 쓰러가기</a>
					<%		
						} else if(pv.getPartyYn().equals("Y")) {
					%>
							<a><button class="btn btn-lg btn-secondary" disabled>마감된 파티</button></a>
					<%		
						}
					%>

					<%
					boolean joinYn = false;
					boolean review = false;
					if(userType.equals("일반회원") && pv.getPartyYn().equals("N") && !pv.getUserId().equals(userId) && joinList.size() < 4) {
						for(int k = 0; k < joinList.size(); k++) {
							if(joinList.get(k).getUserId().equals(userId)) {
								joinYn = true;
								
							} 
						}
						if(joinYn) {
							%>			
							<a class="btn btn-lg btn-danger" onclick="fn_quit()">파티 탈퇴하기</a>
							<%
						} else if(!joinYn) {
							%>
							<a class="btn btn-lg btn-success" onclick="fn_join()">파티 참가하기</a>
							<%	
						}
					} else if(userType.equals("일반회원") && pv.getPartyYn().equals("Y") && !pv.getUserId().equals(userId)) {
						for(int k = 0; k < joinList.size(); k++) {
							if(joinList.get(k).getUserId().equals(userId)) {
								review = true;
							} 
						}
						if(review) {
						%>
							<a class="btn btn-lg btn-warning ml-5" href="<%=request.getContextPath() %>/searchRest/insertReview.do?restCode=<%=pv.getRestCode() %>">식당 리뷰 쓰기</a>
						<%
							
						}
					}
					
					%>
					</div>
					
					<div class="card-footer d-flex justify-content-center">
						<a class="btn btn-lg btn-secondary" type="button" href="main.do">목록으로 돌아가기</a>
						
						<%
							if(pv.getUserId().equals(userId)) {
						%>							
						<a id="upd" class="btn btn-lg btn-secondary ml-5" onclick="fn_boardUpdate('<%=pv.getBoardSeq()%>');">수정하기</a>
						<a id="del" class="btn btn-lg btn-secondary ml-5" onclick="fn_boardDelete('<%=pv.getBoardSeq()%>')">삭제하기</a>
						<%
							}
						%>
						
					</div>
				</div>
			</div>
						
			<div class="card-footer">
				<h2 class="card-title">댓글<small class="ml-5"><%=commentCount %> 개</small></h2>
				
			</div>
			<div class="card-body">
				<table class="table table-sm table-hover" >
					<tbody>
					<%
						for (CommentVO commentVO : commentList) {
					%>
						<tr class="d-flex text-left">
							<th class="col-3"><%=commentVO.getUserId() %></th>
							<th class="col-7"><small><%=commentVO.getReplyDate() %></small></th>
							
					<%
						if(commentVO.getUserId().equals(userId)) {
					%>		
							<td class="col-1 text-sm-right">
								<a class="small" id="upBtn<%=commentVO.getReplySeq()%>" onclick="fn_update_click('<%=commentVO.getReplySeq()%>')">수정</a>
								<a class="small" id="cnBtn<%=commentVO.getReplySeq()%>" style="display: none;" onclick="fn_update_cancel('<%=commentVO.getReplySeq()%>');">취소</a>
							</td>
							<td class="col-1 text-sm-right">
								<a class="small" id="dlBtn<%=commentVO.getReplySeq()%>" onclick="fn_delete('<%=commentVO.getReplySeq()%>');">삭제</a>
								<a class="small" id="cmBtn<%=commentVO.getReplySeq()%>" style="display: none;" onclick="fn_update('<%=commentVO.getReplySeq()%>');">등록</a>
							</td>
					<%
						}
					%>		
						</tr>
						<tr class="d-flex text-left">
							<td class="col-12" id=content<%=commentVO.getReplySeq()%>><%=commentVO.getReplyContent() %></td>
						</tr>
					<%
						}
					%>
					</tbody>
					<%
					if(userType.equals("일반회원") || userType.equals("관리자")) {
					%>
					<tbody id="replyArea">
						<tr class="d-flex text-left">
							<th class="col-12 table-info" id="rUserId"><%=userId %></th>
						</tr>
						<tr class="d-flex text-left table-info">
							<td class ="input-group-append col-11">
							<input type="text" class="form-control input-lg" id="rContent" placeholder="댓글을 입력해주세요.">
							</td>
							<td class ="input-group-append col-1">
							<button type="button" class="btn btn-outline-secondary" id="commentBtn" onclick="fn_insert()">등록</button>
							</td>
						</tr>
					</tbody>
					<%	
					}
					%>
				</table>
			</div>
		</div>
	</div>
</section>

<!-- 파티관련 기능에서 들고나갈 값 -->
<form id="joinInfo" method="post">
	<input type="hidden" name="boardSeq" value="<%=pv.getBoardSeq()%>">
	<input type="hidden" name="userId" value=<%=userId%>>
	<input type="hidden" name="userProfile" value=<%=userPhoto%>>
	<input type="hidden" name="partyEnd" value="<%=pv.getPartyEnd()%>">
</form>

<!-- 댓글에서 들고나갈 값 -->
<form id="fm" method="post">
	<input type="hidden" name="code" value="PARTY">
	<input type="hidden" id="boardSeq" name="boardSeq" value="<%=pv.getBoardSeq()%>">
	<input type="hidden" id="userId" name="userId" value=<%= userId%>>
	<input type="hidden" id="replyContent" name="replyContent">
	<input type="hidden" id="tmpContent">
	<input type="hidden" id="replySeq" name="replySeq">
</form>	
<script type="text/javascript">
	// 파티관련 function
	function fn_endParty() {
		if(confirm("파티모집을 마감하시겠습니까?")) {
			$('#fm').attr('action', '<%=request.getContextPath()%>/PARTY/endParty.do');
			$('#fm').submit();
		}
	}
	
	function fn_join() {
		if(confirm("파티에 참가하시겠습니까?")) {
			$('#joinInfo').attr('action', '<%=request.getContextPath()%>/PARTY/joinParty.do');
			$('#joinInfo').submit();
		}
	}
	
	function fn_quit() {
		if(confirm("파티에서 탈퇴하시겠습니까?")) {
			$('#joinInfo').attr('action', '<%=request.getContextPath()%>/PARTY/quitParty.do');
			$('#joinInfo').submit();
		}
	}
	
	function fn_boardUpdate(seq) {
		$('#joinInfo').attr('method', 'get');
		$('#joinInfo').attr('action', '<%=request.getContextPath()%>/PARTY/update.do');
		$('#joinInfo').submit();
	}
	
	function fn_boardDelete(seq) {
		if(confirm("삭제하시겠습니까?")) {
			$('#joinInfo').attr('action', '<%=request.getContextPath()%>/PARTY/delete.do');
			$('#joinInfo').submit();
		}
	}
	
	// 댓글 부분 function
	function fn_insert() {
		$("#fm").attr("action", "<%=request.getContextPath()%>/comment/insert.do");
		$("#replyContent").val($("#rContent").val());
		$("#fm").submit();
	}
	
	function fn_update(seq) {
	    if(confirm("댓글을 수정하시겠습니까?")) {
	        $('#fm').attr("action", "<%=request.getContextPath()%>/comment/update.do");
	        $('#replySeq').val(seq);
	        var text = $('#newContent').val();
	        $('#replyContent').val(text);
	        $('#fm').submit();
	    }
	}

	function fn_update_click(seq) {
	    $('#upBtn' + seq).hide();
	    $('#cnBtn' + seq).show();
	    $('#dlBtn' + seq).hide();
	    $('#cmBtn' + seq).show();
	    var text = $('#content' + seq).text();
	    $('#content' + seq).html('<textarea class="form-control" id="newContent">' + text + '</textarea>');
	    $('#tmpContent').val(text);
	}

	function fn_update_cancel(seq) {
		$('#upBtn' + seq).show();
	    $('#cnBtn' + seq).hide();
	    $('#dlBtn' + seq).show();
	    $('#cmBtn' + seq).hide();
	    $('#content' + seq).html($('#tmpContent').val());
	}
	
	function fn_delete(seq) {
		if(confirm('댓글을 삭제하시겠습니까?')) {
			$('#fm').attr('action', '<%=request.getContextPath()%>/comment/delete.do');
			$('#replySeq').val(seq);
			$('#fm').submit();
		}
	}
	
	
</script>

<%@include file="/WEB-INF/view/common/mainFooter.jsp"%>