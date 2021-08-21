/**
 * 
 */

function searchHandler(searchType,btnNum) {
	$("#searchType").val(searchType);
	$("#btnNum").val(btnNum);
	
	var fm = document.getElementById("fm");
	fm.method = "post"
	fm.action = "/DPJ/searchRest/list.do";
	fm.submit();
}
	// 	function login(url){
	// 		var fm = document.getElementById("fm");
	// 		fm.method = "post"
	// 		fm.action = url;
	// 		fm.submit();
	// 	}
	
	// 	function movePageByGet(url){
	// 		  // 페이지이동 1
	// 		  location.href = url;
	// 	}