package kr.or.ddit.review.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.common.service.AtchFileServiceImpl;
import kr.or.ddit.common.service.IAtchFileService;
import kr.or.ddit.common.vo.AtchFileVO;
import kr.or.ddit.review.service.IReviewService;
import kr.or.ddit.review.service.ReviewServiceImpl;
import kr.or.ddit.review.vo.ReviewVO;
import kr.or.ddit.util.FileUploadRequestWrapper;

public class UpdateReviewHandler implements CommandHandler{
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return true;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
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
		
		IReviewService reviewService = ReviewServiceImpl.getInstance();
		
		ReviewVO review = new ReviewVO();
		BeanUtils.populate(review, req.getParameterMap());
		
		String restCode = req.getParameter("restCode");
		String userId = req.getParameter("userId");
		reviewService.updateReview(review);
		String redirectUrl = req.getContextPath() + "/searchRest/detailRest.do?restCode=" + restCode + "&userId=" + userId;
		return redirectUrl;
	}
	
}
