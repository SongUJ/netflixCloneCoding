package foward;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AAServlet")
public class AAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AAServlet에 get 요청 도착함!");
		
		//Ex701b.jsp로 forward방식으로 이동.
		//request.getRequestDispatcher(다음페이지경로).forward(request, response);
		request.setAttribute("name","YG");
		request.getRequestDispatcher("Exfile/Ex701b.jsp").forward(request, response);
	}

}
