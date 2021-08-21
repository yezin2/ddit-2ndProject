package kr.or.ddit.partyJoin.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.partyJoin.vo.PartyJoinVO;

public class PartyJoinDaoImpl implements IPartyJoinDao {

	private static IPartyJoinDao partyJoinDao;
	
	private PartyJoinDaoImpl() {

	}
	
	public static IPartyJoinDao getInstance() {
		if(partyJoinDao == null) {
			partyJoinDao = new PartyJoinDaoImpl();
		}
		return partyJoinDao;
	}
	
	@Override
	public int insertPartyJoin(SqlMapClient smc, PartyJoinVO pv) throws SQLException {
		int cnt = 0;
		Object obj = smc.insert("partyJoin.insertPartyJoin", pv);
		if(obj == null) cnt = 1;
		
		return cnt;
	}

	@Override
	public int deletePartyJoin(SqlMapClient smc, PartyJoinVO pv) throws SQLException {
		int cnt = 0;
		cnt = smc.delete("partyJoin.deletePartyJoin", pv);
		return cnt;
	}

	@Override
	public int countJoinMember(SqlMapClient smc, long boardSeq) throws SQLException {
		return (int) smc.queryForObject("partyJoin.countJoinMember", boardSeq);
	}

	@Override
	public List<PartyJoinVO> getListJoinMember(SqlMapClient smc, long boardSeq) throws SQLException {
		List<PartyJoinVO> list = smc.queryForList("partyJoin.getListJoinMember", boardSeq);
		return list;
	}

}
