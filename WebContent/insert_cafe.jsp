<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ī����</title>
</head>
<body>
	
	<%
   		 request.setCharacterEncoding("euc-kr"); 	//�ѱ� �������� ������ ����
	

		String url = "jdbc:oracle:thin:@localhost:1521:oraknu";
		String user = "dbtp";
		String pass = "dbtp";
		Connection conn = null;
		String query = null;
		String sql = null;
		int result; 
		
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
			conn.setAutoCommit(false);
			Statement stmt = conn.createStatement();
			

			String input_c_name= null;
			String input_cc_id= null;
			String input_c_tel= null;//053-754-1231
			String input_c_addr=null;
			String input_c_img=null;
			String input_c_start_date=null;  //2018-11-12
			String input_c_intro = null;
			
			//session�� �����ص� sid�� �������°�
			String h_sid = session.getAttribute("signedUserSid").toString();//toString���� �ƴ����� �𸣰ڴ�!!


			 sql="insert into cafe values(cafe_seq_id.nextval,?,?,?,?,?,?,?,?)"; //c_id, c_name, h_sid, cc_id, c_tel, c_addr, c_img, c_start_date
		

			 // sql="insert into cafe values(cafe_seq_id.nextval,?,(select h_sid from host where h_name=?),(select cc_id from cafe_category where cc_name=?),?,?,?,?)";

			String redirectUrl = "cafe_register.jsp";
			//boolean flag = false;
			
			input_c_name = request.getParameter("c_name");
			input_cc_id = request.getParameter("cc_name");
			input_c_tel = request.getParameter("c_tel");
			input_c_addr = request.getParameter("c_addr");

			input_c_img = request.getParameter("c_img");
			input_c_start_date = request.getParameter("c_start_year") +"-" +  request.getParameter("c_start_month") + "-" +  request.getParameter("c_start_day"); 
			input_c_intro = request.getParameter("c_intro");
			System.out.println("insert new cafe");

			PreparedStatement pstmt = null;

		    pstmt = conn.prepareStatement(sql);
		    
			pstmt.setString(1,input_c_name);
			pstmt.setString(2,h_sid);
			pstmt.setString(3,input_cc_id);
			pstmt.setString(4,input_c_tel);
			pstmt.setString(5,input_c_addr);
			pstmt.setString(6,input_c_img);
			pstmt.setString(7,input_c_start_date);
			pstmt.setString(8,input_c_intro);
			
			System.out.println(input_c_name + "," + h_sid + "," + input_cc_id + "," + input_c_tel + "," + input_c_addr + "," + input_c_img + "," + input_c_start_date );

			result = pstmt.executeUpdate();
		    
			if(result == 1){ //������ ���� ��
			
				out.println("<script>");
				out.println("alert('���������� ��� �Ǿ����ϴ�.');" + "location.href='"+ redirectUrl+"';");
				out.println("</script>");
				System.out.println("cafe insert ����!");
			}
			else{			
				out.println("<script>");
				out.println("alert('���� ��Ȯ�ϰ� �Է����ּ���.');" + "location.href='"+ redirectUrl+"';");
				out.println("</script>");
				System.out.println("cafe insert ����!!");
			
			}
			
			//response.sendRedirect(redirectUrl);
			
		    conn.commit();       
		    conn.setAutoCommit(true);       
		    pstmt.close();   
		    conn.close();      
		    
	
		} catch (Exception e) {
			out.println("<script>alert('���� ��Ȯ�ϰ� �Է����ּ���.');</script>");
			System.err.println("sql error = " + e.getMessage());
		}
	%>
</body>
</html>