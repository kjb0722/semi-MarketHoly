package com.market.admin.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.market.admin.dto.QnaAdminDto;
import com.market.db.JDBCUtil;

public class QnaAdminDao {
	public static QnaAdminDao instance = new QnaAdminDao();

	public static QnaAdminDao getInstance() {
		return instance;
	}

	private QnaAdminDao() {

	}

	public ArrayList<QnaAdminDto> selQnaList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = JDBCUtil.getConn();
			String sql = "select a.*,(select name from category where cnum in(b.cnum) and type in(b.type)) cname,b.name pname from qna a inner join product b on a.pnum = b.pnum order by ref desc,step asc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ArrayList<QnaAdminDto> list = new ArrayList<QnaAdminDto>();
			while (rs.next()) {
				int qnum = rs.getInt("qnum");
				String cname = rs.getString("cname");
				String pname = rs.getString("pname");
				String title = rs.getString("title");
				String name = rs.getString("name");
				Date reg_date = rs.getDate("reg_date");
				list.add(new QnaAdminDto(qnum,cname,pname,title,name,reg_date));
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			JDBCUtil.close(rs, pstmt, con);
		}
	}
}
