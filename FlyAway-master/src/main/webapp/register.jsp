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
<title>registration</title>
</head>
<body>

	<%
	String flightId = request.getParameter("f_id").trim();
	int f_id = Integer.parseInt(flightId);
	String noOfPassenger = session.getAttribute("noOfPassengers").toString(); 
	int passengers = Integer.parseInt(noOfPassenger);
	%>

	<%
	List<Flight> flights = FlightDao.getflight(f_id);
	request.setAttribute("flightlist", flights);
	%>
	<h3>Selected Flight Details</h3>
	<table style="width: 100%">
		<tr>
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
	
	

	<div class="title">
		<h1>Registration</h1>
	</div>
	<div class="registration-form-box">
		<div>

			<form action='Registration.jsp' method="post">
				<input type="hidden" name="flightID" value="<%=flightId%>" />
				<input type="hidden" name="noOfPassengers" value="<%=noOfPassenger%>" />
				
				<div class="input">
					Full Name<input type="text" name="customer_name" id="" class="name"><br>
				</div>
				<div class="input">
					Email<input type="email" name="customer_email" id=""><br>
				</div>
				<div class="input">
					Phone Number<input type="number" name="customer_phone" id=""><br>
				</div>
				<div class="input">
					Address<input type="text" name="customer_address" id=""><br>
				</div>
				<div class="input">
					Passport No.<input type="text" name="customer_passport" id=""><br>
				</div>

				Flight Type <select name="flightType" id="">
					<option value="eomonic">Economic</option>
					<option value="business" selected>Business</option>
				</select>

				<div>
					<button type="submit">Register</button>
				</div>
			</form>
		</div>
	</div>


</body>
</html>