package ajaxUJ;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.uj.dto.CommentBoxDto;
import com.uj.dto.GradeDto;

@WebServlet("/GradeServlet")
public class GradeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("평점!!!!");
		int movieDramaId = Integer.parseInt(request.getParameter("movie_drama_id"));
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@192.168.1.12:1521:xe";
		String dbId = "oraclePort";
		String dbPw = "1234";

		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,dbId,dbPw);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		String sql = "select round(avg(sum(ug.user_grade)/count(gb.grade_id)),2) as 평점, \n"
				+ "count(gb.grade_id) as 참여 \n"
				+ "from grade_board gb,user_grade ug,movie_drama_main mdm \n"
				+ "where gb.profile_id = ug.profile_id \n"
				+ "and mdm.movie_drama_id = gb.movie_drama_id \n"
				+ "and gb.movie_drama_id = ?\n"
				+ "group by ug.user_grade,gb.grade_id";
		PreparedStatement pstmt;
		
		GradeDto dto = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,movieDramaId);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next() ) {
				double grade = rs.getDouble("평점");
				int participation = rs.getInt("참여");
				
				dto = new GradeDto(grade,participation);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.setContentType("application/json");//응답을 json형식으로 만들겠다는 선언
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter(); //응답을 작성할 수 있는 Writer를 얻음.
		JSONObject obj = new JSONObject(); //무한스크롤은 JSONArray로...
		
		obj.put("grade",dto.getGrade());
		obj.put("participation",dto.getParticipation());
			
		
		out.println(obj);
		request.setAttribute("GradeServlet", obj);
//		request.getRequestDispatcher("index.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
