package kr.or.ddit.qna.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.common.service.AtchFileServiceImpl;
import kr.or.ddit.common.service.IAtchFileService;
import kr.or.ddit.common.vo.AtchFileVO;
import kr.or.ddit.qna.service.IQnABoardService;
import kr.or.ddit.qna.service.QnABoardServiceImpl;
import kr.or.ddit.qna.vo.QnABoardVO;
import kr.or.ddit.util.FileUploadRequestWrapper;

public class AdminInsertQnAHandler implements CommandHandler{
	
	private static final String VIEW_PAGE = "/WEB-INF/view/adminBoard/qnaInsert.jsp";
	
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
		if(req.getMethod().equals("GET")) {
			return VIEW_PAGE;
		}else {
			FileItem item = ((FileUploadRequestWrapper)req).getFileItem("atchFileId")
					==null?null:((FileUploadRequestWrapper)req).getFileItem("atchFileId");
			
			AtchFileVO atchFileVO = new AtchFileVO();
			if(item != null) {
				IAtchFileService fileService = AtchFileServiceImpl.getInstance();
				atchFileVO = fileService.saveAtchFile(item); // AtchFile 넣음
			}
			
			String userId = req.getParameter("userId");				//ID
			String boardType = req.getParameter("boardType");		//유형
			String boardTitle = req.getParameter("boardTitle");		//제목
			String boardContent = req.getParameter("boardContent");	//내용
			String boardSecret = req.getParameter("boardSecret");	//비공개
			String boardPw = req.getParameter("boardPw");			//글비밀번호
			
			IQnABoardService qnaService = QnABoardServiceImpl.getInstance();
			
			QnABoardVO qna = new QnABoardVO();
			qna.setUserId(userId);
			qna.setBoardType(boardType);
			qna.setBoardTitle(boardTitle);
			qna.setBoardContent(boardContent);
			qna.setBoardSecret(boardSecret);
			qna.setBoardPw(boardPw);
			qna.setAtchFileId(atchFileVO.getAtchFileId());
			
			qnaService.insertQnABoard(qna);
			
			String redirectUrl = req.getContextPath() + "/adminBoard/qnaGetAll.do";
			
			return redirectUrl;
		}
	}

}
