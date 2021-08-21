package kr.or.ddit.commBoard.service;

import java.util.List;

import kr.or.ddit.commBoard.vo.CommBoardVO;
import kr.or.ddit.common.vo.PagingVO;

/**
 * 게시판 정보 처리를 수행하는 서비스
 * @author PC-08
 *
 */
public interface ICommBoardService {
	
	/**
	 * 게시판을 등록하는 메서드
	 * @param cv DB에 insert할 자료가 저장된 CommBoardVO객체
	 * @return 성공하면 1이상의 값. 실패하면 0 반환
	 */
	public int insertBoard(CommBoardVO cv);
	
	/**전체 게시판 조회 메서드
	 * 
	 * @return
	 */
	public List<CommBoardVO> getAllBoardList(PagingVO pagingVO);
	public List<CommBoardVO> getAllDevBoardList(PagingVO pagingVO);
	public List<CommBoardVO> getAllJobBoardList(PagingVO pagingVO);
	public List<CommBoardVO> getAllSocialBoardList(PagingVO pagingVO);
	public List<CommBoardVO> getAllClassBoardList(PagingVO pagingVO);
	public List<CommBoardVO> getAll401BoardList(PagingVO pagingVO);
	public List<CommBoardVO> getAll402BoardList(PagingVO pagingVO);
	public List<CommBoardVO> getAll403BoardList(PagingVO pagingVO);
	public List<CommBoardVO> getAll404BoardList(PagingVO pagingVO);
	public List<CommBoardVO> getAll405BoardList(PagingVO pagingVO);
	public List<CommBoardVO> getAll406BoardList(PagingVO pagingVO);
	public List<CommBoardVO> getAll407BoardList(PagingVO pagingVO);
	public List<CommBoardVO> getAll408BoardList(PagingVO pagingVO);
	
	/**
	 * 전체 회원수를 반환하는 메서드
	 * @return 전체 회원 수
	 */
	public int getAllBoardListCount();
	
	/**게시판 정보를 수정하는 메서드 
	 * 
	 * @param cv
	 * @return
	 */
	public int updateBoard(CommBoardVO cv);
	/**
	 * 특정 유저의 게시판을 삭제하는 메서드 
	 * @param uerId
	 * @return
	 */
	public int deleteBoard(long boardSeq);
	
	/**
	 * CommBoardVO 자료를 이용하여 회원을 검색하는 메서드
	 * @param cv
	 * @return
	 */
	public List<CommBoardVO> getSearchBoard(CommBoardVO cv);
	
	/**
	 * 주어진 ID에 해당하는 정보를 조회하는 메서드
	 * @param userId
	 * @return
	 */
	public CommBoardVO getBoard(long boardSeq);
	
	
	
}
