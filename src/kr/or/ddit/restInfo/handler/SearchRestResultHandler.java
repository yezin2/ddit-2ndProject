package kr.or.ddit.restInfo.handler;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.restInfo.service.IRestInfoService;
import kr.or.ddit.restInfo.service.RestInfoServiceImpl;
import kr.or.ddit.restInfo.vo.RestInfoVO;

public class SearchRestResultHandler implements CommandHandler {
	private static final String VIEW_PAGE = "/WEB-INF/view/restaurant/restaurantresult2.jsp";

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String searchType = req.getParameter("searchType");
		System.out.println("searchType : " + searchType);
		
		if("street".equals(searchType)) {
			String btnNum = req.getParameter("btnNum");
			
			if("1".equals(btnNum)) { // 거리 : 3분
				// 파라미터 가져오기
				List<RestInfoVO> restInfoList = new ArrayList<RestInfoVO>();
				
				// vo 생성 후 거리 값 삽입
				RestInfoVO restInfoVo = new RestInfoVO();
				restInfoVo.setRestDistance(btnNum);
				
				// 서비스 생성
				IRestInfoService restInfoService = RestInfoServiceImpl.getInstance();
				restInfoList = restInfoService.getSearchRestInfo(restInfoVo);
				
				req.setAttribute("restInfoList", restInfoList);
				
			} else if("2".equals(btnNum)) { // 거리 : 5분
				
			} else if("3".equals(btnNum)) { // 거리 : 10분
				
			} else if("4".equals(btnNum)) { // 거리 : 15분
				
			}
		}
//		
//		// 공통화 서비스로 빼야함. (가격, 거리, 분류)
//		
//		// 가격은 식당정보와 메뉴이름이 동시에
//		
//		// 거리는 식당정보만(중복 제외)
//		
//		// 분류는 식당 정보만(중복 제외)
//		
//		// 해당하는 애들은 PrintWrite한 뒤 화면단에서 테이블 생성
//		
//		// 해당하는 식당 버튼 클릭 시 id를 담아 호 ( onclick="location.href=''")
//		
//		// 식당 상세는 info
//		
		return VIEW_PAGE; 
	}

}
