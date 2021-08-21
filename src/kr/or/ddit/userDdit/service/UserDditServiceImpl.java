package kr.or.ddit.userDdit.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.userAll.vo.UserAllVO;
import kr.or.ddit.userDdit.dao.IUserDditDao;
import kr.or.ddit.userDdit.dao.UserDditDaoImpl;
import kr.or.ddit.userDdit.vo.UserDditVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class UserDditServiceImpl implements IUserDditService{
	
	// 로그 객체 생성
	private static final Logger RESULT_LOGGER = Logger.getLogger(UserDditServiceImpl.class); // 최종 결과에 대한 로거
	
	// 필요한 객체 생성
	private IUserDditDao userDditDao;
	private SqlMapClient smc;
	private static IUserDditService userDditService;
	
	private UserDditServiceImpl() { // 생성자 호출
		userDditDao = UserDditDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static IUserDditService getInstance() { // 싱글톤 패턴
		if(userDditService == null) { userDditService = new UserDditServiceImpl(); }
		return userDditService;
	}
	
	@Override
	public int checkMailUserDdit(String dditMail) {
		int cnt = 0;
		try {
			cnt = userDditDao.checkMailUserDdit(smc, dditMail);
		} catch (SQLException ex) { ex.printStackTrace(); }
		RESULT_LOGGER.info("■■■ Service [0:자료없음] : " + cnt);
		return cnt;
	}

	@Override
	public int insertUserDdit(UserDditVO userDditVo) {
		int cnt = 0;
		try {
			cnt = userDditDao.insertUserDdit(smc, userDditVo);
		} catch (SQLException ex) {ex.printStackTrace(); }
		RESULT_LOGGER.info("■■■ Service [0:삽입 실패] : " + cnt);
		return cnt;
	}

	@Override
	public List<UserDditVO> getAllUserDditList() {
		List<UserDditVO> userDditList = null;
		try {
			userDditList = userDditDao.getAllUserDditList(smc);
		} catch (SQLException ex) { ex.printStackTrace(); }
		RESULT_LOGGER.info("■■■ Service [목록 수] : " + userDditList.size());
		return userDditList;
	}

	@Override
	public int updateUserDdit(UserDditVO userDditVo) {
		int cnt = 0;
		try {
			cnt = userDditDao.updateUserDdit(smc, userDditVo);
		} catch (SQLException ex) { ex.printStackTrace(); }
		RESULT_LOGGER.info("■■■ Service [0:삽입 실패] : " + cnt);
		return cnt;
	}

	@Override
	public int deleteUserDdit(String userId) {
		int cnt = 0;
		try {
			cnt = userDditDao.deleteUserDdit(smc, userId);
		} catch (SQLException ex) { ex.printStackTrace(); }
		RESULT_LOGGER.info("■■■ Service [0:삽입 실패] : " + cnt);
		return cnt;
	}

	@Override
	public List<UserDditVO> getSearchUserDdit(UserDditVO userDditVo) {
		List<UserDditVO> userDditList = null;
		try {
			userDditList = userDditDao.getSearchUserDdit(smc, userDditVo);
		} catch (SQLException ex) { ex.printStackTrace(); }
		return userDditList;
	}
	

	@Override
	public UserDditVO getUserDdit(String userId) {
		UserDditVO userDdit = null;
		try {
			userDdit = userDditDao.getUserDdit(smc, userId);
		} catch (SQLException ex) { ex.printStackTrace(); }
		return userDdit;
	}
}
