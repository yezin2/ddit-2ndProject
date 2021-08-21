package kr.or.ddit.userAll.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.userAll.dao.IUserAllDao;
import kr.or.ddit.userAll.dao.UserAllDaoImpl;
import kr.or.ddit.userAll.vo.UserAllVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class UserAllServiceImpl implements IUserAllService {
	
	// 로그 객체 생성
	private static final Logger RESULT_LOGGER = Logger.getLogger(UserAllServiceImpl.class); // 최종 결과에 대한 로거
	
	// 필요한 객체 생성
	private IUserAllDao userAllDao;
	private SqlMapClient smc;
	private static IUserAllService userAllService;
	
	private UserAllServiceImpl() { // 생성자 호출
		userAllDao = UserAllDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static IUserAllService getInstance() { // 싱글톤 패턴
		if(userAllService == null) { userAllService = new UserAllServiceImpl(); }
		return userAllService;
	}
	
	@Override
	public UserAllVO checkLoginUserAll(UserAllVO userAllVo) {
		try {
			userAllVo = userAllDao.checkLoginUserAll(smc, userAllVo);
		} catch (SQLException ex) { ex.printStackTrace(); }
		return userAllVo;
	}

	@Override
	public int checkIdUserAll(String userId) {
		int cnt = 0;
		try {
			cnt = userAllDao.checkIdUserAll(smc, userId);
		} catch (SQLException ex) { ex.printStackTrace(); }
		RESULT_LOGGER.info("■■■ Service [0:자료없음] : " + cnt);
		return cnt;
	}

	@Override
	public int insertUserAll(UserAllVO userAllVo) {
		int cnt = 0;
		try {
			cnt = userAllDao.insertUserAll(smc, userAllVo);
		} catch (SQLException ex) { ex.printStackTrace(); }
		RESULT_LOGGER.info("■■■ Service [0:삽입 실패] : " + cnt);
		return cnt;
	}

	@Override
	public List<UserAllVO> getAllUserAllList() {
		List<UserAllVO> userAllList = null;
		try {
			userAllList = userAllDao.getAllUserAllList(smc);
		} catch (SQLException ex) { ex.printStackTrace(); }
		RESULT_LOGGER.info("■■■ Service [목록 수] : " + userAllList.size());
		return userAllList;
	}

	@Override
	public int updateUserAll(UserAllVO userAllVo) {
		int cnt = 0;
		try {
			cnt = userAllDao.updateUserAll(smc, userAllVo);
		} catch (SQLException ex) { ex.printStackTrace(); }
		RESULT_LOGGER.info("■■■ Service [0:삽입 실패] : " + cnt);
		return cnt;
	}

	@Override
	public int deleteUserAll(String userId) {
		int cnt = 0;
		try {
			cnt = userAllDao.deleteUserAll(smc, userId);
		} catch (SQLException ex) { ex.printStackTrace(); }
		RESULT_LOGGER.info("■■■ Service [0:삽입 실패] : " + cnt);
		return cnt;
	}

	@Override
	public List<UserAllVO> getSearchUserAll(UserAllVO userAllVo) {
		List<UserAllVO> userAllList = null;
		try {
			userAllList = userAllDao.getSearchUserAll(smc, userAllVo);
		} catch (SQLException ex) { ex.printStackTrace(); }
		return userAllList;
	}
}
