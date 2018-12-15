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
			 String input_cafename="칼디";
			 
			 query="select * from poster where c_id=(select c_id from cafe where c_name=?)";
			 pstmt=conn.prepareStatement(query);
			 pstmt.setString(1,input_cafename);
			 ResultSet rs = pstmt.executeQuery();
			 
			 while(rs.next()) {
				 String poster_file_name = rs.getString("p_imgfm");
				 System.out.println(poster_file_name);
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