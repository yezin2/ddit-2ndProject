package kr.or.ddit.comment.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comment.service.CommentServiceImpl;
import kr.or.ddit.comment.service.ICommentService;
import kr.or.ddit.comment.vo.CommentVO;
import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.qna.service.IQnABoardService;
import kr.or.ddit.qna.service.QnABoardServiceImpl;
import kr.or.ddit.qna.vo.QnABoardVO;
	

public class InsertCommentHandler implements CommandHandler{
	
//	private static final String VIEW_PAGE = "#";
	
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
			
			// 새 댓글 담을 객체
			CommentVO cv = new CommentVO();

			// 서비스
			ICommentService service = CommentServiceImpl.getInstance();
			// 게시글 번호
			long boardSeq = Long.parseLong(req.getParameter("boardSeq"));
			String code = req.getParameter("code");
			
			cv.setCode(req.getParameter("code"));
			cv.setUserId(req.getParameter("userId"));
			cv.setReplyContent(req.getParameter("replyContent"));
			cv.setBoardSeq(boardSeq);
			
			service.insertComment(cv);
			
			// URL 통합 필요 (게시판코드로)
			String redirectUrl = req.getContextPath() + "/" + code + "/select.do?boardSeq=" + boardSeq;
			
//			String redirectUrl = req.getContextPath() + "/commBoard/select.do?boardSeq=" + boardSeq;
			return redirectUrl;
			
		}
	}
}
