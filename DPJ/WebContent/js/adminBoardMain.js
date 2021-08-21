/**
 * 
 */
function fnGet(data) {
	$("#fm").attr("action", "<%=request.getContextPath()%>/adminBoard/noticeGet.do");
	$("#boardSeq").val(data);
	$("#fm").submit();
}