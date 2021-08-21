package kr.or.ddit.partyBoard.service;

import java.util.List;

import kr.or.ddit.partyBoard.vo.PartyBoardVO;

public interface IPartyBoardService {
	
	public int insertPartyBoard(PartyBoardVO pv);
	
	public int updatePartyBoard(PartyBoardVO pv);
	
	public int deletePartyBoard(long boardSeq);
	
	public PartyBoardVO getPartyBoard(long boardSeq);
	
	public List<PartyBoardVO> getPartyBoardList();
	
	public List<PartyBoardVO> getPartyBoardAllList();
	
	public int countHits(long boardSeq);
	
	public int updatePartyStatus(long boardSeq);
	
}
