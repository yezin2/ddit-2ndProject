package kr.or.ddit.code.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.code.service.CodeServiceImpl;
import kr.or.ddit.code.service.ICodeService;
import kr.or.ddit.code.vo.CodeVO;
import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.groupCode.dao.GroupCodeInfoDaoImpl;
import kr.or.ddit.groupCode.service.GroupCodeInfoServiceImpl;
import kr.or.ddit.groupCode.service.IGroupCodeInfoService;
import kr.or.ddit.groupCode.vo.GroupCodeInfoVO;

public class InsertCodeHandler implements CommandHandler {

	private static final String VIEW_PAGE = "/WEB-INF/view/code/insertCode.jsp";
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equals("GET")) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(req.getMethod().equals("GET")) {
			
			IGroupCodeInfoService gService = GroupCodeInfoServiceImpl.getInstance();
			List<GroupCodeInfoVO> gv = gService.getAllGroupCodeList();
			req.setAttribute("groupCode", gv);
			
			return VIEW_PAGE;
		} else {
			
			ICodeService service = CodeServiceImpl.getInstance();
			
			CodeVO cv = new CodeVO();
			cv.setGroupCode(req.getParameter("groupCode"));
			cv.setCode(req.getParameter("code"));
			cv.setCodeName(req.getParameter("codeName"));
			service.insertCode(cv);
			
			return req.getContextPath() + "/code/allList.do";
		}
	}

}
