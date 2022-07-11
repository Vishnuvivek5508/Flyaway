

<%@page import="com.hibernate.entity.Admin"%>
<%@page import="com.hibernate.dao.AdminDao"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin login.jsp</title>
</head>
<body>

<%!
String adminUserId ="";
String password ="";
String securityQAns = "";
String secQueAnswer = "";
%>
	<%
	List<Admin> admin = AdminDao.getAdmin();
	request.setAttribute("adminList", admin);
	
	for(Admin ad: admin){
		 adminUserId =ad.getUserName();
		 password =ad.getPassword();
		 securityQAns = ad.getSecQuestion();
		 secQueAnswer = ad.getSecQueAnswer();
	}
	
	%>


	<%
	String user_Id = request.getParameter("user_id");
	String user_password = request.getParameter("user_pass");
	%>

	<%
	if (user_Id.equals(adminUserId) && user_password.equals(password)) {
	%>
	LogIn Successful!
	<h3>Admin Dashboard</h3>
	<a href="add-new-flight.html">Add new Flight</a><br>
	<a href="view-flights.jsp">View Flights</a><br>
	<a href="view-customers.jsp">View Customer</a><br>
	<%
	} else {
	%>
	<h3>Wrong User Name or Password</h3>
	
	
	<h3>Reset Password</h3>
	<form action="reset-password.jsp">
	What is your <%=securityQAns %>
	<input type ="text" name = "secQueAnser"><br>
	<button type="submit">Click</button><br>
	</form>
	<%
	}
	%>

</body>
</html>