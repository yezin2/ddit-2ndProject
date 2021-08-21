package kr.or.ddit.mypage.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.mypage.service.IMyPageService;
import kr.or.ddit.mypage.service.MyPageServiceImpl;
import kr.or.ddit.partyBoard.vo.PartyBoardVO;

public class MyPagePartyBoardHandler implements CommandHandler {
	private static final String VIEW_PAGE = "/WEB-INF/view/myPage/myPagePartyBoard.jsp";

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession(true); // 세션 가져오기
		String userId = (String) session.getAttribute("USERID");
		
		// VO 객체 생성
		PartyBoardVO partyBoardVo = new PartyBoardVO();
		partyBoardVo.setUserId(userId);
		
		// 서비스 객체 생성하기
		IMyPageService myPageService = MyPageServiceImpl.getInstance();
		
		// 파티 게시글 목록 조회
		List<PartyBoardVO> partyBoardList = myPageService.getAllMyPagePartyBoard(partyBoardVo);
		
		req.setAttribute("partyBoardList", partyBoardList);
		
		return VIEW_PAGE;
	}
}
