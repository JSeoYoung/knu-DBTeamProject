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
		String query = null;
		//
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
			String input_cafename="KONA";
			 
			query="select mc_id, mc_name from menu_category where c_id=(select c_id from cafe where c_name=?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,input_cafename);
			ResultSet rs=pstmt.executeQuery();
			query="select m_name, m_price from menu where mc_id=?";
			pstmt=conn.prepareStatement(query);
			ResultSet rs1=null;
			while(rs.next()) {
				int id=rs.getInt(1);
				String menu_category_name=rs.getString("mc_name");
				System.out.println("menu category name is '"+menu_category_name+"'");;
				pstmt.setInt(1, id);
				rs1=pstmt.executeQuery();
				while(rs1.next()) {
					String menu_name=rs1.getString("m_name");
					int menu_price=rs1.getInt(2);
					System.out.println(menu_name+"  "+menu_price);
				}
				rs1.close();
				System.out.println("\n");
			}
			rs.close();
		    
		    conn.commit();       
		    conn.setAutoCommit(true);  
		    pstmt.close();
		    conn.close();
		} catch(Exception e) {       
			System.err.println("sql error = " + e.getMessage());         
		}
		%>

</body>
</html>