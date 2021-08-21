package kr.or.ddit.adminBoard.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.adminBoard.service.AdminBoardServiceImpl;
import kr.or.ddit.adminBoard.service.IAdminBoardService;
import kr.or.ddit.adminBoard.vo.AdminBoardVO;
import kr.or.ddit.common.handler.CommandHandler;

public class GetAllAdminBoardListHandler implements CommandHandler{
	private static String VIEW_PAGE = "";

	
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		String firstURI = req.getRequestURI();
		String secondURI[] = firstURI.split("/", 4);
		String thirdURI[] = secondURI[3].split("\\.");
		String finalURI = thirdURI[0].substring(0, 3);
		
		String code = "";
		if("not".equals(finalURI)) {
			VIEW_PAGE = "/WEB-INF/view/adminBoard/noticeGetAll.jsp";
			code = "NOTICE";
		}else if("faq".equals(finalURI)){
			VIEW_PAGE = "/WEB-INF/view/adminBoard/faqGetAll.jsp";
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
			VIEW_PAGE = "/WEB-INF/view/adminBoard/noticeGetAll.jsp";
			code = "NOTICE";
		}else if("faq".equals(finalURI)){
			VIEW_PAGE = "/WEB-INF/view/adminBoard/faqGetAll.jsp";
			code = "FAQ";
		}
		System.out.println(code);
		
		AdminBoardVO abv = new AdminBoardVO();
		abv.setCode(code);
		//1. 서비스 객체 생성
		IAdminBoardService boardService = AdminBoardServiceImpl.getInstance();
		
		//2. 게시글 정보 조회
		List<AdminBoardVO> boardList = boardService.getAllAdminBoardList(abv);
		
		req.setAttribute("boardList", boardList);
		return VIEW_PAGE;
	}
}
