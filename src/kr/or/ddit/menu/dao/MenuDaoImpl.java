package kr.or.ddit.menu.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.menu.vo.MenuVO;
import kr.or.ddit.restInfo.dao.RestInfoDaoImpl;

public class MenuDaoImpl implements IMenuDao {
	
	// 로그 객체 생성
	private static final Logger RESULT_LOGGER = Logger.getLogger(MenuDaoImpl.class); // 최종 결과에 대한 로거

	// 필요한 객체 생성
	private static IMenuDao menuDao;
	private MenuDaoImpl() {}
	
	public static IMenuDao getInstance() {
		if(menuDao == null) { menuDao = new MenuDaoImpl(); }
		return menuDao;
	}
	
	@Override
	public List<MenuVO> getSearchMenuRestInfo(SqlMapClient smc, MenuVO menuVo) throws SQLException {
		List<MenuVO> menuList = smc.queryForList("menu.getSearchMenu", menuVo);
		RESULT_LOGGER.info("■■■ DAO [목록 수] : " + menuList.size());
		return menuList;
	}

	@Override
	public List<MenuVO> getSearchNameRestInfo(SqlMapClient smc, String restName) throws SQLException {
		RESULT_LOGGER.info("■■■ restName [값] : " + restName);
		List<MenuVO> menuList = smc.queryForList("menu.getSearchName", restName);
		RESULT_LOGGER.info("■■■ DAO [목록 수] : " + menuList.size());
		return menuList;
	}
	
}
