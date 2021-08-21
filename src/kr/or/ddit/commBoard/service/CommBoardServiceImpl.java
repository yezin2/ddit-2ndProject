package kr.or.ddit.commBoard.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.commBoard.dao.CommBoardDaoImpl;
import kr.or.ddit.commBoard.dao.ICommBoardDao;
import kr.or.ddit.commBoard.vo.CommBoardVO;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class CommBoardServiceImpl implements ICommBoardService{

	private ICommBoardDao boardDao;
	private SqlMapClient smc;
	
	private static ICommBoardService service;
	
	private CommBoardServiceImpl() {
		boardDao = CommBoardDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static ICommBoardService getInstance() {
		if(service == null) {
			service = new CommBoardServiceImpl();
		}
		return service;
		
	}
	
	@Override
	public int insertBoard(CommBoardVO cv) {
		
		int cnt =0;
		
		try {
			cnt = boardDao.insertBoard(smc, cv);
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public List<CommBoardVO> getAllBoardList(PagingVO pagingVO) {

		List<CommBoardVO> boardList = new ArrayList<>();
		
		try {
			boardList = boardDao.getAllBoardList(smc, pagingVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return boardList;
	}
	@Override
	public List<CommBoardVO> getAllDevBoardList(PagingVO pagingVO) {
		List<CommBoardVO> boardList = new ArrayList<>();
		try {
			boardList = boardDao.getAllDevBoardList(smc, pagingVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardList;
	}
	@Override
	public List<CommBoardVO> getAllJobBoardList(PagingVO pagingVO) {
		List<CommBoardVO> boardList = new ArrayList<>();
		try {
			boardList = boardDao.getAllJobBoardList(smc, pagingVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardList;
	}
	@Override
	public List<CommBoardVO> getAllSocialBoardList(PagingVO pagingVO) {
		List<CommBoardVO> boardList = new ArrayList<>();
		try {
			boardList = boardDao.getAllSocialBoardList(smc, pagingVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardList;
	}
	@Override
	public List<CommBoardVO> getAllClassBoardList(PagingVO pagingVO) {
		List<CommBoardVO> boardList = new ArrayList<>();
		try {
			boardList = boardDao.getAllClassBoardList(smc, pagingVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardList;
	}
	@Override
	public List<CommBoardVO> getAll401BoardList(PagingVO pagingVO) {
		List<CommBoardVO> boardList = new ArrayList<>();
		try {
			boardList = boardDao.getAll401BoardList(smc, pagingVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardList;
	}
	@Override
	public List<CommBoardVO> getAll403BoardList(PagingVO pagingVO) {
		List<CommBoardVO> boardList = new ArrayList<>();
		try {
			boardList = boardDao.getAll403BoardList(smc, pagingVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardList;
	}
	@Override
	public List<CommBoardVO> getAll404BoardList(PagingVO pagingVO) {
		List<CommBoardVO> boardList = new ArrayList<>();
		try {
			boardList = boardDao.getAll404BoardList(smc, pagingVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardList;
	}
	@Override
	public List<CommBoardVO> getAll405BoardList(PagingVO pagingVO) {
		List<CommBoardVO> boardList = new ArrayList<>();
		try {
			boardList = boardDao.getAll405BoardList(smc, pagingVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardList;
	}
	@Override
	public List<CommBoardVO> getAll406BoardList(PagingVO pagingVO) {
		List<CommBoardVO> boardList = new ArrayList<>();
		try {
			boardList = boardDao.getAll406BoardList(smc, pagingVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardList;
	}
	@Override
	public List<CommBoardVO> getAll407BoardList(PagingVO pagingVO) {
		List<CommBoardVO> boardList = new ArrayList<>();
		try {
			boardList = boardDao.getAll407BoardList(smc, pagingVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardList;
	}
	@Override
	public List<CommBoardVO> getAll408BoardList(PagingVO pagingVO) {
		List<CommBoardVO> boardList = new ArrayList<>();
		try {
			boardList = boardDao.getAll408BoardList(smc, pagingVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardList;
	}
	@Override
	public List<CommBoardVO> getAll402BoardList(PagingVO pagingVO) {
		List<CommBoardVO> boardList = new ArrayList<>();
		try {
			boardList = boardDao.getAll402BoardList(smc, pagingVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardList;
	}
	
	@Override
	public int getAllBoardListCount() {
		int cnt = 0;
		try {
			cnt = boardDao.getAllBoardListCount(smc);
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateBoard(CommBoardVO cv) {
		int cnt = 0;
		try {
			cnt = boardDao.updateBoard(smc, cv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteBoard(long boardSeq) {
		int cnt = 0;
		
		try {
			cnt = boardDao.deleteBoard(smc, boardSeq);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return cnt;
	}

	@Override
	public List<CommBoardVO> getSearchBoard(CommBoardVO cv) {
		
		List<CommBoardVO> boardList = new ArrayList<>();
		
		try {
			boardList = boardDao.getSearchBoard(smc, cv);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return boardList;
	}

	@Override
	public CommBoardVO getBoard(long boardSeq) {
		CommBoardVO cv = null;
		
		try {
			cv = boardDao.getBoard(smc, boardSeq);
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cv;
	}


}
