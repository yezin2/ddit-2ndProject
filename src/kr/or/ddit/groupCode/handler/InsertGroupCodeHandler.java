package kr.or.ddit.groupCode.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.groupCode.service.GroupCodeInfoServiceImpl;
import kr.or.ddit.groupCode.service.IGroupCodeInfoService;
import kr.or.ddit.groupCode.vo.GroupCodeInfoVO;

public class InsertGroupCodeHandler implements CommandHandler {
	
	private static final String VIEW_PAGE = "/WEB-INF/view/code/groupCodeInsert.jsp";

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
			return VIEW_PAGE;
		} else {
			
			GroupCodeInfoVO gv = new GroupCodeInfoVO();
			IGroupCodeInfoService service = GroupCodeInfoServiceImpl.getInstance();
			
			gv.setGroupCode(req.getParameter("groupCode"));
			gv.setGroupCodeName(req.getParameter("groupCodeName"));
			gv.setUseYn(req.getParameter("useYn"));
			
			int cnt = service.insertGroupCode(gv);
			
			String msg = "";
			if(cnt > 0) {
				msg = "성공";
			} else {
				msg = "실패";
			}
			
			req.setAttribute("msg", msg);

			return req.getContextPath() + "/group/list.do";
			
		}
	}
}
