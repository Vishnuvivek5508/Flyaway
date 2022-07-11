package com.hibernate.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "CustomerDetails")
public class Customer {

	@Id
	@GeneratedValue
	@Column(name = "CustomerID")
	private int custId;
	@Column(name = "Name")
	private String custName;
	@Column(name = "Email")
	private String custEmail;
	@Column(name = "Phone")
	private long custPhone;
	@Column(name = "Address")
	private String address;
	@Column(name = "PossportNumber")
	private String passportNumber;

	private int flightId;
	@Column(name = "FlightType")
	private String flightType;
	@Column(name = "NumberOfPassangers")
	private int noOfPassagners;

	@Column(name = "TotalCost")
	private double totalCost;
	@Column(name = "Payment")
	private String paymentStatus;

	
	
	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public int getCustId() {
		return custId;
	}

	public void setCustId(int custId) {
		this.custId = custId;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getCustEmail() {
		return custEmail;
	}

	public void setCustEmail(String custEmail) {
		this.custEmail = custEmail;
	}

	public long getCustPhone() {
		return custPhone;
	}

	public void setCustPhone(long custPhone) {
		this.custPhone = custPhone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPassportNumber() {
		return passportNumber;
	}

	public void setPassportNumber(String passportNumber) {
		this.passportNumber = passportNumber;
	}

	public int getFlightId() {
		return flightId;
	}

	public void setFlightId(int flightId) {
		this.flightId = flightId;
	}

	public String getFlightType() {
		return flightType;
	}

	public void setFlightType(String flightType) {
		this.flightType = flightType;
	}

	public int getNoOfPassagners() {
		return noOfPassagners;
	}

	public void setNoOfPassagners(int noOfPassagners) {
		this.noOfPassagners = noOfPassagners;
	}

	public double getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(double totalCost) {
		this.totalCost = totalCost;
	}

	// setter and getter

}
