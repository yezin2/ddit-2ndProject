package kr.or.ddit.commBoard.handler;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.commBoard.service.CommBoardServiceImpl;
import kr.or.ddit.commBoard.service.ICommBoardService;
import kr.or.ddit.commBoard.vo.CommBoardVO;
import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.common.service.AtchFileServiceImpl;
import kr.or.ddit.common.service.IAtchFileService;
import kr.or.ddit.common.vo.AtchFileVO;
import kr.or.ddit.util.FileUploadRequestWrapper;

public class InsertCommBoardHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/WEB-INF/view/commBoard/insertForm.jsp";
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equals("GET")) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		if(req.getMethod().equals("GET"))	{
			return VIEW_PAGE;
		}else {
			
			FileItem item = ((FileUploadRequestWrapper) req).getFileItem("atchFileId")
					==null?null:((FileUploadRequestWrapper)req).getFileItem("atchFileId");
			
			AtchFileVO atchFileVO = new AtchFileVO();
			if(item != null) {
				IAtchFileService fileService = AtchFileServiceImpl.getInstance();//?
				atchFileVO = fileService.saveAtchFile(item);
			
			}
			//요청 파라미터 가져오기.? sql에서 주는건?
			String code = req.getParameter("code");
			String userId = req.getParameter("userId");
			String boardTitle = req.getParameter("boardTitle");
			String boardContent = req.getParameter("boardContent");
			
			ICommBoardService boardService = CommBoardServiceImpl.getInstance();
			
			CommBoardVO cv = new CommBoardVO();
			cv.setAtchFileId(atchFileVO.getAtchFileId());
			cv.setBoardContent(boardContent);
			cv.setBoardTitle(boardTitle);
			cv.setCode(code);
			cv.setUserId(userId);
			
			int cnt = boardService.insertBoard(cv);
			
			String msg = "";
			
			if(cnt > 0) {
				msg = "성공";
			}else {
				msg = "실패";
			}
			
			String redirectUrl = req.getContextPath() + "/commBoard/main.do?msg" + URLEncoder.encode(msg, "UTF-8");
			
			return redirectUrl;
		}
		
	}

}
