package mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalculateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		int result = num1 + num2;
		
		request.setAttribute("num1", num1); //Attribute는 출력하기위해
		request.setAttribute("num2", num2);
		request.setAttribute("result", result);
		
		RequestDispatcher rd = request.getRequestDispatcher("Controller?command=result");//외우기 
		rd.forward(request,  response);//외우기 
	}
	
}
