package kr.or.ddit.mypage.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.restInfo.service.IRestInfoService;
import kr.or.ddit.restInfo.service.RestInfoServiceImpl;
import kr.or.ddit.restInfo.vo.RestFavVO;
import kr.or.ddit.restInfo.vo.RestInfoVO;

public class MyDipsHandler implements CommandHandler{
	private static final String VIEW_PAGE = "/WEB-INF/view/myPage/myDips.jsp";

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession(true); // 세션 가져오기
		String userId = (String) session.getAttribute("USERID");
		
		//vo생성
		RestFavVO rfv = new RestFavVO();
		rfv.setUserId(userId);
		
		//서비스 생성
		IRestInfoService restService = RestInfoServiceImpl.getInstance();
		
		//목록조회
		List<RestInfoVO> favInfoList = restService.getRestInfoAboutUser(userId);
		
		req.setAttribute("favInfoList", favInfoList);
		return VIEW_PAGE;
	}

}
