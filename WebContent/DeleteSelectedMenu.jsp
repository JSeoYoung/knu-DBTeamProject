<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
			
			String menu_name = request.getParameter("mname");
			System.out.println(menu_name);
			conn.setAutoCommit(false);
			PreparedStatement pstmt = null;
			
			String C_name = "KONA";
			
			sql = "Delete from temp_"+cid+" where t_menu=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, menu_name);
			pstmt.executeUpdate();

			conn.commit();
			conn.setAutoCommit(true);
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.err.println("sql error = " + e.getMessage());
		}
		
		response.sendRedirect("get_pos_items.jsp?cid="+String.valueOf(cid));

	%>
</body>
</html>