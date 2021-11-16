package interf.Servicebd;

import java.util.List;

import com.Entity.AdminAddProductEntity;
import com.Entity.AdminCustomerEntity;
import com.Entity.AdminMessageEntity;
import com.Entity.AdminUserAddEntity;

public interface CustomerServiceBd {

	public String insert(AdminCustomerEntity ue);

	public boolean login(AdminCustomerEntity ue);

	public String insertMessage(AdminMessageEntity am);

	public List<AdminCustomerEntity> getAllByUname(String uname);

	// ACCOUNT UPDATE DETAILS//
	public void updatePersonal(AdminCustomerEntity personalList);

	// PRODUCTS TO LOAD TABLE DETAILS//
	public List<AdminAddProductEntity> getAllVegiProList();

	public List<AdminAddProductEntity> getAllFruitProList();

	public List<AdminAddProductEntity> getAllMeatProList();

	public List<AdminAddProductEntity> getAllHomeWareProList();

	public List<AdminAddProductEntity> getAllElectronicsProList();

	public List<AdminAddProductEntity> getAllBeautyProList();


	// -- PASSWORD
	// RECOVERY------------------------------------------------------------------------------------//
	public boolean recover(AdminCustomerEntity ue);

	public List<AdminCustomerEntity> getAllByEmail(String email);
	

	// PRODUCTS TO Cart//
	public AdminAddProductEntity getProDetailsById(int id);
	
	
}
