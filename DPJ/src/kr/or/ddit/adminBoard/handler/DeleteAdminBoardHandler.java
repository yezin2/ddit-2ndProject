package kr.or.ddit.adminBoard.handler;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.adminBoard.service.AdminBoardServiceImpl;
import kr.or.ddit.adminBoard.service.IAdminBoardService;
import kr.or.ddit.adminBoard.vo.AdminBoardVO;
import kr.or.ddit.common.handler.CommandHandler;

public class DeleteAdminBoardHandler implements CommandHandler{

	private static String VIEW_PAGE_de = "";
	private static String VIEW_PAGE_ga = "";
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equals("GET")) { // GET 방식인 경우 redirect를 하지 않는다.
			return false;
		}else { // POST 방식인 경우
			return true;
		}
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String firstURI = req.getRequestURI();
		String secondURI[] = firstURI.split("/", 4);
		String thirdURI[] = secondURI[3].split("\\.");
		String finalURI = thirdURI[0].substring(0, 3);
		
		String code = "";
		if("not".equals(finalURI)) {
			VIEW_PAGE_de = "/WEB-INF/view/adminBoard/noticeGetAll.jsp";
			VIEW_PAGE_ga = req.getContextPath() + "/adminBoard/noticeGetAll.do";
			code = "NOTICE";
		}else if("faq".equals(finalURI)){
			VIEW_PAGE_de = "/WEB-INF/view/adminBoard/faqGetAll.jsp";
			VIEW_PAGE_ga = req.getContextPath() + "/adminBoard/faqGetAll.do";
			code = "FAQ";
		}
		if(req.getMethod().equals("GET")) { // GET 방식인 경우 redirect를 하지 않는다.
			return VIEW_PAGE_de;
		}else { // POST 방식인 경우
			//1. 요청 파라미터 정보 가져오기
			long boardSeq = Long.parseLong(req.getParameter("boardSeq"));
			
			//2.서비스 객체 생성
			IAdminBoardService boardService = AdminBoardServiceImpl.getInstance();
			
			//3. 정보 등록
			
			int cnt = boardService.deleteAdminBoard(boardSeq);
			
			return VIEW_PAGE_ga;
		}
	}

}
