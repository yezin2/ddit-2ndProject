package kr.or.ddit.code.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.code.service.CodeServiceImpl;
import kr.or.ddit.code.service.ICodeService;
import kr.or.ddit.common.handler.CommandHandler;

public class DeleteCodeHandler implements CommandHandler {

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equals("GET")) {
			return true;
		}else {
			return true;
		}
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(req.getMethod().equals("GET")) {
			return req.getContextPath() + "/code/allList.do";
		} else {
			String code = req.getParameter("code");
			ICodeService service = CodeServiceImpl.getInstance();
			service.deleteCode(code);
			
			return req.getContextPath() + "/code/allList.do";
		}
	}
}
