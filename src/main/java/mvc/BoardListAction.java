package mvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDao;
import board.BoardDto;

public class BoardListAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDao bDao = new BoardDao();
		
		// 1. ArrayList로 게시글 목록을 읽어와서.
		// 2. 이를 출력할 페이지로 이동(forward).  // request.setAttribute(ArrayList객체)

		int pageNum = 1;
		try {
			pageNum = Integer.parseInt(request.getParameter("page"));
		} catch(NumberFormatException e) { }
		int endBno = 15 * pageNum;			
		int startBno = 15 * pageNum - 14;	
		
		//System.out.println("page번호 : " + pageNum);
		
		ArrayList<BoardDto> listBoard = null;
		try {
			listBoard = bDao.getBoardListStartEnd(startBno, endBno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("list", listBoard);
		request.setAttribute("pageNum", pageNum);
		request.getRequestDispatcher("MVC_list.jsp").forward(request, response);
	}
}














