<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�����</title>
</head>
<body>
	
	<%
	request.setCharacterEncoding("UTF-8");	//�ѱ� �������� ����

		String url = "jdbc:oracle:thin:@localhost:1521:oraknu";
		String user = "dbtp";
		String pass = "dbtp";
		Connection conn = null;
		String query = null;
		String sql = null;
		int result = 0; 
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("����̹� �˻� ����!");
		} catch (ClassNotFoundException e) {
			System.err.println("error = " + e.getMessage());
			System.exit(1);
		}

		try {
			conn = DriverManager.getConnection(url, user, pass);
		} catch (SQLException e) {
			System.err.println("connect sql error = " + e.getMessage());
			System.exit(1);
		}

		try {
		
			boolean flag = true;
			String redirectUrl = "signup.jsp";
			
			conn.setAutoCommit(false);
			Statement stmt = conn.createStatement();
			PreparedStatement pstmt=null;

			String input_h_name= null;
			String input_h_tel= null;
			String input_h_id= null;
			String input_h_pw =null;
			
			input_h_id = request.getParameter("h_id");
			input_h_pw = request.getParameter("h_pw");
			input_h_tel = request.getParameter("h_tel");
			input_h_name = request.getParameter("h_name");

			
			 query = "select h_id from host";       
			 ResultSet rs = stmt.executeQuery(query);
		     while (rs.next()) {              
		    	 String id = rs.getString("h_id");
		    	 System.out.println("compare with '"+id+"'");
		    	 if(id.equals(input_h_id)) {
		    		 System.out.println("�ߺ��� id�� �ֽ��ϴ�.");
		    		 out.println("<script>");
						out.println("alert('�ߺ��� id�� �ֽ��ϴ�.');" + "location.href='"+ redirectUrl+"';");
						out.println("</script>");
						System.out.println("host insert ����!");
		    		 flag = false;
		    		 break;
		    	 }
		    }
		    rs.close();    
		    
		    if(flag) {
		    	System.out.println("insert new host");
		    	sql="insert into host values(seq_id.nextval,?,?,?,?)";
			    pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,input_h_name);
				pstmt.setString(2,input_h_tel);
				pstmt.setString(3,input_h_id);
				pstmt.setString(4,input_h_pw);
				result = pstmt.executeUpdate();
		    }
		    
		    if(result == 1){
		    	redirectUrl = "login.html";
		    	out.println("<script>");
				out.println("alert('ȸ�������� �Ϸ�Ǿ����ϴ�!.');" + "location.href='"+ redirectUrl+"';");
				out.println("</script>");
				System.out.println("host insert ����!");
		    	
		    }else{
		    	

		      	out.println("<script>");
				out.println("alert('ȸ�������� �����Ͽ����ϴ�.');" + "location.href='"+ redirectUrl+"';");
				out.println("</script>");
				System.out.println("host insert ����!");
		    }
		    
		    conn.commit();       
		    conn.setAutoCommit(true);       
		    pstmt.close();   
		    stmt.close();
		    conn.close(); 
		    /////////////////////
			
		    
	
		} catch (Exception e) {
		
			System.err.println("sql error = " + e.getMessage());
		}
	%>
</body>
</html>