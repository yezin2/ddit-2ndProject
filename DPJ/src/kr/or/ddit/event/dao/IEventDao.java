package kr.or.ddit.event.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.event.vo.EventVO;
import kr.or.ddit.restInfo.vo.RestInfoVO;

public interface IEventDao {

	public int insertEvent(SqlMapClient smc, EventVO event) throws SQLException;

	public int updateQnABoard(SqlMapClient smc, EventVO event) throws SQLException; 

	public int deleteEvnet(SqlMapClient smc, long boardSeq) throws SQLException; 

	public List<EventVO> getAllEvnet(SqlMapClient smc) throws SQLException;
	
	public List<RestInfoVO> getRestInfo(SqlMapClient smc) throws SQLException;

	public EventVO selectEvent(SqlMapClient smc, long boardSeq) throws SQLException;
	
	public RestInfoVO selectRest(SqlMapClient smc, String userId) throws SQLException;
	
	public EventVO getEvent(SqlMapClient smc, long boardSeq) throws SQLException;

//	public int countHitsQnABoard(SqlMapClient smc, String boardSeq) throws SQLException;
}
