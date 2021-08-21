package kr.or.ddit.blackList.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.blackList.vo.BlackListVO;

/**
 * 실제 DB와 연결해서 SQL문을 수행하여 결과를 작성한다.
 * @author 유은지
 * 추가, 삭제
 */
public interface IBlackListDao {

	/**
	 * BlackListVO 객체에 담겨진 자료를 DB에 insert하는 메서드
	 * @param smc  SqlMapClient 객체
	 * @param blackListVo blackListVo DB에 insert할 자료가 저장된 BlackListVO 객체
	 * @return 작업성공 : 1, 작업실패 : 0
	 * @throws SQLException JDBC관련 예외객체 발생
	 */
	public int insertBlackList(SqlMapClient smc, BlackListVO blackListVo) throws SQLException;
	
	/**
	 * 전체 레코드를 가져와서 List에 담아 반환하는 메서드
	 * @param smc SqlMapClient 객체
	 * @return 회원 정보를 담고있는 List 객체
	 * @throws SQLException JDBC관련 예외객체 발생
	 */
	public List<BlackListVO> getAllBlackListList(SqlMapClient smc) throws SQLException;
	
	/**
	 * 회원ID를 매개변수로 받아서 그 블랙리스트 정보를 삭제하는 메서드
	 * @param smc SqlMapClient 객체
	 * @param userId 삭제할 회원ID
	 * @return 작업성공 : 1, 작업 실패 : 0
	 * @throws SQLException JDBC관련 예외객체 발생
	 */
	public int deleteBlackList(SqlMapClient smc, String userId) throws SQLException;
}
