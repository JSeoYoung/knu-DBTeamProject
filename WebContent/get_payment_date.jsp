<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>GET DATE</title>
</head>
<body>


	<%
		
	request.setCharacterEncoding("UTF-8");

		String input_cid = request.getParameter("cId");
		String from_date = request.getParameter("fromDate");
		String to_date = request.getParameter("toDate");
		
		String redirectUrl = "payment_list.jsp?cid="+input_cid + "&from_date="+ from_date+ "&to_date=" + to_date;
		System.out.println(redirectUrl);

		out.println("<script>");
		out.println("location.href='" + redirectUrl + "';");
		out.println("</script>");
	
	%>
</body>
</html>