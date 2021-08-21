package kr.or.ddit.groupCode.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.groupCode.service.GroupCodeInfoServiceImpl;
import kr.or.ddit.groupCode.service.IGroupCodeInfoService;

public class DeleteGroupCodeListHandler implements CommandHandler{

//	private static final String VIEW_PAGE = "";

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equals("GET")) { // GET 방식인 경우 redirect를 하지 않는다.
			return true;
		}else { // POST 방식인 경우
			return true;
		}
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(req.getMethod().equals("GET")) { // GET 방식인 경우 redirect를 하지 않는다.
			return req.getContextPath() + "/group/list.do";

		}else { // POST 방식인 경우
			//1. 요청 파라미터 정보 가져오기
			String groupCode = req.getParameter("groupCode");

			//2.서비스 객체 생성
			IGroupCodeInfoService groupCodeInfoService  = GroupCodeInfoServiceImpl.getInstance();

			//3. 정보 등록
			int cnt = groupCodeInfoService.deleteGroupCode(groupCode);

			String msg = "";
			if(cnt > 0) {
				msg = "성공";
			} else {
				msg = "실패";
			}

			// 메시지 넣기
			req.setAttribute("msg", msg);

			return req.getContextPath() + "/group/list.do";
//			String redirectUrl = req.getContextPath() + "/member/list.do?msg=" + URLEncoder.encode(msg, "UTF-8");
//			return redirectUrl;

		}
	}
}
