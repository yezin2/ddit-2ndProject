package kr.or.ddit.common.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 해당 요청을 처리할 핸들러를 발견하지 못한 경우 호출됨
 * @author 유은지
 *
 */
public class NullHandler implements CommandHandler {

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.sendError(HttpServletResponse.SC_NOT_FOUND); // resp에 gerWrite, getoutputStream하는 것이 아닌 정보가 없음을 알리는 에러페이지를 보냄
		return null;
	}
	
}
