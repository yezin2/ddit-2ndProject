package kr.or.ddit.restInfo.handler;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.menu.service.IMenuService;
import kr.or.ddit.menu.service.MenuServiceImpl;
import kr.or.ddit.menu.vo.MenuVO;

public class ListSearchRestHandler implements CommandHandler {
	private static final String VIEW_PAGE = "/WEB-INF/view/restaurant/restaurantList.jsp";

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String searchType = req.getParameter("searchType");
		System.out.println("searchType : " + searchType);
		
		if("menu".equals(searchType)) {
			String menuPrice = req.getParameter("menuPrice"); // 5000, 6000, 7000, 8000, 9000, 10000이상
			String restDistance = req.getParameter("restDistance"); // 3분 5분 10분 15분
			String restType = req.getParameter("restType"); // 한식, 양식, 중식, 일식
			
			System.out.println(menuPrice);
			System.out.println(restDistance);
			System.out.println(restType);
			
			// 파라미터 가져오기
			List<MenuVO> menuList = new ArrayList<MenuVO>();
			
			// vo 생성 후 가격, 거리, 타입 값 삽입
			MenuVO menuVo = new MenuVO();
			
			menuVo.setMenuPrice(menuPrice);
			menuVo.setRestDistance(restDistance);
			if("1".equals(restType)) {
				menuVo.setRestType("한식");
			} else if ("2".equals(restType)) {
				menuVo.setRestType("양식");
			} else if ("3".equals(restType)) {
				menuVo.setRestType("중식");
			} else if ("4".equals(restType)) {
				menuVo.setRestType("일식");
			}
			
			// 서비스 생성
			IMenuService menuService = MenuServiceImpl.getInstance();
			menuList = menuService.getSearchMenuRestInfo(menuVo);
			
			req.setAttribute("menuList", menuList);
		} else if ("name".equals(searchType)) {
			System.out.println("TEST");
			String restName = req.getParameter("inputrestName");
			
			System.out.println("restName!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			System.out.println(restName);
			
			// 파라미터 가져오기
			List<MenuVO> menuList = new ArrayList<MenuVO>();
			
			// 서비스 생성
			IMenuService menuService = MenuServiceImpl.getInstance();
			menuList = menuService.getSearchNameRestInfo(restName);
			req.setAttribute("menuList", menuList);
		}
		return VIEW_PAGE; 
	}

}
