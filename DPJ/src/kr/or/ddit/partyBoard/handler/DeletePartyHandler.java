package kr.or.ddit.partyBoard.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.partyBoard.service.IPartyBoardService;
import kr.or.ddit.partyBoard.service.PartyBoardServiceImpl;

public class DeletePartyHandler implements CommandHandler {

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equals("GET")) {
			return true;
		}else {
			return true;
		}
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(req.getMethod().equals("GET")) { // GET 방식인 경우 redirect를 하지 않는다.
			return req.getContextPath() + "/PARTY/main.do";

		}else {
			long boardSeq = Long.parseLong(req.getParameter("boardSeq"));
			IPartyBoardService service = PartyBoardServiceImpl.getInstance();
			service.deletePartyBoard(boardSeq);
			
			return req.getContextPath() + "/PARTY/main.do";
		}
	}

}
