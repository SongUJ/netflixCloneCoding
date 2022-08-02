//package ajaxYG;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.json.simple.JSONArray;
//import org.json.simple.JSONObject;
//
//import com.yg.dto.SimpleBoardDto;
//
//@WebServlet("/BoardServlet2")
//public class BoardServlet2 extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("요청이 들어옴. page# = " + request.getParameter("page"));
//		int pageNum = Integer.parseInt(request.getParameter("page"));
//		int startPage = pageNum * 20 - 19;
//		int endPage = pageNum * 20;
//
//		String driver = "oracle.jdbc.driver.OracleDriver";
//		String url = "jdbc:oracle:thin:@localhost:1521:xe";
//		String dbId = "test0616";
//		String dbPw = "1234";
//		
//		Connection conn = null;
//		try {
//			Class.forName(driver);
//			conn = DriverManager.getConnection(url, dbId, dbPw);
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//		
//		ArrayList<SimpleBoardDto> listBoard = new ArrayList<SimpleBoardDto>();
//		// select문 --> String sql --> pstmt --> pstmt.executeQuery()
//		String sql = "select *"
//					+ " from (select rownum rnum, s1.*"
//					+ " from (SELECT * FROM simple_board ORDER BY bno DESC) s1) s2"
//					+ " where rnum>=? and rnum<=?";
//		PreparedStatement pstmt;
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, startPage);
//			pstmt.setInt(2, endPage);
//			ResultSet rs = pstmt.executeQuery();
//			while(rs.next()) {
//				int bno = rs.getInt("bno");
//				String writer = rs.getString("writer");
//				String title = rs.getString("title");
//				String content = rs.getString("content");
//				String writedate = rs.getString("writedate");
//				listBoard.add( new SimpleBoardDto(bno, writer, title, content, writedate) );
//			}
//			rs.close();
//			pstmt.close();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("application/json"); // '응답을 json형식으로 만들겠다'는 선언.
//		PrintWriter out = response.getWriter();   // '응답'을 작성할 수 있는 writer를 얻음.
//		
//		JSONArray array = new JSONArray();
//		for(SimpleBoardDto dto : listBoard) {
//			JSONObject obj = new JSONObject();   // "JSONObject" ---> json-simple
//			obj.put("writer",dto.getWriter());
//			obj.put("bno",dto.getBno());
//			obj.put("title",dto.getTitle());
//			obj.put("writedate",dto.getWritedate());
//			array.add(obj);
//		}
//		out.println(array);
//	}
//
////	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
////		System.out.println("post.");
////	}
//}
//
//
//
//
//
//
//
//
