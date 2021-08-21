package kr.or.ddit.partyJoin.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.partyJoin.dao.IPartyJoinDao;
import kr.or.ddit.partyJoin.dao.PartyJoinDaoImpl;
import kr.or.ddit.partyJoin.vo.PartyJoinVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class PartyJoinServiceImpl implements IPartyJoinService {

	private IPartyJoinDao partyJoinDao;
	private SqlMapClient smc;
	
	private static IPartyJoinService service;
	
	private PartyJoinServiceImpl() {
		partyJoinDao = PartyJoinDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static IPartyJoinService getInstance() {
		if(service == null) {
			service = new PartyJoinServiceImpl();
		}
		return service;
	}
	
	
	@Override
	public int insertPartyJoin(PartyJoinVO pv) {
		int cnt = 0;
		
		try {
			cnt = partyJoinDao.insertPartyJoin(smc, pv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deletePartyJoin(PartyJoinVO pv) {
		int cnt = 0;
		
		try {
			cnt = partyJoinDao.deletePartyJoin(smc, pv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int countJoinMember(long boardSeq) {
		int cnt = 0;
		
		try {
			cnt = partyJoinDao.countJoinMember(smc, boardSeq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<PartyJoinVO> getListJoinMember(long boardSeq) {
		List<PartyJoinVO> list = new ArrayList<>();
		try {
			list = partyJoinDao.getListJoinMember(smc, boardSeq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
