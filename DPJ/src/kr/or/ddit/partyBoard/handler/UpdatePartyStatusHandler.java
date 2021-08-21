package kr.or.ddit.partyBoard.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.partyBoard.service.IPartyBoardService;
import kr.or.ddit.partyBoard.service.PartyBoardServiceImpl;
import kr.or.ddit.partyBoard.vo.PartyBoardVO;

public class UpdatePartyStatusHandler implements CommandHandler {

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
			return null;
		} else {
			long boardSeq = Long.parseLong(req.getParameter("boardSeq"));
			PartyBoardVO pv = new PartyBoardVO();
			pv.setBoardSeq(Long.parseLong(req.getParameter("boardSeq")));
			
			IPartyBoardService service = PartyBoardServiceImpl.getInstance();
			service.updatePartyStatus(boardSeq);
			
			return req.getContextPath() + "/PARTY/select.do?boardSeq=" + boardSeq;
		}
	}
}
