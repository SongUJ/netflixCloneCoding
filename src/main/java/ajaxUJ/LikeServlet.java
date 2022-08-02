package ajaxUJ;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.uj.dao.LikeDao;
import com.uj.dto.LikeDto;

@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("좋아요 요청들어옴!");
		int commentId = Integer.parseInt(request.getParameter("commentId"));
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
		
//		ProfileGetDao pDao = new ProfileGetDao();
//		pDao.profileId(memberId);
		
//		String sql1 = "select gb.profile_id\n"
//				+ "from member m , profile p , grade_board gb\n"
//				+ "where m.member_id = p.member_id\n"
//				+ "and p.profile_id = gb.profile_id\n"
//				+ "and p.member_id = ?\n"
//				+ "and gb.profile_id = 1";
//		PreparedStatement pstmt;
//		ProfileGetDto pDto = null;
//		try {
//			pstmt = conn.prepareStatement(sql1);
//			pstmt.setInt(1,memberId);
//			ResultSet rs = pstmt.executeQuery();
//			if(rs.next()) {
//				int profileId = rs.getInt("profile_id");
//				pDto = new ProfileGetDto(profileId);
//				
//			}
//			int result = 0;
//			String sql2 = "insert into like_manage_board values(?,?)";
//			pstmt = conn.prepareStatement(sql2);
//			pstmt.setInt(1,pDto.getProfileId());
//			pstmt.setInt(2,commentId);
//			rs = pstmt.executeQuery();
//
//			
//			String sql = "update grade_board set like_hitcount=like_hitcount+1 where comment_id = ?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1,commentId);
//			result = pstmt.executeUpdate();
//			
//			response.setContentType("application/json");
//			PrintWriter out = response.getWriter();
//			JSONObject obj = new JSONObject();
//			
//			System.out.println("좋아요.");
//			out.println(obj);
//		}catch (SQLIntegrityConstraintViolationException e) {
//			String sql4 = "delete from like_manage_board where profile_id = ? and comment_id = ?";
//			pstmt = conn.prepareStatement(sql4);
//			pstmt.setInt(1,pDto.getProfileId());
//			pstmt.setInt(2,commentId);
//			pstmt.executeUpdate();
//
//			pstmt.close();
//			
//			String sql = "update grade_board set like_hitcount=like_hitcount-1 where comment_id = ?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1,commentId);
//			pstmt.executeUpdate();
//			
//			
//			
//			}catch (Exception e1) {
//				e1.printStackTrace();
//			}
		int like = 0;
		LikeDao dao = new LikeDao();
		ArrayList<LikeDto> dtoList =null;
		try {
			like = dao.like(commentId,memberId);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		response.setContentType("application.json");
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		
		
//		if(result==1) {
//			obj.put("result", "OKAY");
//		}else {
//			obj.put("result", "FAIL");
//		}
		obj.put("like", like);
		out.println(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
