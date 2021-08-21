package kr.or.ddit.code.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.code.service.CodeServiceImpl;
import kr.or.ddit.code.service.ICodeService;
import kr.or.ddit.code.vo.CodeVO;
import kr.or.ddit.common.handler.CommandHandler;

public class GetAllCodeListHandler implements CommandHandler{
	
	private static final String VIEW_PAGE = "/WEB-INF/view/code/getAllCode.jsp";
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		ICodeService service = CodeServiceImpl.getInstance();
		
		List<CodeVO> cv = service.getAllCodeList();
		
		req.setAttribute("codeList", cv);
		
		return VIEW_PAGE;
	}
	
}
