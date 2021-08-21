package kr.or.ddit.partyBoard.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.partyBoard.vo.PartyBoardVO;

public interface IPartyBoardDao {
	
	public int insertPartyBoard(SqlMapClient smc, PartyBoardVO pv) throws SQLException;
	
	public int updatePartyBoard(SqlMapClient smc, PartyBoardVO pv) throws SQLException;
	
	public int deletePartyBoard(SqlMapClient smc, long boardSeq) throws SQLException;
	
	public PartyBoardVO getPartyBoard(SqlMapClient smc, long boardSeq) throws SQLException;
	
	public List<PartyBoardVO> getPartyBoardList(SqlMapClient smc) throws SQLException;
	
	public List<PartyBoardVO> getPartyBoardAllList(SqlMapClient smc) throws SQLException;
	
	public int countHits(SqlMapClient smc, long boardSeq) throws SQLException;
	
	public int updatePartyStatus(SqlMapClient smc, long boardSeq) throws SQLException;
}
