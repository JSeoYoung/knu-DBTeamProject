<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	//1. ������ ���� �����͸� ��� ����
	session.invalidate();

	//2. ���� �������� �̵���Ŵ
	response.sendRedirect("main.jsp");
%>

</body>
</html>