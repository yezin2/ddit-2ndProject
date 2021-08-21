package kr.or.ddit.adminBoard.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.adminBoard.dao.AdminBoardDaoImpl;
import kr.or.ddit.adminBoard.dao.IAdminBoardDao;
import kr.or.ddit.adminBoard.vo.AdminBoardVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class AdminBoardServiceImpl implements IAdminBoardService{
	//사용할 DAO의 객체 변수 선언
	private IAdminBoardDao adminBoardDao;
	private SqlMapClient smc;
	
	private static IAdminBoardService service;
	
	private AdminBoardServiceImpl() {
		adminBoardDao = AdminBoardDaoImpl.getinstance();
			smc = SqlMapClientUtil.getInstance();
	}
	
	public static IAdminBoardService getInstance() {
		if(service == null) {
			service = new AdminBoardServiceImpl();
		}
		return service;
	}

	@Override
	public int insertAdminBoard(AdminBoardVO abv) {
		int cnt = 0;
		
		try {
			cnt = adminBoardDao.insertAdminBoard(smc, abv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public boolean checkAdminBoard(long boardSeq) {
		boolean chk = false;
		
		try {
			chk = adminBoardDao.checkAdminBoard(smc, boardSeq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chk;
	}

	@Override
	public List<AdminBoardVO> getAllAdminBoardList(AdminBoardVO abv) {
		List<AdminBoardVO> boardList = new ArrayList<AdminBoardVO>();
		try {
			boardList = adminBoardDao.getAllAdminBoardList(smc, abv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardList;
	}

	@Override
	public int updateAdminBoard(AdminBoardVO abv) {
		int cnt = 0;
		try {
			cnt = adminBoardDao.updateAdminBoard(smc, abv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteAdminBoard(long boardSeq) {
		int cnt = 0;
		try {
			cnt = adminBoardDao.deleteAdminBoard(smc, boardSeq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<AdminBoardVO> getSearchAdminBoard(AdminBoardVO abv) {
		List<AdminBoardVO> boardList = new ArrayList<>();
		
		try {
			boardList = adminBoardDao.getSearchAdminBoard(smc, abv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardList;
	}

	@Override
	public AdminBoardVO getAdminBoard(long boardSeq) {
		AdminBoardVO abv = null;
		
		try {
			abv = adminBoardDao.getAdminBoard(smc, boardSeq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return abv;
	}
}
