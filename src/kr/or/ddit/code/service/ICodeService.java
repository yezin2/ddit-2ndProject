package kr.or.ddit.code.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.code.vo.CodeVO;

public interface ICodeService {

	/**
	 * 코드 추가
	 * CodeVO 객체에 담겨진 자료를 DB에 insert하는 메서드
	 * @param gv DB에 insert할 자료가 저장된 CodeVO객체
	 * @return DB작업이 성공하면 1 이상의 값이 반환되고, 실패하면 0이 반환된다.
	 */
	public int insertCode(CodeVO cv);

	/**
	 * 코드 수정
	 * 하나의 코드를 이용하여 DB를 update하는 메서드
	 * @param gv 코드
	 * @return 작업성공: 1, 작업실패: 0
	 */
	public int updateCode(CodeVO cv);

	/**
	 * 코드 삭제
	 * 코드를 매개변수로 받아서 그 코드를 삭제하는 메서드
	 * @param code 삭제할 코드
	 * @return 작업성공: 1, 작업실패: 0
	 * @throws SQLException JDBC관련 예외객체
	 */
	public int deleteCode(String code);

	/**
	 * 전체 코드 조회
	 * DB의 Code테이블의 전체 레코드를 가져와서 List에 담아 반환하는 메서드
	 * @return 코드정보를 담고있는 List객체
	 * @throws SQLException JDBC관련 예외객체
	 */
	public List<CodeVO> getAllCodeList();

	/**
	 * 코드정보 조회
	 * 주어진 코드에 해당하는 코드정보를 조회하는 메서드
	 * @param code 검색할 코드
	 * @return
	 */
	public CodeVO getCode(String code);

	List<CodeVO> getCodeList(String groupCode);
}
