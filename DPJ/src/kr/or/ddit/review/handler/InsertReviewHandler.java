package kr.or.ddit.review.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.common.service.AtchFileServiceImpl;
import kr.or.ddit.common.service.IAtchFileService;
import kr.or.ddit.common.vo.AtchFileVO;
import kr.or.ddit.restInfo.service.IRestInfoService;
import kr.or.ddit.restInfo.service.RestInfoServiceImpl;
import kr.or.ddit.restInfo.vo.RestInfoVO;
import kr.or.ddit.review.service.IReviewService;
import kr.or.ddit.review.service.ReviewServiceImpl;
import kr.or.ddit.review.vo.ReviewVO;
import kr.or.ddit.util.FileUploadRequestWrapper;

public class InsertReviewHandler implements CommandHandler{
	private static final String VIEW_PAGE = "/WEB-INF/view/partyBoard/mealPartyReview.jsp";

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
			
			IRestInfoService restInfoService = RestInfoServiceImpl.getInstance();
			List<RestInfoVO> restList = restInfoService.getAllRestInfoList();
			
			req.setAttribute("restList", restList);
			return VIEW_PAGE;
		}else {
			FileItem item = ((FileUploadRequestWrapper)req).getFileItem("atchFileId") == null ? null
					:((FileUploadRequestWrapper)req).getFileItem("atchFileId");
			
			AtchFileVO atchFileVO = new AtchFileVO();
			if(item != null) {
				IAtchFileService fileService = AtchFileServiceImpl.getInstance();
				atchFileVO = fileService.saveAtchFile(item); // AtchFile 넣음
			}
			
			IReviewService reviewService = ReviewServiceImpl.getInstance();
			
			ReviewVO review = new ReviewVO();
			BeanUtils.populate(review, req.getParameterMap());
			review.setAtchFileId(atchFileVO.getAtchFileId());
			
			reviewService.insertReview(review);
			String restCode = req.getParameter("restCode");
			String userId = req.getParameter("userId");
			String redirectUrl = req.getContextPath() + "/searchRest/detailRest.do?restCode=" + restCode + "&userId=" + userId;
			return redirectUrl;
		}
	}
}
