package kr.or.ddit.partyJoin.service;

import java.util.List;

import kr.or.ddit.partyJoin.vo.PartyJoinVO;

public interface IPartyJoinService {

	public int insertPartyJoin(PartyJoinVO pv);
                                              
	public int deletePartyJoin(PartyJoinVO pv);
	                                          
	public int countJoinMember(long boardSeq);
	
	public List<PartyJoinVO> getListJoinMember(long boardSeq);
	
}
