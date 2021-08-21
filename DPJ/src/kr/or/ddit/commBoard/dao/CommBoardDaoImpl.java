package kr.or.ddit.commBoard.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.commBoard.vo.CommBoardVO;
import kr.or.ddit.common.vo.PagingVO;

public class CommBoardDaoImpl implements ICommBoardDao{

	private static ICommBoardDao commDao;
	
	private CommBoardDaoImpl() {
		
	}
	
	public static ICommBoardDao getInstance() {
		if(commDao == null) {
			commDao = new CommBoardDaoImpl();
		}
		return commDao;
	}
	
	@Override
	public int insertBoard(SqlMapClient smc, CommBoardVO cv) throws SQLException {
		int cnt = 0;
		
		Object obj = smc.insert("commBoard.insertBoard", cv);
		
		if(obj == null) {
			cnt = 1;
		}
		
		return cnt;
	}

	@Override
	public List<CommBoardVO> getAllBoardList(SqlMapClient smc, PagingVO pagingVO) throws SQLException {
		
		List<CommBoardVO> boardList = smc.queryForList("commBoard.getAllBoardList", pagingVO);
		
		return boardList;
	}
	public List<CommBoardVO> getAllDevBoardList(SqlMapClient smc, PagingVO pagingVO) throws SQLException {
		
		List<CommBoardVO> boardList = smc.queryForList("commBoard.getAllDevBoardList", pagingVO);
		
		return boardList;
	}
	public List<CommBoardVO> getAllJobBoardList(SqlMapClient smc, PagingVO pagingVO) throws SQLException {
		List<CommBoardVO> boardList = smc.queryForList("commBoard.getAllJobBoardList", pagingVO);
		return boardList;
	}
	public List<CommBoardVO> getAllSocialBoardList(SqlMapClient smc, PagingVO pagingVO) throws SQLException {
		List<CommBoardVO> boardList = smc.queryForList("commBoard.getAllSocialBoardList", pagingVO);
		return boardList;
	}
	public List<CommBoardVO> getAllClassBoardList(SqlMapClient smc, PagingVO pagingVO) throws SQLException {
		List<CommBoardVO> boardList = smc.queryForList("commBoard.getAllClassBoardList", pagingVO);
		return boardList;
	}
	public List<CommBoardVO> getAll401BoardList(SqlMapClient smc, PagingVO pagingVO) throws SQLException {
		List<CommBoardVO> boardList = smc.queryForList("commBoard.getAll401BoardList", pagingVO);
		return boardList;
	}
	public List<CommBoardVO> getAll402BoardList(SqlMapClient smc, PagingVO pagingVO) throws SQLException {
		List<CommBoardVO> boardList = smc.queryForList("commBoard.getAll402BoardList", pagingVO);
		return boardList;
	}
	public List<CommBoardVO> getAll403BoardList(SqlMapClient smc, PagingVO pagingVO) throws SQLException {
		List<CommBoardVO> boardList = smc.queryForList("commBoard.getAll403BoardList", pagingVO);
		return boardList;
	}
	public List<CommBoardVO> getAll404BoardList(SqlMapClient smc, PagingVO pagingVO) throws SQLException {
		List<CommBoardVO> boardList = smc.queryForList("commBoard.getAll404BoardList", pagingVO);
		return boardList;
	}
	public List<CommBoardVO> getAll405BoardList(SqlMapClient smc, PagingVO pagingVO) throws SQLException {
		List<CommBoardVO> boardList = smc.queryForList("commBoard.getAll405BoardList", pagingVO);
		return boardList;
	}
	public List<CommBoardVO> getAll406BoardList(SqlMapClient smc, PagingVO pagingVO) throws SQLException {
		List<CommBoardVO> boardList = smc.queryForList("commBoard.getAll406BoardList", pagingVO);
		return boardList;
	}
	public List<CommBoardVO> getAll407BoardList(SqlMapClient smc, PagingVO pagingVO) throws SQLException {
		List<CommBoardVO> boardList = smc.queryForList("commBoard.getAll407BoardList", pagingVO);
		return boardList;
	}
	public List<CommBoardVO> getAll408BoardList(SqlMapClient smc, PagingVO pagingVO) throws SQLException {
		List<CommBoardVO> boardList = smc.queryForList("commBoard.getAll408BoardList", pagingVO);
		return boardList;
	}
	
	@Override
	public int getAllBoardListCount(SqlMapClient smc) throws SQLException {
		int cnt = (int)smc.queryForObject("commBoard.getBoardAllCount");
		return cnt;
	}
	
	@Override
	public int updateBoard(SqlMapClient smc, CommBoardVO cv) throws SQLException {
		
		int cnt = 0;
		
		cnt = smc.update("commBoard.updateBoard", cv);
		
		return cnt;
	}

	@Override
	public int deleteBoard(SqlMapClient smc, long boardSeq) throws SQLException {

		int cnt = smc.delete("commBoard.deleteBoard", boardSeq);
		
		return cnt;
	}

	@Override
	public List<CommBoardVO> getSearchBoard(SqlMapClient smc, CommBoardVO cv) throws SQLException {
			
		List<CommBoardVO> boardList = smc.queryForList("commBoard.getSearchBoard", cv);
		
		return boardList;
	}

	@Override
	public CommBoardVO getBoard(SqlMapClient smc, long boardSeq) throws SQLException {
		int cnt = smc.update("commBoard.countHitsEvent", boardSeq);
		
		CommBoardVO cv = (CommBoardVO)smc.queryForObject("commBoard.getBoardInfo", boardSeq);
	
		return cv;
	}



}
