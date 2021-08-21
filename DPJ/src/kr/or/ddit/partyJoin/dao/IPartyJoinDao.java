package kr.or.ddit.partyJoin.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.partyJoin.vo.PartyJoinVO;

public interface IPartyJoinDao {
	
	public int insertPartyJoin(SqlMapClient smc, PartyJoinVO pv) throws SQLException;
	
	public int deletePartyJoin(SqlMapClient smc, PartyJoinVO pv) throws SQLException;
	
	public int countJoinMember(SqlMapClient smc, long boardSeq) throws SQLException;

	public List<PartyJoinVO> getListJoinMember(SqlMapClient smc, long boardSeq) throws SQLException;
}
