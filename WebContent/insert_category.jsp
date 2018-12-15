<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페등록</title>
</head>
<body>
	
	<%
	request.setCharacterEncoding("UTF-8");	//한글 깨짐현상 방지
	

		String url = "jdbc:oracle:thin:@localhost:1521:oraknu";
		String user = "dbtp";
		String pass = "dbtp";
		Connection conn = null;
		String query = null;
		String sql = null;
		int result; 
		
		String redirectUrl = "category_register.jsp";

		
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
			System.err.println("connect sql error = " + e.getMessage());
			System.exit(1);
		}

		try {
			conn.setAutoCommit(false);
			Statement stmt = conn.createStatement();
			

			String input_c_name= null;
			String input_cc_id= null;
			
			//session에 저장해둔 sid를 가져오는것
			String h_sid = session.getAttribute("signedUserSid").toString();//toString인지 아닌지는 모르겠당!!


			 sql="insert into menu_category values(cc_seq_id.nextval,?,?)"; //mc_id mc_name c_id

			//boolean flag = false;
			
			input_c_name = request.getParameter("c_name");
			input_cc_id = request.getParameter("cc_name");

			System.out.println("insert new cafe category");

			PreparedStatement pstmt = null;

		    pstmt = conn.prepareStatement(sql);
		    
			pstmt.setString(1,input_c_name);
			pstmt.setString(2,input_cc_id);
			
			System.out.println(input_c_name + "," + input_cc_id);

			result = pstmt.executeUpdate();
		    
			if(result == 1){ //성공한 열의 값
			
				out.println("<script>");
				out.println("alert('정상적으로 등록 되었습니다.');" + "location.href='"+ redirectUrl+"';");
				out.println("</script>");
				System.out.println("cafe insert 성공!");
			}
			else{			
				out.println("<script>");
				out.println("alert('값을 정확하게 입력해주세요.');" + "location.href='"+ redirectUrl+"';");
				out.println("</script>");
				System.out.println("cafe insert 실패!!");
			
			}
			
		    conn.commit();       
		    conn.setAutoCommit(true);       
		    pstmt.close();   
		    conn.close();      
		    
	
		} catch (Exception e) {
			out.println("<script>");
			out.println("alert('카테고리를 선택해주세요.');" + "location.href='"+ redirectUrl+"';");
			out.println("</script>");			System.err.println("sql error = " + e.getMessage());
		}
	%>
</body>
</html>