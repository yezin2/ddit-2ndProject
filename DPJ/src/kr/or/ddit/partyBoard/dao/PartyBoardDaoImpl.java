package kr.or.ddit.partyBoard.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.partyBoard.vo.PartyBoardVO;

public class PartyBoardDaoImpl implements IPartyBoardDao {
	
	private static IPartyBoardDao partyBoardDao;
	
	private PartyBoardDaoImpl() {
	}
	
	public static IPartyBoardDao getInstance() {
		if(partyBoardDao == null) {
			partyBoardDao = new PartyBoardDaoImpl();
		}
		return partyBoardDao;
	}
	
	@Override
	public int insertPartyBoard(SqlMapClient smc, PartyBoardVO pv) throws SQLException {
		int cnt = 0;

		Object obj = smc.insert("partyBoard.insertPartyBoard", pv);

		if(obj == null) {
			cnt = 1;
		}

		return cnt;
	}

	@Override
	public int updatePartyBoard(SqlMapClient smc, PartyBoardVO pv) throws SQLException {
		return (int) smc.update("partyBoard.updatePartyBoard", pv);
	}

	@Override
	public int deletePartyBoard(SqlMapClient smc, long boardSeq) throws SQLException {
		return (int) smc.update("partyBoard.deletePartyBoard", boardSeq);
	}

	@Override
	public PartyBoardVO getPartyBoard(SqlMapClient smc, long boardSeq) throws SQLException {
		return (PartyBoardVO) smc.queryForObject("partyBoard.getPartyBoard", boardSeq);
	}

	@Override
	public List<PartyBoardVO> getPartyBoardList(SqlMapClient smc) throws SQLException {
		List<PartyBoardVO> list = smc.queryForList("partyBoard.getPartyBoardList");
		return list;
	}

	@Override
	public List<PartyBoardVO> getPartyBoardAllList(SqlMapClient smc) throws SQLException {
		List<PartyBoardVO> list = smc.queryForList("partyBoard.getPartyBoardAllList");
		return list;
	}

	@Override
	public int countHits(SqlMapClient smc, long boardSeq) throws SQLException {
		return (int) smc.update("partyBoard.countHits", boardSeq);
	}

	@Override
	public int updatePartyStatus(SqlMapClient smc, long boardSeq) throws SQLException {
		return (int) smc.update("partyBoard.updatePartyStatus", boardSeq);
	}

}
