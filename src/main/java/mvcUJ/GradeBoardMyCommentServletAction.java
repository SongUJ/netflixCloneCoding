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

public class GradeBoardMyCommentServletAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("mvc 내가 쓴 글!!!!!!!");
		int movieDramaId = Integer.parseInt(request.getParameter("movie_drama_id"));
		int memberId = Integer.parseInt(request.getParameter("member_id"));
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
		
		CommentBoxDao dao = new CommentBoxDao();
		ArrayList<CommentBoxDto> listDto = null;
		try {
			listDto = dao.userCommentDataMyComment(movieDramaId,memberId);
			System.out.println("listDto : " + listDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
//		String sql = "select gb.user_grade,gb.comment_id,gb.profile_id,gb.user_comment,gb.comment_date,gb.like_hitcount,gb.unlike_hitcount\n"
//				+ "from member m,profile p,grade_board gb,movie_drama_main mdm\n"
//				+ "where m.member_id = p.member_id\n"
//				+ "and p.profile_id = gb.profile_id\n"
//				+ "and mdm.movie_drama_id = gb.movie_drama_id\n"
//				+ "and gb.movie_drama_id = ? \n"
//				+ "and m.member_id = ? \n"
//				+ "and gb.profile_id = 1";
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1,movieDramaId);
//			pstmt.setInt(2,memberId);
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
		request.setAttribute("gradeBoardMyCommentServletAction", array);
	}

}
