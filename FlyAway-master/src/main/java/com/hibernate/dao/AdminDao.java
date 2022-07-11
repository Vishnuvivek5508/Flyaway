package com.hibernate.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.hibernate.entity.Admin;
import com.hibernate.entity.Customer;
import com.hibernate.util.HibernateUtil;

public class AdminDao {
	public static void addAdmin(Admin admin) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		session.save(admin);
		tx.commit();
		session.close();
	}
	
	
	public static List<Admin> getAdmin( ) {
		List<Admin> admin = null;
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		admin = session.createQuery("from Admin").list();
		session.close();
		return admin;
	}
}
