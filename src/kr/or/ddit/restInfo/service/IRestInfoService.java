package kr.or.ddit.restInfo.service;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.restInfo.vo.RestFavVO;
import kr.or.ddit.restInfo.vo.RestInfoVO;

/**
 * 회원 정보 처리를 수행하는 서비스
 * @author 유은지
 *
 */
public interface IRestInfoService {
	
	/**
	 * 전체 레코드를 가져와서 List에 담아 반환하는 메서드
	 * @return 회원 정보를 담고있는 List 객체
	 */
	public List<RestInfoVO> getAllRestInfoList();
	
	/**
	 * 하나의 회원 정보를 이용하여 DB를 update 하는 메서드
	 * @param restInfoVo RestInfoVO 객체
	 * @return 작업성공 : 1, 작업 실패 : 0
	 */
	public int updateRestInfo(RestInfoVO restInfoVo);
	
	/**
	 * RestInfoVO에 담긴 자료를 이용하여 회원을 검색하는 메서드
	 * @param restInfoVo 검색할 자료가 들어있는 RestInfoVO 객체
	 * @return 검색 결과를 담은 List
	 */
	public List<RestInfoVO> getSearchRestInfo(RestInfoVO restInfoVo);
	
	/**
	 * restCode를 이용해서 RestInfoVO를 가져오는 메서드
	 * @param restCode
	 * @return
	 */
	public RestInfoVO getRest(String restCode);
	
/*************************************************************************************************************/
	
	/**
	 * restcode를 이용해 찜한 회원수를 count(int)로 가져오는 메서드
	 * @param restCode
	 * @return 검색결과 : count(int)
	 */
	public int getUserAboutRest(String restCode);
	
	/**
	 * userId를 이용해 해당 유저가 찜한 식당의 코드를 가져오는 메서드
	 * @param userId
	 * @return 검색결과 : List<RestFavVO>
	 */
	public List<RestFavVO> getRestAboutUser(String userId);
	
	/**
	 * userId를 이용해 해당 유저가 찜한 식당의 코드로 식당정보를 가져오는 메서드
	 * @param userId
	 * @return 검색결과 : List<RestFavVO>
	 */
	public List<RestInfoVO> getRestInfoAboutUser(String userId);
	
	/**
	 * 찜한 정보(userId와 restCode)를 db에 저장하는 메서드
	 * @param rfv
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int insertDips(RestFavVO rfv);
	
	/**
	 * 찜한 정보(userId와 restCode)를 db에서 삭제하는 메서드
	 * @param rfv
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int deleteDips(RestFavVO rfv);
	
}
