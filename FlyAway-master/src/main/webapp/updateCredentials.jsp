
<%@page import="com.hibernate.entity.Admin"%>
<%@page import="com.hibernate.dao.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update credentials</title>
</head>
<body>

	<%
	String adminUserId = request.getParameter("admin_id");
	String password = request.getParameter("admin_password");
	String secQuestion = request.getParameter("security_que");
	String secQueAnswer = request.getParameter("sec_que_ans");

	Admin admin = new Admin();

	admin.setUserName(adminUserId);
	admin.setPassword(password);
	admin.setSecQuestion(secQuestion);
	admin.setSecQueAnswer(secQueAnswer);
	
	AdminDao.addAdmin(admin);

	%>
	Credentials Updated successfully!

</body>
</html>