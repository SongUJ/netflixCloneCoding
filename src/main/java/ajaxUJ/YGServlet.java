package ajaxUJ;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.uj.dto.MovieDramaMainDto;
//커넥션 Dao에서 받아올 수 있음
@WebServlet("/YGServlet")
public class YGServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("YGServlet 요청 들어옴!");
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

		String sql = "select priview,string_age,title,release_day,age,director,actor,genre,summary,priview_image,title_image,first_video"
					+ " from movie_drama_main"
					+ " where movie_drama_id=?";
		PreparedStatement pstmt;
		
		String title = "";
		String releaseDay = "";
		int age = 0;
		String director = "";
		String actor = "";
		String genre = "";
		String summary = "";
		String priviewImage = "";
		String titleImage = "";
		String firstVideo = "";
		String stringAge = "";
		String priview = "";
		
		MovieDramaMainDto dto = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, movieDramaId);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				title = rs.getString("title");
				releaseDay = rs.getString("release_day");
				age = rs.getInt("age");
				director = rs.getString("director");
				actor = rs.getString("actor");
				genre = rs.getString("genre");
				summary = rs.getString("summary");
				priviewImage = rs.getString("priview_image");
				titleImage = rs.getString("title_image");
				firstVideo = rs.getString("first_video");
				stringAge = rs.getString("string_age");
				priview = rs.getString("priview");
				dto = new MovieDramaMainDto(stringAge,priview,title,releaseDay, age, director, actor, genre, summary, priviewImage, titleImage, firstVideo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		response.setContentType("application/json");//응답을 json형식으로 만들겠다는 선언
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter(); //응답을 작성할 수 있는 Writer를 얻음.
		JSONObject obj = new JSONObject(); //무한스크롤은 JSONArray로...
		
		obj.put("title", dto.getTitle());
		obj.put("release_day", dto.getReleaseDay());
		obj.put("age", dto.getAge());
		obj.put("director", dto.getDirector());
		obj.put("actor", dto.getActor());
		obj.put("genre", dto.getGenre());
		obj.put("summary", dto.getSummary());
		obj.put("priview_image", dto.getPriviewImage());
		obj.put("title_image", dto.getTitleImage());
		obj.put("first_video", dto.getFirstVideo());
		obj.put("string_age", dto.getStringAge());
		obj.put("priview", dto.getPriview());
		
//		if(result==1) {
//			//update문 정상적으로 실행됨.
//			obj.put("result", "OKAY");
//		}else {
//			//update문 실행중 문제 발생.
//			obj.put("result", "FAIL");
//		}
//		obj.put("result", "이 테스트 문자열이 잘 담기나?");
		out.println(obj);
		
		// sql에서 || 은 문자 결합
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("포스트가 들어옴!");
	}

}
