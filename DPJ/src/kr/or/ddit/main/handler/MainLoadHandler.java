package kr.or.ddit.main.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.event.service.EventServiceImpl;
import kr.or.ddit.event.service.IEventService;
import kr.or.ddit.event.vo.EventVO;
import kr.or.ddit.restInfo.vo.RestInfoVO;

public class MainLoadHandler implements CommandHandler {
	private static final String VIEW_PAGE = "/WEB-INF/view/login/main.jsp";
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		/** 회원 세션이 존재하는지 확인 */
		HttpSession session = req.getSession(true); // 세션 생성
		String visitFlag = ""; // true : 기존 방문 이력이 있음, false : 방문 이력이 없음
		
		if(session.isNew()) { // 새로 만든 세션이라면 
			visitFlag = "FALSE";
			System.out.println("★★★★★"+visitFlag);
		} else {
			visitFlag = "TRUE";
			System.out.println("★★★★★★"+visitFlag);
		}
		
		session.setAttribute("VISITFLAG", visitFlag);
		
		IEventService eventService = EventServiceImpl.getInstance();
		List<RestInfoVO> restList = eventService.getRestInfo();
		List<EventVO> eventList = eventService.getAllEvent();
		
		req.setAttribute("eventList", eventList);
		req.setAttribute("restList", restList);
		return VIEW_PAGE;
	}

}
