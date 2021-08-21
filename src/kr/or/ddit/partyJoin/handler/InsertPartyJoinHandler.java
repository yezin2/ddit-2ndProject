package kr.or.ddit.partyJoin.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.partyJoin.service.IPartyJoinService;
import kr.or.ddit.partyJoin.service.PartyJoinServiceImpl;
import kr.or.ddit.partyJoin.vo.PartyJoinVO;

public class InsertPartyJoinHandler implements CommandHandler {

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equals("GET")) {
			return true;
		} else {
			return true;
		}
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(req.getMethod().equals("GET")) {
			return null;
		} else {
			
			PartyJoinVO pv = new PartyJoinVO();
			IPartyJoinService service = PartyJoinServiceImpl.getInstance();
			
			long boardSeq = Long.parseLong(req.getParameter("boardSeq"));
			String userId = req.getParameter("userId");
			String userPhoto = req.getParameter("userProfile");
			
			pv.setBoardSeq(boardSeq);
			pv.setUserId(userId);
			pv.setUserProfile(userPhoto);
			
			service.insertPartyJoin(pv);
			
			return req.getContextPath() + "/PARTY/select.do?boardSeq=" + boardSeq;
			
			
		}
			
	}

}
