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

	@Override
	public String insert(AdminCustomerEntity ue) {
		return repositary.insert(ue);
	}

	@Override
	public boolean login(AdminCustomerEntity ue) {
		return repositary.login(ue);
	}

	@Override
	public String insertMessage(AdminMessageEntity am) {
		return repositary.insertMessage(am);
	}

	@Override
	public List<AdminCustomerEntity> getAllByUname(String uname) {
		return repositary.getAllByUname(uname);
	}

	@Override
	public void updatePersonal(AdminCustomerEntity personalList) {
		repositary.updatePersonal(personalList);

	}

	@Override
	public List<AdminAddProductEntity> getAllVegiProList() {
		return repositary.getAllVegiProList();
	}

	@Override
	public List<AdminAddProductEntity> getAllFruitProList() {
		return repositary.getAllFruitProList();
	}

	@Override
	public List<AdminAddProductEntity> getAllMeatProList() {
		return repositary.getAllMeatProList();
	}

	@Override
	public List<AdminAddProductEntity> getAllHomeWareProList() {
		return repositary.getAllHomeWareProList();
	}

	@Override
	public List<AdminAddProductEntity> getAllElectronicsProList() {
		return repositary.getAllElectronicsProList();
	}

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

}
