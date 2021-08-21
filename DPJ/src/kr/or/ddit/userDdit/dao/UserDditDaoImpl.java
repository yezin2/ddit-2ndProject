package kr.or.ddit.userDdit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.userAll.vo.UserAllVO;
import kr.or.ddit.userDdit.vo.UserDditVO;

public class UserDditDaoImpl implements IUserDditDao {
	// 로그 객체 생성
	private static final Logger RESULT_LOGGER = Logger.getLogger(UserDditDaoImpl.class); // 최종 결과에 대한 로거

	// 필요한 객체 생성
	private static IUserDditDao userDditDao;
	private UserDditDaoImpl() {}
	
	public static IUserDditDao getInstance() {
		if(userDditDao == null) { userDditDao = new UserDditDaoImpl(); }
		return userDditDao;
	}
	
	@Override
	public int checkMailUserDdit(SqlMapClient smc, String dditMail) throws SQLException {
		int cnt = (int) smc.queryForObject("userddit.checkMailUserDdit", dditMail);
		RESULT_LOGGER.info("■■■ DAO [0:자료없음] : " + cnt);
		return cnt;
	} 

	@Override
	public int insertUserDdit(SqlMapClient smc, UserDditVO userDditVo) throws SQLException {
		int cnt = 0;
		Object obj = smc.insert("userddit.insertUserDdit", userDditVo);
		if(obj == null) { cnt = 1; }; // 데이터 삽입 성공
		RESULT_LOGGER.info("■■■ DAO [0:삽입 실패] : " + cnt);
		return cnt;
	}

	@Override
	public List<UserDditVO> getAllUserDditList(SqlMapClient smc) throws SQLException {
		List<UserDditVO> userDditList = smc.queryForList("userddit.selectUserDditListAll");
		RESULT_LOGGER.info("■■■ DAO [목록 수] : " + userDditList.size());
		return userDditList;
	}

	@Override
	public int updateUserDdit(SqlMapClient smc, UserDditVO userDditVo) throws SQLException {
		int cnt = 0;
		cnt = smc.update("userddit.updateUserDdit", userDditVo);
		if(cnt<0) {
			RESULT_LOGGER.info("■■■ DAO [-1:수정실패] : " + cnt);
		}else {
			RESULT_LOGGER.info("■■■ DAO [1:성공] : " + cnt);
		}
		return cnt;
	}

	@Override
	public int deleteUserDdit(SqlMapClient smc, String userId) throws SQLException {
		int cnt = 0;
		cnt = smc.delete("userddit.deleteUserDdit", userId);
		RESULT_LOGGER.info("■■■ DAO [0:삭제실패] : " + cnt);
		return cnt;
	}

	@Override
	public List<UserDditVO> getSearchUserDdit(SqlMapClient smc, UserDditVO userDditVo) throws SQLException {
		List<UserDditVO> userDDITList = smc.queryForList("userddit.getSearchUserDdit", userDditVo);
		RESULT_LOGGER.info("■■■ DAO [가져온 목록 수] : " + userDDITList.size());
		
		return userDDITList;
	}


	@Override
	public UserDditVO getUserDdit(SqlMapClient smc, String userId) throws SQLException {
		UserDditVO userDdit = (UserDditVO) smc.queryForObject("userddit.getUserDdit", userId);
		
		return userDdit;
	}
}
