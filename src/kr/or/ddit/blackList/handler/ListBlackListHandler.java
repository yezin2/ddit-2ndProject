package kr.or.ddit.blackList.handler;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import kr.or.ddit.blackList.service.BlackListServiceImpl;
import kr.or.ddit.blackList.service.IBlackListService;
import kr.or.ddit.blackList.vo.BlackListVO;
import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.userDdit.dao.UserDditDaoImpl;

public class ListBlackListHandler implements CommandHandler{
	private static final String VIEW_PAGE = "/WEB-INF/view/blackList/listBlackList.jsp";

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// 데이터 담을 VO 생성
		List<BlackListVO> blackListList = new ArrayList<BlackListVO>();
		
		// 서비스 생성
		IBlackListService blackListService = BlackListServiceImpl.getInstance();
		blackListList = blackListService.getAllBlackListList();
		
		// req 객체에 담음
		req.setAttribute("blackListList", blackListList);
		
		return VIEW_PAGE;
	}
}
