package com.Service;

import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Entity.AdminAddProductEntity;
import com.Entity.AdminCustomerEntity;
import com.Entity.AdminMessageEntity;
import com.Entity.AdminUserAddEntity;

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

	// save user
	@Override
	public String saveUser(AdminUserAddEntity au) {
		return repositary.saveUser(au);
	}

//get All user
	@Override
	public List<AdminUserAddEntity> getAllUserList() {
		return repositary.getAllUserList();
	}

//getBy ID
	@Override
	public AdminUserAddEntity getAllById(Long id) {
		return repositary.getAllById(id);
	}

	// update user
	@Override
	public void updateUser(AdminUserAddEntity user) {
		repositary.updateUser(user);
	}

	// delete user
	@Override
	public void deleteUser(int id) {
		repositary.deleteUser(id);
	}

	// --
	// --
	// --
	// ---------------------------------------ADD PRODUCT
	// SERVICE------------------------------------//

	@Override
	public String saveProduct(AdminAddProductEntity ap) {
		return repositary.saveProduct(ap);
	}

	@Override
	public List<AdminAddProductEntity> getAllProductList() {
		return repositary.getAllProductList();
	}

	@Override
	public AdminAddProductEntity getAllProById(Long id) {
		return repositary.getAllProById(id);
	}

	@Override
	public void updateProduct(AdminAddProductEntity product) {
		repositary.updateProduct(product);
	}

	@Override
	public void deleteProduct(int id) {
		repositary.deleteProduct(id);
	}

	@Override
	public List<AdminCustomerEntity> getAllCustomerList() {
		return repositary.getAllCustomerList();
	}

	@Override
	public void deleteCustomer(int id) {
		repositary.deleteCustomer(id);
	}

	// --
	// --
	// --
	// ---------------------------------------Admin Message CONTROLLER HANDLING
	// METHODS------------------------------------//
	@Override
	public List<AdminMessageEntity> getAllMessageList() {
		return repositary.getAllMessageList();
	}

	@Override
	public AdminMessageEntity getAllMesageById(Long id) {
		return repositary.getAllMesageById(id);
	}

	@Override
	public void deleteMessage(int id) {
		repositary.deleteMessage(id);

	}

	// --
	// --
	// --
	// ---------------------------------------ADMIN
	// USER ADD------------------------------------//

	@Override
	public boolean adminlog(AdminUserAddEntity au) {
		return repositary.adminlog(au);
	}

	@Override
	public List<AdminUserAddEntity> getAllByUname(String uname) {
		return repositary.getAllByUname(uname);
	}

	// --
	// --
	// --
	// ---------------------------------------CUSTOMER
	// SUmmery------------------------------------//
	@Override
	public List<AdminCustomerEntity> getSUmmUserDetail() {
		return repositary.getSUmmUserDetail();
	}

	@Override
	public List<AdminMessageEntity> getSUmmMessaDetail() {
		return repositary.getSUmmMessaDetail();
	}

	@Override
	public Long countProduct() {
		return repositary.countProduct();
	}

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

}
