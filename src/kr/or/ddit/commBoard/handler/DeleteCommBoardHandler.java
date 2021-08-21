package kr.or.ddit.commBoard.handler;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commBoard.service.CommBoardServiceImpl;
import kr.or.ddit.commBoard.service.ICommBoardService;
import kr.or.ddit.commBoard.vo.CommBoardVO;
import kr.or.ddit.common.handler.CommandHandler;

public class DeleteCommBoardHandler implements CommandHandler{
	
	private static final String VIEW_PAGE = "/WEB-INF/view/commBoard/delete.jsp";
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
			return true;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		long boardSeq = Long.parseLong(req.getParameter("boardSeq"));
		
		//2.삭제처리
		ICommBoardService boardService = CommBoardServiceImpl.getInstance();
		
		int cnt = boardService.deleteBoard(boardSeq);
		
		String msg = "";
		
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		// 4. 목록 조회화면으로 이동
		String redirectUrl = req.getContextPath() +
				"/commBoard/main.do?msg=" + URLEncoder.encode(msg, "UTF-8");
//		resp.sendRedirect(redirectUrl); 나중에 핸들러에서 뷰로 보내줄 것.
		
		return redirectUrl;
	}

	
}
