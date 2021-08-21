$(document).ready(function(){
	
	// 모달에서 메인 폼으로 주소 삽입
	$('#tbZipResult').on('click', 'tbody tr', function(){
		var zipcode = $(this).children('td:eq(0)').text();
		var addr = $(this).children('td:eq(1)').text();
		
		$('#userZip').val(zipcode);
		$('#userAdd1').val(addr);
		
		$('#zipModal').modal('hide');
	});
	
});

// 아이디 중복 검사 (아이디 validation 같이 진행해야 함)
function chkId(){
	var userId = $('#userId').val();
	var aI = $('#alertId');
	
	// 빈 값 체크
	if(isEmpty(userId)) {
		aI.text('아이디 입력 후 중복체크를 진행하세요.');
		aI.attr('class', 'form-text text-danger');
		$('#userId').focus();
		return false;
	}
	
	// 공백 체크
	if(hasBlank(userId)) {
		aI.text('아이디에 빈 칸은 입력하실 수 없습니다.');
		aI.attr('class', 'form-text text-danger');
		$('#userId').focus();
		return false;
	}
	
	// 형식체크 : 영소+숫자 4~12, 영소 필수
	if(!checkRegExp(userId, /^(?=.*[a-z])[a-z0-9]{4,12}$/)) {
		aI.text('4~12자 영문 소문자, 숫자를 사용하세요. 영문 소문자는 필수입니다.');
		aI.attr('class', 'form-text text-danger');
		$('#userId').focus();
		return false;
	}
	
//	 DB에서 중복검사 수행
	$.ajax({
		url : '/MemberPj/MemberServlet'
		,type : 'post'
		,data : {'memId' : userId, 'flag' : 'CHKID'}
		,dataType : 'json'
		,async : false
		,success : function(data){
			if(data.resultCnt == 0) {
				$('#alertId').text('사용가능한 아이디입니다.');
				$('#alertId').attr('class', 'form-text text-success');
				$('#checkedId').val(userId);
			} else {
				$('#alertId').text('중복된 아이디가 존재합니다.');
				$('#alertId').attr('class', 'form-text text-danger');
			}
		}
		,error : function(xhr){
			console.log(xhr);
			$('#alertId').hide();
			alert('ID 중복 검사 중 오류가 발생했습니다.');
		}
	});
	return true;
}

// 모달 실행 시 검색 input에 포커스
$('#zipModal').on('shown.bs.modal', function () {
	$('#inputDong').focus();
});

// 모달 종료 시 모달 초기화
$('#zipModal').on('hidden.bs.modal', function () {
	$('#inputDong').val('');
	$('#tbZipResult tbody').empty();
	$('#tbZipResult').hide();
});

// 우편번호 검색
function searchZip() {
	var param = {
					'dong' : $('#inputDong').val()
				};
	
	$.ajax({
		url : '/MemberPj/ZipServlet'
		,type : 'post'
		,data : param
		,dataType : 'json'
		,success : function(data) {
			makeAddrTable(data);
		}
		,error : function(xhr) {
			console.log(xhr);
			alert('오류가 발생하였습니다.\n관리자에게 문의하세요.')
		}
	});
}

//  우편번호 검색 결과 출력
function makeAddrTable(data) {
	$('#tbZipResult').show();
	$('#tbZipResult tbody').empty();
	
	var str = '';
	for(i = 0; i < data.length; i++) {
		str += '<tr>'
			 + '<td>' + data[i].zipcode + '</td>'
			 + '<td>' + data[i].sido + ' ' + changeEmptyVal(data[i].gugun) + ' '
 					  + data[i].dong + ' ' + changeEmptyVal(data[i].bunji) + '</td>'
			 + '</tr>';
	}
	
	$('#tbZipResult tbody').html(str);
}


//회원정보 저장하기
function save(){
	// 회원정보 유효성 체크
	var result = validate();
	if(!result) {
		console.log('validate 실패?');
		return;
	}
	
	// 사용자 컨펌
	if(!confirm('저장하시겠습니까?')) {
		return;
	}
	
	// DB에 저장하는 ajax 호출
	$('#formFlag').val('C');
	$.ajax({
		url : '/MemberPj/MemberServlet'
		,type : 'post'
		,data : $('#fm').serialize()
		,dataType : 'json'
		,success : function(data){
			if(data.resultCnt == 1) {
				alert('저장되었습니다.');
				
				//페이지 이동
				changePage('/MemberPj/html/login.html');
			}
			
		}
		,error : function(xhr){
			alert('실패하였습니다.\n관리자에게 문의하세요.');
			console.log(xhr);
		}
	});
	
}

function changePage(strUrl){
	// 방법1
//	window.location.href = '/JqueryPro/html/member/memberList2.html';
	
	// 방법2
	var fm = document.getElementById('fm');
	fm.action = strUrl;// 서블릿을 호출하기도 함
	fm.method = 'post';
	fm.submit();
	
}
