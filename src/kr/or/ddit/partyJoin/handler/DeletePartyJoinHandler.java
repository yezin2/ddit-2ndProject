package kr.or.ddit.partyJoin.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.partyJoin.service.IPartyJoinService;
import kr.or.ddit.partyJoin.service.PartyJoinServiceImpl;
import kr.or.ddit.partyJoin.vo.PartyJoinVO;

public class DeletePartyJoinHandler implements CommandHandler {

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
		if(req.getMethod().equals("GET")) {
			return null;

		} else {
			
			long boardSeq = Long.parseLong(req.getParameter("boardSeq"));
			String userId = req.getParameter("userId");
			
			PartyJoinVO pv = new PartyJoinVO();
			pv.setBoardSeq(boardSeq);
			pv.setUserId(userId);
			
			IPartyJoinService service = PartyJoinServiceImpl.getInstance();
			service.deletePartyJoin(pv);
			
			return req.getContextPath() + "/PARTY/select.do?boardSeq=" + boardSeq;
		}
	}
}
