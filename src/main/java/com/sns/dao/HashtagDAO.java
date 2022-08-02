package com.sns.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sns.dto.HashtagDTO;

public class HashtagDAO {

	//오른쪽 상단바 실간 트렌드 순위보여줌
	public ArrayList<HashtagDTO> trendRank() throws Exception{
		ArrayList<HashtagDTO> hList = new ArrayList<HashtagDTO>();
		
		Connection conn = DBConnection.getConnection();
		
		String	sql = "select ht.hashtag_name,count(p.content)" + "from hashtag ht, post p , post_hashtag pht "
				+ " where ht.hashtag_id = pht.hashtag_id " + "and p.post_id = pht.post_id "
/* 				+ " and to_char(p.write_date,'mm.dd') = to_char(sysdate, 'mm.dd') " */
				+ " group by hashtag_name "
				+ " order by count(p.content) desc";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		ResultSet rs = pstmt.executeQuery();
			int cnt = 0;
			while(rs.next()){	
				cnt++;
				if(cnt>6) {
					break;
				}
				String hashtagName = rs.getString("hashtag_name");
				int hashtagCnt = rs.getInt("count(p.content)");
				HashtagDTO hDto = new HashtagDTO(hashtagName, hashtagCnt );
				hList.add(hDto);
						
			}
			return hList;
		
	}

}
