package ajaxSY;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.sns.dao.DBConnection;
import com.sns.dao.LikeManageDAO;

@WebServlet("/LikeManageServlet")
public class LikeManageServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("좋아요 요청이 들어옴");

		int postID = Integer.parseInt(request.getParameter("postID"));
		System.out.println("postID : " + postID);
		int loginID = Integer.parseInt(request.getParameter("loginId"));
		System.out.println("loginID : " + loginID);
		LikeManageDAO dao = new LikeManageDAO();
		
		int like = 0;
	
		try {
			like = dao.likeManage(postID,loginID);	// 1 : 하트채움, -1 : 하트뺌, 0 : 무언가이상함(에러).
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		response.setContentType("application/json"); // 응답을 json형식으로 만들겠다
		PrintWriter out = response.getWriter(); // 응답을 작성할 수 있는 writer얻음
		JSONObject obj = new JSONObject(); // "JsonObject"---> json-simple
	  
//		  if(like) { //update문 정상적으로 실행됨 
//			  obj.put("result","okay");
//			
//		  } else { //update문 실행중 문제 발생 
//			  obj.put("result","fail");
//		  
//		  } 
		obj.put("like", like);   // 1:하트채움, -1:하트뺌, 0:에러.
	  	out.println(obj);
	  
	  }
	  
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
