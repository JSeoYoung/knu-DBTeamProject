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
			System.out.println("����̹� �˻� ����!");
		} catch (ClassNotFoundException e) {
			System.err.println("error = " + e.getMessage());
			System.exit(1);
		}
		try {
			conn = DriverManager.getConnection(url, user, pass);
		} catch (SQLException e) {
			System.err.println("sql error = �׷� ���䰡 " + e.getMessage());
			System.exit(1);
		}
		
		try {
			
			String action = request.getParameter("action");
			String menu_name = request.getParameter("mname");
			
			conn.setAutoCommit(false);
			PreparedStatement pstmt = null;
			
			System.out.println("value="+action);
			if(action.equals("plus")){
				System.out.println("plus");
				sql = "update temp_"+cid+" set t_qty=t_qty+1 where t_menu=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, menu_name);
				pstmt.executeUpdate();
			} else if(action.equals("minus")){
				System.out.println("minus");
				query = "select t_qty from temp_"+cid+" where t_menu=?";
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, menu_name);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()){
					int qty = rs.getInt(1);
					if(qty==1){
						sql = "delete from temp_"+cid+" where t_menu=?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, menu_name);
						pstmt.executeUpdate();
					} else{
						sql = "update temp_"+cid+" set t_qty=t_qty-1 where t_menu=?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, menu_name);
						pstmt.executeUpdate();
					}
				}
			}

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