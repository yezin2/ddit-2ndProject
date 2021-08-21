package kr.or.ddit.partyBoard.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.common.service.AtchFileServiceImpl;
import kr.or.ddit.common.service.IAtchFileService;
import kr.or.ddit.common.vo.AtchFileVO;
import kr.or.ddit.partyBoard.service.IPartyBoardService;
import kr.or.ddit.partyBoard.service.PartyBoardServiceImpl;
import kr.or.ddit.partyBoard.vo.PartyBoardVO;
import kr.or.ddit.partyJoin.service.IPartyJoinService;
import kr.or.ddit.partyJoin.service.PartyJoinServiceImpl;
import kr.or.ddit.partyJoin.vo.PartyJoinVO;
import kr.or.ddit.restInfo.dao.IRestInfoDao;
import kr.or.ddit.restInfo.service.IRestInfoService;
import kr.or.ddit.restInfo.service.RestInfoServiceImpl;
import kr.or.ddit.restInfo.vo.RestInfoVO;
import kr.or.ddit.review.service.IReviewService;
import kr.or.ddit.review.service.ReviewServiceImpl;
import kr.or.ddit.review.vo.ReviewVO;
import kr.or.ddit.util.FileUploadRequestWrapper;

public class InsertPartyHandler implements CommandHandler {

	private static final String VIEW_PAGE = "/WEB-INF/view/partyBoard/insertForm.jsp";
	
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
			// 식당 리스트
			IRestInfoService iService = RestInfoServiceImpl.getInstance();
			List<RestInfoVO> rs = iService.getAllRestInfoList();
			req.setAttribute("list", rs);
			
			return VIEW_PAGE;
		}else {
			
			IPartyBoardService service = PartyBoardServiceImpl.getInstance();
			PartyBoardVO pv = new PartyBoardVO();
			
			pv.setCode(req.getParameter("code"));
			pv.setUserId(req.getParameter("userId"));
			pv.setBoardTitle(req.getParameter("boardTitle"));
			pv.setBoardContent(req.getParameter("boardContent"));
			pv.setRestCode(req.getParameter("restCode"));
			pv.setPrice(req.getParameter("price"));
			pv.setDistance(req.getParameter("distance"));
			pv.setPartyEnd(req.getParameter("partyEnd"));
			pv.setRestType(req.getParameter("restType"));
			pv.setUserProfile(req.getParameter("userProfile"));
			
			service.insertPartyBoard(pv);			
			
			
			
			return req.getContextPath() + "/PARTY/main.do";
		}
	}

}
