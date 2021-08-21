package kr.or.ddit.groupCode.handler;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.groupCode.service.GroupCodeInfoServiceImpl;
import kr.or.ddit.groupCode.service.IGroupCodeInfoService;
import kr.or.ddit.groupCode.vo.GroupCodeInfoVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateGroupCodeHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/WEB-INF/view/code/groupCodeUpdate.jsp";

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
			String groupCodeName = req.getParameter("groupCodeName");
			IGroupCodeInfoService service = GroupCodeInfoServiceImpl.getInstance();
			GroupCodeInfoVO gv = service.getGroupCode(groupCode);
			
			req.setAttribute("groupCodeVO", gv);
			
			return VIEW_PAGE;
		} else {
			
			//1. 요청 파라미터 정보 가져오기
			GroupCodeInfoVO groupCodeInfoVO = new GroupCodeInfoVO();
			groupCodeInfoVO.setGroupCode(req.getParameter("groupCode"));
			groupCodeInfoVO.setGroupCodeName(req.getParameter("groupCodeName"));

			//2.서비스 객체 생성
			IGroupCodeInfoService groupCodeInfoService  = GroupCodeInfoServiceImpl.getInstance();

			//3. 정보 등록
			int cnt = groupCodeInfoService.updateGroupCode(groupCodeInfoVO);

			String msg = "";
			if(cnt > 0) {
				msg = "성공";
			} else {
				msg = "실패";
			}

			// 메시지 넣기
			req.setAttribute("msg", msg);

			return req.getContextPath() + "/group/list.do";
		}
	}


}
