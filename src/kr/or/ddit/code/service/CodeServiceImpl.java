package kr.or.ddit.code.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.code.dao.CodeDaoImpl;
import kr.or.ddit.code.dao.ICodeDao;
import kr.or.ddit.code.vo.CodeVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class CodeServiceImpl implements ICodeService {

	private ICodeDao codeDao;
	private SqlMapClient smc;

	private static ICodeService service;

	private CodeServiceImpl() {
		codeDao = CodeDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}

	public static ICodeService getInstance() {
		if(service == null) {
			service = new CodeServiceImpl();
		}
		return service;
	}


	@Override
	public int insertCode(CodeVO cv) {
		int cnt = 0;

		try {
			cnt = codeDao.insertCode(smc, cv);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return cnt;
	}

	@Override
	public int updateCode(CodeVO cv) {
		int cnt = 0;

		try {
			cnt = codeDao.updateCode(smc, cv);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return cnt;
	}

	@Override
	public int deleteCode(String code) {
		int cnt = 0;

		try {
			cnt = codeDao.deleteCode(smc, code);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return cnt;
	}

	@Override
	public List<CodeVO> getAllCodeList() {
		List<CodeVO> codeList = new ArrayList<>();

		try {
			codeList = codeDao.getAllCodeList(smc);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return codeList;
	}

	@Override
	public CodeVO getCode(String code) {
		CodeVO cv = null;

		try {
			cv = codeDao.getCode(smc, code);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return cv;
	}

	@Override
	public List<CodeVO> getCodeList(String groupCode) {
		List<CodeVO> codeList = new ArrayList<>();

		try {
			codeList = codeDao.getCodeList(smc, groupCode);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return codeList;
	}
}
