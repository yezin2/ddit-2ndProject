package kr.or.ddit.groupCode.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.groupCode.service.GroupCodeInfoServiceImpl;
import kr.or.ddit.groupCode.service.IGroupCodeInfoService;
import kr.or.ddit.groupCode.vo.GroupCodeInfoVO;

public class GetAllGroupCodeListHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/WEB-INF/view/code/groupCodeList.jsp";

	@Override
	public boolean isRedirect(HttpServletRequest req) {

		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {


		// 세션 저장
		// req.getSession().setAttribute("user", "유딩몬");

		IGroupCodeInfoService groupCodeService = GroupCodeInfoServiceImpl.getInstance();

		List<GroupCodeInfoVO> groupCodeList = groupCodeService.getAllGroupCodeList();

		req.setAttribute("groupList", groupCodeList);

		return VIEW_PAGE;
	}



}
