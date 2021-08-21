package kr.or.ddit.code.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.code.service.CodeServiceImpl;
import kr.or.ddit.code.service.ICodeService;
import kr.or.ddit.code.vo.CodeVO;
import kr.or.ddit.common.handler.CommandHandler;

public class UpdateCodeHandler implements CommandHandler {
	
	private static final String VIEW_PAGE = "/WEB-INF/view/code/updateCode.jsp";
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equals("GET")) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(req.getMethod().equals("GET")) {
			
			String groupCode = req.getParameter("groupCode");
			String code = req.getParameter("code");
			String codeName = req.getParameter("codeName");
			
			ICodeService service = CodeServiceImpl.getInstance();
			CodeVO cv = service.getCode(code);
			
			req.setAttribute("codeVO", cv);
			
			return VIEW_PAGE;
			
		} else {
			
			CodeVO cv = new CodeVO();
			cv.setCode(req.getParameter("code"));
			cv.setCodeName(req.getParameter("codeName"));
			
			ICodeService service = CodeServiceImpl.getInstance();
			service.updateCode(cv);
			
			return req.getContextPath() + "/code/allList.do";
			
		}
	}

}
