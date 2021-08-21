package kr.or.ddit.event.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

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

public class InsertEventHandler implements CommandHandler{
	
	private static final String VIEW_PAGE = "/WEB-INF/view/eventBoard/insertEvent.jsp";
	
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
			FileItem item = ((FileUploadRequestWrapper)req).getFileItem("atchFileId") == null ? null
					:((FileUploadRequestWrapper)req).getFileItem("atchFileId");
			
			AtchFileVO atchFileVO = new AtchFileVO();
			if(item != null) {
				IAtchFileService fileService = AtchFileServiceImpl.getInstance();
				atchFileVO = fileService.saveAtchFile(item); // AtchFile 넣음
			}
			
			IEventService eventService = EventServiceImpl.getInstance();
			
			EventVO event = new EventVO();
			BeanUtils.populate(event, req.getParameterMap());
			event.setAtchFileId(atchFileVO.getAtchFileId());
			
			eventService.insertEvent(event);
			
			String redirectUrl = req.getContextPath() + "/eventBoard/list.do";
			
			return redirectUrl;
		}
	}

}
