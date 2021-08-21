package kr.or.ddit.userAll.handler;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.userAll.service.IUserAllService;
import kr.or.ddit.userAll.service.UserAllServiceImpl;
import kr.or.ddit.userAll.vo.UserAllVO;

public class CheckIdUserAllHandler implements CommandHandler{

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		try {
			String userId = req.getParameter("userId");
			IUserAllService userAllService = UserAllServiceImpl.getInstance();
			
			// 아이디 정보 조회
			int cnt = userAllService.checkIdUserAll(userId);
			
			/** Gson 적용 부분 ********/
			Gson gson = new Gson();
			String strJson = gson.toJson(cnt);
			
			PrintWriter out = resp.getWriter();
			out.print(strJson);
			out.flush();
			out.close();
		} catch (IOException ex){
			ex.printStackTrace();
		}
		
		return null; // ajax 처리로 인하여 페이지 이동 하지 않음.
	}
	
}
