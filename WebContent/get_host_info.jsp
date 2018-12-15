<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
		String url="jdbc:oracle:thin:@localhost:1521:oraknu";
		String user="seoyoung";
		String pass = "2016117305";
		Connection conn = null;
		String sql = null;
		String query = null;
		int result;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 검색 성공!");
		}catch(ClassNotFoundException e) {
			System.err.println("error = " + e.getMessage());
			System.exit(1);
		}

		try{
			conn = DriverManager.getConnection(url,user,pass);
		}catch(SQLException e) {
			System.err.println("sql error = " + e.getMessage());
			System.exit(1);
		}

		try {
			conn.setAutoCommit(false);
			PreparedStatement pstmt=null;

			//temporary
			String input_h_name="yubin";

			query="select * from host where h_name=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1,input_h_name);
			ResultSet rs = pstmt.executeQuery();

			while(rs.next()) {
				String host_name = rs.getString("h_name");
				String host_tel = rs.getString("h_tel");
				String host_id = rs.getString("h_id");
				System.out.println("host name: "+host_name);
				System.out.println("host telephone: "+host_tel);
				System.out.println("host id: "+host_id);
			}
			rs.close();
			System.out.println();

			query="select * from cafe a, cafe_category b where a.h_id=(select h_sid from host where h_name=?) and a.cc_id=b.cc_id";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1,input_h_name);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				String cafe_name = rs.getString("c_name");
				String cafe_category = rs.getString("cc_name");
				String cafe_tel = rs.getString("c_tel");
				String cafe_addr = rs.getString("c_addr");
				String cafe_img = rs.getString("c_img");
				String cafe_start_date = rs.getString("c_start_date");
				System.out.println("cafe name: "+cafe_name);
				System.out.println("closest door: "+cafe_category);
				System.out.println("cafe telephone: "+cafe_tel);
				System.out.println("cafe address: "+cafe_addr);
				System.out.println("cafe image: "+cafe_img);
				System.out.println("cafe start date: "+cafe_start_date+"\n");
			}
			rs.close();


		    conn.commit();
		    conn.setAutoCommit(true);
		    conn.close();
		} catch(Exception e) {
			System.err.println("sql error = " + e.getMessage());
		}
		%>
</body>
</html>
