package kr.or.ddit.qna.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comment.service.CommentServiceImpl;
import kr.or.ddit.comment.service.ICommentService;
import kr.or.ddit.comment.vo.CommentVO;
import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.common.service.AtchFileServiceImpl;
import kr.or.ddit.common.service.IAtchFileService;
import kr.or.ddit.common.vo.AtchFileVO;
import kr.or.ddit.qna.service.IQnABoardService;
import kr.or.ddit.qna.service.QnABoardServiceImpl;
import kr.or.ddit.qna.vo.QnABoardVO;

public class GetQnABoardHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/WEB-INF/view/qnaBoard/selectQnA.jsp";
	@Override
	public boolean isRedirect(HttpServletRequest req) {
			return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		// 서비스
		IQnABoardService qnaService = QnABoardServiceImpl.getInstance();
		ICommentService commentService = CommentServiceImpl.getInstance();

		// 특정 게시글
		Long boardSeq = Long.parseLong(req.getParameter("boardSeq"));
		QnABoardVO qna = qnaService.selectQnABoard(boardSeq);
		req.setAttribute("qnaVO", qna);

		// 댓글 목록
		CommentVO commentVO = new CommentVO();
		commentVO.setCode("QNA");
		commentVO.setBoardSeq(boardSeq);
		
		// 댓글 수?
		req.setAttribute("cnt", commentService.getCommentCount(commentVO));
		
		// 댓글 목록 세팅
		req.setAttribute("commentList", commentService.getCommentList(commentVO));

		return VIEW_PAGE;
	}

}
