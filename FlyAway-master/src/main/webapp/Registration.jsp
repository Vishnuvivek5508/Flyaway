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
<%@page import="com.hibernate.util.HibernateUtil"%>

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
<title>Insert title here</title>
</head>
<body>
<body>


	<%
	String flight_ID = request.getParameter("flightID").toString();
	int f_ID = Integer.parseInt(flight_ID);
	String noOfPassengers = request.getParameter("noOfPassengers").toString();
	int passengers = Integer.parseInt(noOfPassengers);
	%>

	<%
	String customerName = request.getParameter("customer_name");
	String email = request.getParameter("customer_email");
	String phoneNumber = request.getParameter("customer_phone");
	long custPhone = Long.parseLong(phoneNumber);
	String address = request.getParameter("customer_address");
	String passportNumber = request.getParameter("customer_passport");
	String flightType = request.getParameter("flightType");

	//getting price from flight Table
	double ecomoniPrice = 0.0;
	double businessPrice = 0.0;
	double totalCost = 0.0;
	List<Flight> flights = FlightDao.getflight(f_ID);
	for (Flight fl : flights) {
		ecomoniPrice = fl.getEc_price();
		businessPrice = fl.getBc_price();
	}

	//calculating total cost

	if (flightType.equals("eomonic")) {
		totalCost = (passengers) * (ecomoniPrice);

	} else if (flightType.equals("business")) {
		totalCost = (passengers) * (businessPrice);

	}

	Customer customer = new Customer();
	customer.setFlightId(Integer.parseInt(flight_ID));
	customer.setCustName(customerName);
	customer.setCustEmail(email);
	customer.setCustPhone(custPhone);
	customer.setAddress(address);
	customer.setPassportNumber(passportNumber);
	customer.setNoOfPassagners(passengers);
	customer.setFlightType(flightType);
	customer.setTotalCost(totalCost);

	CustomerDao.addCustomer(customer);
	int cust_Id = customer.getCustId();
	int passenger = customer.getNoOfPassagners();
	%>


	<h2>Registered Successfully!</h2>
    <h3>Total cost: <%= totalCost%></h3> <br> <br>
  <h2>Payment Details</h2>
	<form action="payment.jsp"><br>
	<input type = "hidden" name = "cust_phone" value =<%=phoneNumber%>>
	<input type = "hidden" name = "flight_ID" value =<%=flight_ID %>>
	<input type = "hidden" name = "totalCost" value =<%=totalCost %>>
	<input type = "hidden" name = "customer_ID" value =<%=cust_Id %>>
	<input type = "hidden" name = "passengers" value =<%=passenger %>>
		Card Number<input type="number" name="cardNumber"><br> 
		CCV<input type="number" name="cardCVV"><br>
		<button type="submit">Pay</button><br>
	</form>



    




</body>
</html>