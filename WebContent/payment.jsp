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
			Statement stmt=conn.createStatement();
			PreparedStatement pstmt=null;
			
			//temporary
			String input_cafename="KONA";
			int input_amout=18000;
			String input_payment="카드";
			int input_number_of_menu=3;
			String[] input_menu_category= {"coffee","latte","coffee"};
			String[] input_menu_name= {"아메리카노", "녹차라떼", "에스프레소"};
			int[] input_qty= {3,2,1};	
			
			query="select nvl(max(o_id),0) from corder";
			ResultSet rs=stmt.executeQuery(query);
			rs.next();
			int index=rs.getInt(1)+1;
			rs.close();
			
		    sql="insert into corder values(?,(select sysdate from dual),(select c_id from cafe where c_name=?),?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, index);
			pstmt.setString(2,input_cafename);
			pstmt.setInt(3,input_amout);
			pstmt.setString(4,input_payment);
			pstmt.executeUpdate();	
			
			sql="insert into order_menu values(?,(select a.m_id from menu a, menu_category b, cafe c where c.c_name=? and c.c_id=b.c_id and b.mc_name=? and b.mc_id=a.mc_id and a.m_name=?),?)";
			pstmt=conn.prepareStatement(sql);
			for(int i=0;i<input_number_of_menu;i++) {
				pstmt.setInt(1, index);
				pstmt.setString(2, input_cafename);
				pstmt.setString(3, input_menu_category[i]);
				pstmt.setString(4, input_menu_name[i]);
				pstmt.setInt(5, input_qty[i]);
				pstmt.executeUpdate();
			}
			
		    conn.commit();       
		    conn.setAutoCommit(true);       
		    pstmt.close();   
		    stmt.close();
		    conn.close();      
		} catch(Exception e) {       
			System.err.println("sql error = " + e.getMessage());         
		}
		%>
</body>
</html>