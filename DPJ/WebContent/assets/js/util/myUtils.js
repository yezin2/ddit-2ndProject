/**
 * 
 */

// 빈 값 체크
function isEmpty(val) {
	if(val == undefined) return true;
	if(val == null) return true;
	if(val == "null") return true;
	
	val = jQuery.trim(val);
	if(val.length == 0) return true;
	
	return false;
}

// 공백 체크
function hasBlank(str) {
	return str.match(" ");
}

// 빈 값 => ""
function changeEmptyVal(val) {
	if(isEmpty(val)) return "";
	else return val;
}

// 길이 검사
function checkLength(str, min, max){
	if(min == null && max == null ) {
		return false;
	} else if(min == null) {// 최대값만 존재하는 경우
		if(str.length > max) return false;
		
	} else if(max == null) {// 최소값만 존재하는 경우
		if(str.length < min) return false;
		
	} else {// 최소값, 최대값이 둘다 존재하는 경우
		if(str.length < min || str.length > max)  return false;
	}
	return true;
}

// 정규식 확인
function checkRegExp(str, regExp) {
	return regExp.test(str);
	
}

// 아이디 밸리데이션
function validate() {
	var checkedId = false;
	var userId = $('#userId').val();
	var aI = $('#alertId');
	
	if(isEmpty(userId) && isEmpty($('#checkedId').val())) {
		alert('아이디 중복체크를 진행하세요.');
		$('#userId').focus();
		return false;
	}
	
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
	
	if(userId !== $('#checkedId').val()) {
		console.log('다시 검사해야함');
		alert('아이디 중복체크를 진행하세요.');
		$('#alertId').text('새로 입력하신 아이디의 중복 검사를 진행해주세요.');
		$('#alertId').attr('class', 'form-text text-danger');
		$('#userId').focus();
		return false;
	} else {
		checkedId = true;
	}
	
//	 DB에서 중복검사 수행
	$.ajax({
		url : '/DPJ/MemberServlet'
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

	if(!checkedId) {
		console.log('밖 : ' + checkedId);
		alert('아이디 중복 검사를 실행해주세요.');
		$('#alertId').text('새로 입력하신 아이디의 중복 검사를 진행해주세요.');
		$('#alertId').attr('class', 'form-text text-danger');
		$('#userId').focus();
		return false;
	}

// 이름 밸리데이션
	var userName = $('#userName').val();
	var aN = $('#alertName');
	aN.show();

	// 빈 값 체크
	if(isEmpty(userName)) {
		aN.text('이름은 필수 정보입니다.');
		aN.attr('class', 'form-text text-danger');
		$('#userName').focus();
		return false;
	}
	
	// 공백 체크
	if(hasBlank(userName)) {
		aN.text('이름에 빈 칸은 입력하실 수 없습니다.');
		aN.attr('class', 'form-text text-danger');
		$('#userName').focus();
		return false;
	}
	
	// 형식체크 : 한글 2~5글자
	if(!checkRegExp(userName, /^[가-힣]{2,5}$/)) {
		aN.text('2~5자 한글만 사용하세요.');
		aN.attr('class', 'form-text text-danger');
		$('#userName').focus();
		return false;
	} else aN.hide();

// 생일 벨리데이션
	var userBir = $('#userBir').val();
	var userYear = userBir.split('-')[0];
	var aB = $('#alertBir');
	aB.show();
	
	// 빈 값 체크
	if(isEmpty(userBir)) {
		aB.text('생년월일은 필수 정보입니다.');
		aB.attr('class', 'form-text text-danger');
		$('#userBir').focus();
		return false;
	}
	
	// 나이 제한 (2012년생까지 가입가능)
//	if(userYear < 1900 || 2012 < userYear) {
//		aB.text('1900~2012년생만 가입 가능합니다.');
//		aB.attr('class', 'form-text text-danger');
//		$('#userBir').focus();
//		return false;
//	}
	
	var currDate = new Date();
	var ageLimit = currDate.getFullYear() - 9;
	if(userYear < 1900 || ageLimit < userYear) {
		aB.text('1900~2012년생만 가입 가능합니다.');
		aB.attr('class', 'form-text text-danger');
		$('#userBir').focus();
		return false;
	}
	
	// 형식체크 : 1900-00-00
	if(!checkRegExp(userBir, /^(19[0-9][0-9]|20[0-1][0-9]|202[0-1])-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/)) {
		aB.text('올바른 형태의 생년월일이 아닙니다.\n예) 1900-01-01');
		aB.attr('class', 'form-text text-danger');
		$('#userBir').focus();
		return false;
	} else aB.hide();

// 비밀번호 밸리데이션
	var userPass = $('#userPass').val();
	var aP = $('#alertPass');
	aP.show();

	// 빈 값 체크
	if(isEmpty(userPass)) {
		aP.text('비밀번호는 필수 정보입니다.');
		aP.attr('class', 'form-text text-danger');
		$('#userPass').focus();
		return false;
	}
	
	// 공백 체크
	if(hasBlank(userPass)) {
		aP.text('비밀번호에 빈 칸은 입력하실 수 없습니다.');
		aP.attr('class', 'form-text text-danger');
		$('#userPass').focus();
		return false;
	}
	
	// 형식체크 : 한글 2~5글자
	if(!checkRegExp(userPass, /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[-_!@#$%^&?])[A-Za-z\d-_!@#$%^&?]{8,12}$/)) {
		aP.text('8~12자 영문 대소문자, 숫자, 특수문자(-_!@#$%^&?)를 모두 포함하세요.');
		aP.attr('class', 'form-text text-danger');
		$('#userPass').focus();
		return false;
	} else aP.hide();

// 휴대폰번호 밸리데이션
	var userHp = $('#userHp').val();
	var userHpNum = userHp.replace("-", "");
	var aH = $('#alertHp');
	aH.show();

	// 빈 값 체크
	if(isEmpty(userHp)) {
		aH.text('휴대폰 번호는 필수 정보입니다.');
		aH.attr('class', 'form-text text-danger');
		$('#userHp').focus();
		return false;
	}
	
	// 공백 체크
	if(hasBlank(userHp)) {
		aH.text('휴대폰 번호에 빈 칸은 입력하실 수 없습니다.');
		aH.attr('class', 'form-text text-danger');
		$('#userHp').focus();
		return false;
	}
	
	// 형식체크 : 한글 2~5글자
	if(!checkRegExp(userHp, /^01[0-1]-?\d{3,4}-?\d{4}$/)) {
		aH.text('010 또는 011로 시작하는 휴대폰 번호만 사용하세요. (예: 010-0000-0000)');
		aH.attr('class', 'form-text text-danger');
		$('#userHp').focus();
		return false;
	} else aH.hide();

	// 이메일 밸리데이션
	var userMail = $('#userMail').val();
	var aM = $('#alertMail');
	aM.show();

	// 빈 값 체크
	if(isEmpty(userMail)) {
		aM.text('이메일 주소는 필수 정보입니다.');
		aM.attr('class', 'form-text text-danger');
		$('#userMail').focus();
		return false;
	}
	
	// 공백 체크
	if(hasBlank(userMail)) {
		aM.text('이메일 주소에 빈 칸은 입력하실 수 없습니다.');
		aM.attr('class', 'form-text text-danger');
		$('#userMail').focus();
		return false;
	}
	
	// 형식체크 : 한글 2~5글자
	if(!checkRegExp(userMail, /^(?=.*[a-z])[a-z0-9]{4,12}@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/)) {
		aM.text('올바른 형식의 이메일 주소가 아닙니다.(예: a001@ddit.kr)');
		aM.attr('class', 'form-text text-danger');
		$('#userMail').focus();
		return false;
	} else aM.hide();

// 주소 밸리데이션
	var aA = $('#alertAdd');
	aA.show();

	// 우편번호 빈 값 체크
	if(isEmpty($('#userZip').val())) {
		aA.text('우편번호를 검색해주세요.');
		aA.attr('class', 'form-text text-danger');
		$('#searchZipBtn').focus();
		return false;
	}
	
	// 빈 값 체크
	if(isEmpty($('#userAdd2').val())) {
		aA.text('상세주소를 입력해주세요.');
		aA.attr('class', 'form-text text-danger');
		$('#userAdd2').focus();
		return false;
	} else aA.hide();

	
	// 유효성 체크 정상
	return true;
}