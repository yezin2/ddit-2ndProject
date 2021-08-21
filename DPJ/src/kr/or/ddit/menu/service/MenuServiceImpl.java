package kr.or.ddit.menu.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.menu.dao.IMenuDao;
import kr.or.ddit.menu.dao.MenuDaoImpl;
import kr.or.ddit.menu.vo.MenuVO;
import kr.or.ddit.restInfo.vo.RestInfoVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class MenuServiceImpl implements IMenuService {

	// 로그 객체 생성
	private static final Logger RESULT_LOGGER = Logger.getLogger(MenuServiceImpl.class); // 최종 결과에 대한 로거
	
	// 필요한 객체 생성
	private IMenuDao menuDao;
	private SqlMapClient smc;
	private static IMenuService menuService;
	
	// 생성자 호출
	private MenuServiceImpl() {
		menuDao = MenuDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static IMenuService getInstance() {
		if(menuService == null) { menuService = new MenuServiceImpl(); }
		return menuService;
	}
	
	@Override
	public List<MenuVO> getSearchMenuRestInfo(MenuVO menuVo) {
		List<MenuVO> menuList = null;
		try {
			menuList = menuDao.getSearchMenuRestInfo(smc, menuVo);
		} catch (SQLException ex) { ex.printStackTrace(); }
		RESULT_LOGGER.info("■■■ Service [목록 수] : " + menuList.size());
		return menuList;
	}

	@Override
	public List<MenuVO> getSearchNameRestInfo(String restName) {
		RESULT_LOGGER.info("■■■ restName [값] : " + restName);
		List<MenuVO> menuList = null;
		try {
			menuList = menuDao.getSearchNameRestInfo(smc, restName);
		} catch (SQLException ex) { ex.printStackTrace(); }
		RESULT_LOGGER.info("■■■ Service [목록 수] : " + menuList.size());
		return menuList;
	}
	

}
