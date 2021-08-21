/**
 * 
 */
function insert(url){
	var fm = document.getElementById("fm");
	fm.method = "post"
	fm.action = url;
	fm.submit();
}

function movePageByGet(url){
	  location.href = url;
}


function save(){
	// 사용자 컨펌
	if(!confirm("저장하시겠습니까?")) {
		return;
	} else {
		insert("/DPJ/blackList/insertBlackList.do");
	}
}

function deleteBlackList(userId){
	console.log(userId);
	// 사용자 컨펌
	if(!confirm("삭제하시겠습니까?")) {
		return;
	} else {
		insert("/DPJ/blackList/deleteBlackList.do?userId="+userId);
	}
}