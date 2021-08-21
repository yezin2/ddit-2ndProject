package kr.or.ddit.event.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.event.dao.EventDaoImpl;
import kr.or.ddit.event.dao.IEventDao;
import kr.or.ddit.event.vo.EventVO;
import kr.or.ddit.restInfo.vo.RestInfoVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class EventServiceImpl implements IEventService{

	private IEventDao evnDao;
	private SqlMapClient smc;
	
	private static IEventService eventService;
	
	private EventServiceImpl() {
		evnDao = EventDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static IEventService getInstance() {
		if(eventService == null) {
			eventService = new EventServiceImpl();
		}
		return eventService;
	}

	@Override
	public int insertEvent(EventVO event) {
		int cnt = 0;
		try {
			cnt = evnDao.insertEvent(smc, event);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	@Override
	public int updateEvent(EventVO event) {
		int cnt = 0;
		try {
			cnt = evnDao.updateQnABoard(smc, event);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	@Override
	public int deleteEvent(long boardSeq) {
		int cnt = 0;
		try {
			cnt = evnDao.deleteEvnet(smc, boardSeq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	@Override
	public List<EventVO> getAllEvent() {
		List<EventVO> list = new ArrayList<>();
		try {
			list = evnDao.getAllEvnet(smc);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<RestInfoVO> getRestInfo() {
		List<RestInfoVO> list = new ArrayList<>();
		try {
			list = evnDao.getRestInfo(smc);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public EventVO selectEvent(long boardSeq) {
		EventVO event = null;
		try {
			event = evnDao.selectEvent(smc, boardSeq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return event;
	}

	@Override
	public RestInfoVO selectRest(String userId) {
		RestInfoVO rest = null;
		try {
			rest = evnDao.selectRest(smc, userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rest;
	}
	
	@Override
	public EventVO getEvent(long boardSeq) {
		EventVO event = null;
		try {
			event = evnDao.getEvent(smc, boardSeq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return event;
	}

//	@Override
//	public int countHitsEvent(String boardSeq) {
//		int cnt = 0;
//		try {
//			cnt = evnDao.countHitsQnABoard(smc, boardSeq);
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}
//		return 0;
//	}
}
