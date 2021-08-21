package kr.or.ddit.partyBoard.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.partyBoard.service.IPartyBoardService;
import kr.or.ddit.partyBoard.service.PartyBoardServiceImpl;
import kr.or.ddit.partyBoard.vo.PartyBoardVO;
import kr.or.ddit.partyJoin.service.IPartyJoinService;
import kr.or.ddit.partyJoin.service.PartyJoinServiceImpl;
import kr.or.ddit.partyJoin.vo.PartyJoinVO;
import kr.or.ddit.restInfo.service.IRestInfoService;
import kr.or.ddit.restInfo.service.RestInfoServiceImpl;
import kr.or.ddit.restInfo.vo.RestInfoVO;

public class GetPartyBoardListHandler implements CommandHandler {
	
	private static final String VIEW_PAGE = "/WEB-INF/view/partyBoard/mealPartyMain.jsp"; // 임시
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		IPartyBoardService service = PartyBoardServiceImpl.getInstance();
		List<PartyBoardVO> list = service.getPartyBoardList();
		req.setAttribute("list", list);
		
		
		
		return VIEW_PAGE;
	}
	
	
}
