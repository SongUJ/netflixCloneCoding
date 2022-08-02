package foward;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BBServlet")
public class BBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BBServlet에서 get요청 도착함!");
		
		//Ex701b.jsp로 redirect방식으로 이동
		//"response.sendRedirect(다음페이지경로);"
		
		request.setAttribute("name","YG");
		response.sendRedirect("Exfile/Ex701b.jsp");
	}

}
