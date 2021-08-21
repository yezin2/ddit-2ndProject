package kr.or.ddit.restInfo.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.restInfo.vo.RestFavVO;
import kr.or.ddit.restInfo.vo.RestInfoVO;

/**
 * 실제 DB와 연결해서 SQL문을 수행하여 결과를 작성한다.
 * @author 유은지
 * insert 는 생성하지 않음. userAll에서부터 자식 관계로 있음 
 */
public interface IRestInfoDao {
	
	/**
	 * 전체 레코드를 가져와서 List에 담아 반환하는 메서드
	 * @param smc SqlMapClient 객체
	 * @return 회원 정보를 담고있는 List 객체
	 * @throws SQLException JDBC관련 예외 객체
	 */
	public List<RestInfoVO> getAllRestInfoList(SqlMapClient smc) throws SQLException;
	
	/**
	 * 하나의 정보를 이용하여 DB를 update하는 메서드
	 * @param smc SqlMapClient 객체
	 * @param restInfoVo RestInfoVO 객체
	 * @return 작업성공 : 1, 작업실패 : 0
	 * @throws SQLException JDBC 관련 예외객체 발생
	 */
	public int updateRestInfo(SqlMapClient smc, RestInfoVO restInfoVo) throws SQLException;
	
	/**
	 * RestInfoVO에 담긴 자료를 이용하여 회원을 검색하는 메서드
	 * @param smc SqlMapClient 객체
	 * @param restInfoVo 검색할 자료가 있는 RestInfoVO 객체
	 * @return 검색 결과를 담은 List
	 * @throws SQLException
	 */
	public List<RestInfoVO> getSearchRestInfo(SqlMapClient smc, RestInfoVO restInfoVo) throws SQLException;

	/**
	 * restcode를 이용하여 rest정보를 가져오는 메서드
	 * @param smc
	 * @param restCode
	 * @return 검색결과를 담은 VO
	 * @throws SQLException
	 */
	public RestInfoVO getRest(SqlMapClient smc, String restCode) throws SQLException;
	
	/*************************************************************************************************************/
	
	/**
	 * restcode를 이용해 찜한 회원수를 count(int)로 가져오는 메서드
	 * @param smc
	 * @param restCode
	 * @return 검색결과 : count(int)
	 * @throws SQLException
	 */
	public int getUserAboutRest(SqlMapClient smc, String restCode) throws SQLException;
	
	/**
	 * userId를 이용해 해당 유저가 찜한 식당의 코드를 가져오는 메서드
	 * @param smc
	 * @param userId
	 * @return 검색결과 : List<RestFavVO>
	 * @throws SQLException
	 */
	public List<RestFavVO> getRestAboutUser(SqlMapClient smc, String userId) throws SQLException;
	
	/**
	 * userId를 이용해 해당 유저가 찜한 식당의 정보를 가져오는 메서드
	 * @param smc
	 * @param userId
	 * @return 검색결과 : List<RestFavVO>
	 * @throws SQLException
	 */
	public List<RestInfoVO> getRestInfoAboutUser(SqlMapClient smc, String userId) throws SQLException;
	
	/**
	 * 찜한 정보(userId와 restCode)를 db에 저장하는 메서드
	 * @param smc
	 * @param rfv
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 * @throws SQLException
	 */
	public int insertDips(SqlMapClient smc, RestFavVO rfv) throws SQLException;
	
	/**
	 * 찜한 정보(userId와 restCode)를 db에서 삭제하는 메서드
	 * @param smc
	 * @param rfv
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 * @throws SQLException
	 */
	public int deleteDips(SqlMapClient smc, RestFavVO rfv) throws SQLException;
}
