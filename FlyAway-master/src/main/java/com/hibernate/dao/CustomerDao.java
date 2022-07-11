package com.hibernate.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.hibernate.entity.Customer;
import com.hibernate.entity.Flight;
import com.hibernate.util.HibernateUtil;

public class CustomerDao {
	public static void addCustomer(Customer customer) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		session.save(customer);
		tx.commit();
		session.close();
	}

	public static Customer getCustomer(int cust_id) {
		Customer customer = null;
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		customer = session.get(Customer.class, cust_id);
		tx.commit();
		session.close();
		return customer;
	}

	public static List<Customer> getAllCustomer(int cust_Id) {
		List<Customer> customer = null;
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		customer = session.createQuery("from Customer where CustomerID='" + cust_Id + "'").list();
		session.close();
		return customer;
	}
	
	public static List<Customer> listAllCustomer() {
		List<Customer> customer = null;
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		customer = session.createQuery("from Customer").list();
		session.close();
		return customer;
	}

	public static void updateCustomer(Customer customer) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
//		session.save(customer);
		session.saveOrUpdate(customer);
		tx.commit();
		session.close();
	}
	
	public static Customer deleteCustomer(int cust_id) {
		Customer customer = null;
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		customer = session.get(Customer.class, cust_id);
		session.delete(customer);
		tx.commit();
		session.close();
		return customer;
		
	}

}
