package kr.or.ddit.adminBoard.handler;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.adminBoard.service.AdminBoardServiceImpl;
import kr.or.ddit.adminBoard.service.IAdminBoardService;
import kr.or.ddit.adminBoard.vo.AdminBoardVO;
import kr.or.ddit.common.handler.CommandHandler;

public class UpdateAdminBoardHandler implements CommandHandler{
	private static String VIEW_PAGE_UP = "";
	private static String VIEW_PAGE_GA = "req.getContextPath()";
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		String firstURI = req.getRequestURI();
		String secondURI[] = firstURI.split("/", 4);
		String thirdURI[] = secondURI[3].split("\\.");
		String finalURI = thirdURI[0].substring(0, 3);
		
		String code = "";
		if("not".equals(finalURI)) {
			VIEW_PAGE_UP = "/WEB-INF/view/adminBoard/noticeUpdate.jsp";
			code = "NOTICE";
		}else if("faq".equals(finalURI)){
			VIEW_PAGE_UP = "/WEB-INF/view/adminBoard/faqUpdate.jsp";
			code = "FAQ";
		}
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
			VIEW_PAGE_UP = "/WEB-INF/view/adminBoard/noticeUpdate.jsp";
			VIEW_PAGE_GA = req.getContextPath() + "/adminBoard/noticeGet.do?boardSeq=";
			code = "NOTICE";
		}else if("faq".equals(finalURI)){
			VIEW_PAGE_UP = "/WEB-INF/view/adminBoard/faqUpdate.jsp";
			VIEW_PAGE_GA = req.getContextPath() + "/adminBoard/faqGet.do?boardSeq=";
			code = "FAQ";
		}
		if(req.getMethod().equals("GET")) { // GET 방식인 경우 redirect를 하지 않는다.
			long boardSeq = Long.parseLong(req.getParameter("boardSeq"));
//			String boardTitle = req.getParameter("boardTitle");
//			String boardContent = req.getParameter("boardContent");
			
			//서비스 객체 생성
			IAdminBoardService adminBoardService = AdminBoardServiceImpl.getInstance();
			
			AdminBoardVO abv = adminBoardService.getAdminBoard(boardSeq);
			System.out.println("getAdminBoard(boardSeq)>>>>>" + abv);
			//정보등록
			req.setAttribute("adminBoardVO", abv);
			return VIEW_PAGE_UP;
		}else { // POST 방식인 경우
			
			//요청 파라미터 정보 가져오기
			long boardSeq = Long.parseLong(req.getParameter("boardSeq"));
			String userId = req.getParameter("userId");
			String boardTitle = req.getParameter("boardTitle");
			String boardContent = req.getParameter("boardContent");
			String boardDelete = req.getParameter("boardDelete");
			System.out.println("boardDelete>>>>" + boardDelete);
			
			//서비스 객체 생성
			IAdminBoardService adminBoardService = AdminBoardServiceImpl.getInstance();
			
			//게시글 등록하기
			AdminBoardVO abv = new AdminBoardVO();
			abv.setBoardSeq(boardSeq);
			abv.setUserId(userId);
			abv.setBoardTitle(boardTitle);
			abv.setBoardContent(boardContent);
			abv.setBoardDelete(boardDelete);
//			abv.setAtchFileId(atchFileId);
			
			int cnt = adminBoardService.updateAdminBoard(abv);
			
			String msg = "";
			if(cnt > 0) {
				msg = "성공";
			}else {
				msg = "실패";
			}
			
			VIEW_PAGE_GA += boardSeq;
			//목록조회 화면으로 이동
			return VIEW_PAGE_GA;
		}
	}

}
