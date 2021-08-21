package kr.or.ddit.adminBoard.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.adminBoard.service.AdminBoardServiceImpl;
import kr.or.ddit.adminBoard.service.IAdminBoardService;
import kr.or.ddit.adminBoard.vo.AdminBoardVO;
import kr.or.ddit.common.handler.CommandHandler;

public class MainGetAllAdminBoardListHandler implements CommandHandler{

	private static String VIEW_PAGE = "";

	
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		String firstURI = req.getRequestURI();
		String secondURI[] = firstURI.split("/", 4);
		String thirdURI[] = secondURI[3].split("\\.");
		String finalURI = thirdURI[0].substring(0, 3);
		
		String code = "";
		if("not".equals(finalURI)) {
			VIEW_PAGE = "/WEB-INF/view/adminBoardMain/noticeGetAll.jsp";
			code = "NOTICE";
		}else if("faq".equals(finalURI)){
			VIEW_PAGE = "/WEB-INF/view/adminBoardMain/faqGetAll.jsp";
			code = "FAQ";
		}
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String firstURI = req.getRequestURI();
		String secondURI[] = firstURI.split("/", 4);
		String thirdURI[] = secondURI[3].split("\\.");
		String finalURI = thirdURI[0].substring(0, 3);
		
		String code = "";
		if("not".equals(finalURI)) {
			VIEW_PAGE = "/WEB-INF/view/adminBoardMain/noticeGetAll.jsp";
			code = "NOTICE";
		}else if("faq".equals(finalURI)){
			VIEW_PAGE = "/WEB-INF/view/adminBoardMain/faqGetAll.jsp";
			code = "FAQ";
		}

		//1. 서비스 객체 생성
		IAdminBoardService boardService = AdminBoardServiceImpl.getInstance();
		
		AdminBoardVO sabv = new AdminBoardVO();
		if(req.getParameter("boardTitle") != null) {
			String boardTitle = req.getParameter("boardTitle");
			sabv.setBoardTitle(boardTitle);
		}else if(req.getParameter("userId") != null) {
			String userId = req.getParameter("userId");
			sabv.setBoardTitle(userId);
		}
		sabv.setBoardDelete("N");//삭제 안된 글만 보여줌
		sabv.setCode(code);
		
		//2. 게시글 정보 조회
		List<AdminBoardVO> boardList = boardService.getAllAdminBoardList(sabv);
//		List<AdminBoardVO> boardList = boardService.getAllAdminBoardList(code);
		
		req.setAttribute("boardList", boardList);
		req.setAttribute("code", code);
		return VIEW_PAGE;
	}
}
