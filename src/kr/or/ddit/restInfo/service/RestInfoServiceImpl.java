 package kr.or.ddit.restInfo.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.restInfo.dao.IRestInfoDao;
import kr.or.ddit.restInfo.dao.RestInfoDaoImpl;
import kr.or.ddit.restInfo.vo.RestFavVO;
import kr.or.ddit.restInfo.vo.RestInfoVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class RestInfoServiceImpl implements IRestInfoService {
	
	// 로그 객체 생성
	private static final Logger RESULT_LOGGER = Logger.getLogger(RestInfoServiceImpl.class); // 최종 결과에 대한 로거
	
	// 필요한 객체 생성
	private IRestInfoDao restInfoDao;
	private SqlMapClient smc;
	private static IRestInfoService restInfoService;
	
	private RestInfoServiceImpl() { // 생성자 호출
		restInfoDao = RestInfoDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static IRestInfoService getInstance() { // 싱글톤 패턴
		if(restInfoService == null) { restInfoService = new RestInfoServiceImpl(); }
		return restInfoService;
	}

	@Override
	public List<RestInfoVO> getAllRestInfoList() {
		List<RestInfoVO> restInfoList = null;
		try {
			restInfoList = restInfoDao.getAllRestInfoList(smc);
		} catch (SQLException ex) { ex.printStackTrace(); }
		RESULT_LOGGER.info("■■■ Service [목록 수] : " + restInfoList.size());
		return restInfoList;
	}

	@Override
	public int updateRestInfo(RestInfoVO restInfoVo) {
		int cnt = 0;
		try {
			cnt = restInfoDao.updateRestInfo(smc, restInfoVo);
		} catch (SQLException ex) { ex.printStackTrace(); }
		RESULT_LOGGER.info("■■■ DAO [0:수정실패] : " + cnt);
		return cnt;
	}

	@Override
	public List<RestInfoVO> getSearchRestInfo(RestInfoVO restInfoVo) {
		List<RestInfoVO> restInfoList = null;
		try {
			restInfoList = restInfoDao.getSearchRestInfo(smc, restInfoVo);
		} catch (SQLException ex) { ex.printStackTrace(); }
		RESULT_LOGGER.info("■■■ Service [목록 수] : " + restInfoList.size());
		return restInfoList;
	}

	@Override
	public RestInfoVO getRest(String restCode) {
		RestInfoVO rv = null;
		
		try {
			rv = restInfoDao.getRest(smc, restCode);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return rv;
	}

	@Override
	public int getUserAboutRest(String restCode) {
		int result = 0;
		try {
			result = restInfoDao.getUserAboutRest(smc, restCode);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<RestFavVO> getRestAboutUser(String userId) {
		List<RestFavVO> favList = null;
		try {
			favList = restInfoDao.getRestAboutUser(smc, userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return favList;
	}

	@Override
	public int insertDips(RestFavVO rfv) {
		int res = 0;
		try {
			res = restInfoDao.insertDips(smc, rfv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int deleteDips(RestFavVO rfv) {
		int res = 0;
		try {
			res = restInfoDao.deleteDips(smc, rfv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<RestInfoVO> getRestInfoAboutUser(String userId) {
		List<RestInfoVO> favInfoList = null;
		try {
			favInfoList = restInfoDao.getRestInfoAboutUser(smc, userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return favInfoList;
	}

}
