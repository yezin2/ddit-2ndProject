<%@page import="kr.or.ddit.restInfo.vo.RestInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/view/common/mainNav.jsp"%>
<%
	List<RestInfoVO> restList = (List<RestInfoVO>)request.getAttribute("list");
%>

<div class="container">
	<div class="row">
		<div class="col-md-12 mt-5">
			<h1><i class="fas fa-utensils mr-3"></i>파티 모집하기</h1>

			<div class="card mb-4">
				<form id="fm" method="post" action="<%=request.getContextPath()%>/PARTY/insert.do">
				<div class="card-body">
					<table class="table" >
						<tbody>
							<tr class="d-flex text-right">
								<td class="col-12"><span>무분별한 파티 도배와 주제에 맞지 않는 게시글은 삭제 대상이 될 수 있습니다.</span></td>
							</tr>
							<tr class="d-flex text-left">
								<th class="col-2"><h2>제 목</h2></th>
								<td class="col-10"><input type="text" class="form-control" name="boardTitle" placeholder="제목을 입력해주세요." required="required"></td>
							</tr>
							<tr class="d-flex">
								<td class="col-lg-1">가격</td>
								<td class="col-lg-2">
									<select class="custom-select" id="price" name="price">
										<option value="아무거나" selected>아무거나</option>
										<option value="5000원">5000원</option>
										<option value="6000원">6000원</option>
										<option value="7000원">7000원</option>
										<option value="8000원">8000원</option>
										<option value="9000원">9000원</option>
										<option value="10000원↑">10000원↑</option>
									</select>
								</td>
								<td class="col-lg-1">거리</td>
								<td class="col-lg-2">
									<select class="custom-select" id="distance" name="distance">
										<option value="아무거나" selected>아무거나</option>
										<option value="3분(100m)">3분(100m)</option>
										<option value="5분(300m)">5분(300m)</option>
										<option value="10분(600m)">10분(600m)</option>
										<option value="15분(900m)">15분(900m)</option>
									</select>
								</td>
								<td class="col-lg-1">분류</td>
								<td class="col-lg-2">
									<select class="custom-select" id="restType" name="restType">
										<option value="아무거나" selected>아무거나</option>
										<option value="한식">한식</option>
										<option value="양식">양식</option>
										<option value="중식">중식</option>
										<option value="일식">일식</option>
									</select>
								</td>
								<td class="col-lg-1">식당</td>
								<td class="col-lg-2">
								
									<select class="custom-select" id="restCode" name="restCode">
										<option value="0">아무거나</option>
									<%
										for(int i = 0; i < restList.size(); i++) {
									%>	
										<option value="<%=restList.get(i).getRestCode()%>"><%=restList.get(i).getRestName() %></option>
									<%			
										}
									%>	
									</select>
								</td>
							</tr>
							<tr class="d-flex text-left">
								<td class="col-2"><span>모집마감일</span></td>
								<td class="col-4">
									<input class="form-control" type="date" id="partyEnd" name="partyEnd" required="required">
								</td>
								<td class="col-7">모집마감일은 4일 이내로 선택 가능합니다.</td>
							</tr>
							<tr class="d-flex text-left">
								<th class="col-12"><h2>내 용</h2></th>
							</tr>
						</tbody>
					</table>
					<textarea class="form-control" name="boardContent" rows="10" placeholder="내용을 입력하세요." required="required"></textarea>
				</div>
				<div class="card-footer d-flex justify-content-end">
					<button class="btn btn-outline-success" type="submit"><a>게시물 등록</a></button>
					<a class="btn btn-outline-secondary ml-5" href="<%=request.getContextPath() %>/PARTY/main.do">목록으로 돌아가기</a>
				</div>
				
				
				<!-- 게시글 작성 시 갖고 나갈 값 -->
				<input type="hidden" name="userId" value="<%=userId%>">
				<input type="hidden" name="userProfile" value="<%=userPhoto%>">
				<input type="hidden" name="code" value="PARTY">
				</form>
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		
		// 달력 선택 제한
		function addZero(i) {
			var rtn = i + 100;
			return rtn.toString().substring(1, 3);
		}
		
		function converDateString(dt) {
			return dt.getFullYear() + "-" + addZero(eval(dt.getMonth() + 1)) + "-" + addZero(dt.getDate());
		}
		
		function getDt(s, i) {
			var newDt = new Date(s);
			newDt.setDate(newDt.getDate() + i);
			return converDateString(newDt);
		}
		
		function getFormatDate(date){
            var year = date.getFullYear();
            var month = (1 + date.getMonth());
            month = month >= 10 ? month : '0' + month;
            var day = date.getDate();
            day = day >= 10 ? day : '0' + day;
            return year + '-' + month + '-' + day;
        }
		 
		var startDate = getFormatDate(new Date());
		
		var endDate = getDt(new Date, 3);
		
		$("#partyEnd").attr("min", startDate);
		$("#partyEnd").attr("max", endDate);
		
	});
	
</script>

<%@include file="/WEB-INF/view/common/mainFooter.jsp"%>