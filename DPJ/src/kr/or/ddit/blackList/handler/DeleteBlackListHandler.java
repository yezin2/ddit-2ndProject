package kr.or.ddit.blackList.handler;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.blackList.service.BlackListServiceImpl;
import kr.or.ddit.blackList.service.IBlackListService;
import kr.or.ddit.common.handler.CommandHandler;

public class DeleteBlackListHandler implements CommandHandler {
	
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return true;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String userId = req.getParameter("userId");
		
		IBlackListService blackListService = BlackListServiceImpl.getInstance();
		int cnt = blackListService.deleteBlackList(userId);
		
		String msg = "";
		
		if(cnt > 0) {
			msg = "success";
		} else {
			msg = "failure";
		}
		
		// 화면 이동
		String redirectUrl = req.getContextPath()
				+ "/blackList/listBlackList.do?msg="
				+ URLEncoder.encode(msg, "UTF-8");

		return redirectUrl;
	}

}
