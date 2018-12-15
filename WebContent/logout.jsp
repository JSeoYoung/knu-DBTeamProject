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
	//1. 기존의 세션 데이터를 모두 삭제
	session.invalidate();

	//2. 메인 페이지로 이동시킴
	response.sendRedirect("main.jsp");
%>

</body>
</html>