package kr.or.ddit.event.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.event.service.EventServiceImpl;
import kr.or.ddit.event.service.IEventService;
import kr.or.ddit.event.vo.EventVO;

public class DeleteEventHandler implements CommandHandler{

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return true;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		IEventService eventService = EventServiceImpl.getInstance();
		Long boardSeq = Long.parseLong(req.getParameter("boardSeq"));
		
		eventService.deleteEvent(boardSeq);
		String redirectUrl = req.getContextPath() + "/eventBoard/list.do";
		return redirectUrl;
	}

}
