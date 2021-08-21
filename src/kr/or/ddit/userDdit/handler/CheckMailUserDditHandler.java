package kr.or.ddit.userDdit.handler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.userDdit.service.IUserDditService;
import kr.or.ddit.userDdit.service.UserDditServiceImpl;

public class CheckMailUserDditHandler implements CommandHandler{

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		try {
			String dditMail = req.getParameter("dditMail");
			IUserDditService userDditService = UserDditServiceImpl.getInstance();
			
			// 아이디 정보 조회
			int cnt = userDditService.checkMailUserDdit(dditMail);
			
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
