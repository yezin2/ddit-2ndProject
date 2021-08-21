package kr.or.ddit.partyBoard.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.partyBoard.service.IPartyBoardService;
import kr.or.ddit.partyBoard.service.PartyBoardServiceImpl;
import kr.or.ddit.partyBoard.vo.PartyBoardVO;

public class UpdatePartyHandler implements CommandHandler {
	
	private static final String VIEW_PAGE = "/WEB-INF/view/partyBoard/updateForm.jsp";

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equals("GET")) { 
			return false;
		}else { 
			return true;
		}
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(req.getMethod().equals("GET")) {
			long boardSeq = Long.parseLong(req.getParameter("boardSeq"));
			String userId = req.getParameter("userId");
			IPartyBoardService service = PartyBoardServiceImpl.getInstance();
			PartyBoardVO pv = service.getPartyBoard(boardSeq);
			
			req.setAttribute("partyBoardVO", pv);
			
			return VIEW_PAGE;
		} else {
			PartyBoardVO pv = new PartyBoardVO();
			long boardSeq = Long.parseLong(req.getParameter("boardSeq"));
			pv.setBoardSeq(Long.parseLong(req.getParameter("boardSeq")));
			pv.setUserId(req.getParameter("userId"));
			pv.setBoardTitle(req.getParameter("boardTitle"));
			pv.setBoardContent(req.getParameter("boardContent"));
			pv.setPrice(req.getParameter("price"));
			pv.setDistance(req.getParameter("distance"));
			pv.setRestCode(req.getParameter("restCode"));
			pv.setRestType(req.getParameter("restType"));
			pv.setPartyEnd(req.getParameter("partyEnd"));
			
			IPartyBoardService service = PartyBoardServiceImpl.getInstance();
			
			service.updatePartyBoard(pv);
			
			return req.getContextPath() + "/PARTY/select.do?boardSeq=" + boardSeq;
		}
	}
}
