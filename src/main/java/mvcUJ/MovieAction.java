package mvcUJ;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uj.dao.MainRandomDao;
import com.uj.dao.VideoIdDao;
import com.uj.dto.MainRandomDto;
import com.uj.dto.VideoIdDto;

public class MovieAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MovieAction 들어옴!");
		
		MainRandomDao mRDao = new MainRandomDao();
		ArrayList<MainRandomDto> mRList = new ArrayList<MainRandomDto>();
		try {
			mRList = mRDao.getRandom();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("mRList", mRList);
		
		VideoIdDao vIDao = new VideoIdDao();
		ArrayList<VideoIdDto> top1Movie = new ArrayList<VideoIdDto>();
		try {
			top1Movie = vIDao.top1Movie();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("top1Movie",top1Movie);
		
		ArrayList<VideoIdDto> top2Movie = new ArrayList<VideoIdDto>();
		try {
			top2Movie = vIDao.top2Movie();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("top2Movie",top2Movie);
		
		ArrayList<VideoIdDto> top3Movie = new ArrayList<VideoIdDto>();
		try {
			top3Movie = vIDao.top3Movie();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("top3Movie",top3Movie);
		
		ArrayList<VideoIdDto> top4Movie = new ArrayList<VideoIdDto>();
		try {
			top4Movie = vIDao.top4Movie();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("top4Movie",top4Movie);
		
		ArrayList<VideoIdDto> top5Movie = new ArrayList<VideoIdDto>();
		try {
			top5Movie = vIDao.top5Movie();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("top5Movie",top5Movie);
		
		ArrayList<VideoIdDto> top6Movie = new ArrayList<VideoIdDto>();
		try {
			top6Movie = vIDao.top6Movie();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("top6Movie",top6Movie);
		
		ArrayList<VideoIdDto> top7Movie = new ArrayList<VideoIdDto>();
		try {
			top7Movie = vIDao.top7Movie();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("top7Movie",top7Movie);
		
		ArrayList<VideoIdDto> top8Movie = new ArrayList<VideoIdDto>();
		try {
			top8Movie = vIDao.top8Movie();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("top8Movie",top8Movie);
		
		ArrayList<VideoIdDto> top9Movie = new ArrayList<VideoIdDto>();
		try {
			top9Movie = vIDao.top9Movie();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("top9Movie",top9Movie);
		
		ArrayList<VideoIdDto> top10Movie = new ArrayList<VideoIdDto>();
		try {
			top10Movie = vIDao.top10Movie();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("top10Movie",top10Movie);
		
		ArrayList<VideoIdDto> viewingContents = new ArrayList<VideoIdDto>();
		try {
			viewingContents = vIDao.viewingContents();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("viewingContents", viewingContents);
		
		
		
		ArrayList<VideoIdDto> dibContents = new ArrayList<VideoIdDto>();
		try {
			dibContents = vIDao.dibContents();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("dibContents", dibContents);
		
		
		
		ArrayList<VideoIdDto> dPI = new ArrayList<VideoIdDto>();
		try {
			dPI = vIDao.dramaPosterImage();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("dPI", dPI);
		
		
		
		ArrayList<VideoIdDto> vI = new ArrayList<VideoIdDto>();
		try {
			vI = vIDao.moviePosterImage();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("vI", vI);
		
		
		
		
		request.getRequestDispatcher("netflixMovie.jsp").forward(request, response);
	}
}
