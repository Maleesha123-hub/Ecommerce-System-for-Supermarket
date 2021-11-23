package com.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Entity.AdminAddProductEntity;
import com.Entity.AdminCustomerEntity;
import com.Entity.AdminMessageEntity;

import AdminRepositaryDao.CustomerRepositaryDao;
import interf.Servicebd.CustomerServiceBd;

@Service("serviceBd")
public class CustomerService implements CustomerServiceBd {

	@Autowired
	private CustomerRepositaryDao repositary;

	public CustomerRepositaryDao getRepository() {
		return repositary;
	}

	public void setRepository(CustomerRepositaryDao repository) {
		this.repositary = repository;
	}

	/**
	 * save customer
	 */
	@Override
	public String insert(AdminCustomerEntity ue) {
		return repositary.insert(ue);
	}

	/**
	 * login validation
	 */
	@Override
	public boolean login(AdminCustomerEntity ue) {
		return repositary.login(ue);
	}

	/**
	 * insert message
	 */
	@Override
	public String insertMessage(AdminMessageEntity am) {
		return repositary.insertMessage(am);
	}

	/**
	 * get customer details by username
	 */
	@Override
	public List<AdminCustomerEntity> getAllByUname(String uname) {
		return repositary.getAllByUname(uname);
	}

	/**
	 * update customer details
	 */
	@Override
	public void updatePersonal(AdminCustomerEntity personalList) {
		repositary.updatePersonal(personalList);

	}

	/**
	 * get vegitable product list
	 */
	@Override
	public List<AdminAddProductEntity> getAllVegiProList() {
		return repositary.getAllVegiProList();
	}

	/**
	 * get Fruit product list
	 */
	@Override
	public List<AdminAddProductEntity> getAllFruitProList() {
		return repositary.getAllFruitProList();
	}

	/**
	 * get vegitable product list
	 */
	@Override
	public List<AdminAddProductEntity> getAllMeatProList() {
		return repositary.getAllMeatProList();
	}

	/**
	 * get HomeWare product list
	 */
	@Override
	public List<AdminAddProductEntity> getAllHomeWareProList() {
		return repositary.getAllHomeWareProList();
	}

	/**
	 * get Electron product list
	 */
	@Override
	public List<AdminAddProductEntity> getAllElectronicsProList() {
		return repositary.getAllElectronicsProList();
	}

	/**
	 * get Beauty product list
	 */
	@Override
	public List<AdminAddProductEntity> getAllBeautyProList() {
		return repositary.getAllBeautyProList();
	}

	// -- PASSWORD
	// RECOVERY------------------------------------------------------------------------------------//
	@Override
	public boolean recover(AdminCustomerEntity ue) {
		return repositary.recover(ue);
	}

	/**
	 * get customer details list by email
	 */
	@Override
	public List<AdminCustomerEntity> getAllByEmail(String email) {
		return repositary.getAllByEmail(email);
	}

	//// PRODUCTS TO Cart//////
	//////////// PRODUCTS TO Cart////////
	@Override
	public AdminAddProductEntity getProDetailsById(int id) {
		return repositary.getProDetailsById(id);
	}

	// Save ORDER//
	@Override
	public void saveOrder(String address, String cus_id, String cus_name, String subtotal, String phone, String email, String zip, String status) {
		repositary.saveOrder(address, cus_id, cus_name, subtotal, phone, email, zip, status);
		
	}



}
