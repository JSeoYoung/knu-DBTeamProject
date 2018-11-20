<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
String user = "kdhong";
String pass = "kdhong";
Connection conn = null;
String sql = null;
String query = null;
int result;

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
	conn.setAutoCommit(false);
	Statement stmt = conn.createStatement();
	
	

	query = "select * from member where id = ? and pw = ?";
	PreparedStatement pstmt = null;
	
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	
	int numberid = Integer.parseInt(id);
	
	pstmt = conn.prepareStatement(query);
	
	pstmt.setInt(1,numberid);
	pstmt.setString(2,pw);
	
	ResultSet rs = pstmt.executeQuery();
	while (rs.next()) {
		String add = "(" + rs.getInt("id") + " )";
		add += rs.getString("pw") + " ";
		System.out.println(add);
	}
	rs.close();
	pstmt.close();

	conn.commit();
	conn.setAutoCommit(true);
	stmt.close();
	conn.close();
} catch (Exception e) {
	System.err.println("sql error = " + e.getMessage());
}
%>
</body>
</html>