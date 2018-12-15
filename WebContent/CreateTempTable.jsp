<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>임시테이블 생성입니다.</title>
</head>
<body>
	<%
		String url = "jdbc:oracle:thin:@localhost:1521:oraknu";
		String user = "dbtp";
		String pass = "dbtp";
		Connection conn = null;
		String sql = null;
		String query = null;
		int result;
		String cid = request.getParameter("cid");
		String input_cafename = "";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 검색 성공!");
		} catch (ClassNotFoundException e) {
			System.err.println("error = " + e.getMessage());
			System.exit(1);
		}
		try {
			conn = DriverManager.getConnection(url, user, pass);
		} catch (SQLException e) {
			System.err.println("sql error = 그럼 여긴가 " + e.getMessage());
			System.exit(1);
		}
		try {
			query = "select c_name from cafe where c_id=?";
			PreparedStatement pstmt = null;
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(cid));
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				input_cafename = rs.getString(1);
			}
			rs.close();
		} catch (SQLException e) {
			System.err.println("sql error = " + e.getMessage());
			System.exit(1);
		}
		try {
			conn.setAutoCommit(false);
			Statement stmt = conn.createStatement();
			Boolean flag=true;

			// query = "select * from Test_TT where name = ? and hi = ?";
			PreparedStatement pstmt = null;

			// 받아야 할것 : 1) 카페이름, 2) 메뉴이름, 3) 가격		
			/*
				String cafe_name = "KONA";
				String menu_name = "아메리카노";
				int price = 3000;
				String table_name="temp_"+cafe_name;
			*/
			
			
			
			String C_name = "KONA";
			String menu_name = request.getParameter("mname");
			String _price = request.getParameter("mprice");
			
			int price = Integer.parseInt(_price);
			
			query="select t_qty from "+"Test_TT"+" where t_menu=?";
	         pstmt=conn.prepareStatement(query);
	         pstmt.setString(1, menu_name);
	         ResultSet rs = pstmt.executeQuery();
	         System.out.println("5");
	         while(rs.next()) {
	        	System.out.println(rs.getString("t_qty"));
	        	int qty=rs.getInt("t_qty");
	            flag=false;
	            System.out.println("1");
	            sql="update "+"Test_TT"+" set t_qty=t_qty+1 where t_menu=?";
	            pstmt=conn.prepareStatement(sql);
	            System.out.println("3");
	            //pstmt.setInt(1,qty+1);
	            pstmt.setString(1, menu_name);
	            System.out.println("4");
	            result = pstmt.executeUpdate();
	            if(result==1) System.out.println("ok");
	            sql="update "+"Test_TT"+" set t_total=t_qty*t_price where t_menu=?";
	            pstmt=conn.prepareStatement(sql);
	            pstmt.setString(1, menu_name);
	            pstmt.executeUpdate();
	         }
	         rs.close();
	         stmt.close();
	         System.out.println("2");
	         if(flag) {
	            sql="insert into " + "Test_TT" + " values(?,1,?,?)";
	            pstmt=conn.prepareStatement(sql);
	            pstmt.setString(1, menu_name);
	            pstmt.setInt(2,price);
	            pstmt.setInt(3,price);
	            result = pstmt.executeUpdate();
	         }
	         
	         pstmt.close();

			conn.commit();
			conn.setAutoCommit(true);
			stmt.close();
			conn.close();
		} catch (Exception e) {
			System.err.println("sql error = " + e.getMessage());
		}
		
		response.sendRedirect("get_pos_items.jsp?cid="+String.valueOf(cid));

	%>
</body>
</html>