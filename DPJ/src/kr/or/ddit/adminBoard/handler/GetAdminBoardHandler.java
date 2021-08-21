package kr.or.ddit.adminBoard.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.adminBoard.service.AdminBoardServiceImpl;
import kr.or.ddit.adminBoard.service.IAdminBoardService;
import kr.or.ddit.adminBoard.vo.AdminBoardVO;
import kr.or.ddit.common.handler.CommandHandler;

public class GetAdminBoardHandler implements CommandHandler{
	private static String VIEW_PAGE = "";
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		
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
			VIEW_PAGE = "/WEB-INF/view/adminBoard/noticeGet.jsp";
			code = "NOTICE";
		}else if("faq".equals(finalURI)){
			VIEW_PAGE = "/WEB-INF/view/adminBoard/faqGet.jsp";
			code = "FAQ";
		}
		long boardSeq = Long.parseLong(req.getParameter("boardSeq"));//사용자 정보를 화면에 뿌려주기 위함
		
		
		
		//회원 정보 조회
		IAdminBoardService boardService = AdminBoardServiceImpl.getInstance();
		
		AdminBoardVO abv = boardService.getAdminBoard(boardSeq);
		
//		if(mv.getAtchFileId() > 0) { //첨부파일 존재하면...
//			//첨부파일 정보 조회
//			AtchFileVO fileVO = new AtchFileVO();
//			fileVO.setAtchFileId(mv.getAtchFileId());
//			
//			IAtchFileService atchFileService = AtchFileServiceImpl.getInstance();
//			List<AtchFileVO> atchFileList = atchFileService.getAtchFileList(fileVO);
//			
//			req.setAttribute("atchFileList", atchFileList);
//			
//		}
		
		req.setAttribute("adminBoardVO", abv);
		return VIEW_PAGE;
	}
}
