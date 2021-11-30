package interf.Servicebd;

import java.util.Date;
import java.util.List;

import com.Entity.AdminAddProductEntity;
import com.Entity.AdminCustomerEntity;
import com.Entity.AdminMessageEntity;
import com.Entity.AdminUserAddEntity;
import com.Entity.Order;
import com.Entity.OrderDetail;
import com.Entity.SalesAnalytics;

public interface AdminServiceBd {

	// --
	// ---------------------------------------CUSTOMER
	// SUmmery------------------------------------//
	public List<AdminCustomerEntity> getSUmmUserDetail();

	public List<AdminMessageEntity> getSUmmMessaDetail();

	public List<Order> getSUmmOrderDetail();

	public Long countCustomer();

	public Long countPendingOrder();

	public Long countProduct();

	public List<SalesAnalytics> getSUmmSalesDetail();

	// --
	// --
	// --
	// ---------------------------------------ADMIN
	// USER ADD------------------------------------//
	public String saveUser(AdminUserAddEntity au);

	public List<AdminUserAddEntity> getAllUserList();

	public AdminUserAddEntity getAllById(Long id);

	public void updateUser(AdminUserAddEntity user);

	public void deleteUser(int id);

	// --
	// --
	// --
	// ---------------------------------------ADMIN
	// LOGIN------------------------------------//

	public boolean adminlog(AdminUserAddEntity au);

	List<AdminUserAddEntity> getAllByUname(String uname);

	// --
	// --
	// --
	// ---------------------------------------ADD PRODUCT
	// SERVICEBd------------------------------------//

	public String saveProduct(AdminAddProductEntity ap);

	public List<AdminAddProductEntity> getAllProductList();

	public AdminAddProductEntity getAllProById(Long id);

	public void updateProduct(AdminAddProductEntity product);

	public void deleteProduct(int id);

	// --
	// --
	// --
	// ---------------------------------------Admin Message CONTROLLER HANDLING
	// METHODS------------------------------------//

	public List<AdminMessageEntity> getAllMessageList();

	public AdminMessageEntity getAllMesageById(Long id);

	public void deleteMessage(int id);

	// --
	// --
	// --
	// ---------------------------------------CUSTOMER
	// SERVICEBd------------------------------------//

	public List<AdminCustomerEntity> getAllCustomerList();

	public void deleteCustomer(int id);

	// --
	// --
	// --
	// ---------------------------------------ORDER
	// SERVICEBd------------------------------------//
	public List<Order> getAllOrderPendingList();

	public void deliveredOrder(int orderId);

	public void canceledOrder(int orderId);

	public Order getOneOrder(int orderId);

	public List<OrderDetail> getAllOrderDetailById(String orderId);

	// --
	// --
	// --
	// ---------------------------------------SALES
	// AMALYTICSDao------------------------------------//
	public List<Order> getSalesDetailByDate(String fromDate, String toDate);

	public String saveSales(SalesAnalytics sa);

	public List<SalesAnalytics> getAllSalesList();

}
