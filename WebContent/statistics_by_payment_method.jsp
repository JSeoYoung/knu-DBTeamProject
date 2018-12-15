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
			String input_c_name="KONA";
			String input_start_date="2018-11-15";
			String input_last_date="2018-11-16";
			
			query="select b.o_pay, sum(b.o_amt) amount " + 
					"from cafe a, corder b " + 
					"where a.c_name=? and a.c_id=b.c_id and b.o_date>=to_date(?,'YYYY/MM/DD') and b.o_date<=to_date(?,'YYYY/MM/DD hh24:mi:ss')" +
					"group by b.o_pay";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1,input_c_name);
			pstmt.setString(2,input_start_date);
			pstmt.setString(3,input_last_date+" 23:59:59");
			ResultSet rs = pstmt.executeQuery();
			 
			System.out.println("cafe name: "+input_c_name+"\n\n");
			while(rs.next()) {
				String payment_method = rs.getString("o_pay");
				int amount = rs.getInt(2);
				System.out.println("payment method: "+payment_method);
				System.out.println("total amount: "+amount);
				System.out.println();
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