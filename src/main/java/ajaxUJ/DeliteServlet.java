package ajaxUJ;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.uj.dao.CommentBoxDao;
import com.uj.dto.CommentBoxDto;
import com.yg.dao.DBConnection;


@WebServlet("/DeliteServlet")
public class DeliteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DeliteServlet에 들어옴");
		
		int commentId = Integer.parseInt(request.getParameter("comment_id"));
		int movieDramaId = Integer.parseInt(request.getParameter("movie_drama_id"));
		int memberId = Integer.parseInt(request.getParameter("member_id"));
		Connection conn = DBConnection.getConnection();
		int result = 0;
		String sql = "delete from grade_board where comment_id = ?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,commentId);
			pstmt.executeUpdate();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		
//		DeliteDao dao = new DeliteDao();
//		try {
//			dao.delite(commentId);
//		} catch (Exception e1) {
//			e1.printStackTrace();
//		}
		CommentBoxDao myCommentDao = new CommentBoxDao();
		ArrayList<CommentBoxDto> listDto = new ArrayList<CommentBoxDto>();
		try {
			listDto = myCommentDao.userCommentDataMyComment(movieDramaId,memberId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json"); // '응답을 json형식으로 만들겠다'는 선언.
		PrintWriter out = response.getWriter();
		
		JSONArray array = new JSONArray();
		for(CommentBoxDto dto : listDto) {
			JSONObject obj = new JSONObject();
			obj.put("user_grade",dto.getUserGrade());
			obj.put("comment_id",dto.getCommentId());
			obj.put("profile_id",dto.getProfileId());
			obj.put("user_comment",dto.getUserComment());
			obj.put("comment_date",dto.getCommentDate());
			obj.put("like_hitcount",dto.getLikeHitCount());
			obj.put("unlike_hitcount",dto.getUnlikeHitCount());
			array.add(obj);
		}
		
		out.println(array);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
