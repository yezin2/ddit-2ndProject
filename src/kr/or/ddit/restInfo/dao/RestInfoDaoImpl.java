package kr.or.ddit.restInfo.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.restInfo.vo.RestFavVO;
import kr.or.ddit.restInfo.vo.RestInfoVO;

public class RestInfoDaoImpl implements IRestInfoDao{
	
	// 로그 객체 생성
	private static final Logger RESULT_LOGGER = Logger.getLogger(RestInfoDaoImpl.class); // 최종 결과에 대한 로거
	
	// 필요한 객체 생성
	private static IRestInfoDao restInfoDao;
	private RestInfoDaoImpl() {}
	
	public static IRestInfoDao getInstance() {
		if(restInfoDao == null) { restInfoDao = new RestInfoDaoImpl(); }
		return restInfoDao;
	}

	@Override
	public List<RestInfoVO> getAllRestInfoList(SqlMapClient smc) throws SQLException {
		List<RestInfoVO> restInfoList = smc.queryForList("restinfo.selectRestInfoListAll");
		RESULT_LOGGER.info("■■■ DAO [목록 수] : " + restInfoList.size());
		return restInfoList;
	}

	@Override
	public int updateRestInfo(SqlMapClient smc, RestInfoVO restInfoVo) throws SQLException {
		int cnt = 0;
		cnt = smc.update("restinfo.updateRestInfo", restInfoVo);
		RESULT_LOGGER.info("■■■ DAO [0:수정실패] : " + cnt);
		return cnt;
	}

	@Override
	public List<RestInfoVO> getSearchRestInfo(SqlMapClient smc, RestInfoVO restInfoVo) throws SQLException {
		List<RestInfoVO> restInfoList = smc.queryForList("restinfo.getSearchRestInfo", restInfoVo);
		RESULT_LOGGER.info("■■■ DAO [목록 수] : " + restInfoList.size());
		return restInfoList;
	}

	//식당 하나 디테일 들어갈 것.
	@Override
	public RestInfoVO getRest(SqlMapClient smc, String restCode) throws SQLException {
		RestInfoVO rv = (RestInfoVO)smc.queryForObject("restinfo.getRest", restCode);
		return rv;
	}
	
/**********************************************************************************************************/
	
	@Override
	public int getUserAboutRest(SqlMapClient smc, String restCode) throws SQLException {
		int res = (int)smc.queryForObject("restFav.getUserAboutRest", restCode);
//		int cnt = (int)smc.queryForObject("restFav.updateDips", restCode);
		return res;
	}

	@Override
	public List<RestFavVO> getRestAboutUser(SqlMapClient smc, String userId) throws SQLException {
		List<RestFavVO> favList = smc.queryForList("restFav.getRestAboutUser", userId);
		return favList;
	}

	@Override
	public int insertDips(SqlMapClient smc, RestFavVO rfv) throws SQLException {
		int cnt = 0;
		Object obj = smc.insert("restFav.insertDips", rfv);
		if(obj==null) {
			cnt = 1;
		}
		System.out.println("cnt!!!!!!!!!!!!!!!!!!!!!:"+cnt);
		return cnt;
	}

	@Override
	public int deleteDips(SqlMapClient smc, RestFavVO rfv) throws SQLException {
		int cnt = (int)smc.delete("restFav.deleteDips", rfv);
		return cnt;
	}

	@Override
	public List<RestInfoVO> getRestInfoAboutUser(SqlMapClient smc, String userId) throws SQLException {
		List<RestInfoVO> favInfoList = smc.queryForList("restFav.getRestInfoAboutUser", userId);
		return favInfoList;
	}
}
