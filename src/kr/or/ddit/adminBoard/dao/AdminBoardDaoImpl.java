package kr.or.ddit.adminBoard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.omg.CORBA.PUBLIC_MEMBER;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.adminBoard.vo.AdminBoardVO;

public class AdminBoardDaoImpl implements IAdminBoardDao{
	
	private static IAdminBoardDao adminBdao;
	
	private AdminBoardDaoImpl() {}
	public static IAdminBoardDao getinstance() {
		if(adminBdao == null) {
			adminBdao = new AdminBoardDaoImpl();
		}
		return adminBdao;
	}

	@Override
	public List<AdminBoardVO> getAllAdminBoardList(SqlMapClient smc, AdminBoardVO abv) throws SQLException {
		
		List<AdminBoardVO> boardList = smc.queryForList("adminBoard.getAllAdminBoardList", abv);
		return boardList;
	}

	@Override
	public List<AdminBoardVO> getSearchAdminBoard(SqlMapClient smc, AdminBoardVO abv)
			throws SQLException {
		List<AdminBoardVO> boardList = smc.queryForList("adminBoard.getSearchAdminBoard", abv);
		return null;
	}

	@Override
	public int insertAdminBoard(SqlMapClient smc, AdminBoardVO abv) throws SQLException {
		int cnt = 0;
		Object obj = smc.insert("adminBoard.insertAdminBoard", abv);
		if(obj == null) {
			cnt = 1;
		}
		return cnt;
	}

	@Override
	public int updateAdminBoard(SqlMapClient smc, AdminBoardVO abv) throws SQLException {
		int cnt = smc.update("adminBoard.updateAdminBoard", abv);
		return cnt;
	}

	@Override
	public int deleteAdminBoard(SqlMapClient smc, long boardSeq) throws SQLException {
		int cnt = smc.delete("adminBoard.deleteAdminBoard", boardSeq);
		return cnt;
	}
	
	@Override
	public boolean checkAdminBoard(SqlMapClient smc, long boardSeq) throws SQLException {
		boolean chk = false;
		int cnt = (int) smc.queryForObject("adminBoard.", boardSeq);
		if(cnt > 0) {
			chk = true;
		}
		return chk;
	}
	@Override
	public AdminBoardVO getAdminBoard(SqlMapClient smc, long boardSeq) throws SQLException {
		AdminBoardVO abv = (AdminBoardVO) smc.queryForObject("adminBoard.getAdminBoard", boardSeq);
		int cnt = smc.update("adminBoard.countAdminBoard", boardSeq);
		return abv;
	}

}
