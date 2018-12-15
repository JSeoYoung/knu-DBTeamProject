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
			String input_c_name="KONA";
			String input_start_date="2018-11-16";
			String input_last_date="2018-11-16";
			
			query="select b.mc_id, b.mc_name from cafe a, menu_category b where a.c_name=? and a.c_id=b.c_id";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1,input_c_name);
			ResultSet rs = pstmt.executeQuery();
			 
			System.out.println("cafe name: "+input_c_name+"\n\n");
			while(rs.next()) {
				int mc_id = rs.getInt("mc_id");
				String mc_name = rs.getString("mc_name");
				System.out.println("menu category name: "+mc_name);
				
				query="select menu_name, menu_price, menu_qty, menu_price*menu_qty menu_total_price " + 
						"from (select b.m_id menu_idetifier, b.m_name menu_name, b.m_price menu_price " + 
						"      from menu_category a, menu b " + 
						"      where a.mc_id=? and a.mc_id=b.mc_id(+)) " + 
						"left outer join (select c.m_id menu_comparison, sum(c.o_qty) menu_qty " + 
						"                 from cafe a, corder b, order_menu c " + 
						"                 where a.c_name=? and a.c_id=b.c_id and b.o_date>=to_date(?,'YYYY/MM/DD') and b.o_date<=to_date(?,'YYYY/MM/DD hh24:mi:ss') and b.o_id=c.o_id " + 
						"                 group by c.m_id) " + 
						"on (menu_idetifier=menu_comparison)";
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1,mc_id);
				pstmt.setString(2, input_c_name);
				pstmt.setString(3, input_start_date);
				pstmt.setString(4, input_last_date+" 23:59:59");
				ResultSet rs1 = pstmt.executeQuery();
				while(rs1.next()) {
					if(rs1.getString(1)==null)
						break;
					String menu_name = rs1.getString(1);
					int menu_price = rs1.getInt(2);
					int menu_qty = rs1.getInt(3);
					int menu_total_price = rs1.getInt(4);
					System.out.println(menu_name+"  "+menu_price+" "+menu_qty+" "+menu_total_price);
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