package kr.or.ddit.userDdit.service;

import java.util.List;

import kr.or.ddit.userDdit.vo.UserDditVO;

/**
 * 회원 유저 정보 처리를 수행하는 서비스
 * @author 유은지
 *
 */
public interface IUserDditService {
	
	/**
	 * 작성한 Email이 존재하는지 여부를 알아내는 메서드
	 * @param dditMail 학원생 이메일
	 * @return 학원생 이메일이 존재하면 1, 존재하지 않으면 0
	 */
	public int checkMailUserDdit(String dditMail);
	
	/**
	 * UserDditVO 객체에 담겨진 자료를 DB에 insert하는 메서드
	 * @param userDditVo DB에 insert할 자료가 저장된 UserDditVO 객체
	 * @return DB의 작업이 성공하면 1 이상의 값이 반환되고, 실패하면 0이 반환된다.
	 */
	public int insertUserDdit(UserDditVO userDditVo);
	
	/**
	 * 전체 레코드를 가져와서 List에 담아 반환하는 메서드
	 * @return 학원생 회원 정보를 담고있는 List 객체
	 */
	public List<UserDditVO> getAllUserDditList();
	
	/**
	 * 주어진 회원 ID에 해당하는 회원 정보를 조회하는 메서드
	 * @param userId 검색할 회원 ID
	 * @return 해당 회원 ID에 해당하는 회원 정보
	 */
	public UserDditVO getUserDdit(String userId);
	
	/**
	 * 하나의 회원 정보를 이용하여 DB를 update 하는 메서드
	 * @param userDditVo UserDditVO 객체
	 * @return 작업성공 : 1 , 작업 실패 : 0
	 */
	public int updateUserDdit(UserDditVO userDditVo);
	
	/**
	 * 회원 ID를 매개변수로 받아서 그 회원정보를 삭제하는 메서드
	 * @param userId 삭제할 회원 ID
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int deleteUserDdit(String userId);
	
	/**
	 * UserDditVO에 담긴 자료를 이용하여 회원을 검색하는 메서드
	 * @param userDditVo 검색할 자료가 들어있는 UserDditVO 객체
	 * @return 검색 결과를 담은 List
	 */
	public List<UserDditVO> getSearchUserDdit(UserDditVO userDditVo);
}
