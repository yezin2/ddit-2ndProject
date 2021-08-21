package kr.or.ddit.code.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.code.service.CodeServiceImpl;
import kr.or.ddit.code.service.ICodeService;
import kr.or.ddit.code.vo.CodeVO;
import kr.or.ddit.common.handler.CommandHandler;

public class GetCodeListHandler implements CommandHandler {

	private static final String VIEW_PAGE = "/WEB-INF/view/code/codeList.jsp";

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		// String user = (String) req.getSession().getAttribute("user");
		// if (user == null) return "리다이렉트 페이지";
		// req.getSession().invalidate();

		String groupCode = req.getParameter("groupCode");

		ICodeService codeService = CodeServiceImpl.getInstance();
		List<CodeVO> codeList = codeService.getCodeList(groupCode);
		req.setAttribute("codeList", codeList);

		return VIEW_PAGE;
	}



}
