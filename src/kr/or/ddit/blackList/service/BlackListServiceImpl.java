package kr.or.ddit.blackList.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.blackList.dao.BlackListDaoImpl;
import kr.or.ddit.blackList.dao.IBlackListDao;
import kr.or.ddit.blackList.vo.BlackListVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class BlackListServiceImpl implements IBlackListService {

	// 로그 객체 생성
	private static final Logger RESULT_LOGGER = Logger.getLogger(BlackListServiceImpl.class); // 최종 결과에 대한 로거
	
	// 필요한 객체 생성
	private IBlackListDao blackListDao;
	private SqlMapClient smc;
	private static IBlackListService blackListService;
	
	private BlackListServiceImpl() { // 생성자 호출
		blackListDao = BlackListDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static IBlackListService getInstance() { // 싱글톤 패턴
		if(blackListService == null) { blackListService = new BlackListServiceImpl(); }
		return blackListService;
	}
	
	@Override
	public int insertBlackList(BlackListVO blackListVo) {
		int cnt = 0;
		try {
			cnt = blackListDao.insertBlackList(smc, blackListVo);
		} catch (SQLException ex) { ex.printStackTrace(); }
		RESULT_LOGGER.info("■■■ Service [0:삽입 실패] : " + cnt);
		return cnt;
	}
	
	public List<BlackListVO> getAllBlackListList() {
		List<BlackListVO> blackListList = null;
		try {
			blackListList = blackListDao.getAllBlackListList(smc);
		} catch (SQLException ex) { ex.printStackTrace(); }
		RESULT_LOGGER.info("■■■ Service [목록 수] : " + blackListList.size());
		return blackListList;
	}

	@Override
	public int deleteBlackList(String userId) {
		int cnt = 0;
		try {
			cnt = blackListDao.deleteBlackList(smc, userId);
		} catch (SQLException ex) { ex.printStackTrace(); }
		RESULT_LOGGER.info("■■■ Service [0:삽입 실패] : " + cnt);
		return cnt;
	}

}
