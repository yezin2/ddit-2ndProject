package kr.or.ddit.adminBoard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.adminBoard.vo.AdminBoardVO;

public interface IAdminBoardDao {
	/**
	 * DB의 TB_ADMIN_BOARD테이블의 전체 레코드를 가져와서 List에 담아 반환하는 메서드
	 * @param smc SqlMapClient 객체
	 * @return 회원정보를 담고있는 List객체
	 * @throws SQLException SQL예외객체
	 */
	public List<AdminBoardVO> getAllAdminBoardList(SqlMapClient smc, AdminBoardVO abv)
			throws SQLException;
	
	/**
	 * AdminBoardVO를 이용해 게시글을 검색하는 메서드
	 * @param smc SqlMapClient 객체
	 * @param abv 검색할 정보를 저장한 AdminBoardVO객체
	 * @return 검색된 결과를 담은 List
	 * @throws SQLException SQL예외객체
	 */
	public List<AdminBoardVO> getSearchAdminBoard(SqlMapClient smc, 
			AdminBoardVO abv)
					throws SQLException;

	/**
	 * AdminBoardVO 객체에 담겨진 자료를 DB에 insert하는 메서드
	 * @param smc SqlMapClient 객체
	 * @param abv DB에 insert할 자료가 저장된 AdminBoardVO 객체
	 * @return DB에 insert를 성공하면 1반환, 실패하면 0반환
	 * @throws SQLException SQL예외객체
	 */
	public int insertAdminBoard(SqlMapClient smc, AdminBoardVO abv)
			throws SQLException;
	
	/**
	 * boardSeq를 이용해 DB를 update하는 메서드
	 * @param smc SqlMapClient 객체
	 * @param abv DB에 update할 자료가 저장된 AdminBoardVO 객체(boardSeq포함)
	 * @return DB에 update를 성공하면 1반환, 실패하면 0반환
	 * @throws SQLException SQL예외객체
	 */
	public int updateAdminBoard(SqlMapClient smc, AdminBoardVO abv)
			throws SQLException;
	
	/**
	 * AdminBoardVO에 담긴 게시글 번호로 해당 게시글을 삭제하는 메서드
	 * (진짜 DB삭제가 아닌 boardDelete값을 변경해 주는 것)
	 * @param smc SqlMapClient 객체
	 * @param abv 삭제를 위한 게시글 정보
	 * @return DB에 작업 성공시 1 반환, 실패시 0 반환
	 * @throws SQLException SQL예외객체
	 */
	public int deleteAdminBoard(SqlMapClient smc, long boardSeq)
			throws SQLException;
	
	/**
	 * boardSeq가 존재하는지 여부를 알아내는 메서드
	 * @param smc SqlMapClient 객체
	 * @param boardSeq 확인할 게시글 번호
	 * @return boardSeq가 존재하면 true, 노존재면 false
	 * @throws SQLException SQL예외객체
	 */
	public boolean checkAdminBoard(SqlMapClient smc, long boardSeq)
			throws SQLException;
	
	/**
	 * boardSeq에 해당하는 회원 정보를 조회하는 메서드
	 * @param smc SqlMapClient 객체
	 * @param boardSeq 검색할 게시글 번호
	 * @return boardSeq에 해당하는 게시글 객체
	 * @throws SQLException SQL예외객체
	 */
	public AdminBoardVO getAdminBoard(SqlMapClient smc, long boardSeq)
			throws SQLException;
}
