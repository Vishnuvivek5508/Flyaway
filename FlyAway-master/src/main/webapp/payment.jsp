<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.hibernate.entity.Flight"%>
<%@page import="com.hibernate.entity.Customer"%>
<%@page import="com.hibernate.dao.CustomerDao"%>
<%@page import="com.hibernate.dao.FlightDao"%>
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
<title>payment</title>
</head>
<body>
	<%
	String flight_ID = request.getParameter("flight_ID").toString();
	int f_ID = Integer.parseInt(flight_ID);
	String noOfPassengers = request.getParameter("passengers").toString();
	int passengers = Integer.parseInt(noOfPassengers);
	String totolCost = request.getParameter("totalCost").toString();
	String customerId = request.getParameter("customer_ID").toString();
	int cust_Id = Integer.parseInt(customerId);
	%>
	<%
	String cardNumber = request.getParameter("cust_phone");
	String CVVNumber = request.getParameter("flight_ID");
	%>



	<!-- display Flight details -->
	<%
	List<Flight> flight = FlightDao.getflight(f_ID);
	request.setAttribute("flightlist", flight);
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

	<!-- display customer details -->
	<%
	List<Customer> customers = CustomerDao.getAllCustomer(cust_Id);
	request.setAttribute("customerlist", customers);
	%>
	<h3>Customer Details</h3>
	<table style="width: 100%">
		<tr>
			<!-- <th>Customer Id</th> -->
			<th>CustID</th>
			<th>Name</th>
			<th>Email</th>
			<th>Phone</th>
			<th>Address</th>
			<th>Passport Number</th>
			<th>Flight Type</th>
			<th>Passengers</th>


		</tr>

		<core:forEach items="${customerlist}" var="cu">
			<tr>
				<%-- <td>${cu.getCustId}</td> --%>
				<td>${cu.getCustId()}</td>
				<td>${cu.getCustName()}</td>
				<td>${cu.getCustEmail()}</td>
				<td>${cu.getCustPhone()}</td>
				<td>${cu.getAddress()}</td>
				<td>${cu.getPassportNumber()}</td>
				<td>${cu.getFlightType()}</td>
				<td>${cu.getNoOfPassagners()}</td>

			</tr>
		</core:forEach>
	</table>


	<!-- payment updates -->
	<%
	Customer customer = (Customer) CustomerDao.getCustomer(cust_Id);
	customer.setPaymentStatus("Paid");
	CustomerDao.updateCustomer(customer);
	%>

	<h3>
		Payment of
		<%=totolCost%>
		is done.
	</h3>
	<h3>You have booked the flight successfully!</h3>


	<!-- Updating flight with available seats -->

	<%
	Flight flightUpdate = (Flight) FlightDao.getFlight(f_ID);
	int availableSeats = flightUpdate.getSeats();
	flightUpdate.setSeats(availableSeats - passengers);
	FlightDao.updateFlight(flightUpdate);
	%>
</body>
</html>