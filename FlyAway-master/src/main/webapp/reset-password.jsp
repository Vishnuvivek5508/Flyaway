<%@page import="com.hibernate.entity.Admin"%>
<%@page import="com.hibernate.dao.AdminDao"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search flight</title>
</head>
<body>

<%!
String adminUserId ="";
String password ="";
String securityQAns = "";
String secQueAnswer = "";
String inputSecQueAnser = "";
%>
	<%
	inputSecQueAnser = request.getParameter("secQueAnser");
	List<Admin> admin = AdminDao.getAdmin();
	request.setAttribute("adminList", admin);
	
	for(Admin ad: admin){
		 secQueAnswer = ad.getSecQueAnswer();
	}
	
	if(secQueAnswer.equals(inputSecQueAnser)){
		%>
		<a href="add-new-flight.html">Add new Flight</a><br>
	<a href="#">View Flights</a><br>
	<a href="#">View Customer</a><br>
		<%
		
		
	}
	else{
		response.sendRedirect("updateCredentials.html");  
	}
	%>
</body>
</html>