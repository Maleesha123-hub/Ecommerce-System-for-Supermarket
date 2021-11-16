package com.Repositary;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.hibernate.usertype.UserType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Entity.AdminAddProductEntity;
import com.Entity.AdminCustomerEntity;
import com.Entity.AdminMessageEntity;
import com.Entity.AdminUserAddEntity;

import AdminRepositaryDao.CustomerRepositaryDao;

@Repository("repositaryDao")
public class CustomerRepositary implements CustomerRepositaryDao {

	private Session session = null;
	private Criteria criteria = null;
	private Transaction transaction = null;
	private org.hibernate.Query query = null;

	@Autowired
	HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public String insert(AdminCustomerEntity ue) {
		if (ue != null) {
			session = getHibernateTemplate().getSessionFactory().openSession();
			transaction = session.beginTransaction();
			session.save(ue);
			transaction.commit();
			session.close();
			return "success";
		}
		return "false";
	}

	@Override
	public boolean login(AdminCustomerEntity ue) {
		boolean isSuccess = false;
		try {
			session = getHibernateTemplate().getSessionFactory().openSession();
			transaction = session.beginTransaction();
			String hql = "FROM AdminCustomerEntity WHERE uname = ? AND password = ?";
			query = session.createQuery(hql);
			query.setString(0, ue.getUname());
			query.setString(1, ue.getPassword());
			AdminCustomerEntity st = (AdminCustomerEntity) query.uniqueResult();
			transaction.commit();

			if (st == null) {
				System.out.print("NO INCORRECT");
				isSuccess = false;
			} else {
				System.out.println("CUSTOMER PASSWORD & USERNAME CORRECT!");
				isSuccess = true;
			}

			session.close();

		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
		}
		return isSuccess;
	}

	@Override
	public String insertMessage(AdminMessageEntity am) {
		if (am != null) {
			session = getHibernateTemplate().getSessionFactory().openSession();
			transaction = session.beginTransaction();
			session.save(am);
			transaction.commit();
			session.close();
			return "success";
		}
		return "false";
	}

	@Override
	public List<AdminCustomerEntity> getAllByUname(String uname) {
		session = getHibernateTemplate().getSessionFactory().openSession();
		transaction = session.beginTransaction();
		String hql = "FROM AdminCustomerEntity WHERE uname = ? ";
		query = session.createQuery(hql);
		query.setString(0, uname);
		List<AdminCustomerEntity> UserList = query.list();
		transaction.commit();

		for (AdminCustomerEntity s : UserList) {
			System.out.println(s.getFname());
			System.out.println(s.getEmail());
			System.out.println(
					"------------------------------GET ALL BY CONTACT MESSAGE UName  END!---------------------------");
		}

		session.close();
		return UserList;

	}

