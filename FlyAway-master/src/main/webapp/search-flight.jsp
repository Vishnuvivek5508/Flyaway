
<%@page import="java.text.DateFormat"%>
<%@page import="com.hibernate.entity.Flight"%>
<%@page import="com.hibernate.dao.FlightDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
		table, th, td {
			border: 1px solid black;
		}
	</style>
<meta charset="UTF-8">
<title>search flight</title>
</head>
<body>

	<%
	
	String departing = request.getParameter("fromPlace");
	String destination = request.getParameter("destination");
	String departingDate = request.getParameter("date");
	String noOfPassengers = request.getParameter("noOfPassengers");

	
	Date new_date = null;
	DateFormat formatter = new SimpleDateFormat("yyyy-MM-DD");
	try {
		new_date = (Date) formatter.parse(departingDate);
	} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	List<Flight> flights = FlightDao.listflight(departing,destination, new_date );
	request.setAttribute("flightlist", flights);
	%>
		<table style="width:100%">
		<tr>
			<th>Book</th>
			<th>Flight Id</th>
			<th>Flight Number</th>
			<th>Company</th>
			<th>From</th>
			<th>To</th>
			<th>On</th>
			<th>Time</th>
			<th>Available Seats</th>
			<th>Economic Class</th>
			<th>Business Class</th>
			
		</tr>

		<core:forEach items="${flightlist}" var="fli">
			<tr>
				<td><a href="register.jsp?f_id=${fli.getF_Id()}">Book</a></td>
				<td>${fli.getF_Id()}</td>
				<td>${fli.getFlightNumber()}</td>
				<td>${fli.getCompany()}</td>
				<td>${fli.getDeparting()}</td>
				<td>${fli.getDestination()}</td>
				<td>${fli.getDate()}</td>
				<td>${fli.getTime()}</td>
				<td>${fli.getSeats()}</td>
				<td>${fli.getEc_price()}</td>
				<td>${fli.getBc_price()}</td>
	
			</tr>
		</core:forEach>
	</table>
	<%
    session.setAttribute("noOfPassengers", noOfPassengers);
  
        %> 
<%-- Departing<%=departing %><br>
Destination<%=destination %><br>
Date<%=departingDate%><br>
New Date<%=new_date%><br>
Passengers<%=noOfPassengers %><br> --%>

</body>
</html>