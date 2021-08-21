package kr.or.ddit.commBoard.handler;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.commBoard.service.CommBoardServiceImpl;
import kr.or.ddit.commBoard.service.ICommBoardService;
import kr.or.ddit.commBoard.vo.CommBoardVO;
import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.common.service.AtchFileServiceImpl;
import kr.or.ddit.common.service.IAtchFileService;
import kr.or.ddit.common.vo.AtchFileVO;
import kr.or.ddit.util.FileUploadRequestWrapper;

public class UpdateCommBoardHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/WEB-INF/view/commBoard/updateForm.jsp";

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equals("GET")){
			return false;
		}else {
			return true;
		}
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		if(req.getMethod().equals("GET")) {
			long boardSeq = Long.parseLong(req.getParameter("boardSeq"));
			System.out.println("boardSeq : " + boardSeq);
			
			ICommBoardService service = CommBoardServiceImpl.getInstance();
			
			CommBoardVO cv = service.getBoard(boardSeq);
			
			if(cv.getAtchFileId() > 0) {

				AtchFileVO fileVO = new AtchFileVO();
				fileVO.setAtchFileId(cv.getAtchFileId());
				
				IAtchFileService atchFileService= AtchFileServiceImpl.getInstance();
				List<AtchFileVO> atchFileList = atchFileService.getAtchFileList(fileVO);
				
				req.setAttribute("atchFileList", atchFileList);
				
			}
			req.setAttribute("CommBoardVO", cv);
			
			return VIEW_PAGE;
					
		}else { //post방식인 경우는 언제 쓰나? = 실제 수정작업을 할 때.
			
			//FileItem 추출
			FileItem item = ((FileUploadRequestWrapper)req).getFileItem("atchFile");
			
			AtchFileVO atchFileVO = new AtchFileVO();
			
			//기존 첨부파일 아이디 정보 가져오기
			atchFileVO.setAtchFileId(req.getParameter
					("atchFile") == null ? -1: Long.parseLong(req.getParameter("atchFile")));
			
			if(item != null && !item.getName().equals("")) {
				
				IAtchFileService fileService = AtchFileServiceImpl.getInstance();
				atchFileVO = fileService.saveAtchFile(item); //첨부파일 저장 
			}
			
			Long boardSeq = Long.parseLong(req.getParameter("boardSeq"));
			String userId = req.getParameter("userId");
			String boardTitle = req.getParameter("boardTitle");
			String boardContent = req.getParameter("boardContent");
			String code = req.getParameter("code");
			// 2. 서비스 객체 생성하기
			ICommBoardService boardService = CommBoardServiceImpl.getInstance();
			
			// 3. 회원정보 등록하기
			CommBoardVO cv = new CommBoardVO();
			cv.setCode(code);
			cv.setBoardSeq(boardSeq);
			cv.setUserId(userId);
			cv.setBoardTitle(boardTitle);
			cv.setBoardContent(boardContent);
			cv.setAtchFileId(atchFileVO.getAtchFileId());
			
			int cnt = boardService.updateBoard(cv);
			
			String msg = "";
			
			if(cnt > 0) {
				msg = "성공";
			}else {
				msg = "실패";
			}
			
			// 4. 목록 조회화면으로 이동
			String redirectUrl = req.getContextPath() +
					"/" + code +"/select.do?boardSeq="+ boardSeq;
			
			return redirectUrl;
		}
	
	
	}
	
	
	
	
}
