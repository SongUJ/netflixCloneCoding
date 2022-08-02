package board;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDao {		
	public ArrayList<BoardDto> getBoardListStartEnd(int startBno, int endBno) throws Exception {
		Connection conn = DBConnection.getConnection();
		
		ArrayList<BoardDto> listBoard = new ArrayList<BoardDto>();
		String sql = "select *"
					+ " from (select rownum rnum, b1.*"
					+ " from (SELECT * FROM simple_board ORDER BY bno DESC) b1) b2"
					+ " where rnum>=? and rnum<=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, startBno);
		pstmt.setInt(2, endBno);
		ResultSet rs = pstmt.executeQuery();	
		while(rs.next()) {		
			int bno = rs.getInt("bno");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String writer = rs.getString("writer");
			String writedate = rs.getString("writedate");
			BoardDto dto = new BoardDto(bno,title,content,writer,writedate);
			listBoard.add(dto);
		}
		return listBoard;
	}
	
	public void insertBoard(String title, String content, String writer) throws Exception {
		Connection conn = DBConnection.getConnection();
		
		String sql = "INSERT INTO simple_board(bno,title,content,writer,writedate) VALUES(seq_board.nextval,?,?,?,sysdate)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, writer);
		pstmt.executeUpdate();
	}
}










