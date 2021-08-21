package kr.or.ddit.commBoard.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commBoard.service.CommBoardServiceImpl;
import kr.or.ddit.commBoard.service.ICommBoardService;
import kr.or.ddit.commBoard.vo.CommBoardVO;
import kr.or.ddit.comment.service.CommentServiceImpl;
import kr.or.ddit.comment.service.ICommentService;
import kr.or.ddit.comment.vo.CommentVO;
import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.common.service.AtchFileServiceImpl;
import kr.or.ddit.common.service.IAtchFileService;
import kr.or.ddit.common.vo.AtchFileVO;

public class GetCommBoardHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/WEB-INF/view/commBoard/boardSelectForm.jsp";

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		// 게시글 번호 가져오기
		Long boardSeq= Long.parseLong(req.getParameter("boardSeq"));
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		System.out.println(boardSeq);
		// 서비스 호출
		ICommBoardService boardService = CommBoardServiceImpl.getInstance();
		ICommentService commentService = CommentServiceImpl.getInstance();
		
		// 게시글 출력
		CommBoardVO cv= boardService.getBoard(boardSeq);
		req.setAttribute("boardVO", cv);
		req.setAttribute("cnt", 0);
		
		// 댓글 출력
		CommentVO ccv = new CommentVO();
		ccv.setCode("DEV");
		ccv.setBoardSeq(boardSeq);
		req.setAttribute("commentList", commentService.getCommentList(ccv));
		
		// 댓글 수
		req.setAttribute("commentCnt", commentService.getCommentCount(ccv));
		
		return VIEW_PAGE;
	}
	
	
	
	
}
