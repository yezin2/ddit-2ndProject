package kr.or.ddit.blackList.service;

import java.util.List;

import kr.or.ddit.blackList.vo.BlackListVO;

/**
 * 블랙리스트 정보를 처리하는 서비스 (추가, 삭제)
 * @author 유은지
 * - 아이디 검사 (제외)
 * - 블랙리스트 회원 추가
 * - 블랙리스트 회원 삭제
 */
public interface IBlackListService {
	
	/**
	 * BlackListVO에 담겨진 자료를 DB에 insert하는 메서드
	 * @param blackListVo DB에 insert할 자료가 저장된 BlackListVO 객체
	 * @return DB 작업이 성공하면 1이상의 값이 반환되고 실패하면 0이 반환된다.
	 */
	public int insertBlackList(BlackListVO blackListVo);
	
	/**
	 * 전체 레코드를 가져와서 List에 담아 반환하는 메서드
	 * @return 블랙리스트 정보를 담고있는 List 객체
	 */
	public List<BlackListVO> getAllBlackListList();
	
	/**
	 * 회원 ID를 매개변수로 받아서 그 회원 정보를 삭제하는 메서드 
	 * @param userId 삭제할 회원 ID
	 * @return 작업성공 : 1, 작업 실패 : 0
	 * 테이블에서는 삭제되지 않고 값이 N 으로 변경됨.
	 */
	public int deleteBlackList(String userId);
}
