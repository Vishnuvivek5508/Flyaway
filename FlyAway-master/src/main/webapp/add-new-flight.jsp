
<%@page import="com.hibernate.entity.Flight"%>
<%@page import="com.hibernate.dao.FlightDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>new-flight.jsp</title>
</head>
<body>

	<%
	String flightNumber = request.getParameter("flight_number");
	String company = request.getParameter("company");
	String departuer = request.getParameter("departure");
	String destination = request.getParameter("destination");
	String departingDate = request.getParameter("date");
	String flightTime = request.getParameter("time");
	String noOfSeats = request.getParameter("seats");
	String ec_price = request.getParameter("ec_price");
	String bc_price = request.getParameter("bc_price");

	Flight flight = new Flight();

	flight.setFlightNumber(flightNumber);
	flight.setCompany(company);
	flight.setDestination(destination);
	flight.setDeparting(departuer);
	flight.setEc_price(Double.parseDouble(ec_price));
	flight.setBc_price(Double.parseDouble(bc_price));
	flight.setDate(departingDate);
	flight.setTime(flightTime);
	flight.setSeats(Integer.parseInt(noOfSeats));
	
	FlightDao.addFlight(flight);
	%>
	Flight Added Successfully!

</body>
</html>