//package snsajax;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.json.simple.JSONObject;
//
//import com.sns.dao.LikeManageDAO;
//
//@WebServlet("/LikeManageServlet")
//public class LikeManageServlet extends HttpServlet {
//
//	private static final long serialVersionUID = 1L;
//
//	public LikeManageServlet() {
//
//	}
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//		System.out.println("요청이 들어옴");
//
//		int loginID = 1;
//		
//		int postID = Integer.parseInt(request.getParameter("postID"));
//		LikeManageDAO dao = new LikeManageDAO();
//		boolean like = true;
//		/* boolean pushLike = true; */
//		try {
//			like = dao.likeManage(postID);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//
//		response.setContentType("application/json"); // 응답을 json형식으로 만들겠다
//		PrintWriter out = response.getWriter(); // 응답을 작성할 수 있는 writer얻음
//		JSONObject obj = new JSONObject(); // "JsonObject"---> json-simple
//	  
//		  if(like) { //update문 정상적으로 실행됨 
//			  obj.put("result","okay");
//			
//		  } else { //update문 실행중 문제 발생 
//			  obj.put("result","fail");
//		  
//		  } 
//	  	out.println(obj);
//	  
//	  }
//	  
//	 
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//
//	}
//
//}
