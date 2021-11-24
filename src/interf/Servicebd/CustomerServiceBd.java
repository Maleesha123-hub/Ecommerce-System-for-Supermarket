package interf.Servicebd;

import java.util.List;

import com.Entity.AdminAddProductEntity;
import com.Entity.AdminCustomerEntity;
import com.Entity.AdminMessageEntity;
import com.Entity.AdminUserAddEntity;
import com.Entity.Order;

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

	// Save ORDER//
	public void saveOrder(String address, String cus_id, String cus_name, String subtotal, String phone, String email,
			String zip, String status, String payment);

	public void saveOrderDetails(int lastOrderId, String price, String pro_id, String pro_name, String qty);

	public Order getOrderIdFromLastRow();

	// cancel order by id
	public void cancelorderCashOnDelivery(int lastOrderId);

}
