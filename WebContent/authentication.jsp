<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>LOGIN</title>
</head>
<body>

   
   <%
      String url = "jdbc:oracle:thin:@localhost:1521:oraknu";
      String user = "dbtp";
      String pass = "dbtp";
      Connection conn = null;
      String query = null;

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
         
         String sql = "SELECT * FROM host WHERE h_id=? and h_pw =?";

         
         PreparedStatement pstmt = null;

         pstmt = conn.prepareStatement(sql);
         
         String id = request.getParameter("h_id");
         String pw = request.getParameter("h_pw");

         
         pstmt.setString(1, id);
         pstmt.setString(2, pw);
         ResultSet rs = pstmt.executeQuery();

         String dbId = null;
         String dbPw = null;
         String dbName = null;
         String dbSid = null;
         
         String redirectUrl = "login.html";
         
         boolean flag = false;
         
         while (rs.next()) {
            
            dbId = rs.getString("h_id");
            dbPw = rs.getString("h_pw");   
            dbName = rs.getString("h_name");
            dbSid = rs.getString("h_sid");
            if(dbId.equals(id) && dbPw.equals(pw)){
               flag = true;
               
               session.setAttribute("signedUserName", dbName);
               session.setAttribute("signedUserSid", dbSid);
               redirectUrl = "cafe_register.jsp";
               System.out.println("�����ϴ� ȸ���Դϴ�.");
            }
            
         }
         
         if(!flag){ //ȸ���� �������� ���� ��!
            out.println("<script>");
            out.println("alert('ID �Ǵ� ��й�ȣ��  Ʋ���ϴ�.');" + "location.href='"+ redirectUrl+"';");
            out.println("</script>");
            System.out.println("ID �Ǵ� ��й�ȣ��  Ʋ���ϴ�.");

         }
         else{
            
            out.println("<script>");
            out.println("alert('"+ dbName+"��, ȯ���մϴ�!');" + "location.href='"+ redirectUrl+"';" );
            out.println("</script>");
            System.out.println("�α��� ����!.");

         }
         
         
//         response.sendRedirect(redirectUrl);

         rs.close();
         pstmt.close();
         
         conn.commit();
         conn.setAutoCommit(true);
         stmt.close();
         conn.close();

      } catch (Exception e) {
         System.err.println("sql error = " + e.getMessage());
      }
   %>
</body>
</html>