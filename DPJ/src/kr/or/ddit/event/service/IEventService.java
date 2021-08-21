package kr.or.ddit.event.service;

import java.util.List;

import kr.or.ddit.event.vo.EventVO;
import kr.or.ddit.restInfo.vo.RestInfoVO;

public interface IEventService{
	public int insertEvent(EventVO event);
	
	public int updateEvent(EventVO event);
	
	public int deleteEvent(long boardSeq);
	
	public List<EventVO> getAllEvent();
	
	public List<RestInfoVO> getRestInfo();
	
	public EventVO selectEvent(long boardSeq);
	
	public RestInfoVO selectRest(String userId);
	
	public EventVO getEvent(long boardSeq);
	
//	public int countHitsEvent(String boardSeq);
	
}
