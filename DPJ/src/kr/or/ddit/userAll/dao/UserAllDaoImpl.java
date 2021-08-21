package kr.or.ddit.userAll.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.userAll.vo.UserAllVO;

public class UserAllDaoImpl implements IUserAllDao{
	
	// 로그 객체 생성
	private static final Logger RESULT_LOGGER = Logger.getLogger(UserAllDaoImpl.class); // 최종 결과에 대한 로거
	
	// 필요한 객체 생성
	private static IUserAllDao userAllDao;
	private UserAllDaoImpl() {}
	
	public static IUserAllDao getInstance() {
		if(userAllDao == null) { userAllDao = new UserAllDaoImpl(); }
		return userAllDao;
	}
	
	@Override
	public UserAllVO checkLoginUserAll(SqlMapClient smc, UserAllVO userAllVo) throws SQLException {
		userAllVo = (UserAllVO) smc.queryForObject("userall.checkLoginUserAll", userAllVo); 
		
		return userAllVo;
	}
	
	@Override
	public int checkIdUserAll(SqlMapClient smc, String userId) throws SQLException {
		System.out.println(userId);
		int cnt = (int) smc.queryForObject("userall.checkIdUserAll", userId);
		RESULT_LOGGER.info("■■■ DAO [0:자료없음] : " + cnt);
		return cnt;
	}

	@Override
	public int insertUserAll(SqlMapClient smc, UserAllVO userAllVo) throws SQLException {
		int cnt = 0;
		Object obj = smc.insert("userall.insertUserAll", userAllVo);
		if(obj == null) { cnt = 1; }; // 데이터 삽입 성공
		RESULT_LOGGER.info("■■■ DAO [0:삽입 실패] : " + cnt);
		return cnt;
	}

	@Override
	public List<UserAllVO> getAllUserAllList(SqlMapClient smc) throws SQLException {
		List<UserAllVO> userAllList = smc.queryForList("userall.selectUserAllListAll");
		RESULT_LOGGER.info("■■■ DAO [목록 수] : " + userAllList.size());
		return userAllList;
	}

	@Override
	public int updateUserAll(SqlMapClient smc, UserAllVO userAllVo) throws SQLException {
		int cnt = 0;
		cnt = smc.update("userall.updateUserAll", userAllVo);
		RESULT_LOGGER.info("■■■ DAO [0:수정실패] : " + cnt);
		return cnt;
	}

	@Override
	public int deleteUserAll(SqlMapClient smc, String userId) throws SQLException {
		int cnt = 0;
		cnt = smc.delete("userall.deleteUserAll", userId);
		RESULT_LOGGER.info("■■■ DAO [0:삭제실패] : " + cnt);
		return cnt;
	}

	@Override
	public List<UserAllVO> getSearchUserAll(SqlMapClient smc, UserAllVO userAllVo) throws SQLException {
		List<UserAllVO> userAllList = smc.queryForList("userall.getSearchUserAll", userAllVo);
		RESULT_LOGGER.info("■■■ DAO [가져온 목록 수] : " + userAllList.size());
		
		return userAllList;
	}
	
	
}
