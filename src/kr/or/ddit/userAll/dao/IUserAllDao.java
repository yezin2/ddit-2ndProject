package kr.or.ddit.userAll.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.userAll.vo.UserAllVO;

/**
 * 실제 DB와 연결해서 SQL문을 수행하여 결과를 작성한다.
 * @author 유은지
 *
 */
public interface IUserAllDao {
	
	/**
	 * 로그인 시도 시 회원 ID와 회원 PW에 일치하는 회원이 존재하는지 여부를 알아내는 메서드
	 * @param smc SqlMapClient 객체
	 * @param userAllVo 공통 유저정보 자료가 저장된 UserAllVO 객체
	 * @return 하나의 회원 정보
	 * @throws SQLException JDBC 관련 예외 객체 발생
	 */
	public UserAllVO checkLoginUserAll(SqlMapClient smc, UserAllVO userAllVo) throws SQLException;
	
	/**
	 * 주어진 ID가 존재하는지 여부를 알아내는 메서드
	 * @param smc SqlMapClient 객체
	 * @param userId 회원 ID
	 * @return 회원이 존재하면 1, 존재하지 않으면 0
	 * @throws SQLException JDBC관련 예외객체 발생
	 */
	public int checkIdUserAll(SqlMapClient smc, String userId) throws SQLException;
	
	/**
	 * UserAllVO 객체에 담겨진 자료를 DB에 insert하는 메서드
	 * @param smc SqlMapClient 객체
	 * @param userAllVo DB에 insert할 자료가 저장된 UserAllVO 객체 
	 * @return DB 작업이 성공하면 1이상의 값이 반환되고, 실패하면 0이 반환된다.
	 * @throws SQLException JDBC관련 예외객체 발생
	 */
	public int insertUserAll(SqlMapClient smc, UserAllVO userAllVo) throws SQLException;
	
	/**
	 * 전체 레코드를 가져와서 List에 담아 반환하는 메서드
	 * @param smc SqlMapClient 객체
	 * @return 회원 정보를 담고있는 List 객체
	 * @throws SQLException JDBC관련 예외객체 발생
	 */
	public List<UserAllVO> getAllUserAllList(SqlMapClient smc) throws SQLException;
	
	/**
	 * 하나의 회원정보를 이용하여 DB를 update하는 메서드
	 * @param smc SqlMapClient 객체
	 * @param userAllVo UserAllVO 객체 
	 * @return 작업성공 : 1, 작업실패 : 0
	 * @throws SQLException JDBC관련 예외객체 발생
	 */
	public int updateUserAll(SqlMapClient smc, UserAllVO userAllVo) throws SQLException;
	
	
	/**
	 * 회원ID를 매개변수로 받아서 그 회원정보를 삭제하는 메서드
	 * @param smc SqlMapClient 객체
	 * @param userId 삭제할 회원ID
	 * @return 작업성공 : 1, 작업 실패 : 0
	 * @throws SQLException JDBC관련 예외객체 발생
	 */
	public int deleteUserAll(SqlMapClient smc, String userId) throws SQLException;
	
	/**
	 * UserAllVO 에 담긴 자료를 이용하여 회원을 검색하는 메서드
	 * @param smc SqlMapClient 객체
	 * @param userAllVo 검색할 자료가 들어있는 UserAllVO 객체
	 * @return 검색 결과를 담은 List
	 * @throws SQLException JDBC관련 예외객체 발생
	 */
	public List<UserAllVO> getSearchUserAll(SqlMapClient smc, UserAllVO userAllVo) throws SQLException;
}
