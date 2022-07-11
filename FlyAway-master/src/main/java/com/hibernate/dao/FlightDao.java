package com.hibernate.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.hibernate.entity.Customer;
import com.hibernate.entity.Flight;
import com.hibernate.util.HibernateUtil;

public class FlightDao {
	public static void addFlight(Flight flight) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		session.save(flight);
		tx.commit();
		session.close();
	}

	public static List<Flight> listflight(String departing, String destination, Date date) {
		List<Flight> flights = null;
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		String query = "from Flight where Departing=:x and Destination=:y and Date=:z";
		Query q = session.createQuery(query);
		q.setParameter("x", departing);
		q.setParameter("y", destination);
		q.setParameter("z", date);

		flights = q.list();
		return flights;
	}
	
	public static List<Flight> getflight(int F_ID ) {
		List<Flight> flights = null;
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		flights = session.createQuery("from Flight where Flight_ID='"+F_ID+"'").list();
		session.close();
		return flights;
	}
	
	public static Flight getFlight(int flight_id) {
		Flight flight = null;
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		flight = session.get(Flight.class, flight_id);
		tx.commit();
		session.close();
		return flight;
	}
	
	public static void updateFlight(Flight flight) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(flight);
		tx.commit();
		session.close();
	}
	
	public static List<Flight> getAllFlight() {
		List<Flight> flights = null;
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		flights = session.createQuery("from Flight").list();
		session.close();
		return flights;
	}
	
	public static void deleteFlight(int flight_id) {
		Flight flight = null;
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		flight = session.get(Flight.class, flight_id);
		session.delete(flight);
		tx.commit();
		session.close();
		
	}
	
	
}
