package kr.or.ddit.blackList.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.blackList.vo.BlackListVO;
import kr.or.ddit.userAll.dao.IUserAllDao;
import kr.or.ddit.userAll.dao.UserAllDaoImpl;
import kr.or.ddit.userAll.vo.UserAllVO;

public class BlackListDaoImpl implements IBlackListDao {
	
	// 로그 객체 생성
	private static final Logger RESULT_LOGGER = Logger.getLogger(BlackListDaoImpl.class); // 최종 결과에 대한 로거
	
	// 필요한 객체 생성
	private static IBlackListDao blackListDao;
	private BlackListDaoImpl() {}
	
	public static IBlackListDao getInstance() {
		if(blackListDao == null) { blackListDao = new BlackListDaoImpl(); }
		return blackListDao;
	}

	@Override
	public int insertBlackList(SqlMapClient smc, BlackListVO blackListVo) throws SQLException {
		int cnt = 0;
		Object obj = smc.insert("blacklist.insertBlackList", blackListVo);
		if(obj == null) { cnt = 1; }; // 데이터 삽입 성공
		RESULT_LOGGER.info("■■■ DAO [0:삽입 실패] : " + cnt);
		return cnt;
	}
	
	@Override
	public List<BlackListVO> getAllBlackListList(SqlMapClient smc) throws SQLException {
		List<BlackListVO> blackListList = smc.queryForList("blacklist.getAllBlackListList");
		RESULT_LOGGER.info("■■■ DAO [목록 수] : " + blackListList.size());
		return blackListList;
	}

	@Override
	public int deleteBlackList(SqlMapClient smc, String userId) throws SQLException {
		int cnt = 0;
		cnt = smc.delete("blacklist.deleteBlackList", userId);
		RESULT_LOGGER.info("■■■ DAO [0:삭제실패] : " + cnt);
		return cnt;
	}

}
