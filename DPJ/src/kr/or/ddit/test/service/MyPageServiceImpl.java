package kr.or.ddit.test.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.mypage.dao.IMyPageDao;
import kr.or.ddit.mypage.dao.MyPageDaoImpl;
import kr.or.ddit.qna.vo.QnABoardVO;
import kr.or.ddit.userAll.vo.UserAllVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class MyPageServiceImpl implements IMyPageService {

	private static final Logger RESULT_LOGGER = Logger.getLogger(MyPageServiceImpl.class); // 최종 결과에 대한 로거
	
	// 필요한 객체 생성
	private IMyPageDao myPageDao;
	private SqlMapClient smc;
	private static IMyPageService myPageService;
	
	private MyPageServiceImpl() { // 생성자 호출
		myPageDao = MyPageDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static IMyPageService getInstance() { // 싱글톤 패턴
		if(myPageService == null) { myPageService = new MyPageServiceImpl(); }
		return myPageService;
	}
	
	@Override
	public List<QnABoardVO> getAllMyPageQna(QnABoardVO qnaBoardVo) {
		List<QnABoardVO> qnaBoardList = null;
		try {
			qnaBoardList = myPageDao.getAllMyPageQna(smc, qnaBoardVo);
		} catch (SQLException ex) { ex.printStackTrace(); } 
		RESULT_LOGGER.info("■■■ Service [목록 수] : " + qnaBoardList.size());
		return qnaBoardList;
	}
}
