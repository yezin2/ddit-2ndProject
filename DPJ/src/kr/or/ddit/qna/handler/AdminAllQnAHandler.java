package kr.or.ddit.qna.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.qna.service.IQnABoardService;
import kr.or.ddit.qna.service.QnABoardServiceImpl;
import kr.or.ddit.qna.vo.QnABoardVO;

public class AdminAllQnAHandler implements CommandHandler{
	
	private static final String VIEW_PAGE = "/WEB-INF/view/adminBoard/qnaGetAll.jsp";
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		IQnABoardService qnaBoardService = QnABoardServiceImpl.getInstance();
		
		List<QnABoardVO> qnaList = qnaBoardService.getAllQnABoard();
		
		req.setAttribute("qnaList", qnaList);
		
		return VIEW_PAGE;
	}
}
