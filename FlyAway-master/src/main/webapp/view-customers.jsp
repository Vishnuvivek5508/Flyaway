
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
<title>Customer List</title>
</head>
<body>
	<%
	List<Customer> customers = CustomerDao.listAllCustomer();
	request.setAttribute("customerlist", customers);
	%>
	<h3>Customer Details</h3>
	<table style="width: 100%">
		<tr>
			<th></th>
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
				<td><a href="deleteCustomer.jsp?f_id=${cu.getCustId()}">Delete</a></td>
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

</body>
</html>