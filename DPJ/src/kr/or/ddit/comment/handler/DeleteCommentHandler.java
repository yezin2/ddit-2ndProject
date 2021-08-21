package kr.or.ddit.comment.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Request;

import kr.or.ddit.comment.service.CommentServiceImpl;
import kr.or.ddit.comment.service.ICommentService;
import kr.or.ddit.common.handler.CommandHandler;

public class DeleteCommentHandler implements CommandHandler {

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equals("GET")) { 
			return true;
		}else { 
			return true;
		}
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(req.getMethod().equals("GET")) { // GET 방식인 경우 redirect를 하지 않는다.
			return null;

		}else { 
			long replySeq = Long.parseLong(req.getParameter("replySeq"));
			long boardSeq = Long.parseLong(req.getParameter("boardSeq"));
			String code = req.getParameter("code");
			
			ICommentService service = CommentServiceImpl.getInstance();
			service.deleteComment(replySeq);
			
			// 세션가져오기
			String userId = (String) req.getSession().getAttribute("USERID");
			
			// 세션에 따라 VIEW 달라짐
//			String redirectUrl = "";
//			if("admin2".equals(userId)) {
//				redirectUrl = req.getContextPath() + "/comment/allList.do";
//			} else {
//				redirectUrl = req.getContextPath() + "/qnaBoard/select.do?boardSeq=" + boardSeq;
//			}
			
			String redirectUrl = req.getContextPath() + "/" + code + "/select.do?boardSeq=" + boardSeq;
			
			return redirectUrl;
		}
	}
}
