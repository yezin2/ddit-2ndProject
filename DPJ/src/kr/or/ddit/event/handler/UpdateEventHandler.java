package kr.or.ddit.event.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.common.service.AtchFileServiceImpl;
import kr.or.ddit.common.service.IAtchFileService;
import kr.or.ddit.common.vo.AtchFileVO;
import kr.or.ddit.event.service.EventServiceImpl;
import kr.or.ddit.event.service.IEventService;
import kr.or.ddit.event.vo.EventVO;
import kr.or.ddit.util.FileUploadRequestWrapper;

public class UpdateEventHandler implements CommandHandler{
	private static final String VIEW_PAGE = "/WEB-INF/view/eventBoard/updateEvent.jsp";
	
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
			long boardSeq = Long.parseLong(req.getParameter("boardSeq"));
			
			IEventService eventService = EventServiceImpl.getInstance();
			EventVO event= eventService.getEvent(boardSeq);
			
			if(event.getAtchFileId() > 0) { //첨부파일이 존재하면
		         //첨부파일 정보 조회
		         AtchFileVO fileVO = new AtchFileVO();
		         fileVO.setAtchFileId(event.getAtchFileId());
		         
		         IAtchFileService atchFileService= AtchFileServiceImpl.getInstance();
		         List<AtchFileVO> atchFileList = atchFileService.getAtchFileList(fileVO);
		         
		         req.setAttribute("atchFileList", atchFileList);
		      }
			
			req.setAttribute("eventVO", event);
			return VIEW_PAGE;
		}else {
			// FileItem 추출
			FileItem item = ((FileUploadRequestWrapper)req).getFileItem("atchFile");
			
			AtchFileVO atchFileVO = new AtchFileVO();
			
			// 기존의 첨부파일아이디 정보 가져오기
			atchFileVO.setAtchFileId(req.getParameter("atchFile") == null ? -1
					: Long.parseLong(req.getParameter("atchFile")));
			
			if(item != null && item.getName().equals("")) {
				IAtchFileService fileService = AtchFileServiceImpl.getInstance();
				atchFileVO = fileService.saveAtchFile(item);	// 첨부파일 저장
			}
						
			Long boardSeq = Long.parseLong(req.getParameter("boardSeq"));
			
			IEventService eventService = EventServiceImpl.getInstance();
			
			EventVO event = new EventVO();
			BeanUtils.populate(event, req.getParameterMap());
			event.setAtchFileId(atchFileVO.getAtchFileId());
			
			eventService.updateEvent(event);
			
			String redirectUrl = req.getContextPath() + "/eventBoard/select.do?boardSeq=" + boardSeq;
			
			return redirectUrl;
		}
	}

}
