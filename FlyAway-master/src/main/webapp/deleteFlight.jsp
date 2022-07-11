<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.hibernate.entity.Flight"%>
<%@page import="com.hibernate.entity.Customer"%>
<%@page import="com.hibernate.dao.CustomerDao"%>
<%@page import="com.hibernate.dao.FlightDao"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Flight</title>
</head>
<body>

	<%
	
	String flightId = request.getParameter("f_id").trim();
	int flightID = Integer.parseInt(flightId);
	//deleting customer
	Flight flight = (Flight) FlightDao.getFlight(flightID);
	FlightDao.deleteFlight(flightID);
	%>
	Flight with ID <%=flightID %> Deleted Successfully!
<jsp:include page="view-flights.jsp"></jsp:include>

</body>
</html>