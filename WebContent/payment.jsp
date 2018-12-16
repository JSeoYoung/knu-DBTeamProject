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
		String user="dbtp";
		String pass ="dbtp";  
		Connection conn = null;  
		String sql = null;  
		String query = null;
		String query1 = null;
		String query2 = null;
		String cid = request.getParameter("cid");
		String payment = request.getParameter("payment");
		String input_payment = null;
		
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
			
			query2= "select c_name from cafe where c_id ="+cid;
			
			ResultSet rs2 = stmt.executeQuery(query2);
			rs2.next();
			String input_cafename=rs2.getString(1);
			rs2.close();
			stmt.close();
			
			if(payment.equals("1")){
				input_payment="카드";
			}
			else if(payment.equals("2")){
				input_payment="현금";
			}
			
			System.out.println(input_cafename);
			
			//int number = 0;
			
			stmt=conn.createStatement();
			query1="select nvl(max(o_id),0) from corder";
			ResultSet rs=stmt.executeQuery(query1);
			rs.next();
			int index=rs.getInt(1)+1;
			System.out.println(index);
			System.out.println(input_cafename);
			System.out.println(cid);
			rs.close();
			stmt.close();
			
			//String T_menu ;
			//int T_qty ;
			//int T_price ;
			int T_total = 0;
			
			stmt=conn.createStatement();
			query = "select sum(t_total) w from TEST_TT";
			ResultSet rs1=stmt.executeQuery(query);
			
			while(rs1.next()){
				// Test_TT 의 변수 4가지를 불러옴
				T_total += rs1.getInt(1);
				System.out.println(T_total);
			}
			rs1.close();
			stmt.close();
			//String pay_ = request.getParameter("payment");
			
			sql="insert into corder values(?,(select sysdate from dual),?,?,?)";
			System.out.println("1");
			
			pstmt = conn.prepareStatement(sql);
			System.out.println("2");
			pstmt.setInt(1, index);
			pstmt.setInt(2,Integer.parseInt(cid));
			pstmt.setInt(3,T_total);
			pstmt.setString(4,"카드");
			System.out.println("3");
			pstmt.executeUpdate();
			System.out.println("4");
			System.out.println("clear corder!!!!");
			
			stmt=conn.createStatement();
			query = "select * from TEST_TT";
			rs1=stmt.executeQuery(query);
			
			// 2번째 파라미터 : cafe 의 이름 , 3번째 파라미터 : menu 의 이름
			sql="insert into order_menu values(?,(select a.m_id from menu a, cafe c where c.c_id=? and c.c_id=a.c_id and a.m_name=?),?)";
	         pstmt=conn.prepareStatement(sql);
	         while(rs1.next()){
	        	 	pstmt.setInt(1, index);
		            pstmt.setInt(2, Integer.parseInt(cid));
		            pstmt.setString(3, rs1.getString("T_MENU"));
		            pstmt.setInt(4, rs1.getInt("T_qty"));
		            pstmt.executeUpdate();
	         }
	         rs1.close();
	         
		    conn.commit();       
		    conn.setAutoCommit(true);       
		    pstmt.close();   
		    stmt.close();
		    conn.close();      
		} catch(Exception e) {       
			System.err.println("sql error = " + e.getMessage());         
		}
		
		response.sendRedirect("get_pos_items.jsp?cid="+cid);
		%>
</body>
</html>