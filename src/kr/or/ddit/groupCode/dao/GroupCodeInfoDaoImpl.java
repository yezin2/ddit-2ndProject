package kr.or.ddit.groupCode.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.groupCode.vo.GroupCodeInfoVO;

public class GroupCodeInfoDaoImpl implements IGroupCodeInfoDao {

	private static IGroupCodeInfoDao groupDao;

	private GroupCodeInfoDaoImpl() {

	}

	public static IGroupCodeInfoDao getInstance() {
		if(groupDao == null) {
			groupDao = new GroupCodeInfoDaoImpl();
		}
		return groupDao;
	}

	@Override
	public int insertGroupCode(SqlMapClient smc, GroupCodeInfoVO gv) throws SQLException {
		int cnt = 0;

		Object obj = smc.insert("groupCode.insertGroupCode", gv);

		if(obj == null) {
			cnt = 1;
		}

		return cnt;
	}

	@Override
	public int updateGroupCode(SqlMapClient smc, GroupCodeInfoVO gv) throws SQLException {
		int cnt = 0;

		cnt = smc.update("groupCode.updateGroupCode", gv);

		return cnt;
	}

	@Override
	public int deleteGroupCode(SqlMapClient smc, String groupCode) throws SQLException {
		int cnt = 0;

		cnt = smc.delete("groupCode.deleteGroupCode", groupCode);

		return cnt;
	}

	@Override
	public List<GroupCodeInfoVO> getAllGroupCodeList(SqlMapClient smc) throws SQLException {
		return smc.queryForList("groupCode.getAllGroupCodeList");
	}

	@Override
	public GroupCodeInfoVO getGroupCode(SqlMapClient smc, String groupCode) throws SQLException {
		return (GroupCodeInfoVO) smc.queryForObject("groupCode.getGroupCode", groupCode);
	}
}
