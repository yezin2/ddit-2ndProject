package kr.or.ddit.test.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.qna.vo.QnABoardVO;
import kr.or.ddit.userAll.vo.UserAllVO;

public interface IMyPageDao {
	/**
	 * 유저 ID 를 기준으로 Qna목록을 가져오는 메서드
	 * @param smc SqlMapClient 객체
	 * @param userAllVo 회원 ID를 담고있는 객체
	 * @return Qna 게시글 목록 담고있는 객체
	 * @throws SQLException JDBC관련 예외객체 발생
	 */
	public List<QnABoardVO> getAllMyPageQna(SqlMapClient smc, QnABoardVO qnaBoardVo) throws SQLException;
}
