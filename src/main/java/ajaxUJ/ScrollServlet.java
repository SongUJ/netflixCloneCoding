package ajaxUJ;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.uj.dao.VideoIdDao;
import com.uj.dto.VideoIdDto;

@WebServlet("/ScrollServlet")
public class ScrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageNum = Integer.parseInt(request.getParameter("page"));
		int startPage = pageNum * 9 - 8;
		int endPage = pageNum * 9;
		
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
		
		VideoIdDao dao = new VideoIdDao();
		ArrayList<VideoIdDto> listDto = null;
		try {
			listDto = dao.dramaInfinityScroll(startPage, endPage);
		} catch (Exception e) {
			e.printStackTrace();
		}
//		String sql = "select movie_drama_id,poster_image "
//				+ "from(select rownum rnum, s1.movie_drama_id,poster_image "
//				+ "from(select movie_drama_id,poster_image from movie_drama_main where movie_drama_id >= 1 and movie_drama_id <= 157)s1)s2 "
//				+ "where rnum>=? and rnum<=?"
//				+ "order by dbms_random.random()";
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1,startPage);
//			pstmt.setInt(2,endPage);
//			ResultSet rs = pstmt.executeQuery();
//			while(rs.next()) {
//				int movieDramaId = rs.getInt("movie_drama_id");
//				String posterImage = rs.getString("poster_image");
//				listDto.add(new VideoIdDto(movieDramaId,posterImage));
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
		for(VideoIdDto dto :  listDto) {
			JSONObject obj = new JSONObject();
			obj.put("movie_drama_id",dto.getMovieDramaId());
			obj.put("poster_image",dto.getPosterImage());
			array.add(obj);
		}
		out.println(array);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
