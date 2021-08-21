package kr.or.ddit.menu.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.menu.vo.MenuVO;

public interface IMenuDao {
	
	/**
	 * MenuVO에 담긴 자료를 이용하여 메뉴를 검색하는 메서드
	 * @param smc SqlMapClient 객체
	 * @param menuVo 검색할 자료가 있는 MenuVO 객체
	 * @return 검색 결과를 담은 List
	 * @throws SQLException JDBC 관련 예외객체 발생
	 */
	public List<MenuVO> getSearchMenuRestInfo(SqlMapClient smc, MenuVO menuVo) throws SQLException;
	
	/**
	 * 식당 이름을 이용하여 메뉴를 검색하는 메서드
	 * @param smc SqlMapClient 객체
	 * @param menuVo 검색할 자료가 있는 MenuVO 객체
	 * @return 검색 결과를 담은 List
	 * @throws SQLException JDBC 관련 예외객체 발생
	 */
	public List<MenuVO> getSearchNameRestInfo(SqlMapClient smc, String restName) throws SQLException;
}
