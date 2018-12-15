<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page language="java" import="java.text.*, java.sql.*"%>
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

		Class.forName("oracle.jdbc.driver.OracleDriver");
//		System.out.println("드라이버 검색 성공!");

		conn = DriverManager.getConnection(url, user, pass);

		conn.setAutoCommit(false);
		Statement stmt = conn.createStatement();
		query = "select * from host";
		ResultSet rs = stmt.executeQuery(query);
	%>

	<h5>A List of HOST tuples</h5>
	<%
		out.println("<table>");

		ResultSetMetaData rsmd = rs.getMetaData();
		int cnt = rsmd.getColumnCount();

		for (int i = 1; i <= cnt; i++) {
			out.println("<th>" + rsmd.getColumnName(i) + "</th>");
		}

		while (rs.next()) {

			String id = rs.getString("h_id");
			String pw = rs.getString("h_pw");

			out.println("<tr>");
			out.println("<td>" + rs.getString("h_id") + "</td>");
			out.println("<td>" + rs.getString("h_pw") + "</td>");
			out.println("</tr>");
			//	System.out.println(" ID= " + id + ", PW= " + pw);
		}

		out.println("</table>");
		rs.close();
		conn.commit();
		conn.setAutoCommit(true);
		stmt.close();
		conn.close();
	%>
</body>
</html>