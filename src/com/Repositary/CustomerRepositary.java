package com.Repositary;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Entity.AdminAddProductEntity;
import com.Entity.AdminCustomerEntity;
import com.Entity.AdminMessageEntity;
import com.Entity.AdminUserAddEntity;
import com.Entity.OrderDetail;

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

	/**
	 * save customer details
	 * 
	 * @return string value
	 */
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

	/**
	 * check login validation
	 */
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

	/**
	 * save message details
	 * 
	 * @return string value
	 */
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

	/**
	 * get all customer details
	 * 
	 * @param username
	 * @return list of customers
	 */
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

	/**
	 * update customer details by id
	 * 
	 */
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

	/**
	 * get all category of vegitable details
	 * 
	 * @return list of vegitable details
	 */
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

	/**
	 * get all category of fruits details
	 * 
	 * @return list of fruits details
	 */
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

	/**
	 * get all category of meats details
	 * 
	 * @return list of meats details
	 */
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

	/**
	 * get all category of homeware items details
	 * 
	 * @return list of homeware items details
	 */
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

	/**
	 * get all category of electronic items details
	 * 
	 * @return list of electronic items details
	 */
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

	/**
	 * get all category of beauty items details
	 * 
	 * @return list of beauty items details
	 */
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

	/**
	 * password Recovery by email
	 * 
	 * @return true or false
	 */
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

	/**
	 * get all customers details by email
	 * 
	 * @return list of customers details
	 */
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

	/**
	 * get product details by id
	 * 
	 * @param id
	 * @return list of product
	 */
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

	/**
	 * save orderdetails by parameters
	 * 
	 */
	@Override
	public boolean saveOrder(String proId, String name, String price, String qty, String cusId) {

		boolean isSuccess;
		System.out.println("ORDER REPO");
		try {
			
			System.out.println(proId);
			System.out.println(name);
			System.out.println(price);
			System.out.println(qty);
			System.out.println(cusId);

			session = getHibernateTemplate().getSessionFactory().openSession();
			transaction = session.beginTransaction();
			OrderDetail od = new OrderDetail();
			od.setPrice(price);
			od.setProductId(proId);
			od.setProductname(name);
			od.setQuantity(qty);
			transaction = session.beginTransaction();
			session.save(od);
			transaction.commit();
			session.close();

			isSuccess = true;

		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
		}

		return isSuccess;
	}

}
