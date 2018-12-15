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
			String input_start_date="2018-11-16";
			String input_last_date="2018-11-16";
			
			query="select b.o_id, b.o_date, b.o_amt, b.o_pay " + 
					"from cafe a, corder b " + 
					"where a.c_name=? and a.c_id=b.c_id and b.o_date>=to_date(?,'YYYY/MM/DD') and b.o_date<=to_date(?,'YYYY/MM/DD hh24:mi:ss')" +
					"order by b.o_date";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1,input_c_name);
			pstmt.setString(2,input_start_date);
			pstmt.setString(3,input_last_date+" 23:59:59");
			ResultSet rs = pstmt.executeQuery();
			 
			System.out.println("cafe name: "+input_c_name+"\n\n");
			while(rs.next()) {
				String order_id = rs.getString("o_id");
				String order_date = rs.getString("o_date");
				String order_amount = rs.getString("o_amt");
				String order_pay = rs.getString("o_pay");
				System.out.println("order date: "+order_date);
				System.out.println("order amount: "+order_amount);
				System.out.println("order pay: "+order_pay);
				
				System.out.println("order list: ");
				query="select b.m_name, a.o_qty, a.o_qty*b.m_price from order_menu a, menu b where o_id=? and a.m_id=b.m_id";
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1,order_id);
				ResultSet rs1 = pstmt.executeQuery();
				while(rs1.next()) {
					String order_menu_name=rs1.getString("m_name");
					int order_menu_qty=rs1.getInt(2);
					int order_menu_all_price=rs1.getInt(3);
					System.out.println("   "+order_menu_name+" "+order_menu_qty+" "+order_menu_all_price);
				}
				rs1.close();
				System.out.println();			 
			}
			rs.close();		
			System.out.println();

			conn.commit();       
		    conn.setAutoCommit(true);       
		    conn.close();      
		} catch(Exception e) {       
			System.err.println("sql error = " + e.getMessage());         
		}
		%>
</body>
</html>