	@Override
	public void updatePersonal(AdminCustomerEntity personalList) {
		System.out.print("REPOSITARY UPDATE!");
		try {
			session = getHibernateTemplate().getSessionFactory().openSession();
			criteria = session.createCriteria(AdminUserAddEntity.class);
			criteria.add(Restrictions.eq("id", personalList.getId()));
			transaction = session.beginTransaction();
			session.update(personalList);
			transaction.commit();
			session.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// --
	// --
	// --
	// ---------------------------------------VEGITABLE TABLE REPOSITARY
	// METHODS------------------------------------//
	@Override
	public List<AdminAddProductEntity> getAllVegiProList() {
		session = getHibernateTemplate().getSessionFactory().openSession();
		transaction = session.beginTransaction();
		String hql = "FROM AdminAddProductEntity WHERE category = :category ";
		query = session.createQuery(hql);
		query.setParameter("category", "Vegitable");
		List<AdminAddProductEntity> listofproduct = query.list();
		transaction.commit();

		for (AdminAddProductEntity s : listofproduct) {
			System.out.println(s.getId());
			System.out.println(s.getName());
			System.out.println(s.getPrice());
			System.out.println(s.getCategory());
			System.out.println(s.getDescription());
			System.out.println(s.getImage());
			System.out.println("------------------------------GET ALL BY VEGI END!---------------------------");
		}

		session.close();

		return listofproduct;
	}

	@Override
	public List<AdminAddProductEntity> getAllFruitProList() {
		session = getHibernateTemplate().getSessionFactory().openSession();
		transaction = session.beginTransaction();
		String hql = "FROM AdminAddProductEntity WHERE category = :category ";
		query = session.createQuery(hql);
		query.setParameter("category", "Fruit");
		List<AdminAddProductEntity> listofproduct = query.list();
		transaction.commit();

		for (AdminAddProductEntity s : listofproduct) {
			System.out.println(s.getId());
			System.out.println(s.getName());
			System.out.println(s.getPrice());
			System.out.println(s.getCategory());
			System.out.println(s.getDescription());
			System.out.println(s.getImage());
			System.out.println("------------------------------GET ALL BY VEGI END!---------------------------");
		}

		session.close();

		return listofproduct;
	}

	@Override
	public List<AdminAddProductEntity> getAllMeatProList() {
		session = getHibernateTemplate().getSessionFactory().openSession();
		transaction = session.beginTransaction();
		String hql = "FROM AdminAddProductEntity WHERE category = :category ";
		query = session.createQuery(hql);
		query.setParameter("category", "Meat");
		List<AdminAddProductEntity> listofproduct = query.list();
		transaction.commit();

		for (AdminAddProductEntity s : listofproduct) {
			System.out.println(s.getId());
			System.out.println(s.getName());
			System.out.println(s.getPrice());
			System.out.println(s.getCategory());
			System.out.println(s.getDescription());
			System.out.println(s.getImage());
			System.out.println("------------------------------GET ALL BY VEGI END!---------------------------");
		}

		session.close();

		return listofproduct;
	}

	@Override
	public List<AdminAddProductEntity> getAllHomeWareProList() {
		session = getHibernateTemplate().getSessionFactory().openSession();
		transaction = session.beginTransaction();
		String hql = "FROM AdminAddProductEntity WHERE category = :category ";
		query = session.createQuery(hql);
		query.setParameter("category", "Home Ware");
		List<AdminAddProductEntity> listofproduct = query.list();
		transaction.commit();

		for (AdminAddProductEntity s : listofproduct) {
			System.out.println(s.getId());
			System.out.println(s.getName());
			System.out.println(s.getPrice());
			System.out.println(s.getCategory());
			System.out.println(s.getDescription());
			System.out.println(s.getImage());
			System.out.println("------------------------------GET ALL BY VEGI END!---------------------------");
		}

		session.close();

		return listofproduct;
	}

	@Override
	public List<AdminAddProductEntity> getAllElectronicsProList() {
		session = getHibernateTemplate().getSessionFactory().openSession();
		transaction = session.beginTransaction();
		String hql = "FROM AdminAddProductEntity WHERE category = :category ";
		query = session.createQuery(hql);
		query.setParameter("category", "Electronics");
		List<AdminAddProductEntity> listofproduct = query.list();
		transaction.commit();

		for (AdminAddProductEntity s : listofproduct) {
			System.out.println(s.getId());
			System.out.println(s.getName());
			System.out.println(s.getPrice());
			System.out.println(s.getCategory());
			System.out.println(s.getDescription());
			System.out.println(s.getImage());
			System.out.println("------------------------------GET ALL BY VEGI END!---------------------------");
		}

		session.close();

		return listofproduct;
	}

	@Override
	public List<AdminAddProductEntity> getAllBeautyProList() {
		session = getHibernateTemplate().getSessionFactory().openSession();
		transaction = session.beginTransaction();
		String hql = "FROM AdminAddProductEntity WHERE category = :category ";
		query = session.createQuery(hql);
		query.setParameter("category", "Beauty");
		List<AdminAddProductEntity> listofproduct = query.list();
		transaction.commit();

		for (AdminAddProductEntity s : listofproduct) {
			System.out.println(s.getId());
			System.out.println(s.getName());
			System.out.println(s.getPrice());
			System.out.println(s.getCategory());
			System.out.println(s.getDescription());
			System.out.println(s.getImage());
			System.out.println("------------------------------GET ALL BY VEGI END!---------------------------");
		}

		session.close();

		return listofproduct;
	}

	/// RECOVERY PASSWORD/////////////
	/////////////////////////////////////////////////////////////////////////////////////
	@Override
	public boolean recover(AdminCustomerEntity ue) {
		boolean isSuccess = false;
		try {
			session = getHibernateTemplate().getSessionFactory().openSession();
			transaction = session.beginTransaction();
			String hql = "FROM AdminCustomerEntity WHERE email = ?";
			query = session.createQuery(hql);
			query.setString(0, ue.getEmail());
			AdminCustomerEntity st = (AdminCustomerEntity) query.uniqueResult();
			transaction.commit();

			if (st == null) {
				System.out.print("NO INCORRECT");
				isSuccess = false;
			} else {
				System.out.println("CUSTOMER EMAIL CORRECT!");
				isSuccess = true;
			}

			session.close();

		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
		}
		return isSuccess;
	}

	@Override
	public List<AdminCustomerEntity> getAllByEmail(String email) {
		session = getHibernateTemplate().getSessionFactory().openSession();
		transaction = session.beginTransaction();
		String hql = "FROM AdminCustomerEntity WHERE email = ? ";
		query = session.createQuery(hql);
		query.setString(0, email);
		List<AdminCustomerEntity> UserList = query.list();
		transaction.commit();

		for (AdminCustomerEntity s : UserList) {
			System.out.println(s.getFname());
			System.out.println(s.getEmail());
			System.out.println(
					"------------------------------GET ALL BY CONTACT MESSAGE UName  END!---------------------------");
		}

		session.close();
		return UserList;
	}

	//// PRODUCTS TO Cart//////
	//////////// PRODUCTS TO Cart////////

	@Override
	public AdminAddProductEntity getProDetailsById(int id) {
		session = getHibernateTemplate().getSessionFactory().openSession();
		transaction = session.beginTransaction();
		String hql = "FROM AdminAddProductEntity WHERE id = ? ";
		query = session.createQuery(hql);
		query.setLong(0, id);
		AdminAddProductEntity user = (AdminAddProductEntity) query.uniqueResult();
		transaction.commit();
		session.close();

		return user;
	}
}
