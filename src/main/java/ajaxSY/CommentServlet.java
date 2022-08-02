//package ajaxSY;
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
//import com.sns.dao.CommentDAO;
//import com.sns.dto.CommentDTO;
//
//@WebServlet("/CommentServlet")
//public class CommentServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
//		int postID = Integer.parseInt(request.getParameter("postID"));
//		String comments = request.getParameter("comments");
//		
//		System.out.println(postID);
//		System.out.println(comments);
//		
//		CommentDAO cDAO = new CommentDAO();
//		int result = cDAO.addComment(postID, comments);   //  1: 성공, 0: 실패.
//		CommentDTO dto = cDAO.getRecentComment(postID);
//		
//		JSONObject obj = new JSONObject();
//		obj.put("result", result);
//		obj.put("comment_id", dto.getCommentID());
//		obj.put("post_id", dto.getPostID());
//		obj.put("comments", dto.getComments());
//		obj.put("nickname", dto.getNickname());
//		obj.put("profile_img", dto.getProfileImg());
//		obj.put("writedate", dto.getWriteDate());
//
//		response.setContentType("application/json");
//		response.setCharacterEncoding("utf-8");
//		PrintWriter out = response.getWriter();
//		out.println(obj);
//		
//	}
//
//}
