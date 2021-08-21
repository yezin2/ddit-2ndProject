package kr.or.ddit.userAll.handler;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.userAll.service.IUserAllService;
import kr.or.ddit.userAll.service.UserAllServiceImpl;
import kr.or.ddit.userAll.vo.UserAllVO;

public class ListUserAllHandler implements CommandHandler {
	private static final String VIEW_PAGE = "/WEB-INF/view/userAll/listUserAll.jsp";

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		List<UserAllVO> userAllList = new ArrayList<UserAllVO>();
		
		IUserAllService userAllService = UserAllServiceImpl.getInstance();
		userAllList = userAllService.getAllUserAllList();
		
		req.setAttribute("userAllList", userAllList);
		
		return VIEW_PAGE;
	}
}
