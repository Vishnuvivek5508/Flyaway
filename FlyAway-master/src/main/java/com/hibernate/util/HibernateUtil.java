package com.hibernate.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.hibernate.entity.Admin;
import com.hibernate.entity.Customer;
import com.hibernate.entity.Flight;
//import com.hibernate.entity.Passenger;



public class HibernateUtil {

	static SessionFactory sessionFactory;

	public static SessionFactory getSessionFactory() {
		if (sessionFactory != null) {
			return sessionFactory;
		}
//		Step 1: Create Config obj and provide DB info.
		Configuration configuration = new Configuration();
		configuration.configure("hibernate.cfg.xml");

		// provide mapping
		configuration.addAnnotatedClass(Flight.class);
		configuration.addAnnotatedClass(Customer.class);
		configuration.addAnnotatedClass(Admin.class);

		sessionFactory = configuration.buildSessionFactory();
		return sessionFactory;

	}

}
