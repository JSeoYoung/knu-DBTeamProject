<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"  %>


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
		System.err.println("sql error = " + e.getMessage());
		System.exit(1);
	}
	try {
		conn.setAutoCommit(false);
		Statement stmt = conn.createStatement();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		String confirm_password = request.getParameter("confirm_password");
		String name = request.getParameter("name");
		String cellphone = request.getParameter("cellPhone");
		
		// 전화번호의 - 를 저장할수 없어 추출합니다.
		String[] array = cellphone.split("-");
		cellphone = "";
		for(int i=0;i<array.length;i++)
			cellphone += array[i];
		
		
		sql = "insert into member values("+id+",'"+pw+"','"+name+"','"+cellphone+"')";
		
		result = stmt.executeUpdate(sql);
		System.out.println(result + " row inserted");
		
		
		conn.commit();
		conn.setAutoCommit(true);
		stmt.close();
		conn.close();
	} catch (Exception e) {
		System.err.println("sql error = " + e.getMessage());
	}
	
%>
	<%=sql %>
</body>
</html>