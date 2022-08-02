package mvcUJ;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.uj.dao.CommentBoxDao;
import com.uj.dto.CommentBoxDto;

public class GradeBoardRecentServletAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("mvc 최신순 요청 들어옴!");
		int movieDramaId = Integer.parseInt(request.getParameter("movie_drama_id"));
		System.out.println("movieDramaId = " + movieDramaId);
		
//		String driver = "oracle.jdbc.driver.OracleDriver";
//		String url = "jdbc:oracle:thin:@192.168.1.12:1521:xe";
//		String dbId = "oraclePort";
//		String dbPw = "1234";
//
//		Connection conn = null;
//		try {
//			Class.forName(driver);
//			conn = DriverManager.getConnection(url,dbId,dbPw);
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
		
		CommentBoxDao Dao = new CommentBoxDao();
		ArrayList<CommentBoxDto> listDto = null;
		try {
			listDto = Dao.userCommentDataRecent(movieDramaId);
		} catch (Exception e) {
			e.printStackTrace();
		}
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1,movieDramaId);
//			ResultSet rs = pstmt.executeQuery();
//			while(rs.next()) {
//				int userGrade = rs.getInt("user_grade");
//				int commentId = rs.getInt("comment_id");
//				int profileId = rs.getInt("profile_id");
//				String userComment = rs.getString("user_comment");
//				String commentDate = rs.getString("comment_date");
//				int likeHitCount = rs.getInt("like_hitcount");
//				int unlikeHitCount = rs.getInt("unlike_hitcount");
//				
//				listDto.add(new CommentBoxDto(userGrade,commentId,profileId,userComment,commentDate,likeHitCount,unlikeHitCount));
//			}
//			rs.close();
//			pstmt.close();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
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
		request.setAttribute("GradeBoardRecentServletAction",array);
	}

}
