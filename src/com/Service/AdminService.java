package com.Service;

import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Entity.AdminAddProductEntity;
import com.Entity.AdminCustomerEntity;
import com.Entity.AdminMessageEntity;
import com.Entity.AdminUserAddEntity;
import com.Entity.Order;

import AdminRepositaryDao.AdminRepositaryDao;
import interf.Servicebd.AdminServiceBd;

@Service("adminServiceBd")
public class AdminService implements AdminServiceBd {

	@Autowired
	private AdminRepositaryDao repositary;

	public AdminRepositaryDao getRepositary() {
		return repositary;
	}

	public void setRepositary(AdminRepositaryDao repositary) {
		this.repositary = repositary;
	}

	/**
	 * save user
	 */
	@Override
	public String saveUser(AdminUserAddEntity au) {
		return repositary.saveUser(au);
	}

	/**
	 * get All user
	 */
	@Override
	public List<AdminUserAddEntity> getAllUserList() {
		return repositary.getAllUserList();
	}

	/**
	 * get user details By ID
	 */
	@Override
	public AdminUserAddEntity getAllById(Long id) {
		return repositary.getAllById(id);
	}

	/**
	 * update user
	 */
	@Override
	public void updateUser(AdminUserAddEntity user) {
		repositary.updateUser(user);
	}

	/**
	 * delete user
	 */
	@Override
	public void deleteUser(int id) {
		repositary.deleteUser(id);
	}

	// --
	// --
	// --
	// ---------------------------------------ADD PRODUCT
	// SERVICE------------------------------------//

	/**
	 * save product
	 */
	@Override
	public String saveProduct(AdminAddProductEntity ap) {
		return repositary.saveProduct(ap);
	}

	/**
	 * get All products
	 */
	@Override
	public List<AdminAddProductEntity> getAllProductList() {
		return repositary.getAllProductList();
	}

	/**
	 * get product details by id
	 */
	@Override
	public AdminAddProductEntity getAllProById(Long id) {
		return repositary.getAllProById(id);
	}

	/**
	 * update product
	 */
	@Override
	public void updateProduct(AdminAddProductEntity product) {
		repositary.updateProduct(product);
	}

	/**
	 * delete product by id
	 */
	@Override
	public void deleteProduct(int id) {
		repositary.deleteProduct(id);
	}

	/**
	 * get All customers details
	 */
	@Override
	public List<AdminCustomerEntity> getAllCustomerList() {
		return repositary.getAllCustomerList();
	}

	/**
	 * delete customer by id
	 */
	@Override
	public void deleteCustomer(int id) {
		repositary.deleteCustomer(id);
	}

	// --
	// --
	// --
	// ---------------------------------------Admin Message CONTROLLER HANDLING
	// METHODS------------------------------------//

	/**
	 * get All messages
	 */
	@Override
	public List<AdminMessageEntity> getAllMessageList() {
		return repositary.getAllMessageList();
	}

	/**
	 * get All message by id
	 */
	@Override
	public AdminMessageEntity getAllMesageById(Long id) {
		return repositary.getAllMesageById(id);
	}

	/**
	 * delete message by id
	 */
	@Override
	public void deleteMessage(int id) {
		repositary.deleteMessage(id);

	}

	// --
	// --
	// --
	// ---------------------------------------ADMIN
	// USER ADD------------------------------------//

	/**
	 * check login validation
	 */
	@Override
	public boolean adminlog(AdminUserAddEntity au) {
		return repositary.adminlog(au);
	}

	/**
	 * get user details by username
	 */
	@Override
	public List<AdminUserAddEntity> getAllByUname(String uname) {
		return repositary.getAllByUname(uname);
	}

	// --
	// --
	// --
	// ---------------------------------------CUSTOMER
	// SUmmery------------------------------------//

	/**
	 * get user details
	 */
	@Override
	public List<AdminCustomerEntity> getSUmmUserDetail() {
		return repositary.getSUmmUserDetail();
	}

	/**
	 * get message details
	 */
	@Override
	public List<AdminMessageEntity> getSUmmMessaDetail() {
		return repositary.getSUmmMessaDetail();
	}

	/**
	 * get Product count
	 */
	@Override
	public Long countProduct() {
		return repositary.countProduct();
	}

	/**
	 * get Customer count
	 */
	@Override
	public Long countCustomer() {
		return repositary.countCustomer();
	}

	@Override
	public Long countOrder() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long countRevenue() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Order> getAllOrderPendingList() {
		return repositary.getAllOrderPendingList();
	}

	@Override
	public void deliveredOrder(int orderId) {
		repositary.deliveredOrder(orderId);
	}

	@Override
	public void canceledOrder(int orderId) {
		repositary.canceledOrder(orderId);
	}

	@Override
	public Order getOneOrder(String orderId) {
		return repositary.getOneOrder(orderId);
	}

}
