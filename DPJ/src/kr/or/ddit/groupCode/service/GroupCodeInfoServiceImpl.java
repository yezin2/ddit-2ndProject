package kr.or.ddit.groupCode.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.groupCode.dao.GroupCodeInfoDaoImpl;
import kr.or.ddit.groupCode.dao.IGroupCodeInfoDao;
import kr.or.ddit.groupCode.vo.GroupCodeInfoVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class GroupCodeInfoServiceImpl implements IGroupCodeInfoService {

	private IGroupCodeInfoDao groupDao;
	private SqlMapClient smc;
	
	private static IGroupCodeInfoService service;
	
	private GroupCodeInfoServiceImpl() {
		groupDao = GroupCodeInfoDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static IGroupCodeInfoService getInstance() {
		if(service == null) {
			service = new GroupCodeInfoServiceImpl();
		}
		return service;
	}

	
	@Override
	public int insertGroupCode(GroupCodeInfoVO gv) {
		int cnt = 0;
		
		try {
			cnt = groupDao.insertGroupCode(smc, gv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int updateGroupCode(GroupCodeInfoVO gv) {
		int cnt = 0;
		
		try {
			cnt = groupDao.updateGroupCode(smc, gv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int deleteGroupCode(String groupCode) {
		int cnt = 0;
		
		try {
			cnt = groupDao.deleteGroupCode(smc, groupCode);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public List<GroupCodeInfoVO> getAllGroupCodeList() {

		List<GroupCodeInfoVO> groupList = new ArrayList<>();
		
		try {
			groupList = groupDao.getAllGroupCodeList(smc);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return groupList;
	}

	@Override
	public GroupCodeInfoVO getGroupCode(String groupCode) {
		
		GroupCodeInfoVO gv = null;
		
		try {
			gv = groupDao.getGroupCode(smc, groupCode);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return gv;
	}

}
