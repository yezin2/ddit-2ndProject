package kr.or.ddit.blackList.handler;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import kr.or.ddit.blackList.service.BlackListServiceImpl;
import kr.or.ddit.blackList.service.IBlackListService;
import kr.or.ddit.blackList.vo.BlackListVO;
import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.userDdit.dao.UserDditDaoImpl;

public class InsertBlackListHandler implements CommandHandler {
	
	private static final String VIEW_PAGE = "/WEB-INF/view/blackList/insertBlackList.jsp";
	
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
			BlackListVO blackListVo = new BlackListVO();
			BeanUtils.populate(blackListVo, req.getParameterMap());
			
			
			IBlackListService blackListService = BlackListServiceImpl.getInstance();
			int cnt = blackListService.insertBlackList(blackListVo);
			
			String msg = "";
			
			if(cnt > 0) {
				msg = "success";
			} else {
				msg = "failure";
			}
			
			// 화면 이동
			String redirectUrl = req.getContextPath()
					+ "/blackList/listBlackList.do?msg="
					+ URLEncoder.encode(msg, "UTF-8");
			
			return redirectUrl;
		}
	}

}
