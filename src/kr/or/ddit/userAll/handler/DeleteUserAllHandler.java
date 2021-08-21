package kr.or.ddit.userAll.handler;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.userAll.service.IUserAllService;
import kr.or.ddit.userAll.service.UserAllServiceImpl;

public class DeleteUserAllHandler implements CommandHandler {

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return true;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String userId = req.getParameter("userId");
		
		IUserAllService userAllService = UserAllServiceImpl.getInstance();
		int cnt = userAllService.deleteUserAll(userId);
		
		String msg = "";
		
		if(cnt > 0) {
			msg = "success";
		} else {
			msg = "failure";
		}
		
		// 화면 이동
		String redirectUrl = req.getContextPath()
				+ "/userAll/listUserAllList.do?msg="
				+ URLEncoder.encode(msg, "UTF-8");
		
		return redirectUrl;
	}

}
