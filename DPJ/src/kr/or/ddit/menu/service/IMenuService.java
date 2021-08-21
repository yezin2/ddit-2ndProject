package kr.or.ddit.menu.service;

import java.util.List;

import kr.or.ddit.menu.vo.MenuVO;

public interface IMenuService {

	
	/**
	 * MenuVO에 담긴 자료를 이용하여 회원을 검색하는 메서드
	 * @param menuVo 검색할 자료가 있는 MenuVO 객체
	 * @return 검색 결과를 담은 List
	 */
	public List<MenuVO> getSearchMenuRestInfo(MenuVO menuVo);
	
	/**
	 * 식당 이름을 이용하여 메뉴를 검색하는 메서드
	 * @param restName 식당 이름
	 * @return 검색 결과를 담은 List
	 */
	public List<MenuVO> getSearchNameRestInfo(String restName);
}
