package kr.or.ddit.userAll.handler;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.userAll.service.IUserAllService;
import kr.or.ddit.userAll.service.UserAllServiceImpl;
import kr.or.ddit.userAll.vo.UserAllVO;
import kr.or.ddit.userDdit.dao.UserDditDaoImpl;
import kr.or.ddit.userDdit.service.IUserDditService;
import kr.or.ddit.userDdit.service.UserDditServiceImpl;
import kr.or.ddit.userDdit.vo.UserDditVO;
import kr.or.ddit.util.HashSha256Test;

public class InsertUserAllHandler implements CommandHandler {
	
	private static final String VIEW_PAGE = "/WEB-INF/view/userAll/insertUserAll.jsp";
	
	// 로그 객체 생성
	private static final Logger RESULT_LOGGER = Logger.getLogger(UserDditDaoImpl.class); // 최종 결과에 대한 로거
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if("GET".equals(req.getMethod())) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if("GET".equals(req.getMethod())) {
			return VIEW_PAGE;
		} else {
			UserAllVO userAllVo = new UserAllVO();
			UserDditVO userDditVo = new UserDditVO();
			
			String userId = req.getParameter("userId");
			String userPw = req.getParameter("userPw");
			String dditName = req.getParameter("dditName");
			String userPhoto = req.getParameter("userPhoto");
			String dditClass = req.getParameter("dditClass");
			String dditHp = req.getParameter("dditHp");
			String dditMail = req.getParameter("dditMail");
			String recvMail = req.getParameter("recvMail");
			String dditBir = req.getParameter("dditBir");
			
			RESULT_LOGGER.info("■■■ 파라미터 값 : " + userId);
			RESULT_LOGGER.info("■■■ 파라미터 값 : " + userPw);
			RESULT_LOGGER.info("■■■ 파라미터 값 : " + dditName);
			RESULT_LOGGER.info("■■■ 파라미터 값 : " + userPhoto);
			RESULT_LOGGER.info("■■■ 파라미터 값 : " + dditClass);
			RESULT_LOGGER.info("■■■ 파라미터 값 : " + dditHp);
			RESULT_LOGGER.info("■■■ 파라미터 값 : " + dditMail);
			RESULT_LOGGER.info("■■■ 파라미터 값 : " + recvMail);
			RESULT_LOGGER.info("■■■ 파라미터 값 : " + dditBir);
			
			// 비밀번호 암호화 메서드 호출
			userPw = HashSha256Test.hashSha256(userPw);
			RESULT_LOGGER.info("■■■ 암호화 비밀번호 값 : " + userPw);
			
			// 이메일 수신 여부 동의 데이터 가공 : on -> Y
//			int b = (5 < 4) ? 50 : 40; 
			if(recvMail == null) {
				recvMail = "N";
			}else if(recvMail.equals("on")){
				recvMail = "Y";
			}
//			recvMail = (recvMail.equals("on")) ? "Y" : (recvMail.equals(anObject)"N";
			RESULT_LOGGER.info("■■■ 메일 가공된 값 : " + recvMail);
			
			userAllVo.setUserId(userId);
			userAllVo.setUserPw(userPw);
			userAllVo.setUserType("일반회원");
			userAllVo.setUserDelete("N");
			userAllVo.setUserPhoto("A");
			
			userDditVo.setUserId(userId);
			userDditVo.setDditName(dditName);
			userDditVo.setDditClass(dditClass);
			userDditVo.setDditHp(dditHp);
			userDditVo.setDditMail(dditMail);
			userDditVo.setDditBir(dditBir);
			userDditVo.setRecvMail(recvMail);
			userDditVo.setPolicyYn("N");
			
			// 서비스 객체 생성하기
			IUserAllService userAllService = UserAllServiceImpl.getInstance();
			IUserDditService userDditService = UserDditServiceImpl.getInstance();
			
			int cntUserAll = userAllService.insertUserAll(userAllVo);
			int cntUserDdit = userDditService.insertUserDdit(userDditVo);
			
			RESULT_LOGGER.info("■■■ UserAll, UserDdit DB 결과 : " + cntUserAll + ", " + cntUserDdit);
			
			String msg = "";
			
			if(cntUserAll > 0 && cntUserDdit > 0) {
				msg = "success";
			} else {
				msg = "failure";
			}
			
			// 화면 이동
			String redirectUrl = req.getContextPath()
					+ "/userAll/listUserAllList.do?msg="
					+ URLEncoder.encode(msg, "UTF-8");
			
			return redirectUrl;
		}
	}
	
}
