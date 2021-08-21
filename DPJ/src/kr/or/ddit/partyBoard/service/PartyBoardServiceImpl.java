package kr.or.ddit.partyBoard.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.partyBoard.dao.IPartyBoardDao;
import kr.or.ddit.partyBoard.dao.PartyBoardDaoImpl;
import kr.or.ddit.partyBoard.vo.PartyBoardVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class PartyBoardServiceImpl implements IPartyBoardService {
	
	private IPartyBoardDao partyBoardDao;
	private SqlMapClient smc;
	
	private static IPartyBoardService partyBoardService;

	private PartyBoardServiceImpl() {
		partyBoardDao = PartyBoardDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static IPartyBoardService getInstance() {
		if(partyBoardService == null) {
			partyBoardService = new PartyBoardServiceImpl();
		}
		return partyBoardService;
	}
	
	@Override
	public int insertPartyBoard(PartyBoardVO pv) {
		int cnt = 0;
		try {
			cnt = partyBoardDao.insertPartyBoard(smc, pv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updatePartyBoard(PartyBoardVO pv) {
		int cnt = 0;
		try {
			cnt = partyBoardDao.updatePartyBoard(smc, pv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deletePartyBoard(long boardSeq) {
		int cnt = 0;
		try {
			cnt = partyBoardDao.deletePartyBoard(smc, boardSeq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public PartyBoardVO getPartyBoard(long boardSeq) {
		PartyBoardVO pv = null;
		try {
			pv = partyBoardDao.getPartyBoard(smc, boardSeq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pv;
	}

	@Override
	public List<PartyBoardVO> getPartyBoardList() {
		List<PartyBoardVO> list = new ArrayList<>();
		try {
			list = partyBoardDao.getPartyBoardList(smc);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	
	}

	@Override
	public List<PartyBoardVO> getPartyBoardAllList() {
		List<PartyBoardVO> list = new ArrayList<>();
		try {
			list = partyBoardDao.getPartyBoardAllList(smc);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int countHits(long boardSeq) {
		int cnt = 0;
		try {
			cnt = partyBoardDao.countHits(smc, boardSeq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updatePartyStatus(long boardSeq) {
		int cnt = 0;
		
		try {
			cnt = partyBoardDao.updatePartyStatus(smc, boardSeq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

}
