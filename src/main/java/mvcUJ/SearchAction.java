package mvcUJ;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("SearchAction에 들어옴!");

		request.getRequestDispatcher("netflixSearch.jsp").forward(request, response);
	}

}
