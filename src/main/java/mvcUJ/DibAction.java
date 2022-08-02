package mvcUJ;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uj.dao.VideoIdDao;
import com.uj.dto.VideoIdDto;

public class DibAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VideoIdDao vIDao = new VideoIdDao();
		ArrayList<VideoIdDto> dibContents = new ArrayList<VideoIdDto>();
		try {
			dibContents = vIDao.dibContents();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("dibContents", dibContents);
		
		
		
		request.getRequestDispatcher("netflixDib.jsp").forward(request, response);
	}
	
}
