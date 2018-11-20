<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-eqiov="Content-Type" content="text/html; charset=EUC-KR">
<title>Web -> 톰캣 서버를 통한(JSP파일 사용) JDBC 연동 및 확인</title>
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
				 Statement stmt = conn.createStatement();
				 sql = "create table member1 (" +
				 "id int,pw varchar2(20),name varchar2(20),cellphone varchar2(20),primary key(id) )";
				 result = stmt.executeUpdate(sql);
				 if (result == 0)
				System.out.println("table created!!!");
				 conn.commit();
				 conn.setAutoCommit(true);
				 stmt.close();
				 conn.close();
				 } catch(Exception e) {
				 System.err.println("sql error = " + e.getMessage());
				 }
			
    %>
    
</body>
</html>