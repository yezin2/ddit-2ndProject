package kr.or.ddit.comment.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commBoard.service.ICommBoardService;
import kr.or.ddit.comment.service.CommentServiceImpl;
import kr.or.ddit.comment.service.ICommentService;
import kr.or.ddit.comment.vo.CommentVO;
import kr.or.ddit.common.handler.CommandHandler;

public class GetAllCommentListHandler implements CommandHandler {

	private static final String VIEW_PAGE = "/WEB-INF/view/admin/comment/allCommentList.jsp";
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ICommentService service = CommentServiceImpl.getInstance();
		List<CommentVO> cv = service.getAllCommentList();
		req.setAttribute("list", cv);
		
		return VIEW_PAGE;
	}
	
}
