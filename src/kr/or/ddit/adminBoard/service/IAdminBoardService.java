package kr.or.ddit.adminBoard.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.adminBoard.vo.AdminBoardVO;

public interface IAdminBoardService {
	/**
	 * 게시글 등록
	 * @param abv DB에 insert할 자료가 저장된 AdminBoardVO객체
	 * @return DB작업이 성공하면 1이상의 값 반환, 실패하면 0반환
	 */
	public int insertAdminBoard(AdminBoardVO abv);
	
	/**
	 * 주어진 boardSeq가 존재하는지 여부를 알아내는 메서그
	 * @param boardSeq 게시글 번호
	 * @return 해당 게시글 번호가 존재하면 true, 노존재면 false
	 */
	public boolean checkAdminBoard(long boardSeq);
	
	/**
	 * 전체 게시글 정보 조회 메서드
	 * @return 작업 완료된 게시글 정보를 담고있는 List객체
	 */
	public List<AdminBoardVO> getAllAdminBoardList(AdminBoardVO abv);
	
	/**
	 * 하나의 게시글 정보를 수정하는 메서드
	 * @param abv 게시글 정보 객체
	 * @return 작업 성공 1, 작업 실패 0
	 */
	public int updateAdminBoard(AdminBoardVO abv);
	
	/**
	 * AdminBoardVO에 담긴 게시글 번호로 해당 게시글을 삭제하는 메서드
	 * (진짜 DB삭제가 아닌 boardDelete값을 변경해 주는 것 == update)
	 * @param abv 게시글 정보 객체
	 * @return 작업 성공 1, 작업 실패 0
	 */
	public int deleteAdminBoard(long boardSeq);
	
	/**
	 * 게시글 정보 검색
	 * @param abv 게시글 정보 객체
	 * @return 작업 완료된 게시글 정보를 담고있는 AdminBoardVO 객체
	 */
	public List<AdminBoardVO> getSearchAdminBoard(AdminBoardVO abv);
	
	/**
	 * 주어진 boardSeq에 해당하는 게시글 정보를 조회하는 메서드
	 * @param boardSeq 검색할 게시글 번호
	 * @return 해당 게시글 번호
	 */
	public AdminBoardVO getAdminBoard(long boardSeq);
}
