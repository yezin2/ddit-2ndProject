package kr.or.ddit.code.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.code.vo.CodeVO;

public class CodeDaoImpl implements ICodeDao {

	private static ICodeDao codeDao;

	private CodeDaoImpl() {

	}

	public static ICodeDao getInstance() {
		if(codeDao == null) {
			codeDao = new CodeDaoImpl();
		}
		return codeDao;
	}

	@Override
	public int insertCode(SqlMapClient smc, CodeVO cv) throws SQLException {
		int cnt = 0;

		Object obj = smc.insert("code.insertCode", cv);

		if(obj == null) {
			cnt = 1;
		}

		return cnt;
	}

	@Override
	public int updateCode(SqlMapClient smc,  CodeVO cv) throws SQLException {
		int cnt = 0;

		cnt = smc.update("code.updateCode", cv);

		return cnt;
	}

	@Override
	public int deleteCode(SqlMapClient smc, String code) throws SQLException {
		int cnt = 0;

		cnt = smc.delete("code.deleteCode", code);

		return cnt;
	}

	@Override
	public List<CodeVO> getAllCodeList(SqlMapClient smc) throws SQLException {
		return smc.queryForList("code.getAllCodeList");
	}

	@Override
	public CodeVO getCode(SqlMapClient smc, String code) throws SQLException {
		return (CodeVO) smc.queryForObject("code.getCode", code);
	}

	@Override
	public List<CodeVO> getCodeList(SqlMapClient smc, String groupCode) throws SQLException {
		return smc.queryForList("code.getCodeList", groupCode);
	}
}
