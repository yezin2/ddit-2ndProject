package kr.or.ddit.commBoard.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commBoard.service.CommBoardServiceImpl;
import kr.or.ddit.commBoard.service.ICommBoardService;
import kr.or.ddit.commBoard.vo.CommBoardVO;
import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.common.vo.PagingVO;

public class GetAllClass407BoardHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/WEB-INF/view/commBoard/407BoardList.jsp";
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		int pageNo = 
				req.getParameter("pageNo") == null ? 
				1 : Integer.parseInt(req.getParameter("pageNo"));
			
			PagingVO pagingVO = new PagingVO();
			
		ICommBoardService boardService = CommBoardServiceImpl.getInstance();
		
		int totalCount = boardService.getAllBoardListCount();
		pagingVO.setTotalCount(totalCount);
		pagingVO.setCurrentPageNo(pageNo);
		pagingVO.setCountPerPage(5);
		pagingVO.setPageSize(5);
		
		List<CommBoardVO> boardList = boardService.getAll407BoardList(pagingVO);
		
		req.setAttribute("boardList", boardList);
		req.setAttribute("pagingVO", pagingVO);
		
		return VIEW_PAGE;
	}

}
