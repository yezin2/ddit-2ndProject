package kr.or.ddit.event.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.common.service.AtchFileServiceImpl;
import kr.or.ddit.common.service.IAtchFileService;
import kr.or.ddit.common.vo.AtchFileVO;
import kr.or.ddit.event.service.EventServiceImpl;
import kr.or.ddit.event.service.IEventService;
import kr.or.ddit.event.vo.EventVO;
import kr.or.ddit.restInfo.vo.RestInfoVO;

public class SelectEventHandler implements CommandHandler{
	private static final String VIEW_PAGE = "/WEB-INF/view/eventBoard/selectEvent.jsp";

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		long boardSeq = Long.parseLong(req.getParameter("boardSeq"));
		IEventService eventService = EventServiceImpl.getInstance();
		
		EventVO event = eventService.selectEvent(boardSeq);
		
		RestInfoVO rest = eventService.selectRest(event.getUserId());
		req.setAttribute("restVO", rest);
		req.setAttribute("eventVO", event);
		return VIEW_PAGE;
	}
}