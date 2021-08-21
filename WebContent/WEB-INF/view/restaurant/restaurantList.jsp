<%@page import="java.util.List"%>
<%@ page import="kr.or.ddit.menu.vo.MenuVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <script src="<%=request.getContextPath() %>/assets/js/restaurant/restaurant.js"> --%>
<script>
function searchHandler(searchType,btnNum) {
	$("#searchType").val(searchType);
	$("#btnNum").val(btnNum);
	
	var fm = document.getElementById("fm");
	fm.method = "post"
	fm.action = "/DPJ/searchRest/list.do";
	fm.submit();
}
</script>

<!---------------------------------------- MAP---------------------------- -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f535229eba283a7816f699aaa287ed65"></script>
<style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
<!---------------------------------------- MAP---------------------------- -->



<%
	List<MenuVO> menuList = (List<MenuVO>) request.getAttribute("menuList");
%>
<%@include file="/WEB-INF/view/common/mainNav.jsp"%>

	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<!-- Blog Entries Column -->
			<div class="col-md-12">
				<h1 class="my-1">식당 검색</h1>
				<!-- Blog Post -->
				<div class="card mb-10">
					<div class="card-footer text-muted col-12">
					<h2 class="card-title">검색결과</h2>
						<table class="table col-12">
							<thead>
								<tr class="d-flex justify-content-start">
									<th class="col-1">#</th>
									<th class="col-3">식당이름</th>
									<th class="col-3">메뉴이름</th>
									<th class="col-2">가격</th>
									<th class="col-1">평점</th>
									<th class="col-2">리뷰수</th>
								</tr>
							</thead>
							<tbody class="col-12">
								<%
								int menuListSize = menuList.size();
								
								if(menuListSize > 0){
									for(int i = 0; i < menuListSize ; i++){
										String restCode = menuList.get(i).getRestCode();
										%>
										<tr class="d-flex justify-content-start">
											<td class="col-1"><%= (i+1) %></td>
											<td class="col-3"><a href="<%=request.getContextPath() %>/searchRest/detailRest.do?restCode=<%= restCode %>&userId=<%=userId %>" ><%= menuList.get(i).getRestName() %></a></td>
											<td class="col-3"><%= menuList.get(i).getMenuName() %></td>
											<td class="col-2"><%= menuList.get(i).getMenuPrice() %></td>
											<td class="col-1"><%= menuList.get(i).getRestFavCnt() %></td>
											<td class="col-2"><%= menuList.get(i).getRestReviewCnt() %></td>
										</tr>
										<%
									}
								} else {
									%>
									<tr align="center">
										<td colspan="5"> 검색결과가 없습니다.</td>
									</tr>
									<%
								}
								%>
							</tbody>
						</table>
						<div class="card-footer d-flex justify-content-center">
						<a class="btn btn-lg btn-secondary" type="button" href="<%=request.getContextPath() %>/searchRest/list.do">다시 검색하기!!</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row1 -->
		<div class="row">
			<div class="col-md-12">
				<h1 class="my-1">지도로 확인하기</h1>
					<div class="card mb-10">
						<div class="w-100 h-50" width="750px" height="300px">
							<!-- MAP -->
							<div id="map" style="width:100%;height:300px;"></div>
<!-- 						<br>
						<br>
						<br>
						<br>
						<br>
						<br> --------------------------------------------------->
<!-- 						<img class="card-img-top" src="http://placehold.it/750x300" alt="Card image cap"> -->
						</div>
					</div>
			</div>
		</div>



	</div>
	<form id="fm">
		<input type="hidden" id="searchType">
		<input type="hidden" id="btnNum">
	</form>
	
<script>
var contents = [];
var lats = [];
var lngs = [];

<%
for(int i = 0; i < menuListSize ; i++){
	%>
	var content = "<%= menuList.get(i).getMenuName() %>";
	var restLat = "<%= menuList.get(i).getRestLat() %>";
	var restLng = "<%= menuList.get(i).getRestLng() %>";
	contents.push(content);
	lats.push(restLat);
	lngs.push(restLng);
	<%
}
%>

</script>
	
	
	<!------------------------------------- map ----------------------------->
<script>
var mapContainer = document.getElementById('map'), // 지도의 중심좌표
    mapOption = { 
        center: new kakao.maps.LatLng(36.32554734619475, 127.41982350399763), // 대덕인재개발원 기준
        level: 3 // 지도의 확대 레벨
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 


var positions = [
	<% for(int i = 0 ; i < menuListSize ; i++) { %>
    {
        content: "<div style='width:150px;text-align:center;padding:6px 0;'><%= menuList.get(i).getRestName() %></div>", 
        latlng: new kakao.maps.LatLng(<%= menuList.get(i).getRestLat() %>, <%= menuList.get(i).getRestLng() %>)
    } <% if(i != (menuListSize-1)) { %>
    		,
   		<%} %> // close if 문
    <%}%> // close for문
];

// 지도에 마커를 표시합니다 
var marker = new kakao.maps.Marker({
    map: map, 
    position: new kakao.maps.LatLng(36.32519726991685, 127.42016682686366) // 대덕인재개발원
});

// 커스텀 오버레이에 표시할 컨텐츠 입니다
// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
// 별도의 이벤트 메소드를 제공하지 않습니다 
var content = '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            '            대덕인재개발원' + 
            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="/DPJ/assets/img/test1.png" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis">대전광역시 중구 대흥동 500-5</div>' + 
            '                <div class="jibun ellipsis">(전화번호) 042-222-8201</div>' + 
            '                <div><a href="https://www.ddit.or.kr/" target="_blank" class="link">홈페이지</a></div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>';

// 마커 위에 커스텀오버레이를 표시합니다
// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
var overlay = new kakao.maps.CustomOverlay({
    content: content,
    map: map,
    position: marker.getPosition()       
});

// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
kakao.maps.event.addListener(marker, 'click', function() {
    overlay.setMap(map);
});

// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
function closeOverlay() {
    overlay.setMap(null);     
}



/*여러개 마커 찍기**********************************/
for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker1 = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker1, 'mouseover', makeOverListener(map, marker1, infowindow));
    kakao.maps.event.addListener(marker1, 'mouseout', makeOutListener(infowindow));
    kakao.maps.event.addListener(marker1, 'click', function() {
<%--     	<% for(int i = 0 ; i < menuListSize ; i++) { %> --%>
    	location.href="https://map.kakao.com/link/to/세호불백,36.32804796422512,127.41902128213523"; 
<%--     	<%}%> // close for문 --%>
  });
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker1, infowindow) {
    return function() {
        infowindow.open(map, marker1);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}

</script>





<!------------------------------------- map ----------------------------->

	<!-- /.container -->
	<%@include file="/WEB-INF/view/common/mainFooter.jsp"%>
	