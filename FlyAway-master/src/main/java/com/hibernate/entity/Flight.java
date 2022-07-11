package com.hibernate.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import javax.persistence.Table;


@Entity
@Table(name = "FlightDetails")
public class Flight {
	@Id
	@GeneratedValue
	@Column(name = "Flight_ID")
	private int F_Id;

	@Column(name = "FlightNumber")
	private String flightNumber;

	@Column(name = "Company")
	private String Company;

	@Column(name = "Departing")
	private String departing;

	@Column(name = "Destination")
	private String destination;

	@Column(name = "Date")
	private String date;
	
	@Column(name = "Time")
	private String time;

	@Column(name = "Seats")
	private int seats;

	@Column(name = "EC_Price")
	private double ec_price;

	@Column(name = "BC_Price")
	private double bc_price;
	

	// getter and setter

	public int getF_Id() {
		return F_Id;
	}

	public double getEc_price() {
		return ec_price;
	}

	public void setEc_price(double ec_price) {
		this.ec_price = ec_price;
	}

	public double getBc_price() {
		return bc_price;
	}

	public void setBc_price(double bc_price) {
		this.bc_price = bc_price;
	}

	public void setF_Id(int f_Id) {
		F_Id = f_Id;
	}

	public int getSeats() {
		return seats;
	}

	public void setSeats(int seats) {
		this.seats = seats;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getFlightNumber() {
		return flightNumber;
	}

	public void setFlightNumber(String flightNumber) {
		this.flightNumber = flightNumber;
	}

	public String getCompany() {
		return Company;
	}

	public void setCompany(String company) {
		Company = company;
	}

	public String getDeparting() {
		return departing;
	}

	public void setDeparting(String departing) {
		this.departing = departing;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

}
