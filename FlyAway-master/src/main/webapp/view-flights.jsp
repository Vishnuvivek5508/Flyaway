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
<title>Admin View Flights</title>
</head>
<body>
	<%
	List<Flight> flights = FlightDao.getAllFlight();
	request.setAttribute("flightlist", flights);
	%>
	<h3>Selected Flight Details</h3>
	<table style="width: 100%">
		<tr>
			<th></th>
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
			    <td><a href="deleteFlight.jsp?f_id=${fli.getF_Id()}">Delete</a></td>
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
	
	

</body>
</html>