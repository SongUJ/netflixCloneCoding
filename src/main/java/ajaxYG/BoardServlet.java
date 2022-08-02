//package ajaxYG;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.json.simple.JSONObject;
////커넥션 Dao에서 받아올 수 있음
//@WebServlet("/BoardServlet")
//public class BoardServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		//System.out.println("요청이 들어옴!" + request.getParameter("board_num"));
//		//request.getParameter("이름2") --> 값2 
//		//request.getParameter("이름3") --> 값3
//		int bno = Integer.parseInt(request.getParameter("board_num"));
//		
//		String driver = "oracle.jdbc.driver.OracleDriver";
//		String url = "jdbc:oracle:thin:@192.168.19.142:1521:xe";
//		String dbId = "test0616";
//		String dbPw = "1234";
//		
//		Connection conn = null;
//		try {
//			Class.forName(driver);
//			conn = DriverManager.getConnection(url,dbId,dbPw);
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		String sql = "update simple_board set title=title || '!' where bno = ?";
//		int result = 0;
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1,bno);
//			result = pstmt.executeUpdate(); //result가 여기서 1이됨(?)..
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		response.setContentType("application/json");//응답을 json형식으로 만들겠다는 선언
//		PrintWriter out = response.getWriter(); //응답을 작성할 수 있는 Writer를 얻음.
//		JSONObject obj = new JSONObject(); //무한스크롤은 JSONArray로...
//		
//		if(result==1) {
//			//update문 정상적으로 실행됨.
//			obj.put("result", "OKAY");
//		}else {
//			//update문 실행중 문제 발생.
//			obj.put("result", "FAIL");
//		}
//		out.println(obj);
//		
//		// sql에서 || 은 문자 결합
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("포스트가 들어옴!");
//	}
//
//}
